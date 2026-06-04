const std = @import("std");

pub fn main() void {
    const spec = "a-e";
    const start = spec[0];
    const end = spec[2];
    var buf: [64]u8 = undefined;
    var n: usize = 0;
    var c: u8 = start;
    while (c <= end) : (c += 1) {
        buf[n] = c;
        n += 1;
    }
    std.debug.print("{s}\n", .{buf[0..n]});
}
