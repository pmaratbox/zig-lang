const std = @import("std");

fn word(n: i32) []const u8 {
    return switch (n) {
        1 => "one",
        2 => "two",
        else => "many",
    };
}

pub fn main() void {
    for ([_]i32{ 1, 2, 5 }) |n| {
        std.debug.print("{d}: {s}\n", .{ n, word(n) });
    }
}
