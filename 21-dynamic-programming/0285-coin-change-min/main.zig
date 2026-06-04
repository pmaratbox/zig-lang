const std = @import("std");

pub fn main() void {
    const coins = [_]usize{ 1, 2, 5 };
    const target: usize = 11;
    var dp = [_]usize{std.math.maxInt(usize)} ** (target + 1);
    dp[0] = 0;
    var amount: usize = 1;
    while (amount <= target) : (amount += 1) {
        for (coins) |c| {
            if (c <= amount and dp[amount - c] != std.math.maxInt(usize)) {
                dp[amount] = @min(dp[amount], dp[amount - c] + 1);
            }
        }
    }
    std.debug.print("{d}\n", .{dp[target]});
}
