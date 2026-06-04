const std = @import("std");

fn taskscombine(value: u32, out: *u32) void {
    out.* = value;
}

pub fn main() !void {
    var a: u32 = 0;
    var b: u32 = 0;
    const t1 = try std.Thread.spawn(.{}, taskscombine, .{ 10, &a });
    const t2 = try std.Thread.spawn(.{}, taskscombine, .{ 20, &b });
    t1.join();
    t2.join();
    std.debug.print("{d}\n", .{a + b});
}
