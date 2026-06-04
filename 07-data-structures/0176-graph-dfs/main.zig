const std = @import("std");

const adj = [4][]const usize{
    &[_]usize{ 1, 2 },
    &[_]usize{ 0, 3 },
    &[_]usize{ 0, 3 },
    &[_]usize{ 1, 2 },
};

var visited = [_]bool{false} ** 4;
var first = true;

fn dfs(node: usize) void {
    visited[node] = true;
    if (!first) std.debug.print(" ", .{});
    std.debug.print("{d}", .{node});
    first = false;
    for (adj[node]) |nb| {
        if (!visited[nb]) dfs(nb);
    }
}

pub fn main() void {
    dfs(0);
    std.debug.print("\n", .{});
}
