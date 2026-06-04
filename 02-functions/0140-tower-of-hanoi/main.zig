const std = @import("std");

fn moves(n: u64) u64 {
    if (n == 0) return 0;
    return 2 * moves(n - 1) + 1;
}

pub fn main() void {
    std.debug.print("{d}\n", .{moves(3)});
}
