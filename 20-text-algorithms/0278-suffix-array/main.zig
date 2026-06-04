const std = @import("std");

const s = "banana";

fn lessThan(_: void, a: usize, b: usize) bool {
    return std.mem.lessThan(u8, s[a..], s[b..]);
}

pub fn main() void {
    var idx: [s.len]usize = undefined;
    var i: usize = 0;
    while (i < s.len) : (i += 1) idx[i] = i;

    std.mem.sort(usize, &idx, {}, lessThan);

    i = 0;
    while (i < s.len) : (i += 1) {
        if (i != 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{idx[i]});
    }
    std.debug.print("\n", .{});
}
