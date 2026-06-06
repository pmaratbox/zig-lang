const std = @import("std");

const Event = struct {
    time: u64,
    seq: u64,
    value: []const u8,
};

const Throttle = struct {
    window: u64,
    block_until: u64 = 0,

    fn next(self: *Throttle, now: u64, value: []const u8) void {
        if (now >= self.block_until) {
            std.debug.print("{s}\n", .{value});
            self.block_until = now + self.window;
        }
    }
};

pub fn main() void {
    // Virtual-time scheduler: events sorted by (time, seq).
    var events = [_]Event{
        .{ .time = 10, .seq = 0, .value = "a" },
        .{ .time = 20, .seq = 1, .value = "b" },
        .{ .time = 100, .seq = 2, .value = "c" },
        .{ .time = 110, .seq = 3, .value = "d" },
    };

    std.sort.block(Event, &events, {}, struct {
        fn lessThan(_: void, a: Event, b: Event) bool {
            if (a.time != b.time) return a.time < b.time;
            return a.seq < b.seq;
        }
    }.lessThan);

    var throttle = Throttle{ .window = 30 };

    // run(): pop smallest (time, seq), set virtual clock = its time, invoke.
    for (events) |ev| {
        throttle.next(ev.time, ev.value);
    }
}
