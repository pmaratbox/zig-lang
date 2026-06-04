const std = @import("std");

pub fn main() void {
    const xs = [_]i32{ 1, 2, 3 };
    var out: [16]i32 = undefined;
    var n: usize = 0;
    for (xs) |x| {
        // x -> [x, x*10]
        out[n] = x;
        out[n + 1] = x * 10;
        n += 2;
    }

    for (out[0..n], 0..) |v, i| {
        if (i != 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{v});
    }
    std.debug.print("\n", .{});
}
