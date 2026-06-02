const std = @import("std");

pub fn main() void {
    const n: i32 = 7;

    if (n < 10) {
        std.debug.print("{} is less than 10\n", .{n});
    } else if (n == 10) {
        std.debug.print("{} is equal to 10\n", .{n});
    } else {
        std.debug.print("{} is greater than 10\n", .{n});
    }
}
