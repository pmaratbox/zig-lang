const std = @import("std");

pub fn main() void {
    const n: usize = 10;
    var is_prime = [_]bool{true} ** (n + 1);
    is_prime[0] = false;
    is_prime[1] = false;
    var i: usize = 2;
    while (i * i <= n) : (i += 1) {
        if (is_prime[i]) {
            var j: usize = i * i;
            while (j <= n) : (j += i) {
                is_prime[j] = false;
            }
        }
    }

    var first = true;
    var k: usize = 2;
    while (k <= n) : (k += 1) {
        if (is_prime[k]) {
            if (!first) std.debug.print(" ", .{});
            std.debug.print("{d}", .{k});
            first = false;
        }
    }
    std.debug.print("\n", .{});
}
