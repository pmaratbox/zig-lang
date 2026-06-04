const std = @import("std");

pub fn main() void {
    const r: u32 = 1;
    const g: u32 = 2;
    const b: u32 = 3;
    const packed_val = (r << 16) | (g << 8) | b;
    const ur = (packed_val >> 16) & 0xff;
    const ug = (packed_val >> 8) & 0xff;
    const ub = packed_val & 0xff;
    std.debug.print("{d} {d} {d}\n", .{ ur, ug, ub });
}
