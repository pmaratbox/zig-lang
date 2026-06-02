const std = @import("std");

pub fn main() void {
    const nested = [_][2]i32{ .{ 1, 2 }, .{ 3, 4 } };

    var first = true;
    for (nested) |row| {
        for (row) |x| {
            if (!first) std.debug.print(" ", .{});
            std.debug.print("{d}", .{x});
            first = false;
        }
    }
    std.debug.print("\n", .{});
}
