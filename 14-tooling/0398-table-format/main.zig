const std = @import("std");

pub fn main() void {
    const rows = [_][2][]const u8{
        .{ "a", "1" },
        .{ "bb", "22" },
    };

    var width: usize = 0;
    for (rows) |row| {
        if (row[0].len > width) width = row[0].len;
    }

    for (rows) |row| {
        std.debug.print("{s}", .{row[0]});
        var pad = width - row[0].len;
        while (pad > 0) : (pad -= 1) {
            std.debug.print(" ", .{});
        }
        std.debug.print(" | {s}\n", .{row[1]});
    }
}
