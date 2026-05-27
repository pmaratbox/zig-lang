const std = @import("std");

pub fn main() void {
    const n: i32 = 42;
    const pi: f64 = 3.14;
    const greeting: []const u8 = "hello";
    const flag: bool = true;

    std.debug.print("int: {}\n", .{n});
    std.debug.print("float: {d}\n", .{pi});
    std.debug.print("string: {s}\n", .{greeting});
    std.debug.print("bool: {}\n", .{flag});
}
