const std = @import("std");

pub fn main() void {
    const name = "world";

    std.debug.print("Hello, {s}!\n", .{name});

    var buf: [name.len]u8 = undefined;
    const upper = std.ascii.upperString(&buf, name);
    std.debug.print("{s}\n", .{upper});

    std.debug.print("length: {}\n", .{name.len});
}
