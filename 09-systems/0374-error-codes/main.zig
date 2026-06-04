const std = @import("std");

fn message(code: u8) []const u8 {
    return switch (code) {
        0 => "ok",
        1 => "invalid",
        2 => "not found",
        else => "unknown",
    };
}

pub fn main() void {
    std.debug.print("{s}\n", .{message(2)});
}
