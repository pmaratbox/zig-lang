const std = @import("std");

const Red = struct {
    fn name(_: Red) []const u8 {
        return "red";
    }
};

const Circle = struct {
    color: Red,

    fn describe(self: Circle) void {
        std.debug.print("{s} circle\n", .{self.color.name()});
    }
};

pub fn main() void {
    const shape = Circle{ .color = Red{} };
    shape.describe();
}
