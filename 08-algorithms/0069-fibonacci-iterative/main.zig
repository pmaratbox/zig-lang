const std = @import("std");

pub fn main() void {
    var a: i32 = 0;
    var b: i32 = 1;
    var i: usize = 0;
    while (i < 7) : (i += 1) {
        if (i > 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{a});
        const t = a + b;
        a = b;
        b = t;
    }
    std.debug.print("\n", .{});
}
