const std = @import("std");

pub fn main() void {
    const grid = [_][3]usize{
        .{ 1, 3, 1 },
        .{ 1, 5, 1 },
        .{ 4, 2, 1 },
    };
    var dp = [_]usize{0} ** 3;
    for (grid, 0..) |row, r| {
        for (row, 0..) |val, c| {
            if (r == 0 and c == 0) {
                dp[c] = val;
            } else if (r == 0) {
                dp[c] = dp[c - 1] + val;
            } else if (c == 0) {
                dp[c] = dp[c] + val;
            } else {
                dp[c] = @min(dp[c], dp[c - 1]) + val;
            }
        }
    }
    std.debug.print("{d}\n", .{dp[2]});
}
