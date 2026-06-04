const std = @import("std");

pub fn main() void {
    const values = [_]u32{ 1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 };
    const symbols = [_][]const u8{ "M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I" };
    var n: u32 = 14;
    var buf: [32]u8 = undefined;
    var len: usize = 0;
    for (values, symbols) |v, sym| {
        while (n >= v) {
            n -= v;
            @memcpy(buf[len .. len + sym.len], sym);
            len += sym.len;
        }
    }
    std.debug.print("{s}\n", .{buf[0..len]});
}
