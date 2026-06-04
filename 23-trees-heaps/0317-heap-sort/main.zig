const std = @import("std");

fn siftDown(a: []i64, start: usize, end: usize) void {
    var i = start;
    while (true) {
        const l = 2 * i + 1;
        const r = 2 * i + 2;
        var largest = i;
        if (l < end and a[l] > a[largest]) largest = l;
        if (r < end and a[r] > a[largest]) largest = r;
        if (largest == i) break;
        std.mem.swap(i64, &a[i], &a[largest]);
        i = largest;
    }
}

fn heapSort(a: []i64) void {
    if (a.len < 2) return;
    var i = a.len / 2;
    while (i > 0) {
        i -= 1;
        siftDown(a, i, a.len);
    }
    var end = a.len;
    while (end > 1) {
        end -= 1;
        std.mem.swap(i64, &a[0], &a[end]);
        siftDown(a, 0, end);
    }
}

pub fn main() void {
    var arr = [_]i64{ 5, 3, 8, 1, 4 };
    heapSort(&arr);

    var first = true;
    for (arr) |v| {
        if (!first) std.debug.print(" ", .{});
        first = false;
        std.debug.print("{d}", .{v});
    }
    std.debug.print("\n", .{});
}
