const std = @import("std");

var parent: [5]usize = undefined;

fn find(x: usize) usize {
    var r = x;
    while (parent[r] != r) r = parent[r];
    return r;
}

pub fn main() void {
    const n = 5;
    for (&parent, 0..) |*p, i| p.* = i;

    const edges = [_][2]usize{ .{ 0, 1 }, .{ 1, 2 }, .{ 3, 4 } };
    for (edges) |e| {
        const ra = find(e[0]);
        const rb = find(e[1]);
        if (ra != rb) parent[ra] = rb;
    }

    var count: usize = 0;
    var i: usize = 0;
    while (i < n) : (i += 1) {
        if (find(i) == i) count += 1;
    }
    std.debug.print("{d}\n", .{count});
}
