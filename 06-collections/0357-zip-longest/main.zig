const std = @import("std");

pub fn main() void {
    const nums = [_]i32{ 1, 2, 3 };
    const letters = [_][]const u8{ "a", "b" };
    const len = @max(nums.len, letters.len);
    var i: usize = 0;
    while (i < len) : (i += 1) {
        if (i > 0) std.debug.print(" ", .{});
        if (i < nums.len) {
            std.debug.print("{d}", .{nums[i]});
        } else {
            std.debug.print("-", .{});
        }
        if (i < letters.len) {
            std.debug.print("{s}", .{letters[i]});
        } else {
            std.debug.print("-", .{});
        }
    }
    std.debug.print("\n", .{});
}
