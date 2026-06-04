const std = @import("std");

fn attempt(n: u32) error{Fail}!void {
    if (n < 3) return error.Fail;
}

pub fn main() void {
    const max: u32 = 5;
    var n: u32 = 1;
    while (n <= max) : (n += 1) {
        if (attempt(n)) |_| {
            std.debug.print("ok after {d}\n", .{n});
            break;
        } else |_| {
            // failed this attempt; retry
        }
    }
}
