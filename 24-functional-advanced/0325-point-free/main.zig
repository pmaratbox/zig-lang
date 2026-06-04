const std = @import("std");

fn square(x: i32) i32 {
    return x * x;
}

fn sum(xs: []const i32) i32 {
    var acc: i32 = 0;
    for (xs) |x| acc += x;
    return acc;
}

// sumOfSquares = sum . map(square)
fn sumOfSquares(xs: []const i32) i32 {
    var squared: [16]i32 = undefined;
    for (xs, 0..) |x, i| squared[i] = square(x);
    return sum(squared[0..xs.len]);
}

pub fn main() void {
    const xs = [_]i32{ 1, 2, 3 };
    std.debug.print("{d}\n", .{sumOfSquares(&xs)});
}
