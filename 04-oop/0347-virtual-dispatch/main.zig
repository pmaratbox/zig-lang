const std = @import("std");

const Shape = struct {
    describeFn: *const fn () []const u8,

    fn describe(self: Shape) []const u8 {
        return self.describeFn();
    }
};

const Circle = struct {
    fn describe() []const u8 {
        return "circle";
    }
};

const Square = struct {
    fn describe() []const u8 {
        return "square";
    }
};

const Triangle = struct {
    fn describe() []const u8 {
        return "triangle";
    }
};

pub fn main() void {
    const shapes = [_]Shape{
        .{ .describeFn = Circle.describe },
        .{ .describeFn = Square.describe },
        .{ .describeFn = Triangle.describe },
    };
    for (shapes, 0..) |s, i| {
        if (i != 0) std.debug.print(" ", .{});
        std.debug.print("{s}", .{s.describe()});
    }
    std.debug.print("\n", .{});
}
