const std = @import("std");

const Counter = struct {
    value: std.atomic.Value(u32) = std.atomic.Value(u32).init(0),
};

fn counter(c: *Counter) void {
    var i: u32 = 0;
    while (i < 100) : (i += 1) {
        _ = c.value.fetchAdd(1, .monotonic);
    }
}

pub fn main() !void {
    var c = Counter{};
    var threads: [10]std.Thread = undefined;
    for (&threads) |*t| {
        t.* = try std.Thread.spawn(.{}, counter, .{&c});
    }
    for (&threads) |*t| t.join();
    std.debug.print("{d}\n", .{c.value.load(.monotonic)});
}
