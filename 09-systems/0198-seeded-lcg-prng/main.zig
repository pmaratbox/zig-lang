const std = @import("std");

pub fn main() void {
    var x: u32 = 1;
    for (0..3) |i| {
        x = (5 * x + 3) % 16;
        if (i != 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{x});
    }
    std.debug.print("\n", .{});
}
