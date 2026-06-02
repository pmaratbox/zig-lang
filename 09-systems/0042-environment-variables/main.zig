const std = @import("std");

pub fn main(init: std.process.Init) void {
    const value = init.environ_map.get("LESSON_ENV_VAR") orelse "default";
    std.debug.print("value: {s}\n", .{value});
}
