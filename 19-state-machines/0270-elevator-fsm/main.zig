const std = @import("std");

pub fn main() void {
    const targets = [_]i32{ 2, 0 };
    var floor: i32 = 0;
    var first = true;

    std.debug.print("{d}", .{floor});
    first = false;

    for (targets) |t| {
        while (floor != t) {
            if (floor < t) floor += 1 else floor -= 1;
            if (!first) std.debug.print(" ", .{});
            first = false;
            std.debug.print("{d}", .{floor});
        }
    }
    std.debug.print("\n", .{});
}
