const std = @import("std");

fn task(x: u32, out: *u32) void {
    out.* = x;
}

pub fn main() !void {
    var a: u32 = 0;
    var b: u32 = 0;
    const t1 = try std.Thread.spawn(.{}, task, .{ 1, &a });
    const t2 = try std.Thread.spawn(.{}, task, .{ 2, &b });
    t1.join();
    t2.join();
    std.debug.print("sum: {d}\n", .{a + b});
}
