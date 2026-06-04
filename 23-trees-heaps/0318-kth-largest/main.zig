const std = @import("std");

// A size-k min-heap: its root is the kth largest seen so far.
const MinHeap = struct {
    data: [8]i64 = undefined,
    len: usize = 0,
    cap: usize,

    fn push(self: *MinHeap, v: i64) void {
        if (self.len < self.cap) {
            var i = self.len;
            self.data[i] = v;
            self.len += 1;
            while (i > 0) {
                const parent = (i - 1) / 2;
                if (self.data[parent] <= self.data[i]) break;
                std.mem.swap(i64, &self.data[parent], &self.data[i]);
                i = parent;
            }
        } else if (v > self.data[0]) {
            self.data[0] = v;
            var i: usize = 0;
            while (true) {
                const l = 2 * i + 1;
                const r = 2 * i + 2;
                var smallest = i;
                if (l < self.len and self.data[l] < self.data[smallest]) smallest = l;
                if (r < self.len and self.data[r] < self.data[smallest]) smallest = r;
                if (smallest == i) break;
                std.mem.swap(i64, &self.data[i], &self.data[smallest]);
                i = smallest;
            }
        }
    }
};

pub fn main() void {
    var heap = MinHeap{ .cap = 2 };
    for ([_]i64{ 3, 2, 1, 5, 6, 4 }) |v| heap.push(v);
    std.debug.print("{d}\n", .{heap.data[0]});
}
