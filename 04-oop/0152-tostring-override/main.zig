const std = @import("std");

const Point = struct {
    x: i32,
    y: i32,

    pub fn format(self: Point, writer: *std.Io.Writer) !void {
        try writer.print("Point({d}, {d})", .{ self.x, self.y });
    }
};

pub fn main() void {
    const p = Point{ .x = 1, .y = 2 };
    std.debug.print("{f}\n", .{p});
}
