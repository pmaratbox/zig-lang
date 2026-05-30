const std = @import("std");

const Rectangle = struct { width: i32, height: i32 };
const Square = struct { side: i32 };

const Shape = union(enum) {
    rectangle: Rectangle,
    square: Square,

    fn name(self: Shape) []const u8 {
        return switch (self) {
            .rectangle => "rectangle",
            .square => "square",
        };
    }

    fn area(self: Shape) i32 {
        return switch (self) {
            .rectangle => |r| r.width * r.height,
            .square => |s| s.side * s.side,
        };
    }
};

pub fn main() void {
    const shapes = [_]Shape{
        .{ .rectangle = .{ .width = 3, .height = 4 } },
        .{ .square = .{ .side = 5 } },
    };
    for (shapes) |s| {
        std.debug.print("{s} area: {}\n", .{ s.name(), s.area() });
    }
}
