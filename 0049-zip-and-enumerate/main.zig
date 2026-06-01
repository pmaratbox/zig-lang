const std = @import("std");

pub fn main() void {
    const letters = [_][]const u8{ "a", "b", "c" };
    const nums = [_]i32{ 1, 2, 3 };
    for (letters, nums, 0..) |k, n, i| {
        if (i > 0) std.debug.print(" ", .{});
        std.debug.print("{s}={d}", .{ k, n });
    }
    std.debug.print("\n", .{});
}
