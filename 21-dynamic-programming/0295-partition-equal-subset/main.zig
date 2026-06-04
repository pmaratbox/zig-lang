const std = @import("std");

pub fn main() void {
    const nums = [_]usize{ 1, 5, 11, 5 };
    var total: usize = 0;
    for (nums) |x| total += x;
    if (total % 2 != 0) {
        std.debug.print("no\n", .{});
        return;
    }
    const target = total / 2;
    var dp = [_]bool{false} ** 12;
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
