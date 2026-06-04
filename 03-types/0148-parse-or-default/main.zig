const std = @import("std");

fn parseOrDefault(s: []const u8, default: i64) i64 {
    return std.fmt.parseInt(i64, s, 10) catch default;
}

pub fn main() void {
    const a = parseOrDefault("42", 0);
    const b = parseOrDefault("x", 0);
    std.debug.print("{d} {d}\n", .{ a, b });
}
