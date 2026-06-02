const std = @import("std");

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    var queue: std.ArrayList(i32) = .empty;
    defer queue.deinit(allocator);
    try queue.append(allocator, 1);
    try queue.append(allocator, 2);
    try queue.append(allocator, 3);

    var i: usize = 0;
    while (queue.items.len > 0) : (i += 1) {
        if (i > 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{queue.orderedRemove(0)});
    }
    std.debug.print("\n", .{});
}
