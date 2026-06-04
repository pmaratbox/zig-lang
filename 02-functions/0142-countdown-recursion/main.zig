const std = @import("std");

fn countdown(n: u64) void {
    if (n == 0) return;
    if (n == 1) {
        std.debug.print("{d}", .{n});
    } else {
        std.debug.print("{d} ", .{n});
    }
    countdown(n - 1);
}

pub fn main() void {
    countdown(5);
    std.debug.print("\n", .{});
}
