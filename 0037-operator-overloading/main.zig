const std = @import("std");

const Point = struct {
    x: i32,
    y: i32,

    fn add(self: Point, other: Point) Point {
        return Point{ .x = self.x + other.x, .y = self.y + other.y };
    }
};

pub fn main() void {
    const p = (Point{ .x = 1, .y = 2 }).add(Point{ .x = 3, .y = 4 });
    std.debug.print("({d}, {d})\n", .{ p.x, p.y });
}
