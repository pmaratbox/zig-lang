const std = @import("std");

pub fn main() void {
    const root: f64 = std.math.sqrt(@as(f64, 16));
    const power: f64 = std.math.pow(f64, 2, 10);
    std.debug.print("sqrt: {d}\n", .{@as(i32, @intFromFloat(root))});
    std.debug.print("pow: {d}\n", .{@as(i32, @intFromFloat(power))});
    std.debug.print("abs: {d}\n", .{@abs(@as(i32, -5))});
    std.debug.print("max: {d}\n", .{@max(3, 9)});
}
