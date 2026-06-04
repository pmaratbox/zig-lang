const std = @import("std");

pub fn main() void {
    const nums = [_]i32{ 10, 9, 2, 5, 3, 7, 101, 18 };
    var dp = [_]usize{1} ** nums.len;
    var best: usize = 1;
    var i: usize = 0;
    while (i < nums.len) : (i += 1) {
        var j: usize = 0;
        while (j < i) : (j += 1) {
            if (nums[j] < nums[i] and dp[j] + 1 > dp[i]) {
                dp[i] = dp[j] + 1;
            }
        }
        best = @max(best, dp[i]);
    }
    std.debug.print("{d}\n", .{best});
}
