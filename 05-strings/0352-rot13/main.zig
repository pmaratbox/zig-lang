const std = @import("std");

fn rot13(c: u8) u8 {
    if (c >= 'a' and c <= 'z') return 'a' + (c - 'a' + 13) % 26;
    if (c >= 'A' and c <= 'Z') return 'A' + (c - 'A' + 13) % 26;
    return c;
}

pub fn main() void {
    const input = "hello";
    var once: [input.len]u8 = undefined;
    for (input, 0..) |c, i| once[i] = rot13(c);
    var twice: [input.len]u8 = undefined;
    for (once, 0..) |c, i| twice[i] = rot13(c);
    std.debug.print("{s} {s}\n", .{ once, twice });
}
