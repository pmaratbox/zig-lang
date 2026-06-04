const std = @import("std");

fn doubleStep(in: i64, out: *i64) void {
    out.* = in * 2;
}

fn incStep(in: i64, out: *i64) void {
    out.* = in + 1;
}

pub fn main() !void {
    var a: i64 = undefined;
    var b: i64 = undefined;

    const t1 = try std.Thread.spawn(.{}, doubleStep, .{ 5, &a });
    t1.join();

    const t2 = try std.Thread.spawn(.{}, incStep, .{ a, &b });
    t2.join();

    std.debug.print("{d}\n", .{b});
}
