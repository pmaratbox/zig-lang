const std = @import("std");

const Point = struct {
    x: i32,
    y: i32,
};

pub fn main() void {
    const p1 = Point{ .x = 1, .y = 2 };
    var p2 = p1;
    p2.x = 9;
    std.debug.print("original: ({d}, {d})\n", .{ p1.x, p1.y });
    std.debug.print("updated: ({d}, {d})\n", .{ p2.x, p2.y });
}
