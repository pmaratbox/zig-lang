const std = @import("std");

pub fn main() void {
    const nums = [_]i32{ 1, 2, 3, 4, 5 };

    var sum: i32 = 0;
    for (nums) |n| {
        if (@mod(n, 2) == 0) {
            sum += n * 2;
        }
    }

    std.debug.print("sum: {}\n", .{sum});
}
