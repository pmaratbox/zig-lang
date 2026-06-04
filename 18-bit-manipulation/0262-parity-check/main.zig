const std = @import("std");

pub fn main() void {
    const a: u32 = 7;
    const b: u32 = 5;
    const pa = @popCount(a) & 1;
    const pb = @popCount(b) & 1;
    std.debug.print("{d} {d}\n", .{ pa, pb });
}
