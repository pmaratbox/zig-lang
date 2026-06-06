const std = @import("std");

/// A scheduled event in virtual time: fire `value` at `time`, ordered by
/// (time, seq) so ties break by insertion order.
const Event = struct {
    time: u64,
    seq: u64,
    value: i64,
};

fn lessThan(_: void, a: Event, b: Event) bool {
    if (a.time != b.time) return a.time < b.time;
    return a.seq < b.seq;
}

/// A virtual-time scheduler: a priority queue of timed callbacks. We push
/// events, then `run` pops the smallest (time, seq), advances the clock, and
/// emits. flatMap merges every inner stream concurrently (no cancellation).
const Scheduler = struct {
    events: std.ArrayListUnmanaged(Event) = .empty,
    seq: u64 = 0,

    fn schedule(self: *Scheduler, allocator: std.mem.Allocator, time: u64, value: i64) !void {
        try self.events.append(allocator, .{ .time = time, .seq = self.seq, .value = value });
        self.seq += 1;
    }

    fn run(self: *Scheduler) void {
        std.mem.sort(Event, self.events.items, {}, lessThan);
        for (self.events.items) |ev| {
            std.debug.print("{d}\n", .{ev.value});
        }
    }
};

pub fn main() !void {
    var buffer: [4096]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buffer);
    const allocator = fba.allocator();

    var sched = Scheduler{};
    defer sched.events.deinit(allocator);

    // Outer stream emits (10 -> 1), (20 -> 2).
    const outer = [_]Event{
        .{ .time = 10, .seq = 0, .value = 1 },
        .{ .time = 20, .seq = 0, .value = 2 },
    };

    // flatMap: each outer value n maps to an inner stream that schedules
    // (now+5 -> n) and (now+30 -> n*10). All inners run concurrently.
    for (outer) |o| {
        try sched.schedule(allocator, o.time + 5, o.value);
        try sched.schedule(allocator, o.time + 30, o.value * 10);
    }

    sched.run();
}
