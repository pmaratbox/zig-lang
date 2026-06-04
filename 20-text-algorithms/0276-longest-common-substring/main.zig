const std = @import("std");

pub fn main() void {
    const a = "abcde";
    const b = "xbcdy";

    var dp: [a.len + 1][b.len + 1]usize = undefined;
    var i: usize = 0;
    while (i <= a.len) : (i += 1) dp[i][0] = 0;
    var j: usize = 0;
    while (j <= b.len) : (j += 1) dp[0][j] = 0;

    var best: usize = 0;
    var end: usize = 0;
    i = 1;
    while (i <= a.len) : (i += 1) {
        j = 1;
        while (j <= b.len) : (j += 1) {
            if (a[i - 1] == b[j - 1]) {
                dp[i][j] = dp[i - 1][j - 1] + 1;
                if (dp[i][j] > best) {
                    best = dp[i][j];
                    end = i;
                }
            } else {
                dp[i][j] = 0;
            }
        }
    }

    std.debug.print("{s}\n", .{a[end - best .. end]});
}
