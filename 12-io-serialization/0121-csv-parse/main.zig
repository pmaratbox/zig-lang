const std = @import("std");

pub fn main() void {
    const csv = "alice,30\nbob,25";

    var first = true;
    var rows = std.mem.splitScalar(u8, csv, '\n');
    while (rows.next()) |row| {
        if (row.len == 0) continue;
        var fields = std.mem.splitScalar(u8, row, ',');
        const name = fields.next().?;
        const value = fields.next().?;
        if (!first) std.debug.print(" ", .{});
        std.debug.print("{s}={s}", .{ name, value });
        first = false;
    }
    std.debug.print("\n", .{});
}
