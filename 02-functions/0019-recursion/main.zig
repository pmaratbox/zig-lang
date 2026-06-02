const std = @import("std");

fn factorial(n: u64) u64 {
    if (n <= 1) {
        return 1;
    }
    return n * factorial(n - 1);
}

pub fn main() void {
    std.debug.print("factorial(5) = {}\n", .{factorial(5)});
}
