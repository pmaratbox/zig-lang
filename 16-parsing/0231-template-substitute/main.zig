const std = @import("std");

pub fn main() void {
    const tmpl = "hi {name}";
    const name = "Ada";
    var buf: [64]u8 = undefined;
    var len: usize = 0;
    var i: usize = 0;
    while (i < tmpl.len) {
        if (tmpl[i] == '{') {
            const end = std.mem.indexOfScalarPos(u8, tmpl, i, '}').?;
            const key = tmpl[i + 1 .. end];
            const val = if (std.mem.eql(u8, key, "name")) name else "";
            @memcpy(buf[len .. len + val.len], val);
            len += val.len;
            i = end + 1;
        } else {
            buf[len] = tmpl[i];
            len += 1;
            i += 1;
        }
    }
    std.debug.print("{s}\n", .{buf[0..len]});
}
