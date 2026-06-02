const std = @import("std");

pub fn main() void {
    const text = "hello world";
    var buf: [64]u8 = undefined;
    @memcpy(buf[0..text.len], text);
    var start = true;
    for (buf[0..text.len]) |*ch| {
        if (ch.* == ' ') {
            start = true;
        } else if (start) {
            ch.* = std.ascii.toUpper(ch.*);
            start = false;
        }
    }
    std.debug.print("{s}\n", .{buf[0..text.len]});
}
