const std = @import("std");

pub fn main() void {
    const text = "hello world";
    var it = std.mem.splitBackwardsScalar(u8, text, ' ');
    var first = true;
    while (it.next()) |word| {
        if (!first) std.debug.print(" ", .{});
        std.debug.print("{s}", .{word});
        first = false;
    }
    std.debug.print("\n", .{});
}
