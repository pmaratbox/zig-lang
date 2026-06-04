const std = @import("std");

pub fn main() void {
    const row = "00100";
    const n = row.len;
    var out: [n]u8 = undefined;
    for (0..n) |i| {
        const left: u8 = if (i == 0) 0 else row[i - 1] - '0';
        const right: u8 = if (i == n - 1) 0 else row[i + 1] - '0';
        out[i] = (left ^ right) + '0';
    }
    std.debug.print("{s}\n", .{out[0..]});
}
