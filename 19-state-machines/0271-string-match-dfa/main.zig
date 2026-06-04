const std = @import("std");

pub fn main() void {
    const pattern = "ab";
    const text = "aab";
    // DFA state = number of matched pattern chars so far.
    var state: usize = 0;
    var match_index: ?usize = null;
    for (text, 0..) |ch, i| {
        if (ch == pattern[state]) {
            state += 1;
        } else if (ch == pattern[0]) {
            state = 1;
        } else {
            state = 0;
        }
        if (state == pattern.len) {
            match_index = i + 1 - pattern.len;
            break;
        }
    }
    if (match_index) |idx| {
        std.debug.print("{d}\n", .{idx});
    }
}
