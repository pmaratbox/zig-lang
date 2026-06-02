const std = @import("std");

pub fn main() void {
    const a: u8 = 6;
    const b: u8 = 3;
    std.debug.print("and: {d}\n", .{a & b});
    std.debug.print("or: {d}\n", .{a | b});
    std.debug.print("xor: {d}\n", .{a ^ b});
    std.debug.print("shift: {d}\n", .{a << 1});
}
