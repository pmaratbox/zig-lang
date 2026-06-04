const std = @import("std");

fn label(flag: bool) []const u8 {
    return if (flag) "enabled" else "disabled";
}

pub fn main() void {
    std.debug.print("{s} {s}\n", .{ label(true), label(false) });
}
