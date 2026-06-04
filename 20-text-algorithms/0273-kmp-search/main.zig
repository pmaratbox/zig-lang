const std = @import("std");

pub fn main() void {
    const text = "ababab";
    const pat = "ab";

    var lps: [pat.len]usize = undefined;
    lps[0] = 0;
    var len: usize = 0;
    var i: usize = 1;
    while (i < pat.len) {
        if (pat[i] == pat[len]) {
            len += 1;
            lps[i] = len;
            i += 1;
        } else if (len != 0) {
            len = lps[len - 1];
        } else {
            lps[i] = 0;
            i += 1;
        }
    }

    var first = true;
    var ti: usize = 0;
    var pi: usize = 0;
    while (ti < text.len) {
        if (text[ti] == pat[pi]) {
            ti += 1;
            pi += 1;
            if (pi == pat.len) {
                if (!first) std.debug.print(" ", .{});
                std.debug.print("{d}", .{ti - pi});
                first = false;
                pi = lps[pi - 1];
            }
        } else if (pi != 0) {
            pi = lps[pi - 1];
        } else {
            ti += 1;
        }
    }
    std.debug.print("\n", .{});
}
