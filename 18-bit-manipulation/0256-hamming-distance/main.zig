const std = @import("std");

pub fn main() void {
    const a: u32 = 1;
    const b: u32 = 4;
    const dist = @popCount(a ^ b);
    std.debug.print("{d}\n", .{dist});
}
