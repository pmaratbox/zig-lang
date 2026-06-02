const std = @import("std");

pub fn main() void {
    const nums = [_]i32{ 10, 20, 30, 40, 50 };
    const slice = nums[1..4];
    std.debug.print("slice:", .{});
    for (slice) |n| {
        std.debug.print(" {d}", .{n});
    }
    std.debug.print("\n", .{});
}
