const std = @import("std");

pub fn main() void {
    const idx = std.mem.indexOf(u8, "hello", "lo");
    std.debug.print("{d}\n", .{idx.?});
}
