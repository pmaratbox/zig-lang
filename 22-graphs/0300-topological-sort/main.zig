const std = @import("std");

pub fn main() void {
    const n = 4;
    var adj = [_][n]bool{[_]bool{false} ** n} ** n;
    var indeg = [_]u32{0} ** n;

    const edges = [_][2]usize{ .{ 0, 1 }, .{ 0, 2 }, .{ 1, 3 }, .{ 2, 3 } };
    for (edges) |e| {
        adj[e[0]][e[1]] = true;
        indeg[e[1]] += 1;
    }

    var done = [_]bool{false} ** n;
    var first = true;
    var count: usize = 0;
    while (count < n) : (count += 1) {
        // smallest index with indegree 0 not yet emitted
        var pick: usize = n;
        var i: usize = 0;
        while (i < n) : (i += 1) {
            if (!done[i] and indeg[i] == 0) {
                pick = i;
                break;
            }
        }
        if (pick == n) break;
        done[pick] = true;
        if (!first) std.debug.print(" ", .{});
        first = false;
        std.debug.print("{d}", .{pick});
        var v: usize = 0;
        while (v < n) : (v += 1) {
            if (adj[pick][v]) indeg[v] -= 1;
        }
    }
    std.debug.print("\n", .{});
}
