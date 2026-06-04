const std = @import("std");

fn lowerBound(a: []const i32, x: i32) usize {
    var lo: usize = 0;
    var hi: usize = a.len;
    while (lo < hi) {
        const mid = lo + (hi - lo) / 2;
        if (a[mid] < x) lo = mid + 1 else hi = mid;
    }
    return lo;
}

fn upperBound(a: []const i32, x: i32) usize {
    var lo: usize = 0;
    var hi: usize = a.len;
    while (lo < hi) {
        const mid = lo + (hi - lo) / 2;
        if (a[mid] <= x) lo = mid + 1 else hi = mid;
    }
    return lo;
}

pub fn main() void {
    const a = [_]i32{ 1, 3, 5, 5, 7 };
    const lb = lowerBound(&a, 5);
    const ub = upperBound(&a, 5);
    std.debug.print("{d} {d}\n", .{ lb, ub });
}
