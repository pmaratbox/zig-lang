const std = @import("std");

pub fn main() void {
    const nums = [_]i32{ 2, 7, 11, 15 };
    const target: i32 = 9;
    var i: usize = 0;
    outer: while (i < nums.len) : (i += 1) {
        var j: usize = i + 1;
        while (j < nums.len) : (j += 1) {
            if (nums[i] + nums[j] == target) {
                std.debug.print("{d} {d}\n", .{ i, j });
                break :outer;
            }
        }
    }
}
