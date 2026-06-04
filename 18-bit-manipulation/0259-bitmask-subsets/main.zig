const std = @import("std");

pub fn main() void {
    const mask: u32 = 5;
    var sub: u32 = mask;
    var first = true;
    while (true) {
        if (!first) std.debug.print(" ", .{});
        first = false;
        std.debug.print("{d}", .{sub});
        if (sub == 0) break;
        sub = (sub -% 1) & mask;
    }
    std.debug.print("\n", .{});
}
