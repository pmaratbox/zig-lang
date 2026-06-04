const std = @import("std");

pub fn main() void {
    const bits: u3 = 0b101;
    var out: [3]u8 = undefined;
    out[0] = if (bits & 0b100 != 0) 'r' else '-';
    out[1] = if (bits & 0b010 != 0) 'w' else '-';
    out[2] = if (bits & 0b001 != 0) 'x' else '-';
    std.debug.print("{s}\n", .{out[0..]});
}
