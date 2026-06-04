const std = @import("std");

pub fn main() void {
    const src = "1 + 2";
    var first = true;
    for (src) |c| {
        const name = switch (c) {
            '0'...'9' => "NUM",
            '+' => "PLUS",
            else => continue,
        };
        if (!first) std.debug.print(" ", .{});
        std.debug.print("{s}", .{name});
        first = false;
    }
    std.debug.print("\n", .{});
}
