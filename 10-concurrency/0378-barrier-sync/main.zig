const std = @import("std");

var arrived: std.atomic.Value(u32) = std.atomic.Value(u32).init(0);
const total: u32 = 3;

fn worker() void {
    // Arrive at the barrier.
    _ = arrived.fetchAdd(1, .acq_rel);
    // Spin until every thread has arrived before proceeding.
    while (arrived.load(.acquire) < total) {
        std.atomic.spinLoopHint();
    }
}

pub fn main() !void {
    var threads: [total]std.Thread = undefined;
    for (&threads) |*t| {
        t.* = try std.Thread.spawn(.{}, worker, .{});
    }
    for (&threads) |*t| t.join();
    std.debug.print("all reached: {d}\n", .{total});
}
