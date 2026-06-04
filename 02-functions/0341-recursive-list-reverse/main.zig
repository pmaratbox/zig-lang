const std = @import("std");

fn reverseInto(xs: []const i32, out: []i32) void {
    if (xs.len == 0) return;
    out[0] = xs[xs.len - 1];
    reverseInto(xs[0 .. xs.len - 1], out[1..]);
}

pub fn main() void {
    const xs = [_]i32{ 1, 2, 3 };
    var rev: [3]i32 = undefined;
    reverseInto(&xs, &rev);
    for (rev, 0..) |v, i| {
        if (i != 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{v});
    }
    std.debug.print("\n", .{});
}
