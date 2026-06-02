const std = @import("std");

fn anagram(a: []const u8, b: []const u8) bool {
    if (a.len != b.len) return false;
    var x: [64]u8 = undefined;
    var y: [64]u8 = undefined;
    @memcpy(x[0..a.len], a);
    @memcpy(y[0..b.len], b);
    std.mem.sort(u8, x[0..a.len], {}, std.sort.asc(u8));
    std.mem.sort(u8, y[0..b.len], {}, std.sort.asc(u8));
    return std.mem.eql(u8, x[0..a.len], y[0..b.len]);
}

pub fn main() void {
    const pairs = [_][2][]const u8{ .{ "listen", "silent" }, .{ "hello", "world" } };
    for (pairs) |p| {
        std.debug.print("{s}/{s}: {s}\n", .{ p[0], p[1], if (anagram(p[0], p[1])) "yes" else "no" });
    }
}
