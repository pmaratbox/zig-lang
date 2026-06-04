const std = @import("std");

pub fn main() void {
    var data = [_]i32{ 5, 1, 4, 2, 8 };
    var i: usize = 1;
    while (i < data.len) : (i += 1) {
        const key = data[i];
        var j: usize = i;
        while (j > 0 and data[j - 1] > key) : (j -= 1) {
            data[j] = data[j - 1];
        }
        data[j] = key;
    }
    var first = true;
    for (data) |x| {
        if (!first) std.debug.print(" ", .{});
        std.debug.print("{d}", .{x});
        first = false;
    }
    std.debug.print("\n", .{});
}
