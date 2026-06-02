const std = @import("std");

fn total(args: anytype) i32 {
    var sum: i32 = 0;
    inline for (args) |n| {
        sum += n;
    }
    return sum;
}

pub fn main() void {
    std.debug.print("sum: {d}\n", .{total(.{ 1, 2, 3 })});
}
