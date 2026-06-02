const std = @import("std");

fn inc(p: *i32) void {
    p.* += 1;
}

pub fn main() void {
    var n: i32 = 1;
    std.debug.print("before: {d}\n", .{n});
    inc(&n);
    std.debug.print("after: {d}\n", .{n});
}
