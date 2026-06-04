const std = @import("std");

pub fn main() void {
    const a = [_]u32{ 1, 2, 3, 4 };
    const b = [_]u32{ 2, 4 };

    var first = true;
    for (a) |x| {
        var found = false;
        for (b) |y| {
            if (x == y) {
                found = true;
                break;
            }
        }
        if (!found) {
            if (!first) std.debug.print(" ", .{});
            std.debug.print("{d}", .{x});
            first = false;
        }
    }
    std.debug.print("\n", .{});
}
