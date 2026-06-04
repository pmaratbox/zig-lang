const std = @import("std");

pub fn main() void {
    const program = "+++";
    var cell: u8 = 0;
    for (program) |c| {
        switch (c) {
            '+' => cell +%= 1,
            '-' => cell -%= 1,
            else => {},
        }
    }
    std.debug.print("{d}\n", .{cell});
}
