const std = @import("std");

pub fn main() void {
    const input = "aab";
    var order: [input.len]u8 = undefined;
    var counts: [input.len]usize = undefined;
    var n: usize = 0;

    outer: for (input) |c| {
        var i: usize = 0;
        while (i < n) : (i += 1) {
            if (order[i] == c) {
                counts[i] += 1;
                continue :outer;
            }
        }
        order[n] = c;
        counts[n] = 1;
        n += 1;
    }

    var i: usize = 0;
    while (i < n) : (i += 1) {
        if (i != 0) std.debug.print(" ", .{});
        std.debug.print("{c}:{d}", .{ order[i], counts[i] });
    }
    std.debug.print("\n", .{});
}
