const std = @import("std");

pub fn main() void {
    var i: u32 = 1;
    while (i <= 3) : (i += 1) {
        var j: u32 = 0;
        while (j < i) : (j += 1) {
            std.debug.print("*", .{});
        }
        std.debug.print("\n", .{});
    }
}
