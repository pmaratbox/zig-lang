const std = @import("std");

pub fn main() void {
    const words = [_][]const u8{ "flower", "flow", "flight" };
    var len: usize = words[0].len;
    for (words) |w| len = @min(len, w.len);
    var i: usize = 0;
    outer: while (i < len) : (i += 1) {
        const c = words[0][i];
        for (words) |w| {
            if (w[i] != c) break :outer;
        }
    }
    std.debug.print("{s}\n", .{words[0][0..i]});
}
