const std = @import("std");

const Edge = struct { u: usize, v: usize, w: u32 };

var parent: [3]usize = undefined;

fn find(x: usize) usize {
    var r = x;
    while (parent[r] != r) r = parent[r];
    return r;
}

pub fn main() void {
    var edges = [_]Edge{
        .{ .u = 0, .v = 1, .w = 1 },
        .{ .u = 1, .v = 2, .w = 2 },
        .{ .u = 0, .v = 2, .w = 3 },
    };

    std.mem.sort(Edge, &edges, {}, struct {
        fn lt(_: void, a: Edge, b: Edge) bool {
            return a.w < b.w;
        }
    }.lt);

    for (&parent, 0..) |*p, i| p.* = i;

    var total: u32 = 0;
    for (edges) |e| {
        const ru = find(e.u);
        const rv = find(e.v);
        if (ru != rv) {
            parent[ru] = rv;
            total += e.w;
        }
    }
    std.debug.print("{d}\n", .{total});
}
