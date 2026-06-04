const std = @import("std");

const N = 3;

const Node = struct { r: usize, c: usize, g: u32 };

fn h(r: usize, c: usize) u32 {
    const dr = if (r > N - 1) r - (N - 1) else (N - 1) - r;
    const dc = if (c > N - 1) c - (N - 1) else (N - 1) - c;
    return @intCast(dr + dc);
}

pub fn main() void {
    const inf = std.math.maxInt(u32);
    var gscore = [_][N]u32{[_]u32{inf} ** N} ** N;
    var open = [_]Node{undefined} ** (N * N);
    var olen: usize = 0;

    gscore[0][0] = 0;
    open[olen] = .{ .r = 0, .c = 0, .g = 0 };
    olen += 1;

    const dr = [_]i32{ -1, 1, 0, 0 };
    const dc = [_]i32{ 0, 0, -1, 1 };

    var answer: u32 = inf;
    while (olen > 0) {
        // pick node with smallest f = g + h
        var bi: usize = 0;
        var bf: u32 = inf;
        var i: usize = 0;
        while (i < olen) : (i += 1) {
            const f = open[i].g + h(open[i].r, open[i].c);
            if (f < bf) {
                bf = f;
                bi = i;
            }
        }
        const cur = open[bi];
        olen -= 1;
        open[bi] = open[olen];

        if (cur.r == N - 1 and cur.c == N - 1) {
            answer = cur.g;
            break;
        }
        var d: usize = 0;
        while (d < 4) : (d += 1) {
            const nr = @as(i32, @intCast(cur.r)) + dr[d];
            const nc = @as(i32, @intCast(cur.c)) + dc[d];
            if (nr < 0 or nr >= N or nc < 0 or nc >= N) continue;
            const rr: usize = @intCast(nr);
            const cc: usize = @intCast(nc);
            const ng = cur.g + 1;
            if (ng < gscore[rr][cc]) {
                gscore[rr][cc] = ng;
                open[olen] = .{ .r = rr, .c = cc, .g = ng };
                olen += 1;
            }
        }
    }

    std.debug.print("{d}\n", .{answer});
}
