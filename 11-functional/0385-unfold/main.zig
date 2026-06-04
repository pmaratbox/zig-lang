const std = @import("std");

pub fn main() void {
    var x: u32 = 1;
    var n: usize = 0;
    while (n < 5) : (n += 1) {
        if (n > 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{x});
        x *= 2;
    }
    std.debug.print("\n", .{});
}
