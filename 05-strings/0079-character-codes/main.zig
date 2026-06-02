const std = @import("std");

pub fn main() void {
    std.debug.print("{d} {c}\n", .{ @as(u8, 'A'), @as(u8, 66) });
}
