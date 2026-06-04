const std = @import("std");

pub fn main() void {
    var a = [_]i32{ 5, 2, 8, 1, 9, 3 };
    const n = a.len;
    var gap = n / 2;
    while (gap > 0) : (gap /= 2) {
        var i = gap;
        while (i < n) : (i += 1) {
            const tmp = a[i];
            var j = i;
            while (j >= gap and a[j - gap] > tmp) : (j -= gap) {
                a[j] = a[j - gap];
            }
            a[j] = tmp;
        }
    }
    for (a, 0..) |v, idx| {
        if (idx != 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{v});
    }
    std.debug.print("\n", .{});
}
