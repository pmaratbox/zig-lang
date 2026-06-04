const std = @import("std");

pub fn main() !void {
    const alloc = std.heap.page_allocator;

    var dq: std.ArrayListUnmanaged(i32) = .empty;
    defer dq.deinit(alloc);

    try dq.append(alloc, 1); // back
    try dq.append(alloc, 2); // back
    try dq.insert(alloc, 0, 0); // front

    for (dq.items, 0..) |v, i| {
        if (i != 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{v});
    }
    std.debug.print("\n", .{});
}
