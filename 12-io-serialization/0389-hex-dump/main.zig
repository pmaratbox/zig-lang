const std = @import("std");

pub fn main() void {
    const bytes = "Hi";
    for (bytes, 0..) |b, i| {
        if (i != 0) std.debug.print(" ", .{});
        std.debug.print("{x:0>2}", .{b});
    }
    std.debug.print("\n", .{});
}
