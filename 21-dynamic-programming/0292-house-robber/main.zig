const std = @import("std");

pub fn main() void {
    const houses = [_]usize{ 2, 7, 9, 3, 1 };
    var rob: usize = 0;
    var skip: usize = 0;
    for (houses) |h| {
        const new_rob = skip + h;
        const new_skip = @max(skip, rob);
        rob = new_rob;
        skip = new_skip;
    }
    std.debug.print("{d}\n", .{@max(rob, skip)});
}
