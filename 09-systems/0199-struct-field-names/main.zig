const std = @import("std");

const Point = struct { x: i32, y: i32 };

pub fn main() void {
    inline for (std.meta.fields(Point), 0..) |field, i| {
        if (i != 0) std.debug.print(" ", .{});
        std.debug.print("{s}", .{field.name});
    }
    std.debug.print("\n", .{});
}
