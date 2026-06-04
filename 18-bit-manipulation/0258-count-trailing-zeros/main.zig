const std = @import("std");

pub fn main() void {
    const x: u32 = 8;
    const tz = @ctz(x);
    std.debug.print("{d}\n", .{tz});
}
