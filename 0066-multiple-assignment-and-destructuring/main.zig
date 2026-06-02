const std = @import("std");

pub fn main() void {
    var a: i32 = 1;
    var b: i32 = 2;
    const swapped = .{ b, a };
    a, b = swapped;
    std.debug.print("{d} {d}\n", .{ a, b });

    const x, const y = .{ 3, 4 };
    std.debug.print("{d} {d}\n", .{ x, y });
}
