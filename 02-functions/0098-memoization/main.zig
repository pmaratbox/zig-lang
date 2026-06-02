const std = @import("std");

var cache = [_]i32{-1} ** 11;

fn fib(n: usize) i32 {
    if (n < 2) return @intCast(n);
    if (cache[n] != -1) return cache[n];
    cache[n] = fib(n - 1) + fib(n - 2);
    return cache[n];
}

pub fn main() void {
    std.debug.print("{d}\n", .{fib(10)});
}
