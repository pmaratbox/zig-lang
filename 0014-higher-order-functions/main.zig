const std = @import("std");

fn inc(x: i32) i32 {
    return x + 1;
}

fn double(x: i32) i32 {
    return x * 2;
}

fn apply(f: *const fn (i32) i32, x: i32) i32 {
    return f(x);
}

pub fn main() void {
    std.debug.print("inc 5 = {}\n", .{apply(&inc, 5)});
    std.debug.print("double 5 = {}\n", .{apply(&double, 5)});
}
