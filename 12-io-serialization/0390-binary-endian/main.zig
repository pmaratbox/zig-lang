const std = @import("std");

pub fn main() void {
    const n: u16 = 258;
    const high: u8 = @intCast(n >> 8);
    const low: u8 = @intCast(n & 0xFF);
    const decoded: u16 = @as(u16, high) * 256 + low;
    std.debug.print("{d} {d} {d}\n", .{ high, low, decoded });
}
