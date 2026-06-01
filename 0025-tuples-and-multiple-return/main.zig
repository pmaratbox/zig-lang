const std = @import("std");

fn minMax(a: i32, b: i32) struct { i32, i32 } {
    return if (a < b) .{ a, b } else .{ b, a };
}

pub fn main() void {
    const lo, const hi = minMax(3, 7);
    std.debug.print("min: {d}\n", .{lo});
    std.debug.print("max: {d}\n", .{hi});
}
