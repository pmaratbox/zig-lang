const std = @import("std");

const MinMax = struct { lo: i32, hi: i32 };

fn minMax(a: i32, b: i32) MinMax {
    return if (a < b) .{ .lo = a, .hi = b } else .{ .lo = b, .hi = a };
}

pub fn main() void {
    const r = minMax(3, 7);
    std.debug.print("min: {d}\n", .{r.lo});
    std.debug.print("max: {d}\n", .{r.hi});
}
