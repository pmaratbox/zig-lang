const std = @import("std");

fn applyTwice(f: *const fn (i32) i32, x: i32) i32 {
    return f(f(x));
}

fn inc(x: i32) i32 {
    return x + 1;
}

pub fn main() void {
    std.debug.print("{d}\n", .{applyTwice(inc, 3)});
}
