const std = @import("std");

fn check(cond: bool) void {
    std.debug.assert(cond);
}

pub fn main() void {
    check(1 + 1 == 2);
    check(2 * 3 == 6);
    check(10 - 4 == 6);
    std.debug.print("all passed\n", .{});
}
