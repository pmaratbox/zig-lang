const std = @import("std");

const Meters = i64;

pub fn main() void {
    const distance: Meters = 5;
    std.debug.print("distance: {d}\n", .{distance});
}
