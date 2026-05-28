const std = @import("std");

pub fn main() !void {
    const allocator = std.heap.page_allocator;

    var nums = std.StringHashMap(i32).init(allocator);
    defer nums.deinit();

    try nums.put("one", 1);
    try nums.put("two", 2);
    try nums.put("three", 3);

    std.debug.print("two: {}\n", .{nums.get("two").?});
    std.debug.print("size: {}\n", .{nums.count()});
}
