const std = @import("std");

const Cache = struct {
    cap: usize,
    keys: std.ArrayListUnmanaged(i32) = .empty,
    vals: std.ArrayListUnmanaged(i32) = .empty,
    alloc: std.mem.Allocator,

    fn find(self: *Cache, key: i32) ?usize {
        for (self.keys.items, 0..) |k, i| {
            if (k == key) return i;
        }
        return null;
    }

    fn touch(self: *Cache, i: usize) void {
        const k = self.keys.orderedRemove(i);
        const v = self.vals.orderedRemove(i);
        self.keys.appendAssumeCapacity(k);
        self.vals.appendAssumeCapacity(v);
    }

    fn put(self: *Cache, key: i32, val: i32) !void {
        if (self.find(key)) |i| {
            self.vals.items[i] = val;
            self.touch(i);
            return;
        }
        if (self.keys.items.len == self.cap) {
            _ = self.keys.orderedRemove(0);
            _ = self.vals.orderedRemove(0);
        }
        try self.keys.append(self.alloc, key);
        try self.vals.append(self.alloc, val);
    }

    fn get(self: *Cache, key: i32) i32 {
        if (self.find(key)) |i| {
            const v = self.vals.items[i];
            self.touch(i);
            return v;
        }
        return -1;
    }
};

pub fn main() !void {
    const alloc = std.heap.page_allocator;
    var c = Cache{ .cap = 2, .alloc = alloc };
    try c.put(1, 1);
    try c.put(2, 2);
    _ = c.get(1);
    try c.put(3, 3);
    std.debug.print("{d} {d}\n", .{ c.get(1), c.get(2) });
}
