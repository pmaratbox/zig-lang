const std = @import("std");

fn f(x: u32) u32 {
    return x * 3;
}

pub fn main() void {
    var x: u32 = 1;
    var n: usize = 0;
    while (n < 4) : (n += 1) {
        if (n > 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{x});
        x = f(x);
    }
    std.debug.print("\n", .{});
}
