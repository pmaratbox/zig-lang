const std = @import("std");

fn mapAdd2(opt: ?i32) ?i32 {
    if (opt) |v| return v + 2;
    return null;
}

pub fn main() void {
    const present: ?i32 = 10;
    const absent: ?i32 = null;

    const a = mapAdd2(present);
    const b = mapAdd2(absent);

    std.debug.print("{d} ", .{a.?});
    if (b) |v| {
        std.debug.print("{d}\n", .{v});
    } else {
        std.debug.print("none\n", .{});
    }
}
