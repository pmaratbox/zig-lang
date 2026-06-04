const std = @import("std");

fn returnvalues(x: u32, out: *u32) void {
    out.* = x * x;
}

pub fn main() !void {
    var a: u32 = 0;
    var b: u32 = 0;
    const t1 = try std.Thread.spawn(.{}, returnvalues, .{ 3, &a });
    const t2 = try std.Thread.spawn(.{}, returnvalues, .{ 4, &b });
    t1.join();
    t2.join();
    std.debug.print("{d}\n", .{a + b});
}
