const std = @import("std");

pub fn main() void {
    const nums = [_]i32{ 1, 2, 3, 4, 5, 6, 7 };
    const size: usize = 3;
    var i: usize = 0;
    while (i < nums.len) : (i += size) {
        const end = @min(i + size, nums.len);
        var j = i;
        while (j < end) : (j += 1) {
            if (j > i) std.debug.print(" ", .{});
            std.debug.print("{d}", .{nums[j]});
        }
        std.debug.print("\n", .{});
    }
}
