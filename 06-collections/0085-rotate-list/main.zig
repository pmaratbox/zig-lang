const std = @import("std");

pub fn main() void {
    const nums = [_]i32{ 1, 2, 3, 4, 5 };
    const k: usize = 2;
    for (0..nums.len) |i| {
        if (i > 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{nums[(i + k) % nums.len]});
    }
    std.debug.print("\n", .{});
}
