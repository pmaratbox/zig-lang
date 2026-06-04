const std = @import("std");

pub fn main() void {
    defer std.debug.print("\n", .{});
    defer std.debug.print("1", .{});
    defer std.debug.print("2 ", .{});
    defer std.debug.print("3 ", .{});
}
