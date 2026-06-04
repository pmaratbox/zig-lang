const std = @import("std");

pub fn main() void {
    const text = "[1,2,3]";
    const inner = text[1 .. text.len - 1];
    var sum: i64 = 0;
    var it = std.mem.tokenizeScalar(u8, inner, ',');
    while (it.next()) |tok| {
        sum += std.fmt.parseInt(i64, tok, 10) catch 0;
    }
    std.debug.print("{d}\n", .{sum});
}
