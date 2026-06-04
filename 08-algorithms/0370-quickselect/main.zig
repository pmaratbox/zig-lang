const std = @import("std");

fn partition(a: []i32, lo: usize, hi: usize) usize {
    const pivot = a[hi];
    var i = lo;
    var j = lo;
    while (j < hi) : (j += 1) {
        if (a[j] < pivot) {
            const t = a[i];
            a[i] = a[j];
            a[j] = t;
            i += 1;
        }
    }
    const t = a[i];
    a[i] = a[hi];
    a[hi] = t;
    return i;
}

fn quickselect(a: []i32, k: usize) i32 {
    var lo: usize = 0;
    var hi: usize = a.len - 1;
    while (true) {
        if (lo == hi) return a[lo];
        const p = partition(a, lo, hi);
        if (p == k) {
            return a[p];
        } else if (k < p) {
            hi = p - 1;
        } else {
            lo = p + 1;
        }
    }
}

pub fn main() void {
    var a = [_]i32{ 7, 10, 4, 3, 20, 15 };
    // 3rd smallest -> index 2 (0-based)
    const v = quickselect(&a, 2);
    std.debug.print("{d}\n", .{v});
}
