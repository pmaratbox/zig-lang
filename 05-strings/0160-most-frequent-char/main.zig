const std = @import("std");

pub fn main() void {
    const text = "hello";
    var counts = [_]usize{0} ** 256;
    for (text) |c| counts[c] += 1;
    var best: u8 = text[0];
    var best_count: usize = 0;
    for (text) |c| {
        if (counts[c] > best_count) {
            best_count = counts[c];
            best = c;
        }
    }
    std.debug.print("{c}\n", .{best});
}
