const std = @import("std");

pub fn main() void {
    const nums = [_]i32{ 1, 2, 3, 4 };
    var i: usize = 0;
    while (i + 1 < nums.len) : (i += 1) {
        if (i > 0) std.debug.print(" ", .{});
        std.debug.print("{d},{d}", .{ nums[i], nums[i + 1] });
    }
    std.debug.print("\n", .{});
}
