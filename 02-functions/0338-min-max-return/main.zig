const std = @import("std");

const MinMaxReturn = struct { min: i32, max: i32 };

fn minMax(xs: []const i32) MinMaxReturn {
    var lo = xs[0];
    var hi = xs[0];
    for (xs[1..]) |x| {
        if (x < lo) lo = x;
        if (x > hi) hi = x;
    }
    return .{ .min = lo, .max = hi };
}

pub fn main() void {
    const r = minMax(&[_]i32{ 4, 1, 7 });
    std.debug.print("{d} {d}\n", .{ r.min, r.max });
}
