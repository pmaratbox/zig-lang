const std = @import("std");

pub fn main() void {
    var a: u32 = 1;
    var b: u32 = 2;
    const tmp = a;
    a = b;
    b = tmp;
    std.debug.print("{d} {d}\n", .{ a, b });
}
