const std = @import("std");

pub fn main() void {
    const f: f64 = 3.9;
    const i: i64 = @intFromFloat(f);
    const widened: f64 = @floatFromInt(i);
    std.debug.print("{d} {d:.1}\n", .{ i, widened });
}
