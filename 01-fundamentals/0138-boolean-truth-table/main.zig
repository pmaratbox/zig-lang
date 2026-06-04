const std = @import("std");

pub fn main() void {
    const rows = [_][2]bool{
        .{ true, true },
        .{ true, false },
        .{ false, true },
        .{ false, false },
    };
    for (rows) |row| {
        const a = row[0];
        const b = row[1];
        std.debug.print("{} {} {} {} {}\n", .{ a, b, a and b, a or b, a != b });
    }
}
