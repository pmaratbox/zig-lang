const std = @import("std");

pub fn main() void {
    const names = [_][]const u8{ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" };
    const start: u32 = 6; // Saturday
    const result = (start + 3) % 7;
    std.debug.print("{s}\n", .{names[result]});
}
