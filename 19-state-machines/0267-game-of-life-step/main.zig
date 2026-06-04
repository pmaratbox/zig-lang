const std = @import("std");

const N = 3;

fn countNeighbors(grid: [N][N]u8, r: usize, c: usize) u8 {
    var count: u8 = 0;
    var dr: i32 = -1;
    while (dr <= 1) : (dr += 1) {
        var dc: i32 = -1;
        while (dc <= 1) : (dc += 1) {
            if (dr == 0 and dc == 0) continue;
            const nr = @as(i32, @intCast(r)) + dr;
            const nc = @as(i32, @intCast(c)) + dc;
            if (nr < 0 or nr >= N or nc < 0 or nc >= N) continue;
            count += grid[@intCast(nr)][@intCast(nc)];
        }
    }
    return count;
}

pub fn main() void {
    const grid: [N][N]u8 = .{
        .{ 0, 1, 0 },
        .{ 0, 1, 0 },
        .{ 0, 1, 0 },
    };
    var next: [N][N]u8 = undefined;
    for (0..N) |r| {
        for (0..N) |c| {
            const n = countNeighbors(grid, r, c);
            if (grid[r][c] == 1) {
                next[r][c] = if (n == 2 or n == 3) 1 else 0;
            } else {
                next[r][c] = if (n == 3) 1 else 0;
            }
        }
    }
    for (0..N) |r| {
        for (0..N) |c| {
            std.debug.print("{s}", .{if (next[r][c] == 1) "#" else "."});
        }
        std.debug.print("\n", .{});
    }
}
