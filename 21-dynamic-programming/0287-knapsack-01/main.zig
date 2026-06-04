const std = @import("std");

pub fn main() void {
    const weights = [_]usize{ 2, 3, 4 };
    const values = [_]usize{ 3, 4, 5 };
    const cap: usize = 5;
    var dp = [_]usize{0} ** (cap + 1);
    for (weights, values) |w, v| {
        var c: usize = cap;
        while (c >= w) : (c -= 1) {
            dp[c] = @max(dp[c], dp[c - w] + v);
            if (c == w) break;
        }
    }
    std.debug.print("{d}\n", .{dp[cap]});
}
