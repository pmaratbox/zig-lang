const std = @import("std");

pub fn main() void {
    const a = "abcd";
    const b = "cdab";
    var buf: [8]u8 = undefined;
    @memcpy(buf[0..a.len], a);
    @memcpy(buf[a.len .. a.len * 2], a);
    const doubled = buf[0 .. a.len * 2];
    const is_rotation = a.len == b.len and std.mem.indexOf(u8, doubled, b) != null;
    std.debug.print("{s}\n", .{if (is_rotation) "yes" else "no"});
}
