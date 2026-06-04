const std = @import("std");

pub fn main() void {
    const a = [_]usize{ 3, 1, 2, 3, 1 };
    var counts = [_]usize{0} ** 4; // values 0..3
    for (a) |v| counts[v] += 1;

    var first = true;
    var value: usize = 0;
    while (value < counts.len) : (value += 1) {
        var c = counts[value];
        while (c > 0) : (c -= 1) {
            if (!first) std.debug.print(" ", .{});
            std.debug.print("{d}", .{value});
            first = false;
        }
    }
    std.debug.print("\n", .{});
}
