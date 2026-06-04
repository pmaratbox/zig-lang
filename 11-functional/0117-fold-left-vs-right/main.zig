const std = @import("std");

fn sub(a: i32, b: i32) i32 {
    return a - b;
}

fn foldl(xs: []const i32, init: i32) i32 {
    var acc = init;
    for (xs) |x| acc = sub(acc, x);
    return acc;
}

fn foldr(xs: []const i32, init: i32) i32 {
    var acc = init;
    var i = xs.len;
    while (i > 0) {
        i -= 1;
        acc = sub(xs[i], acc);
    }
    return acc;
}

pub fn main() void {
    const xs = [_]i32{ 1, 2, 3 };
    std.debug.print("{d} {d}\n", .{ foldl(&xs, 0), foldr(&xs, 0) });
}
