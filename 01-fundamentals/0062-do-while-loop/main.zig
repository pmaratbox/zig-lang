const std = @import("std");

pub fn main() void {
    var i: i32 = 1;
    var first = true;
    while (true) {
        if (!first) std.debug.print(" ", .{});
        std.debug.print("{d}", .{i});
        first = false;
        i += 1;
        if (i > 3) break;
    }
    std.debug.print("\n", .{});
}
