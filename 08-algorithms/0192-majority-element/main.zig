const std = @import("std");

pub fn main() void {
    const data = [_]i32{ 2, 2, 1, 2, 3, 2 };
    var candidate: i32 = 0;
    var count: i32 = 0;
    for (data) |x| {
        if (count == 0) candidate = x;
        count += if (x == candidate) @as(i32, 1) else -1;
    }
    std.debug.print("{d}\n", .{candidate});
}
