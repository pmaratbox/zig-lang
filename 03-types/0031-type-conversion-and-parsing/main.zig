const std = @import("std");

pub fn main() !void {
    const n = try std.fmt.parseInt(i32, "42", 10);
    const f = try std.fmt.parseFloat(f64, "3.5");
    var buf: [16]u8 = undefined;
    const s = try std.fmt.bufPrint(&buf, "{d}", .{n});
    std.debug.print("int: {d}\n", .{n});
    std.debug.print("float: {d}\n", .{f});
    std.debug.print("str: {s}\n", .{s});
}
