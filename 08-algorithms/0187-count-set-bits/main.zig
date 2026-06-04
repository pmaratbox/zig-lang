const std = @import("std");

pub fn main() void {
    const n: u32 = 13;
    std.debug.print("{d}\n", .{@popCount(n)});
}
