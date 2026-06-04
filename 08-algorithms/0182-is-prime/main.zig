const std = @import("std");

fn isPrime(n: u64) bool {
    if (n < 2) return false;
    var i: u64 = 2;
    while (i * i <= n) : (i += 1) {
        if (n % i == 0) return false;
    }
    return true;
}

pub fn main() void {
    std.debug.print("{s} {s}\n", .{
        if (isPrime(7)) "yes" else "no",
        if (isPrime(9)) "yes" else "no",
    });
}
