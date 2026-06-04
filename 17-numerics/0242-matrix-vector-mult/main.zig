const std = @import("std");

pub fn main() void {
    const m = [2][2]i64{ .{ 1, 2 }, .{ 3, 4 } };
    const v = [2]i64{ 5, 6 };
    const r0 = m[0][0] * v[0] + m[0][1] * v[1];
    const r1 = m[1][0] * v[0] + m[1][1] * v[1];
    std.debug.print("{d} {d}\n", .{ r0, r1 });
}
