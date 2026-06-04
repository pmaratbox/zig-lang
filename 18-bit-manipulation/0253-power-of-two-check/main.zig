const std = @import("std");

fn isPow2(n: u32) bool {
    return n > 0 and (n & (n - 1)) == 0;
}

pub fn main() void {
    std.debug.print("{s} {s}\n", .{
        if (isPow2(16)) "yes" else "no",
        if (isPow2(18)) "yes" else "no",
    });
}
