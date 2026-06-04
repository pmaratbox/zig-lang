const std = @import("std");

pub fn main() void {
    const items = [_]u8{ 'a', 'b', 'a', 'c', 'b', 'a' };

    // Track distinct elements in first-seen order with their counts.
    var distinct = [_]u8{0} ** 8;
    var counts = [_]u32{0} ** 8;
    var n: usize = 0;

    for (items) |x| {
        var idx: ?usize = null;
        var i: usize = 0;
        while (i < n) : (i += 1) {
            if (distinct[i] == x) {
                idx = i;
                break;
            }
        }
        if (idx) |j| {
            counts[j] += 1;
        } else {
            distinct[n] = x;
            counts[n] = 1;
            n += 1;
        }
    }

    // Selection sort by count descending, stable (preserves first-seen order on ties).
    var a: usize = 0;
    while (a < n) : (a += 1) {
        var best = a;
        var b = a + 1;
        while (b < n) : (b += 1) {
            if (counts[b] > counts[best]) best = b;
        }
        if (best != a) {
            const tc = counts[a];
            counts[a] = counts[best];
            counts[best] = tc;
            const td = distinct[a];
            distinct[a] = distinct[best];
            distinct[best] = td;
        }
    }

    const k: usize = 2;
    var first = true;
    var t: usize = 0;
    while (t < k and t < n) : (t += 1) {
        if (!first) std.debug.print(" ", .{});
        std.debug.print("{c}", .{distinct[t]});
        first = false;
    }
    std.debug.print("\n", .{});
}
