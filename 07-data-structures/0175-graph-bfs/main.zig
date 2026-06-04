const std = @import("std");

pub fn main() void {
    const adj = [4][]const usize{
        &[_]usize{ 1, 2 },
        &[_]usize{ 0, 3 },
        &[_]usize{ 0, 3 },
        &[_]usize{ 1, 2 },
    };

    var visited = [_]bool{false} ** 4;
    var queue: [4]usize = undefined;
    var qhead: usize = 0;
    var qtail: usize = 0;

    queue[qtail] = 0;
    qtail += 1;
    visited[0] = true;

    var first = true;
    while (qhead < qtail) {
        const node = queue[qhead];
        qhead += 1;
        if (!first) std.debug.print(" ", .{});
        std.debug.print("{d}", .{node});
        first = false;
        for (adj[node]) |nb| {
            if (!visited[nb]) {
                visited[nb] = true;
                queue[qtail] = nb;
                qtail += 1;
            }
        }
    }
    std.debug.print("\n", .{});
}
