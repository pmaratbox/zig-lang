const std = @import("std");

const Heap = struct {
    data: [16]i64 = undefined,
    len: usize = 0,

    fn push(self: *Heap, v: i64) void {
        var i = self.len;
        self.data[i] = v;
        self.len += 1;
        while (i > 0) {
            const parent = (i - 1) / 2;
            if (self.data[parent] >= self.data[i]) break;
            std.mem.swap(i64, &self.data[parent], &self.data[i]);
            i = parent;
        }
    }

    fn pop(self: *Heap) i64 {
        const top = self.data[0];
        self.len -= 1;
        self.data[0] = self.data[self.len];
        var i: usize = 0;
        while (true) {
            const l = 2 * i + 1;
            const r = 2 * i + 2;
            var largest = i;
            if (l < self.len and self.data[l] > self.data[largest]) largest = l;
            if (r < self.len and self.data[r] > self.data[largest]) largest = r;
            if (largest == i) break;
            std.mem.swap(i64, &self.data[i], &self.data[largest]);
            i = largest;
        }
        return top;
    }
};

pub fn main() void {
    var heap = Heap{};
    for ([_]i64{ 3, 1, 4, 1, 5 }) |v| heap.push(v);

    var first = true;
    for (0..3) |_| {
        if (!first) std.debug.print(" ", .{});
        first = false;
        std.debug.print("{d}", .{heap.pop()});
    }
    std.debug.print("\n", .{});
}
