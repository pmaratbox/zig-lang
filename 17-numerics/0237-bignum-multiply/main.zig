const std = @import("std");

pub fn main() void {
    const a = "123";
    const b = "456";
    var result = [_]u8{0} ** (a.len + b.len);
    var i: isize = @intCast(a.len);
    while (i > 0) {
        i -= 1;
        const da: u32 = a[@intCast(i)] - '0';
        var j: isize = @intCast(b.len);
        var carry: u32 = 0;
        while (j > 0) {
            j -= 1;
            const db: u32 = b[@intCast(j)] - '0';
            const pos: usize = @intCast(i + j + 1);
            const cur = result[pos] + da * db + carry;
            result[pos] = @intCast(cur % 10);
            carry = cur / 10;
        }
        var pos: usize = @intCast(i);
        while (carry > 0) {
            const cur = result[pos] + carry;
            result[pos] = @intCast(cur % 10);
            carry = cur / 10;
            if (pos == 0) break;
            pos -= 1;
        }
    }
    var start: usize = 0;
    while (start < result.len - 1 and result[start] == 0) start += 1;
    var buf: [16]u8 = undefined;
    var n: usize = 0;
    var k = start;
    while (k < result.len) : (k += 1) {
        buf[n] = '0' + result[k];
        n += 1;
    }
    std.debug.print("{s}\n", .{buf[0..n]});
}
