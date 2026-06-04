const std = @import("std");

pub fn main() void {
    const target: f64 = 2.0;
    var x: f64 = target;
    var i: usize = 0;
    while (i < 50) : (i += 1) {
        const next = x - (x * x - target) / (2.0 * x);
        if (@abs(next - x) < 1e-12) {
            x = next;
            break;
        }
        x = next;
    }
    std.debug.print("{d:.4}\n", .{x});
}
