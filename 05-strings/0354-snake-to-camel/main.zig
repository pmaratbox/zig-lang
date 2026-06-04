const std = @import("std");

pub fn main() void {
    const input = "hello_world";
    var buf: [input.len]u8 = undefined;
    var n: usize = 0;
    var capitalize = false;

    for (input) |c| {
        if (c == '_') {
            capitalize = true;
            continue;
        }
        if (capitalize and c >= 'a' and c <= 'z') {
            buf[n] = c - 32;
        } else {
            buf[n] = c;
        }
        capitalize = false;
        n += 1;
    }

    std.debug.print("{s}\n", .{buf[0..n]});
}
