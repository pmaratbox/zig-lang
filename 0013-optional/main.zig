const std = @import("std");

pub fn main() void {
    const present: ?i32 = 42;
    const absent: ?i32 = null;

    std.debug.print("present: {}\n", .{present orelse -1});
    std.debug.print("absent: {}\n", .{absent orelse -1});
}
