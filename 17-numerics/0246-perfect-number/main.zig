const std = @import("std");

fn isPerfect(n: u64) bool {
    var sum: u64 = 0;
    var d: u64 = 1;
    while (d < n) : (d += 1) {
        if (n % d == 0) sum += d;
    }
    return sum == n;
}

pub fn main() void {
    const a = if (isPerfect(6)) "yes" else "no";
    const b = if (isPerfect(8)) "yes" else "no";
    std.debug.print("{s} {s}\n", .{ a, b });
}
