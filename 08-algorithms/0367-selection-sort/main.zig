const std = @import("std");

pub fn main() void {
    var a = [_]i32{ 5, 1, 4, 2 };
    const n = a.len;
    var i: usize = 0;
    while (i < n) : (i += 1) {
        var min = i;
        var j = i + 1;
        while (j < n) : (j += 1) {
            if (a[j] < a[min]) min = j;
        }
        const tmp = a[i];
        a[i] = a[min];
        a[min] = tmp;
    }
    for (a, 0..) |v, idx| {
        if (idx != 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{v});
    }
    std.debug.print("\n", .{});
}
