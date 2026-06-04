const std = @import("std");

fn power(base: u64, exp: u64) u64 {
    if (exp == 0) return 1;
    return base * power(base, exp - 1);
}

pub fn main() void {
    std.debug.print("{d}\n", .{power(2, 10)});
}
