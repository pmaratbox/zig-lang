const std = @import("std");

pub fn main() void {
    var n: u64 = 60;
    var first = true;
    while (n % 2 == 0) : (n = @divExact(n, 2)) {
        if (!first) std.debug.print(" ", .{});
        std.debug.print("2", .{});
        first = false;
    }
    var f: u64 = 3;
    while (f * f <= n) : (f += 2) {
        while (n % f == 0) : (n = @divExact(n, f)) {
            if (!first) std.debug.print(" ", .{});
            std.debug.print("{d}", .{f});
            first = false;
        }
    }
    if (n > 1) {
        if (!first) std.debug.print(" ", .{});
        std.debug.print("{d}", .{n});
        first = false;
    }
    std.debug.print("\n", .{});
}
