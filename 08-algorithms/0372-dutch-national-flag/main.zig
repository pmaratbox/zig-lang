const std = @import("std");

pub fn main() void {
    var a = [_]i32{ 2, 0, 2, 1, 1, 0 };
    var low: usize = 0;
    var mid: usize = 0;
    var high: usize = a.len; // exclusive, decremented before use
    while (mid < high) {
        if (a[mid] == 0) {
            const t = a[low];
            a[low] = a[mid];
            a[mid] = t;
            low += 1;
            mid += 1;
        } else if (a[mid] == 1) {
            mid += 1;
        } else {
            high -= 1;
            const t = a[high];
            a[high] = a[mid];
            a[mid] = t;
        }
    }
    for (a, 0..) |v, idx| {
        if (idx != 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{v});
    }
    std.debug.print("\n", .{});
}
