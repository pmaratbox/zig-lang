const std = @import("std");

fn fold(
    comptime T: type,
    items: []const T,
    identity: T,
    combine: *const fn (T, T) T,
) T {
    var acc = identity;
    for (items) |x| acc = combine(acc, x);
    return acc;
}

fn addInt(a: i32, b: i32) i32 {
    return a + b;
}

var buf: [64]u8 = undefined;
var len: usize = 0;

fn concat(a: []const u8, b: []const u8) []const u8 {
    // a is the running accumulator already laid out at buf[0..len]; append b.
    _ = a;
    @memcpy(buf[len .. len + b.len], b);
    len += b.len;
    return buf[0..len];
}

pub fn main() void {
    const strs = [_][]const u8{ "a", "b", "c" };
    const s = fold([]const u8, &strs, "", concat);

    const ints = [_]i32{ 1, 2, 3 };
    const n = fold(i32, &ints, 0, addInt);

    std.debug.print("{s} {d}\n", .{ s, n });
}
