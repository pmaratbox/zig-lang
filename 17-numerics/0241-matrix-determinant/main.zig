const std = @import("std");

pub fn main() void {
    const m = [2][2]i64{ .{ 1, 2 }, .{ 3, 4 } };
    const det = m[0][0] * m[1][1] - m[0][1] * m[1][0];
    std.debug.print("{d}\n", .{det});
}
