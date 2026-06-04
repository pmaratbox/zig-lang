const std = @import("std");

const Direction = enum { N, E, S, W };

pub fn main() void {
    const ordinal_s = @intFromEnum(Direction.S);
    const name_at_3 = @tagName(@as(Direction, @enumFromInt(3)));
    std.debug.print("{d} {s}\n", .{ ordinal_s, name_at_3 });
}
