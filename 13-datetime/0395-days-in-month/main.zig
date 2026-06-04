const std = @import("std");

fn isLeap(year: u32) bool {
    return (year % 4 == 0 and year % 100 != 0) or year % 400 == 0;
}

fn daysInMonth(year: u32, month: u32) u32 {
    const lengths = [_]u32{ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
    var len = lengths[month - 1];
    if (month == 2 and isLeap(year)) len += 1;
    return len;
}

pub fn main() void {
    std.debug.print("{d} {d}\n", .{ daysInMonth(2000, 2), daysInMonth(2001, 2) });
}
