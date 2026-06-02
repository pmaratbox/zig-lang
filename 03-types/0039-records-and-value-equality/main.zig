const std = @import("std");

const Point = struct {
    x: i32,
    y: i32,
};

pub fn main() void {
    const p1 = Point{ .x = 1, .y = 2 };
    const p2 = Point{ .x = 1, .y = 2 };
    std.debug.print("point: ({d}, {d})\n", .{ p1.x, p1.y });
    const equal = std.meta.eql(p1, p2);
    std.debug.print("equal: {s}\n", .{if (equal) "yes" else "no"});
}
