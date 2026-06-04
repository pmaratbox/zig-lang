const std = @import("std");

pub fn main() void {
    const strings = [_][]const u8{ "a", "bbb", "cc" };

    var best: []const u8 = strings[0];
    for (strings[1..]) |s| {
        if (s.len > best.len) best = s;
    }

    std.debug.print("{s}\n", .{best});
}
