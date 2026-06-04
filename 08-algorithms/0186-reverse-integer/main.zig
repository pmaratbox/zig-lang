const std = @import("std");

pub fn main() void {
    var n: u64 = 1234;
    var rev: u64 = 0;
    while (n != 0) : (n = @divFloor(n, 10)) {
        rev = rev * 10 + n % 10;
    }
    std.debug.print("{d}\n", .{rev});
}
