const std = @import("std");

const Shape = union(enum) {
    rectangle: struct { w: f64, h: f64 },
    triangle: struct { base: f64, height: f64 },

    fn area(self: Shape) f64 {
        return switch (self) {
            .rectangle => |r| r.w * r.h,
            .triangle => |t| t.base * t.height / 2.0,
        };
    }
};

pub fn main() void {
    const shapes = [_]Shape{
        .{ .rectangle = .{ .w = 2, .h = 3 } },
        .{ .triangle = .{ .base = 4, .height = 4 } },
    };
    var total: f64 = 0;
    for (shapes) |s| total += s.area();
    std.debug.print("total area: {d}\n", .{total});
}
