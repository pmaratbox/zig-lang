const std = @import("std");

pub fn main() void {
    const x: u8 = 1;
    const reversed = @bitReverse(x);
    std.debug.print("{d}\n", .{reversed});
}
