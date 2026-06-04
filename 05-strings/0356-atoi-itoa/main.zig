const std = @import("std");

fn atoi(s: []const u8) i64 {
    var i: usize = 0;
    var neg = false;
    if (i < s.len and (s[i] == '-' or s[i] == '+')) {
        neg = s[i] == '-';
        i += 1;
    }
    var acc: i64 = 0;
    while (i < s.len) : (i += 1) {
        acc = acc * 10 + (s[i] - '0');
    }
    return if (neg) -acc else acc;
}

fn itoa(buf: []u8, value: i64) []const u8 {
    if (value == 0) {
        buf[0] = '0';
        return buf[0..1];
    }
    var v = value;
    const neg = v < 0;
    if (neg) v = -v;
    var tmp: [20]u8 = undefined;
    var n: usize = 0;
    while (v > 0) : (v = @divTrunc(v, 10)) {
        tmp[n] = '0' + @as(u8, @intCast(@mod(v, 10)));
        n += 1;
    }
    var out: usize = 0;
    if (neg) {
        buf[out] = '-';
        out += 1;
    }
    var k: usize = n;
    while (k > 0) {
        k -= 1;
        buf[out] = tmp[k];
        out += 1;
    }
    return buf[0..out];
}

pub fn main() void {
    const parsed = atoi("-42");
    var buf: [21]u8 = undefined;
    const formatted = itoa(&buf, parsed);
    std.debug.print("{d} {s}\n", .{ parsed, formatted });
}
