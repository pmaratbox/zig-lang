const std = @import("std");

fn quicksort(a: []i32, lo: isize, hi: isize) void {
    if (lo >= hi) return;
    const pivot = a[@intCast(hi)];
    var i = lo;
    var j = lo;
    while (j < hi) : (j += 1) {
        if (a[@intCast(j)] < pivot) {
            std.mem.swap(i32, &a[@intCast(i)], &a[@intCast(j)]);
            i += 1;
        }
    }
    std.mem.swap(i32, &a[@intCast(i)], &a[@intCast(hi)]);
    quicksort(a, lo, i - 1);
    quicksort(a, i + 1, hi);
}

pub fn main() void {
    var data = [_]i32{ 3, 1, 4, 1, 5, 2 };
    quicksort(&data, 0, @as(isize, data.len) - 1);
    var first = true;
    for (data) |x| {
        if (!first) std.debug.print(" ", .{});
        std.debug.print("{d}", .{x});
        first = false;
    }
    std.debug.print("\n", .{});
}
