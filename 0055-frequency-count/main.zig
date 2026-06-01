const std = @import("std");

pub fn main() void {
    const word = "banana";
    var counts = [_]u32{0} ** 256;
    for (word) |ch| {
        counts[ch] += 1;
    }

    var first = true;
    for (counts, 0..) |n, c| {
        if (n > 0) {
            if (!first) std.debug.print(" ", .{});
            std.debug.print("{c}:{d}", .{ @as(u8, @intCast(c)), n });
            first = false;
        }
    }
    std.debug.print("\n", .{});
}
