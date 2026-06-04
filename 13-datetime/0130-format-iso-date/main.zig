const std = @import("std");

pub fn main() void {
    const y: u32 = 2026;
    const m: u32 = 6;
    const d: u32 = 4;
    std.debug.print("{d:0>4}-{d:0>2}-{d:0>2}\n", .{ y, m, d });
}
