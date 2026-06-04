const std = @import("std");

fn gcd(a: u64, b: u64) u64 {
    var x = a;
    var y = b;
    while (y != 0) {
        const t = x % y;
        x = y;
        y = t;
    }
    return x;
}

pub fn main() void {
    const a: u64 = 4;
    const b: u64 = 6;
    const result = a / gcd(a, b) * b;
    std.debug.print("{d}\n", .{result});
}
