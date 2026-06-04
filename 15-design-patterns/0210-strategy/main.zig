const std = @import("std");

fn add(a: i32, b: i32) i32 {
    return a + b;
}

fn mul(a: i32, b: i32) i32 {
    return a * b;
}

fn select(name: []const u8) *const fn (i32, i32) i32 {
    if (std.mem.eql(u8, name, "add")) return &add;
    return &mul;
}

pub fn main() void {
    const s1 = select("add");
    const s2 = select("mul");
    std.debug.print("{d} {d}\n", .{ s1(3, 4), s2(3, 4) });
}
