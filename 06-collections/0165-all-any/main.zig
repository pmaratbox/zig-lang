const std = @import("std");

pub fn main() void {
    const items = [_]u32{ 2, 4, 6 };

    var all_even = true;
    for (items) |x| {
        if (x % 2 != 0) all_even = false;
    }

    var any_odd = false;
    for (items) |x| {
        if (x % 2 != 0) any_odd = true;
    }

    std.debug.print("{s} {s}\n", .{
        if (all_even) "yes" else "no",
        if (any_odd) "yes" else "no",
    });
}
