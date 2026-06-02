const std = @import("std");

pub fn main() void {
    var text = [_]u8{ 'a', 'b', 'c' };
    std.mem.reverse(u8, &text);
    std.debug.print("{s}\n", .{text});
}
