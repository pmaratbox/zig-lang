const std = @import("std");

pub fn main() void {
    const temps = [_]i32{ 100, 0 };
    for (temps) |c| {
        const f = @divTrunc(c * 9, 5) + 32;
        std.debug.print("{d}C = {d}F\n", .{ c, f });
    }
}
