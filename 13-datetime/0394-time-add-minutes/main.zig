const std = @import("std");

pub fn main() void {
    const total = 10 * 60 + 45 + 90;
    const hh = @divTrunc(total, 60) % 24;
    const mm = @mod(total, 60);
    std.debug.print("{d:0>2}:{d:0>2}\n", .{ hh, mm });
}
