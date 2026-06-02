const std = @import("std");

fn gcd(a: i32, b: i32) i32 {
    var x = a;
    var y = b;
    while (y != 0) {
        const t = y;
        y = @rem(x, y);
        x = t;
    }
    return x;
}

pub fn main() void {
    std.debug.print("{d}\n", .{gcd(48, 36)});
}
