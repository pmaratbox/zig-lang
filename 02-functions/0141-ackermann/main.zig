const std = @import("std");

fn ackermann(m: u64, n: u64) u64 {
    if (m == 0) return n + 1;
    if (n == 0) return ackermann(m - 1, 1);
    return ackermann(m - 1, ackermann(m, n - 1));
}

pub fn main() void {
    std.debug.print("{d}\n", .{ackermann(2, 3)});
}
