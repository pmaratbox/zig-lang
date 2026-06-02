const std = @import("std");

fn lessThan(_: void, a: i32, b: i32) std.math.Order {
    return std.math.order(a, b);
}

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    var pq: std.PriorityQueue(i32, void, lessThan) = .empty;
    defer pq.deinit(allocator);
    for ([_]i32{ 3, 1, 2 }) |n| {
        try pq.push(allocator, n);
    }

    var first = true;
    while (pq.pop()) |n| {
        if (!first) std.debug.print(" ", .{});
        std.debug.print("{d}", .{n});
        first = false;
    }
    std.debug.print("\n", .{});
}
