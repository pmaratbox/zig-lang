const std = @import("std");

/// An observer receives pushed values from a producer.
const Observer = struct {
    ctx: *anyopaque,
    nextFn: *const fn (ctx: *anyopaque, value: i64) void,

    fn next(self: Observer, value: i64) void {
        self.nextFn(self.ctx, value);
    }
};

/// A scheduled task: invoke `cb` at virtual time `time`, ordered by (time, seq).
const Task = struct {
    time: i64,
    seq: usize,
    value: i64,
    observer: *const Observer,
};

fn lessThan(_: void, a: Task, b: Task) bool {
    if (a.time != b.time) return a.time < b.time;
    return a.seq < b.seq;
}

/// Virtual-time scheduler: a priority queue of (time, seq) tasks.
const Scheduler = struct {
    tasks: std.ArrayListUnmanaged(Task) = .empty,
    seq: usize = 0,

    fn schedule(self: *Scheduler, alloc: std.mem.Allocator, time: i64, value: i64, observer: *const Observer) !void {
        try self.tasks.append(alloc, .{
            .time = time,
            .seq = self.seq,
            .value = value,
            .observer = observer,
        });
        self.seq += 1;
    }

    /// Drain in (time, seq) order, advancing the virtual clock per task.
    fn run(self: *Scheduler) void {
        std.mem.sort(Task, self.tasks.items, {}, lessThan);
        for (self.tasks.items) |task| {
            task.observer.next(task.value);
        }
    }
};

/// A timed source: emits each value by scheduling it at the given virtual time.
const Source = struct {
    times: []const i64,
    values: []const i64,

    fn subscribe(self: Source, sched: *Scheduler, alloc: std.mem.Allocator, observer: *const Observer) !void {
        for (self.times, self.values) |t, v| {
            try sched.schedule(alloc, t, v, observer);
        }
    }
};

/// merge subscribes to both sources onto the same observer.
fn merge(a: Source, b: Source, sched: *Scheduler, alloc: std.mem.Allocator, observer: *const Observer) !void {
    try a.subscribe(sched, alloc, observer);
    try b.subscribe(sched, alloc, observer);
}

fn printNext(_: *anyopaque, value: i64) void {
    std.debug.print("{d}\n", .{value});
}

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const alloc = arena.allocator();

    var dummy: u8 = 0;
    const observer = Observer{ .ctx = @ptrCast(&dummy), .nextFn = printNext };

    const streamA = Source{ .times = &.{ 10, 30, 50 }, .values = &.{ 1, 3, 5 } };
    const streamB = Source{ .times = &.{ 20, 40, 60 }, .values = &.{ 2, 4, 6 } };

    var sched = Scheduler{};
    try merge(streamA, streamB, &sched, alloc, &observer);
    sched.run();
}
