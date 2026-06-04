const std = @import("std");

pub fn main() void {
    const n = 4;
    const inf = std.math.maxInt(u32);
    var w = [_][n]u32{[_]u32{inf} ** n} ** n;
    const edges = [_][3]u32{ .{ 0, 1, 1 }, .{ 1, 2, 2 }, .{ 2, 3, 3 } };
    for (edges) |e| {
        w[e[0]][e[1]] = e[2];
        w[e[1]][e[0]] = e[2];
    }

    var in_tree = [_]bool{false} ** n;
    var key = [_]u32{inf} ** n;
    key[0] = 0;

    var total: u32 = 0;
    var iter: usize = 0;
    while (iter < n) : (iter += 1) {
        var u: usize = n;
        var best: u32 = inf;
        var i: usize = 0;
        while (i < n) : (i += 1) {
            if (!in_tree[i] and key[i] < best) {
                best = key[i];
                u = i;
            }
        }
        if (u == n) break;
        in_tree[u] = true;
        total += key[u];
        var v: usize = 0;
        while (v < n) : (v += 1) {
            if (!in_tree[v] and w[u][v] != inf and w[u][v] < key[v]) {
                key[v] = w[u][v];
            }
        }
    }
    std.debug.print("{d}\n", .{total});
}
