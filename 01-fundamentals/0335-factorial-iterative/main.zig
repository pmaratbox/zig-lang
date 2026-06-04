const std = @import("std");

pub fn main() void {
    var result: u64 = 1;
    var i: u64 = 1;
    while (i <= 5) : (i += 1) {
        result *= i;
    }
    std.debug.print("{d}\n", .{result});
}
