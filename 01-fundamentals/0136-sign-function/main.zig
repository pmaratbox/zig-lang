const std = @import("std");

fn sign(x: i32) i32 {
    if (x > 0) return 1;
    if (x < 0) return -1;
    return 0;
}

pub fn main() void {
    std.debug.print("{d} {d} {d}\n", .{ sign(-5), sign(0), sign(5) });
}
