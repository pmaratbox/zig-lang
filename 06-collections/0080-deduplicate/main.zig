const std = @import("std");

pub fn main() void {
    const nums = [_]i32{ 1, 2, 2, 3, 1 };
    var unique: [nums.len]i32 = undefined;
    var count: usize = 0;
    for (nums) |n| {
        var dup = false;
        for (unique[0..count]) |u| {
            if (u == n) {
                dup = true;
                break;
            }
        }
        if (!dup) {
            unique[count] = n;
            count += 1;
        }
    }
    for (unique[0..count], 0..) |x, i| {
        if (i > 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{x});
    }
    std.debug.print("\n", .{});
}
