const std = @import("std");

pub fn main() void {
    const word = "hello";
    var count: u32 = 0;
    for (word) |ch| {
        if (std.mem.indexOfScalar(u8, "aeiou", ch) != null) count += 1;
    }
    std.debug.print("{d}\n", .{count});
}
