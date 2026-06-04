const std = @import("std");

const Address = struct {
    city: []const u8,
};

const Person = struct {
    name: []const u8,
    address: Address,
};

pub fn main() void {
    const person = Person{
        .name = "Ada",
        .address = .{ .city = "London" },
    };
    std.debug.print("{s}\n", .{person.address.city});
}
