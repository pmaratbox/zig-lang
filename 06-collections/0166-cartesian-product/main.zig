const std = @import("std");

pub fn main() void {
    const nums = [_]u32{ 1, 2 };
    const letters = [_]u8{ 'a', 'b' };

    var first = true;
    for (nums) |n| {
        for (letters) |l| {
            if (!first) std.debug.print(" ", .{});
            std.debug.print("{d}{c}", .{ n, l });
            first = false;
        }
    }
    std.debug.print("\n", .{});
}
