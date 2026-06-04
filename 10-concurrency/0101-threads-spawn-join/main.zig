const std = @import("std");

fn spawnjoin(id: u32) void {
    _ = id; // trivial work
}

pub fn main() !void {
    var threads: [3]std.Thread = undefined;
    for (&threads, 0..) |*t, i| {
        t.* = try std.Thread.spawn(.{}, spawnjoin, .{@as(u32, @intCast(i))});
    }
    var joined: u32 = 0;
    for (&threads) |*t| {
        t.join();
        joined += 1;
    }
    std.debug.print("done: {d}\n", .{joined});
}
