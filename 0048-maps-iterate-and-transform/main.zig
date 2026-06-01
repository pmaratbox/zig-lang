const std = @import("std");

pub fn main() !void {
    var scores = std.StringHashMap(i32).init(std.heap.page_allocator);
    defer scores.deinit();
    try scores.put("a", 1);
    try scores.put("b", 2);
    try scores.put("c", 3);

    var total: i32 = 0;
    var it = scores.valueIterator();
    while (it.next()) |v| {
        total += v.*;
    }
    std.debug.print("sum: {d}\n", .{total});
}
