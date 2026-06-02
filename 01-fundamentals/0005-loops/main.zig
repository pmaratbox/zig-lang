const std = @import("std");

pub fn main() void {
    for (1..6) |i| {
        std.debug.print("{}\n", .{i});
    }
}
