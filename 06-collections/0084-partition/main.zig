const std = @import("std");

pub fn main() void {
    const nums = [_]i32{ 1, 2, 3, 4, 5, 6 };
    std.debug.print("evens:", .{});
    for (nums) |n| {
        if (@rem(n, 2) == 0) std.debug.print(" {d}", .{n});
    }
    std.debug.print("\n", .{});
    std.debug.print("odds:", .{});
    for (nums) |n| {
        if (@rem(n, 2) != 0) std.debug.print(" {d}", .{n});
    }
    std.debug.print("\n", .{});
}
