const std = @import("std");

pub fn main() void {
    const data = [_]i32{ -2, 1, -3, 4, -1, 2, 1, -5, 4 };
    var best = data[0];
    var cur = data[0];
    var i: usize = 1;
    while (i < data.len) : (i += 1) {
        cur = @max(data[i], cur + data[i]);
        best = @max(best, cur);
    }
    std.debug.print("{d}\n", .{best});
}
