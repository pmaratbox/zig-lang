const std = @import("std");

pub fn main() void {
    std.debug.print("pi: {d:.2}\n", .{3.14159});
    std.debug.print("id: {d:0>5}\n", .{42});
}
