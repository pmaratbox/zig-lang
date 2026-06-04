const std = @import("std");

fn square(in: u32, out: *u32) void {
    out.* = in * in;
}

pub fn main() !void {
    const inputs = [_]u32{ 1, 2, 3, 4 };
    var results: [4]u32 = undefined;
    var threads: [4]std.Thread = undefined;

    for (inputs, 0..) |n, i| {
        threads[i] = try std.Thread.spawn(.{}, square, .{ n, &results[i] });
    }
    for (&threads) |*t| t.join();

    for (results, 0..) |r, i| {
        if (i != 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{r});
    }
    std.debug.print("\n", .{});
}
