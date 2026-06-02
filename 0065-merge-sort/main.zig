const std = @import("std");

fn merge(items: []i32, lo: usize, mid: usize, hi: usize, buf: []i32) void {
    var i = lo;
    var j = mid;
    var k = lo;
    while (i < mid and j < hi) {
        if (items[i] <= items[j]) {
            buf[k] = items[i];
            i += 1;
        } else {
            buf[k] = items[j];
            j += 1;
        }
        k += 1;
    }
    while (i < mid) : (i += 1) {
        buf[k] = items[i];
        k += 1;
    }
    while (j < hi) : (j += 1) {
        buf[k] = items[j];
        k += 1;
    }
    var t = lo;
    while (t < hi) : (t += 1) items[t] = buf[t];
}

fn mergeSort(items: []i32, lo: usize, hi: usize, buf: []i32) void {
    if (hi - lo <= 1) return;
    const mid = lo + (hi - lo) / 2;
    mergeSort(items, lo, mid, buf);
    mergeSort(items, mid, hi, buf);
    merge(items, lo, mid, hi, buf);
}

pub fn main() void {
    var data = [_]i32{ 3, 1, 4, 1, 5, 2 };
    var buf: [6]i32 = undefined;
    mergeSort(&data, 0, data.len, &buf);

    var first = true;
    for (data) |x| {
        if (!first) std.debug.print(" ", .{});
        std.debug.print("{d}", .{x});
        first = false;
    }
    std.debug.print("\n", .{});
}
