const std = @import("std");

const Edge = struct { u: usize, v: usize, w: i32 };

pub fn main() void {
    const n = 3;
    const inf = std.math.maxInt(i32);
    const edges = [_]Edge{
        .{ .u = 0, .v = 1, .w = 1 },
        .{ .u = 1, .v = 2, .w = -2 },
        .{ .u = 0, .v = 2, .w = 4 },
    };

    var dist = [_]i32{inf} ** n;
    dist[0] = 0;

    var i: usize = 0;
    while (i < n - 1) : (i += 1) {
        for (edges) |e| {
            if (dist[e.u] != inf and dist[e.u] + e.w < dist[e.v]) {
                dist[e.v] = dist[e.u] + e.w;
            }
        }
    }

    var k: usize = 0;
    while (k < n) : (k += 1) {
        if (k != 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{dist[k]});
    }
    std.debug.print("\n", .{});
}
