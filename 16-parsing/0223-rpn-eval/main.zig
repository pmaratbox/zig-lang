const std = @import("std");

pub fn main() void {
    const expr = "3 4 + 5 *";
    var stack: [16]i64 = undefined;
    var top: usize = 0;
    var it = std.mem.tokenizeScalar(u8, expr, ' ');
    while (it.next()) |tok| {
        if (tok.len == 1 and (tok[0] == '+' or tok[0] == '*')) {
            const b = stack[top - 1];
            const a = stack[top - 2];
            top -= 2;
            stack[top] = if (tok[0] == '+') a + b else a * b;
            top += 1;
        } else {
            stack[top] = std.fmt.parseInt(i64, tok, 10) catch 0;
            top += 1;
        }
    }
    std.debug.print("{d}\n", .{stack[0]});
}
