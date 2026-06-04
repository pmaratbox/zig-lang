const std = @import("std");

pub fn main() void {
    const x: u32 = 12;
    const low = x & (~x +% 1);
    std.debug.print("{d}\n", .{low});
}
