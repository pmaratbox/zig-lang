const std = @import("std");

pub fn main() void {
    const text = "abc";
    const shift: u8 = 1;
    var buf: [16]u8 = undefined;
    for (text, 0..) |ch, i| {
        buf[i] = (ch - 'a' + shift) % 26 + 'a';
    }
    std.debug.print("{s}\n", .{buf[0..text.len]});
}
