const std = @import("std");

pub fn main() void {
    var n: u64 = 6;
    var steps: u64 = 0;
    while (n != 1) : (steps += 1) {
        if (n % 2 == 0) {
            n = @divExact(n, 2);
        } else {
            n = 3 * n + 1;
        }
    }
    std.debug.print("{d}\n", .{steps});
}
