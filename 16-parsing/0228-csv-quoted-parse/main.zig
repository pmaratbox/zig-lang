const std = @import("std");

pub fn main() void {
    const row = "a,\"b,c\",d";
    var out: [64]u8 = undefined;
    var len: usize = 0;
    var in_quotes = false;
    for (row) |c| {
        switch (c) {
            '"' => in_quotes = !in_quotes,
            ',' => {
                if (in_quotes) {
                    out[len] = c;
                    len += 1;
                } else {
                    out[len] = '|';
                    len += 1;
                }
            },
            else => {
                out[len] = c;
                len += 1;
            },
        }
    }
    std.debug.print("{s}\n", .{out[0..len]});
}
