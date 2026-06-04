const std = @import("std");

fn value(c: u8) i64 {
    return switch (c) {
        'I' => 1,
        'V' => 5,
        'X' => 10,
        'L' => 50,
        'C' => 100,
        'D' => 500,
        'M' => 1000,
        else => 0,
    };
}

pub fn main() void {
    const s = "XIV";
    var total: i64 = 0;
    var i: usize = 0;
    while (i < s.len) : (i += 1) {
        const v = value(s[i]);
        if (i + 1 < s.len and value(s[i + 1]) > v) {
            total -= v;
        } else {
            total += v;
        }
    }
    std.debug.print("{d}\n", .{total});
}
