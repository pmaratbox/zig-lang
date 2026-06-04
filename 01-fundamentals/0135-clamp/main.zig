const std = @import("std");

fn clamp(x: i32, lo: i32, hi: i32) i32 {
    return @max(lo, @min(x, hi));
}

pub fn main() void {
    std.debug.print("{d} {d}\n", .{ clamp(15, 0, 10), clamp(-3, 0, 10) });
}
