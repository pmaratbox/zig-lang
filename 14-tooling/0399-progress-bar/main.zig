const std = @import("std");

pub fn main() void {
    const width: usize = 10;
    const pct: f64 = 0.4;
    const filled: usize = @intFromFloat(@round(@as(f64, @floatFromInt(width)) * pct));

    std.debug.print("[", .{});
    var i: usize = 0;
    while (i < filled) : (i += 1) {
        std.debug.print("#", .{});
    }
    var j: usize = filled;
    while (j < width) : (j += 1) {
        std.debug.print("-", .{});
    }
    std.debug.print("]\n", .{});
}
