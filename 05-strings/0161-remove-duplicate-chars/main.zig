const std = @import("std");

pub fn main() void {
    const text = "aabbcc";
    var seen = [_]bool{false} ** 256;
    var buf: [256]u8 = undefined;
    var n: usize = 0;
    for (text) |c| {
        if (!seen[c]) {
            seen[c] = true;
            buf[n] = c;
            n += 1;
        }
    }
    std.debug.print("{s}\n", .{buf[0..n]});
}
