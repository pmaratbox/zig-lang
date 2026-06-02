const std = @import("std");

fn classify(n: i32) []const u8 {
    if (n < 0) return "negative";
    if (n == 0) return "zero";
    return "positive";
}

pub fn main() void {
    const vals = [_]i32{ -1, 0, 5 };
    for (vals) |n| {
        std.debug.print("{s}\n", .{classify(n)});
    }
}
