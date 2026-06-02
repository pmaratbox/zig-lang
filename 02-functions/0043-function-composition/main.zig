const std = @import("std");

fn inc(x: i32) i32 {
    return x + 1;
}

fn twice(x: i32) i32 {
    return x * 2;
}

fn compose(comptime f: fn (i32) i32, comptime g: fn (i32) i32, x: i32) i32 {
    return f(g(x));
}

pub fn main() void {
    std.debug.print("{d}\n", .{compose(inc, twice, 3)});
}
