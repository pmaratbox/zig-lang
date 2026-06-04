const std = @import("std");

const Multiset = struct {
    counts: std.AutoHashMapUnmanaged(i32, u32) = .{},
    alloc: std.mem.Allocator,

    fn add(self: *Multiset, v: i32) !void {
        const gop = try self.counts.getOrPut(self.alloc, v);
        if (!gop.found_existing) gop.value_ptr.* = 0;
        gop.value_ptr.* += 1;
    }

    fn remove(self: *Multiset, v: i32) void {
        if (self.counts.getPtr(v)) |p| {
            if (p.* > 0) p.* -= 1;
        }
    }

    fn count(self: *Multiset, v: i32) u32 {
        return self.counts.get(v) orelse 0;
    }
};

pub fn main() !void {
    const alloc = std.heap.page_allocator;
    var ms = Multiset{ .alloc = alloc };

    try ms.add(1);
    try ms.add(1);
    try ms.add(2);
    const a = ms.count(1);
    ms.remove(1);
    const b = ms.count(1);
    std.debug.print("{d} {d}\n", .{ a, b });
}
