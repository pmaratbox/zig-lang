const std = @import("std");

pub fn main() void {
    const s = "bbbab";
    const n = s.len;
    var dp = [_][5]usize{[_]usize{0} ** 5} ** 5;
    var i: usize = n;
    while (i > 0) {
        i -= 1;
        dp[i][i] = 1;
        var j: usize = i + 1;
        while (j < n) : (j += 1) {
            if (s[i] == s[j]) {
                dp[i][j] = dp[i + 1][j - 1] + 2;
            } else {
                dp[i][j] = @max(dp[i + 1][j], dp[i][j - 1]);
            }
        }
    }
    std.debug.print("{d}\n", .{dp[0][n - 1]});
}
