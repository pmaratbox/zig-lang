const std = @import("std");

pub fn main() void {
    const bit: u8 = 1;
    var x: u8 = 0;
    x |= (@as(u8, 1) << bit);
    const set_val = x;
    x &= ~(@as(u8, 1) << bit);
    const clear_val = x;
    x ^= (@as(u8, 1) << bit);
    const toggle_val = x;
    std.debug.print("{d} {d} {d}\n", .{ set_val, clear_val, toggle_val });
}
