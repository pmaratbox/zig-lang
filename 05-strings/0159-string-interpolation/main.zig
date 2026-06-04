const std = @import("std");

pub fn main() void {
    const name = "Ada";
    const age = 36;
    std.debug.print("{s} is {d}\n", .{ name, age });
}
