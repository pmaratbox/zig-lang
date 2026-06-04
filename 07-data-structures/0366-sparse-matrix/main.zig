const std = @import("std");

const Key = struct { row: i32, col: i32 };

const SparseMatrix = struct {
    entries: std.AutoHashMapUnmanaged(Key, i32) = .{},
    alloc: std.mem.Allocator,

    fn set(self: *SparseMatrix, row: i32, col: i32, v: i32) !void {
        try self.entries.put(self.alloc, .{ .row = row, .col = col }, v);
    }

    fn get(self: *SparseMatrix, row: i32, col: i32) i32 {
        return self.entries.get(.{ .row = row, .col = col }) orelse 0;
    }
};

pub fn main() !void {
    const alloc = std.heap.page_allocator;
    var m = SparseMatrix{ .alloc = alloc };

    try m.set(1, 1, 5);
    std.debug.print("{d} {d}\n", .{ m.get(1, 1), m.get(0, 0) });
}
