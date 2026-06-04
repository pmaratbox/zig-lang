const std = @import("std");

pub fn main() void {
    const values = [_]usize{ 3, 1, 2 };
    for (values) |n| {
        var i: usize = 0;
        while (i < n) : (i += 1) {
            std.debug.print("#", .{});
        }
        std.debug.print("\n", .{});
    }
}
