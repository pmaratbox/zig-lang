const std = @import("std");

fn sumRange(lo: u32, hi: u32, out: *u32) void {
    if (hi - lo <= 1) {
        out.* = lo;
        return;
    }
    const mid = lo + (hi - lo) / 2;
    var left: u32 = 0;
    var right: u32 = 0;
    const t = std.Thread.spawn(.{}, sumRange, .{ lo, mid, &left }) catch unreachable;
    sumRange(mid, hi, &right);
    t.join();
    out.* = left + right;
}

pub fn main() void {
    var total: u32 = 0;
    sumRange(1, 9, &total);
    std.debug.print("{d}\n", .{total});
}
