const std = @import("std");

pub fn main() void {
    const s = "ADOBECODEBANC";
    const t = "ABC";

    var need = [_]i32{0} ** 256;
    for (t) |ch| need[ch] += 1;
    const required: i32 = @intCast(t.len);

    var have = [_]i32{0} ** 256;
    var left: usize = 0;
    var best_len: usize = s.len + 1;
    var best_start: usize = 0;
    var formed: i32 = 0;

    var right: usize = 0;
    while (right < s.len) : (right += 1) {
        const c = s[right];
        have[c] += 1;
        if (need[c] > 0 and have[c] <= need[c]) formed += 1;

        while (formed == required) {
            if (right - left + 1 < best_len) {
                best_len = right - left + 1;
                best_start = left;
            }
            const lc = s[left];
            have[lc] -= 1;
            if (need[lc] > 0 and have[lc] < need[lc]) formed -= 1;
            left += 1;
        }
    }

    std.debug.print("{s}\n", .{s[best_start .. best_start + best_len]});
}
