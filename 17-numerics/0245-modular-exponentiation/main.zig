const std = @import("std");

fn modpow(base: u64, exp: u64, m: u64) u64 {
    var result: u64 = 1;
    var b = base % m;
    var e = exp;
    while (e > 0) {
        if (e & 1 == 1) result = (result * b) % m;
        b = (b * b) % m;
        e >>= 1;
    }
    return result;
}

pub fn main() void {
    std.debug.print("{d}\n", .{modpow(3, 13, 7)});
}
