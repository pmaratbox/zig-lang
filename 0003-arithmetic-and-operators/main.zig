const std = @import("std");

pub fn main() void {
    const a: i32 = 17;
    const b: i32 = 5;

    std.debug.print("a + b: {}\n", .{a + b});
    std.debug.print("a - b: {}\n", .{a - b});
    std.debug.print("a * b: {}\n", .{a * b});
    std.debug.print("a / b: {}\n", .{@divTrunc(a, b)});
    std.debug.print("a % b: {}\n", .{@rem(a, b)});
}
