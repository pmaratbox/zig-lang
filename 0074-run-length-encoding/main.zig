const std = @import("std");

pub fn main() void {
    const text = "aaabbc";
    var i: usize = 0;
    while (i < text.len) {
        const ch = text[i];
        var count: u32 = 0;
        while (i < text.len and text[i] == ch) : (i += 1) {
            count += 1;
        }
        std.debug.print("{c}{d}", .{ ch, count });
    }
    std.debug.print("\n", .{});
}
