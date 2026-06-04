const std = @import("std");

const Color = enum { RED, GREEN, BLUE };

pub fn main() void {
    inline for (std.meta.fields(Color), 0..) |field, i| {
        if (i != 0) std.debug.print(" ", .{});
        std.debug.print("{s}", .{field.name});
    }
    std.debug.print("\n", .{});
}
