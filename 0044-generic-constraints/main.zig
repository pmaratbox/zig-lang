const std = @import("std");

fn largest(comptime T: type, a: T, b: T) T {
    if (T == []const u8) {
        return if (std.mem.order(u8, a, b) == .gt) a else b;
    }
    return if (a > b) a else b;
}

pub fn main() void {
    std.debug.print("{d}\n", .{largest(i32, 3, 9)});
    std.debug.print("{s}\n", .{largest([]const u8, "apple", "pear")});
}
