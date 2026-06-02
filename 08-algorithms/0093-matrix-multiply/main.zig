const std = @import("std");

pub fn main() void {
    const a = [2][2]i32{ .{ 1, 2 }, .{ 3, 4 } };
    const b = [2][2]i32{ .{ 5, 6 }, .{ 7, 8 } };
    var result = [2][2]i32{ .{ 0, 0 }, .{ 0, 0 } };
    for (0..2) |i| {
        for (0..2) |j| {
            for (0..2) |k| {
                result[i][j] += a[i][k] * b[k][j];
            }
        }
    }

    for (result) |row| {
        for (row, 0..) |x, j| {
            if (j > 0) std.debug.print(" ", .{});
            std.debug.print("{d}", .{x});
        }
        std.debug.print("\n", .{});
    }
}
