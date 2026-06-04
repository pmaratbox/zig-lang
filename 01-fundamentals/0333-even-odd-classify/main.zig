const std = @import("std");

pub fn main() void {
    const nums = [_]u32{ 1, 2, 3, 4 };
    for (nums, 0..) |n, i| {
        const label = if (n % 2 == 0) "even" else "odd";
        if (i != 0) std.debug.print(" ", .{});
        std.debug.print("{s}", .{label});
    }
    std.debug.print("\n", .{});
}
