const std = @import("std");

const Color = enum {
    red,
    green,
    blue,
};

pub fn main() void {
    std.debug.print("green: {}\n", .{@intFromEnum(Color.green)});
    std.debug.print("blue: {}\n", .{@intFromEnum(Color.blue)});
}
