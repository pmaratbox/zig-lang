const std = @import("std");

const n = 3;
var adj = [_][n]bool{[_]bool{false} ** n} ** n;
var color = [_]u8{0} ** n; // 0 white, 1 gray, 2 black

fn dfs(u: usize) bool {
    color[u] = 1;
    var v: usize = 0;
    while (v < n) : (v += 1) {
        if (adj[u][v]) {
            if (color[v] == 1) return true;
            if (color[v] == 0 and dfs(v)) return true;
        }
    }
    color[u] = 2;
    return false;
}

pub fn main() void {
    const edges = [_][2]usize{ .{ 0, 1 }, .{ 1, 2 }, .{ 2, 0 } };
    for (edges) |e| adj[e[0]][e[1]] = true;

    var found = false;
    var i: usize = 0;
    while (i < n) : (i += 1) {
        if (color[i] == 0 and dfs(i)) {
            found = true;
            break;
        }
    }
    std.debug.print("{s}\n", .{if (found) "cycle" else "acyclic"});
}
