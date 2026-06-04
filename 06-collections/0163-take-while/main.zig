const std = @import("std");

pub fn main() void {
    const items = [_]u32{ 1, 2, 3, 4, 1 };
    var first = true;
    for (items) |x| {
        if (x >= 3) break;
        if (!first) std.debug.print(" ", .{});
        std.debug.print("{d}", .{x});
        first = false;
    }
    std.debug.print("\n", .{});
}
