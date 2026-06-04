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
    const n1: i64 = 1;
    const d1: i64 = 2;
    const n2: i64 = 1;
    const d2: i64 = 3;
    var num = n1 * d2 + n2 * d1;
    var den = d1 * d2;
    const g = gcd(num, den);
    num = @divTrunc(num, g);
    den = @divTrunc(den, g);
    std.debug.print("{d}/{d}\n", .{ num, den });
}
