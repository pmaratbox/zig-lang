const std = @import("std");

const HeapManual = struct {
    data: [16]i32 = undefined,
    len: usize = 0,

    fn push(self: *HeapManual, v: i32) void {
        self.data[self.len] = v;
        var i = self.len;
        self.len += 1;
        while (i > 0) {
            const parent = (i - 1) / 2;
            if (self.data[parent] <= self.data[i]) break;
            const tmp = self.data[parent];
            self.data[parent] = self.data[i];
            self.data[i] = tmp;
            i = parent;
        }
    }

    fn pop(self: *HeapManual) i32 {
        const top = self.data[0];
        self.len -= 1;
        self.data[0] = self.data[self.len];
        var i: usize = 0;
        while (true) {
            const l = 2 * i + 1;
            const r = 2 * i + 2;
            var smallest = i;
            if (l < self.len and self.data[l] < self.data[smallest]) smallest = l;
            if (r < self.len and self.data[r] < self.data[smallest]) smallest = r;
            if (smallest == i) break;
            const tmp = self.data[i];
            self.data[i] = self.data[smallest];
            self.data[smallest] = tmp;
            i = smallest;
        }
        return top;
    }
};

pub fn main() void {
    var heap = HeapManual{};
    heap.push(3);
    heap.push(1);
    heap.push(2);

    var first = true;
    while (heap.len > 0) {
        if (!first) std.debug.print(" ", .{});
        std.debug.print("{d}", .{heap.pop()});
        first = false;
    }
    std.debug.print("\n", .{});
}
