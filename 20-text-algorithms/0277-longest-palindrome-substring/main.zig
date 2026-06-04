const std = @import("std");

fn expand(s: []const u8, lo_in: usize, hi_in: usize) struct { start: usize, len: usize } {
    var lo = lo_in;
    var hi = hi_in;
    while (lo > 0 and hi + 1 < s.len and s[lo - 1] == s[hi + 1]) {
        lo -= 1;
        hi += 1;
    }
    return .{ .start = lo, .len = hi - lo + 1 };
}

pub fn main() void {
    const s = "babad";
    var best_start: usize = 0;
    var best_len: usize = 1;

    var c: usize = 0;
    while (c < s.len) : (c += 1) {
        const odd = expand(s, c, c);
        if (odd.len > best_len) {
            best_len = odd.len;
            best_start = odd.start;
        }
        if (c + 1 < s.len and s[c] == s[c + 1]) {
            const even = expand(s, c, c + 1);
            if (even.len > best_len) {
                best_len = even.len;
                best_start = even.start;
            }
        }
    }

    std.debug.print("{s}\n", .{s[best_start .. best_start + best_len]});
}
