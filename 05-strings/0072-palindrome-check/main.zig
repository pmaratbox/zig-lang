const std = @import("std");

fn isPalindrome(s: []const u8) bool {
    var i: usize = 0;
    var j: usize = s.len - 1;
    while (i < j) : (i += 1) {
        if (s[i] != s[j]) return false;
        j -= 1;
    }
    return true;
}

pub fn main() void {
    const words = [_][]const u8{ "level", "hello" };
    for (words) |word| {
        std.debug.print("{s}: {s}\n", .{ word, if (isPalindrome(word)) "yes" else "no" });
    }
}
