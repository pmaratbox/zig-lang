const std = @import("std");

fn divisibleBy3(bits: []const u8) bool {
    var state: u32 = 0;
    for (bits) |c| {
        const b: u32 = c - '0';
        state = (state * 2 + b) % 3;
    }
    return state == 0;
}

pub fn main() void {
    const a = divisibleBy3("110");
    const b = divisibleBy3("100");
    std.debug.print("{s} {s}\n", .{
        if (a) "yes" else "no",
        if (b) "yes" else "no",
    });
}
