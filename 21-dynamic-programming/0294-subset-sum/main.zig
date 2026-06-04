const std = @import("std");

pub fn main() void {
    const nums = [_]usize{ 3, 34, 4, 12, 5, 2 };
    const target: usize = 9;
    var dp = [_]bool{false} ** (target + 1);
    dp[0] = true;
    for (nums) |x| {
        if (x > target) continue;
        var s: usize = target;
        while (s >= x) : (s -= 1) {
            if (dp[s - x]) dp[s] = true;
            if (s == x) break;
        }
    }
    std.debug.print("{s}\n", .{if (dp[target]) "yes" else "no"});
}
