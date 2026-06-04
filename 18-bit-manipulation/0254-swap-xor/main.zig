const std = @import("std");

pub fn main() void {
    var a: u32 = 3;
    var b: u32 = 5;
    a ^= b;
    b ^= a;
    a ^= b;
    std.debug.print("{d} {d}\n", .{ a, b });
}
