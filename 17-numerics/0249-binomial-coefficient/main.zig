const std = @import("std");

fn binom(n: u64, k0: u64) u64 {
    var k = k0;
    if (k > n - k) k = n - k;
    var result: u64 = 1;
    var i: u64 = 0;
    while (i < k) : (i += 1) {
        result = result * (n - i) / (i + 1);
    }
    return result;
}

pub fn main() void {
    std.debug.print("{d}\n", .{binom(5, 2)});
}
