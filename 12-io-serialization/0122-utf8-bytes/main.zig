const std = @import("std");

pub fn main() void {
    const text = "Hi";
    for (text, 0..) |byte, i| {
        if (i != 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{byte});
    }
    std.debug.print("\n", .{});
}
