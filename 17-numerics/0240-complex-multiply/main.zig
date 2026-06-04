const std = @import("std");

pub fn main() void {
    const ar: i64 = 1;
    const ai: i64 = 2;
    const br: i64 = 3;
    const bi: i64 = 4;
    const re = ar * br - ai * bi;
    const im = ar * bi + ai * br;
    std.debug.print("{d} {d}\n", .{ re, im });
}
