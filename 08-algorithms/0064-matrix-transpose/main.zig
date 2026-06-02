const std = @import("std");

pub fn main() void {
    const matrix = [2][3]i32{ .{ 1, 2, 3 }, .{ 4, 5, 6 } };
    const rows = matrix.len;
    const cols = matrix[0].len;

    var j: usize = 0;
    while (j < cols) : (j += 1) {
        var i: usize = 0;
        while (i < rows) : (i += 1) {
            if (i > 0) std.debug.print(" ", .{});
            std.debug.print("{d}", .{matrix[i][j]});
        }
        std.debug.print("\n", .{});
    }
}
