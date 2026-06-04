const std = @import("std");

pub fn main() void {
    var n: u32 = 90210;
    var count: u32 = 0;
    while (true) {
        count += 1;
        n /= 10;
        if (n == 0) break;
    }
    std.debug.print("{d}\n", .{count});
}
