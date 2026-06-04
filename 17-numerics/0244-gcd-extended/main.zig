const std = @import("std");

const Result = struct { g: i64, x: i64, y: i64 };

fn extgcd(a: i64, b: i64) Result {
    if (b == 0) return .{ .g = a, .x = 1, .y = 0 };
    const r = extgcd(b, @mod(a, b));
    return .{ .g = r.g, .x = r.y, .y = r.x - @divTrunc(a, b) * r.y };
}

pub fn main() void {
    const r = extgcd(30, 12);
    std.debug.print("{d} {d} {d}\n", .{ r.g, r.x, r.y });
}
