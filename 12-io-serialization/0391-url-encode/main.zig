const std = @import("std");

fn unreserved(c: u8) bool {
    return (c >= 'A' and c <= 'Z') or
        (c >= 'a' and c <= 'z') or
        (c >= '0' and c <= '9') or
        c == '-' or c == '_' or c == '.' or c == '~';
}

pub fn main() void {
    const input = "a b&c";
    const hex = "0123456789ABCDEF";
    for (input) |c| {
        if (unreserved(c)) {
            std.debug.print("{c}", .{c});
        } else {
            std.debug.print("%{c}{c}", .{ hex[c >> 4], hex[c & 0xF] });
        }
    }
    std.debug.print("\n", .{});
}
