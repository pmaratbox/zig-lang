const std = @import("std");

fn prec(op: u8) u8 {
    return switch (op) {
        '+', '-' => 1,
        '*', '/' => 2,
        else => 0,
    };
}

pub fn main() void {
    const expr = "3 + 4 * 2";
    var out: [32]u8 = undefined;
    var olen: usize = 0;
    var ops: [16]u8 = undefined;
    var otop: usize = 0;

    var it = std.mem.tokenizeScalar(u8, expr, ' ');
    while (it.next()) |tok| {
        const c = tok[0];
        if (c >= '0' and c <= '9') {
            if (olen != 0) {
                out[olen] = ' ';
                olen += 1;
            }
            out[olen] = c;
            olen += 1;
        } else {
            while (otop > 0 and prec(ops[otop - 1]) >= prec(c)) {
                otop -= 1;
                out[olen] = ' ';
                olen += 1;
                out[olen] = ops[otop];
                olen += 1;
            }
            ops[otop] = c;
            otop += 1;
        }
    }
    while (otop > 0) {
        otop -= 1;
        out[olen] = ' ';
        olen += 1;
        out[olen] = ops[otop];
        olen += 1;
    }
    std.debug.print("{s}\n", .{out[0..olen]});
}
