const std = @import("std");

fn isEven(n: i32) bool {
    if (n == 0) return true;
    return isOdd(n - 1);
}

fn isOdd(n: i32) bool {
    if (n == 0) return false;
    return isEven(n - 1);
}

pub fn main() void {
    const vals = [_]i32{ 4, 3 };
    for (vals) |n| {
        std.debug.print("{s}\n", .{if (isEven(n)) "even" else "odd"});
    }
}
