const std = @import("std");

pub fn main() void {
    var n: u32 = 0;
    while (n < 4) : (n += 1) {
        const g = n ^ (n >> 1);
        if (n > 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{g});
    }
    std.debug.print("\n", .{});
}
