const std = @import("std");

fn addStrings(a: []const u8, b: []const u8, out: []u8) usize {
    var i: isize = @intCast(a.len);
    var j: isize = @intCast(b.len);
    var k: usize = out.len;
    var carry: u8 = 0;
    while (i > 0 or j > 0 or carry > 0) {
        var sum: u8 = carry;
        if (i > 0) {
            i -= 1;
            sum += a[@intCast(i)] - '0';
        }
        if (j > 0) {
            j -= 1;
            sum += b[@intCast(j)] - '0';
        }
        carry = sum / 10;
        k -= 1;
        out[k] = '0' + (sum % 10);
    }
    return k;
}

pub fn main() void {
    var buf: [32]u8 = undefined;
    const start = addStrings("999999999999", "1", &buf);
    std.debug.print("{s}\n", .{buf[start..]});
}
