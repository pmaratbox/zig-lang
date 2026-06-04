const std = @import("std");

pub fn main() void {
    const rows: usize = 3;
    const cols: usize = 3;
    var dp = [_]usize{1} ** cols;
    var r: usize = 1;
    while (r < rows) : (r += 1) {
        var c: usize = 1;
        while (c < cols) : (c += 1) {
            dp[c] += dp[c - 1];
        }
    }
    std.debug.print("{d}\n", .{dp[cols - 1]});
}
