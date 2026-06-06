const std = @import("std");

/// A scheduled task in virtual time: fire `cb(arg)` at `time`, ordered by
/// (time, seq). `alive` is flipped to false when cancelled.
const Task = struct {
    time: u64,
    seq: u64,
    arg: i64,
    cb: *const fn (sched: *Scheduler, arg: i64) void,
    alive: bool = true,
};

/// Virtual-time scheduler: a list of tasks driven entirely by run(), with no
/// real clocks, threads, or randomness.
const Scheduler = struct {
    tasks: std.ArrayListUnmanaged(Task) = .empty,
    allocator: std.mem.Allocator,
    next_seq: u64 = 0,
    clock: u64 = 0,

    fn schedule(self: *Scheduler, time: u64, arg: i64, cb: *const fn (*Scheduler, i64) void) !usize {
        const seq = self.next_seq;
        self.next_seq += 1;
        try self.tasks.append(self.allocator, .{ .time = time, .seq = seq, .arg = arg, .cb = cb });
        return self.tasks.items.len - 1;
    }

    fn cancel(self: *Scheduler, token: usize) void {
        self.tasks.items[token].alive = false;
    }

    fn run(self: *Scheduler) void {
        while (true) {
            var best: ?usize = null;
            for (self.tasks.items, 0..) |t, i| {
                if (!t.alive) continue;
                if (best == null) {
                    best = i;
                } else {
                    const b = self.tasks.items[best.?];
                    if (t.time < b.time or (t.time == b.time and t.seq < b.seq)) best = i;
                }
            }
            const idx = best orelse return;
            var task = self.tasks.items[idx];
            task.alive = false;
            self.tasks.items[idx].alive = false;
            self.clock = task.time;
            task.cb(self, task.arg);
        }
    }
};

// switchMap state: track the tokens scheduled by the current inner so a new
// outer value can cancel the previous inner's still-pending emissions.
var sched: Scheduler = undefined;
var inner_tokens: [2]usize = .{ 0, 0 };
var inner_count: usize = 0;
var have_inner: bool = false;

fn emitInner(_: *Scheduler, n: i64) void {
    std.debug.print("{d}\n", .{n});
}

/// Outer value `n` arrives: cancel previous inner's pending emissions, then
/// start a new inner that schedules (now+5 -> n) and (now+30 -> n*10).
fn outer(s: *Scheduler, n: i64) void {
    if (have_inner) {
        var i: usize = 0;
        while (i < inner_count) : (i += 1) s.cancel(inner_tokens[i]);
    }
    inner_count = 0;
    inner_tokens[inner_count] = s.schedule(s.clock + 5, n, emitInner) catch unreachable;
    inner_count += 1;
    inner_tokens[inner_count] = s.schedule(s.clock + 30, n * 10, emitInner) catch unreachable;
    inner_count += 1;
    have_inner = true;
}

pub fn main() void {
    var buf: [4096]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buf);
    sched = .{ .allocator = fba.allocator() };

    // Outer source: (10 -> 1), (20 -> 2).
    _ = sched.schedule(10, 1, outer) catch unreachable;
    _ = sched.schedule(20, 2, outer) catch unreachable;

    sched.run();
}
