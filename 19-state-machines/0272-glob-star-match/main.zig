const std = @import("std");

fn globMatch(pat: []const u8, text: []const u8) bool {
    var pi: usize = 0;
    var ti: usize = 0;
    var star: ?usize = null;
    var star_ti: usize = 0;
    while (ti < text.len) {
        if (pi < pat.len and (pat[pi] == text[ti])) {
            pi += 1;
            ti += 1;
        } else if (pi < pat.len and pat[pi] == '*') {
            star = pi;
            star_ti = ti;
            pi += 1;
        } else if (star) |sp| {
            pi = sp + 1;
            star_ti += 1;
            ti = star_ti;
        } else {
            return false;
        }
    }
    while (pi < pat.len and pat[pi] == '*') pi += 1;
    return pi == pat.len;
}

pub fn main() void {
    const a = globMatch("a*b", "aaab");
    const b = globMatch("a*b", "aac");
    std.debug.print("{s} {s}\n", .{
        if (a) "yes" else "no",
        if (b) "yes" else "no",
    });
}
