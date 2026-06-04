const std = @import("std");

pub fn main() void {
    const text = "a b\nc";
    const chars = text.len;
    var lines: usize = 1;
    for (text) |c| {
        if (c == '\n') lines += 1;
    }
    var words: usize = 0;
    var it = std.mem.tokenizeAny(u8, text, " \n");
    while (it.next()) |_| words += 1;
    std.debug.print("{d} {d} {d}\n", .{ words, lines, chars });
}
