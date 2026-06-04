const std = @import("std");

pub fn main() void {
    var data = [_]i32{ 5, 1, 4, 2, 8 };
    var n: usize = data.len;
    while (n > 1) : (n -= 1) {
        var i: usize = 1;
        while (i < n) : (i += 1) {
            if (data[i - 1] > data[i]) {
                std.mem.swap(i32, &data[i - 1], &data[i]);
            }
        }
    }
    var first = true;
    for (data) |x| {
        if (!first) std.debug.print(" ", .{});
        std.debug.print("{d}", .{x});
        first = false;
    }
    std.debug.print("\n", .{});
}
