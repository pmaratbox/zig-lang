const std = @import("std");

pub fn main() void {
    const p = [_]usize{ 10, 20, 30, 40 };
    const n = p.len - 1; // number of matrices
    var dp = [_][3]usize{[_]usize{0} ** 3} ** 3;
    var len: usize = 2;
    while (len <= n) : (len += 1) {
        var i: usize = 0;
        while (i + len - 1 < n) : (i += 1) {
            const j = i + len - 1;
            dp[i][j] = std.math.maxInt(usize);
            var k: usize = i;
            while (k < j) : (k += 1) {
                const cost = dp[i][k] + dp[k + 1][j] + p[i] * p[k + 1] * p[j + 1];
                dp[i][j] = @min(dp[i][j], cost);
            }
        }
    }
    std.debug.print("{d}\n", .{dp[0][n - 1]});
}
