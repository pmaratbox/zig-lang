const std = @import("std");

pub fn main() void {
    const text = "zzabc";
    const pat = "abc";

    var last = [_]i32{-1} ** 256;
    for (pat, 0..) |ch, i| last[ch] = @intCast(i);

    var s: usize = 0;
    var result: i32 = -1;
    while (s + pat.len <= text.len) {
        var j: i32 = @intCast(pat.len - 1);
        while (j >= 0 and pat[@intCast(j)] == text[s + @as(usize, @intCast(j))]) j -= 1;
        if (j < 0) {
            result = @intCast(s);
            break;
        } else {
            const bc = last[text[s + @as(usize, @intCast(j))]];
            const shift = j - bc;
            s += if (shift > 1) @intCast(shift) else 1;
        }
    }

    std.debug.print("{d}\n", .{result});
}
