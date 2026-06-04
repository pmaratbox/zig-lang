const std = @import("std");

pub fn main() void {
    const s = "aaaa";
    var z: [s.len]usize = undefined;
    z[0] = 0;

    var l: usize = 0;
    var r: usize = 0;
    var i: usize = 1;
    while (i < s.len) : (i += 1) {
        if (i < r) {
            z[i] = @min(r - i, z[i - l]);
        } else {
            z[i] = 0;
        }
        while (i + z[i] < s.len and s[z[i]] == s[i + z[i]]) z[i] += 1;
        if (i + z[i] > r) {
            l = i;
            r = i + z[i];
        }
    }

    i = 1;
    while (i < s.len) : (i += 1) {
        if (i != 1) std.debug.print(" ", .{});
        std.debug.print("{d}", .{z[i]});
    }
    std.debug.print("\n", .{});
}
