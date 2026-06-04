const std = @import("std");

fn rol8(x: u8, n: u3) u8 {
    return std.math.rotl(u8, x, n);
}

pub fn main() void {
    std.debug.print("{d} {d}\n", .{ rol8(1, 1), rol8(128, 1) });
}
