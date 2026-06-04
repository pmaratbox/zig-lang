const std = @import("std");

fn recursiveSum(xs: []const i32) i32 {
    if (xs.len == 0) return 0;
    return xs[0] + recursiveSum(xs[1..]);
}

pub fn main() void {
    const total = recursiveSum(&[_]i32{ 1, 2, 3, 4 });
    std.debug.print("{d}\n", .{total});
}
