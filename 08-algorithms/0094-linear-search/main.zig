const std = @import("std");

pub fn main() void {
    const nums = [_]i32{ 4, 2, 7, 1, 9 };
    const target: i32 = 7;
    const index = std.mem.indexOfScalar(i32, &nums, target);
    std.debug.print("found {d} at index {d}\n", .{ target, index.? });
}
