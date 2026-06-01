const std = @import("std");

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    var stack: std.ArrayList(i32) = .empty;
    defer stack.deinit(allocator);
    try stack.append(allocator, 1);
    try stack.append(allocator, 2);
    try stack.append(allocator, 3);

    std.debug.print("{d}", .{stack.pop().?});
    while (stack.items.len > 0) {
        std.debug.print(" {d}", .{stack.pop().?});
    }
    std.debug.print("\n", .{});
}
