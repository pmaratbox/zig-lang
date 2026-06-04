const std = @import("std");

const READ: u8 = 1;
const WRITE: u8 = 2;

pub fn main() void {
    const flags: u8 = READ | WRITE;
    const set = (flags & WRITE) != 0;
    std.debug.print("{d} {s}\n", .{ flags, if (set) "yes" else "no" });
}
