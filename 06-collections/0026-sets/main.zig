const std = @import("std");

pub fn main() !void {
    var set = std.AutoHashMap(i32, void).init(std.heap.page_allocator);
    defer set.deinit();
    for ([_]i32{ 1, 2, 2, 3 }) |n| {
        try set.put(n, {});
    }
    std.debug.print("size: {d}\n", .{set.count()});
    std.debug.print("has 2: {s}\n", .{if (set.contains(2)) "yes" else "no"});
    std.debug.print("has 5: {s}\n", .{if (set.contains(5)) "yes" else "no"});
}
