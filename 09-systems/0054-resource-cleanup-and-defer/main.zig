const std = @import("std");

pub fn main() void {
    std.debug.print("open\n", .{});
    defer std.debug.print("close\n", .{});
    std.debug.print("use\n", .{});
}
