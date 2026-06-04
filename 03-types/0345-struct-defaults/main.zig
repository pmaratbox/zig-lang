const std = @import("std");

const Point = struct {
    x: i64 = 0,
    y: i64 = 0,
};

pub fn main() void {
    const a = Point{};
    const b = Point{ .x = 5 };
    std.debug.print("{d} {d}\n{d} {d}\n", .{ a.x, a.y, b.x, b.y });
}
