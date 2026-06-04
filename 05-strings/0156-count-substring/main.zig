const std = @import("std");

pub fn main() void {
    const text = "ababab";
    const needle = "ab";
    var count: usize = 0;
    var i: usize = 0;
    while (i + needle.len <= text.len) {
        if (std.mem.eql(u8, text[i .. i + needle.len], needle)) {
            count += 1;
            i += needle.len;
        } else {
            i += 1;
        }
    }
    std.debug.print("{d}\n", .{count});
}
