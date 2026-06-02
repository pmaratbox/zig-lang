const std = @import("std");

pub fn main() void {
    const nums = [_]i32{ 1, 2, 3, 4 };
    const size: usize = 2;
    var i: usize = 0;
    while (i + size <= nums.len) : (i += 1) {
        var j = i;
        while (j < i + size) : (j += 1) {
            if (j > i) std.debug.print(" ", .{});
            std.debug.print("{d}", .{nums[j]});
        }
        std.debug.print("\n", .{});
    }
}
