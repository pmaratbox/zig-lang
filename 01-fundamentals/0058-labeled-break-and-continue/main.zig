const std = @import("std");

pub fn main() void {
    var i: usize = 1;
    outer: while (i <= 3) : (i += 1) {
        var j: usize = 1;
        while (j <= 3) : (j += 1) {
            if (j > i) continue :outer;
            if (i * j == 4) {
                std.debug.print("stop at {d},{d}\n", .{ i, j });
                break :outer;
            }
            std.debug.print("{d},{d}\n", .{ i, j });
        }
    }
}
