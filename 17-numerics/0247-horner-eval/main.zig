const std = @import("std");

pub fn main() void {
    const coeffs = [_]i64{ 2, 3, 1 };
    const x: i64 = 2;
    var acc: i64 = 0;
    for (coeffs) |c| {
        acc = acc * x + c;
    }
    std.debug.print("{d}\n", .{acc});
}
