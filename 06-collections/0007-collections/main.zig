const std = @import("std");

pub fn main() void {
    const nums = [_]i32{ 1, 2, 3, 4, 5 };

    std.debug.print("count: {}\n", .{nums.len});
    std.debug.print("first: {}\n", .{nums[0]});
    std.debug.print("last: {}\n", .{nums[nums.len - 1]});
}
