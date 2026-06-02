const std = @import("std");

pub fn main() void {
    var n: i32 = 1234;
    var total: i32 = 0;
    while (n > 0) {
        total += @rem(n, 10);
        n = @divTrunc(n, 10);
    }
    std.debug.print("{d}\n", .{total});
}
