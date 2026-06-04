const std = @import("std");

pub fn main() void {
    var c: u64 = 1;
    var out: [5]u64 = undefined;
    var n: usize = 0;
    while (n < 5) : (n += 1) {
        out[n] = c;
        c = c * 2 * (2 * @as(u64, n) + 1) / (@as(u64, n) + 2);
    }
    std.debug.print("{d} {d} {d} {d} {d}\n", .{ out[0], out[1], out[2], out[3], out[4] });
}
