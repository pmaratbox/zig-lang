const std = @import("std");

fn inc(n: i32) i32 {
    return n + 1;
}

fn double(n: i32) i32 {
    return n * 2;
}

fn negate(n: i32) i32 {
    return -n;
}

const Fn = *const fn (i32) i32;

fn pipe(fns: []const Fn, x: i32) i32 {
    var acc = x;
    for (fns) |f| acc = f(acc);
    return acc;
}

pub fn main() void {
    const stages = [_]Fn{ inc, double, negate };
    std.debug.print("{d}\n", .{pipe(&stages, 3)});
}
