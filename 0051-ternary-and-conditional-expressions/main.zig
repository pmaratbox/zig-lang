const std = @import("std");

pub fn main() void {
    for ([_]i32{ 4, 7 }) |n| {
        const label = if (@rem(n, 2) == 0) "even" else "odd";
        std.debug.print("{d}: {s}\n", .{ n, label });
    }
}
