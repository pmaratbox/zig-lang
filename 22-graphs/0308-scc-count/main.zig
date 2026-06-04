const std = @import("std");

const N = 4;

var adj = [_][N]bool{[_]bool{false} ** N} ** N;
var index_counter: u32 = 0;
var idx = [_]i32{-1} ** N;
var low = [_]u32{0} ** N;
var on_stack = [_]bool{false} ** N;
var stack = [_]usize{0} ** N;
var sp: usize = 0;
var scc_count: u32 = 0;

fn strongconnect(v: usize) void {
    idx[v] = @intCast(index_counter);
    low[v] = index_counter;
    index_counter += 1;
    stack[sp] = v;
    sp += 1;
    on_stack[v] = true;

    var w: usize = 0;
    while (w < N) : (w += 1) {
        if (!adj[v][w]) continue;
        if (idx[w] == -1) {
            strongconnect(w);
            if (low[w] < low[v]) low[v] = low[w];
        } else if (on_stack[w]) {
            const iw: u32 = @intCast(idx[w]);
            if (iw < low[v]) low[v] = iw;
        }
    }

    if (low[v] == @as(u32, @intCast(idx[v]))) {
        scc_count += 1;
        while (true) {
            sp -= 1;
            const u = stack[sp];
            on_stack[u] = false;
            if (u == v) break;
        }
    }
}

pub fn main() void {
    adj[0][1] = true;
    adj[1][2] = true;
    adj[2][0] = true;
    adj[2][3] = true;

    var v: usize = 0;
    while (v < N) : (v += 1) {
        if (idx[v] == -1) strongconnect(v);
    }

    std.debug.print("{d}\n", .{scc_count});
}
