const std = @import("std");

pub fn main() void {
    const a = "kitten";
    const b = "sitting";

    var prev: [b.len + 1]usize = undefined;
    var curr: [b.len + 1]usize = undefined;

    var j: usize = 0;
    while (j <= b.len) : (j += 1) prev[j] = j;

    var i: usize = 1;
    while (i <= a.len) : (i += 1) {
        curr[0] = i;
        j = 1;
        while (j <= b.len) : (j += 1) {
            const cost: usize = if (a[i - 1] == b[j - 1]) 0 else 1;
            const del = prev[j] + 1;
            const ins = curr[j - 1] + 1;
            const sub = prev[j - 1] + cost;
            curr[j] = @min(del, @min(ins, sub));
        }
        prev = curr;
    }

    std.debug.print("{d}\n", .{prev[b.len]});
}
