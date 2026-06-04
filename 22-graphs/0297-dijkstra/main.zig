const std = @import("std");

pub fn main() void {
    const n = 4;
    const inf = std.math.maxInt(u32);
    // adjacency matrix of weights
    var w = [_][n]u32{[_]u32{inf} ** n} ** n;
    w[0][1] = 4;
    w[0][2] = 1;
    w[2][1] = 2;
    w[1][3] = 1;
    w[2][3] = 5;

    var dist = [_]u32{inf} ** n;
    var done = [_]bool{false} ** n;
    dist[0] = 0;

    var iter: usize = 0;
    while (iter < n) : (iter += 1) {
        // pick the unvisited node with the smallest distance
        var u: usize = n;
        var best: u32 = inf;
        var i: usize = 0;
        while (i < n) : (i += 1) {
            if (!done[i] and dist[i] < best) {
                best = dist[i];
                u = i;
            }
        }
        if (u == n) break;
        done[u] = true;
        var v: usize = 0;
        while (v < n) : (v += 1) {
            if (w[u][v] != inf and dist[u] != inf and dist[u] + w[u][v] < dist[v]) {
                dist[v] = dist[u] + w[u][v];
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
