const std = @import("std");

fn fastPow(base: u64, exp: u64) u64 {
    var result: u64 = 1;
    var b = base;
    var e = exp;
    while (e > 0) {
        if (e & 1 == 1) result *= b;
        b *= b;
        e >>= 1;
    }
    return result;
}

pub fn main() void {
    std.debug.print("{d}\n", .{fastPow(2, 10)});
}
