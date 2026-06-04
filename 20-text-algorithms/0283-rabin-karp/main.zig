const std = @import("std");

pub fn main() void {
    const text = "xabxab";
    const pat = "ab";
    const base: u64 = 256;
    const mod: u64 = 1_000_000_007;

    var pat_hash: u64 = 0;
    var win_hash: u64 = 0;
    var pow: u64 = 1;
    var i: usize = 0;
    while (i < pat.len) : (i += 1) {
        pat_hash = (pat_hash * base + pat[i]) % mod;
        win_hash = (win_hash * base + text[i]) % mod;
        if (i + 1 < pat.len) pow = (pow * base) % mod;
    }

    var first = true;
    var s: usize = 0;
    while (s + pat.len <= text.len) : (s += 1) {
        if (win_hash == pat_hash and std.mem.eql(u8, text[s .. s + pat.len], pat)) {
            if (!first) std.debug.print(" ", .{});
            std.debug.print("{d}", .{s});
            first = false;
        }
        if (s + pat.len < text.len) {
            win_hash = (win_hash + mod - (text[s] * pow) % mod) % mod;
            win_hash = (win_hash * base + text[s + pat.len]) % mod;
        }
    }
    std.debug.print("\n", .{});
}
