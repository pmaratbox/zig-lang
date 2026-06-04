const std = @import("std");

pub fn main() void {
    const adj = [4][]const i32{
        &[_]i32{ 1, 2 },
        &[_]i32{ 0, 3 },
        &[_]i32{ 0, 3 },
        &[_]i32{ 1, 2 },
    };

    for (adj[0], 0..) |n, i| {
        if (i != 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{n});
    }
    std.debug.print("\n", .{});
}
