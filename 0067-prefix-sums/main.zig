const std = @import("std");

pub fn main() void {
    const nums = [_]i32{ 1, 2, 3, 4 };
    var total: i32 = 0;
    var first = true;
    for (nums) |n| {
        total += n;
        if (!first) std.debug.print(" ", .{});
        std.debug.print("{d}", .{total});
        first = false;
    }
    std.debug.print("\n", .{});
}
