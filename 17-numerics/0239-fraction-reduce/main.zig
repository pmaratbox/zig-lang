const std = @import("std");

fn gcd(a: i64, b: i64) i64 {
    var x = if (a < 0) -a else a;
    var y = if (b < 0) -b else b;
    while (y != 0) {
        const t = @rem(x, y);
        x = y;
        y = t;
    }
    return x;
}

pub fn main() void {
    var num: i64 = 6;
    var den: i64 = 8;
    const g = gcd(num, den);
    num = @divTrunc(num, g);
    den = @divTrunc(den, g);
    std.debug.print("{d}/{d}\n", .{ num, den });
}
