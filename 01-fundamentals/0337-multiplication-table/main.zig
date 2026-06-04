const std = @import("std");

pub fn main() void {
    var i: u32 = 1;
    while (i <= 3) : (i += 1) {
        var j: u32 = 1;
        while (j <= 3) : (j += 1) {
            if (j != 1) std.debug.print(" ", .{});
            std.debug.print("{d}", .{i * j});
        }
        std.debug.print("\n", .{});
    }
}
