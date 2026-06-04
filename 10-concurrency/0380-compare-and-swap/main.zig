const std = @import("std");

var value: std.atomic.Value(u32) = std.atomic.Value(u32).init(0);

fn worker(times: u32) void {
    var i: u32 = 0;
    while (i < times) : (i += 1) {
        var cur = value.load(.monotonic);
        while (value.cmpxchgWeak(cur, cur + 1, .monotonic, .monotonic)) |actual| {
            cur = actual;
        }
    }
}

pub fn main() !void {
    var threads: [4]std.Thread = undefined;
    for (&threads) |*t| {
        t.* = try std.Thread.spawn(.{}, worker, .{25});
    }
    for (&threads) |*t| t.join();
    std.debug.print("{d}\n", .{value.load(.monotonic)});
}
