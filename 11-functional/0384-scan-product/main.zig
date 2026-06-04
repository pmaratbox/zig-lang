const std = @import("std");

pub fn main() void {
    const data = [_]u32{ 1, 2, 3, 4 };
    var acc: u32 = 1;
    for (data, 0..) |x, idx| {
        acc *= x;
        if (idx > 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{acc});
    }
    std.debug.print("\n", .{});
}
