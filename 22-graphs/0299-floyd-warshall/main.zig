const std = @import("std");

pub fn main() void {
    const n = 3;
    const inf = std.math.maxInt(u32) / 2;
    var dist = [_][n]u32{[_]u32{inf} ** n} ** n;
    var d: usize = 0;
    while (d < n) : (d += 1) dist[d][d] = 0;
    dist[0][1] = 3;
    dist[1][2] = 1;
    dist[0][2] = 5;

    var k: usize = 0;
    while (k < n) : (k += 1) {
        var i: usize = 0;
        while (i < n) : (i += 1) {
            var j: usize = 0;
            while (j < n) : (j += 1) {
                if (dist[i][k] + dist[k][j] < dist[i][j]) {
                    dist[i][j] = dist[i][k] + dist[k][j];
                }
            }
        }
    }

    std.debug.print("{d}\n", .{dist[0][2]});
}
