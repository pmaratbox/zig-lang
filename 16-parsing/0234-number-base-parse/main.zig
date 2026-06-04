const std = @import("std");

pub fn main() void {
    const hex = std.fmt.parseInt(u32, "ff", 16) catch 0;
    const bin = std.fmt.parseInt(u32, "101", 2) catch 0;
    std.debug.print("{d} {d}\n", .{ hex, bin });
}
