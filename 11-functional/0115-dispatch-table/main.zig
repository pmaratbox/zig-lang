const std = @import("std");

const Op = *const fn (i32, i32) i32;

fn add(a: i32, b: i32) i32 {
    return a + b;
}

fn mul(a: i32, b: i32) i32 {
    return a * b;
}

pub fn main() !void {
    const alloc = std.heap.page_allocator;

    var table = std.StringHashMap(Op).init(alloc);
    defer table.deinit();
    try table.put("add", add);
    try table.put("mul", mul);

    const f = table.get("add").?;
    const g = table.get("mul").?;
    std.debug.print("{d} {d}\n", .{ f(3, 4), g(3, 4) });
}
