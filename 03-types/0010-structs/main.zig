const std = @import("std");

const Person = struct {
    name: []const u8,
    age: u32,
};

pub fn main() void {
    const p = Person{ .name = "Ada", .age = 36 };

    std.debug.print("name: {s}\n", .{p.name});
    std.debug.print("age: {}\n", .{p.age});
}
