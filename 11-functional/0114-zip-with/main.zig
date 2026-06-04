const std = @import("std");

pub fn main() void {
    const a = [_]i32{ 1, 2, 3 };
    const b = [_]i32{ 4, 5, 6 };
    for (a, b, 0..) |x, y, i| {
        if (i != 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{x + y});
    }
    std.debug.print("\n", .{});
}
