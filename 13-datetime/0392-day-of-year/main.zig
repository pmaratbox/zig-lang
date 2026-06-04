const std = @import("std");

fn isLeap(year: u32) bool {
    return (year % 4 == 0 and year % 100 != 0) or year % 400 == 0;
}

pub fn main() void {
    const year: u32 = 2000;
    const month: u32 = 3;
    const day: u32 = 1;

    const lengths = [_]u32{ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
    var doy: u32 = day;
    var m: u32 = 1;
    while (m < month) : (m += 1) {
        var len = lengths[m - 1];
        if (m == 2 and isLeap(year)) len += 1;
        doy += len;
    }
    std.debug.print("{d}\n", .{doy});
}
