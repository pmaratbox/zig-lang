const std = @import("std");

pub fn main() void {
    const n: u8 = 255;
    std.debug.print("hex: {x}\n", .{n});
    std.debug.print("oct: {o}\n", .{n});
    std.debug.print("bin: {b}\n", .{n});
}
