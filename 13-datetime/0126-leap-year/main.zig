const std = @import("std");

fn isLeap(year: u32) bool {
    return year % 4 == 0 and (year % 100 != 0 or year % 400 == 0);
}

pub fn main() void {
    const years = [_]u32{ 2000, 1900, 2024 };
    for (years, 0..) |year, i| {
        if (i != 0) std.debug.print(" ", .{});
        std.debug.print("{s}", .{if (isLeap(year)) "yes" else "no"});
    }
    std.debug.print("\n", .{});
}
