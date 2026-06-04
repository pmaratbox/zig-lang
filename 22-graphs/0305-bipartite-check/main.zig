const std = @import("std");

fn isBipartite(comptime n: usize, adj: [n][n]bool) bool {
    var color = [_]i8{-1} ** n;
    var queue: [n]usize = undefined;
    var start: usize = 0;
    while (start < n) : (start += 1) {
        if (color[start] != -1) continue;
        color[start] = 0;
        var head: usize = 0;
        var tail: usize = 0;
        queue[tail] = start;
        tail += 1;
        while (head < tail) {
            const u = queue[head];
            head += 1;
            var v: usize = 0;
            while (v < n) : (v += 1) {
                if (!adj[u][v]) continue;
                if (color[v] == -1) {
                    color[v] = 1 - color[u];
                    queue[tail] = v;
                    tail += 1;
                } else if (color[v] == color[u]) {
                    return false;
                }
            }
        }
    }
    return true;
}

pub fn main() void {
    // 4-cycle 0-1-2-3-0
    var c4 = [_][4]bool{[_]bool{false} ** 4} ** 4;
    const e4 = [_][2]usize{ .{ 0, 1 }, .{ 1, 2 }, .{ 2, 3 }, .{ 3, 0 } };
    for (e4) |e| {
        c4[e[0]][e[1]] = true;
        c4[e[1]][e[0]] = true;
    }

    // triangle 0-1-2-0
    var t3 = [_][3]bool{[_]bool{false} ** 3} ** 3;
    const e3 = [_][2]usize{ .{ 0, 1 }, .{ 1, 2 }, .{ 2, 0 } };
    for (e3) |e| {
        t3[e[0]][e[1]] = true;
        t3[e[1]][e[0]] = true;
    }

    const a = if (isBipartite(4, c4)) "yes" else "no";
    const b = if (isBipartite(3, t3)) "yes" else "no";
    std.debug.print("{s} {s}\n", .{ a, b });
}
