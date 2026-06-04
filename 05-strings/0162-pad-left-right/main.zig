const std = @import("std");

pub fn main() void {
    const s = "5";
    const width = 3;
    const pad = width - s.len;
    std.debug.print("{s}{s}|{s}{s}\n", .{
        " " ** pad,
        s,
        s,
        " " ** pad,
    });
}
