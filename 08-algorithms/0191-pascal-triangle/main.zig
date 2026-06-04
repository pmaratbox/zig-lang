const std = @import("std");

pub fn main() void {
    var row = [_]u64{0} ** 4;
    var n: usize = 0;
    while (n < 4) : (n += 1) {
        var k: usize = n;
        while (k > 0) : (k -= 1) {
            row[k] += row[k - 1];
        }
        row[0] = 1;
        var first = true;
        for (row[0 .. n + 1]) |v| {
            if (!first) std.debug.print(" ", .{});
            std.debug.print("{d}", .{v});
            first = false;
        }
        std.debug.print("\n", .{});
    }
}
