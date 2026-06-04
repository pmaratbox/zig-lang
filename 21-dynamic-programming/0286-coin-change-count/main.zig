const std = @import("std");

pub fn main() void {
    const coins = [_]usize{ 1, 2, 5 };
    const target: usize = 5;
    var dp = [_]usize{0} ** (target + 1);
    dp[0] = 1;
    for (coins) |c| {
        var amount: usize = c;
        while (amount <= target) : (amount += 1) {
            dp[amount] += dp[amount - c];
        }
    }
    std.debug.print("{d}\n", .{dp[target]});
}
