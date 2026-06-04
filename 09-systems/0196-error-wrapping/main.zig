const std = @import("std");

pub fn main() void {
    const inner = "inner";
    const outer = "outer";
    std.debug.print("{s}: {s}\n", .{ outer, inner });
}
