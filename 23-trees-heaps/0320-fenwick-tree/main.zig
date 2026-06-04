const std = @import("std");

const N = 5;

const Fenwick = struct {
    bit: [N + 1]i64 = [_]i64{0} ** (N + 1),

    fn update(self: *Fenwick, idx: usize, delta: i64) void {
        var i = idx;
        while (i <= N) : (i += i & (~i +% 1)) {
            self.bit[i] += delta;
        }
    }

    fn prefix(self: *Fenwick, idx: usize) i64 {
        var sum: i64 = 0;
        var i = idx;
        while (i > 0) : (i -= i & (~i +% 1)) {
            sum += self.bit[i];
        }
        return sum;
    }
};

pub fn main() void {
    var ft = Fenwick{};
    const vals = [_]i64{ 1, 2, 3, 4, 5 };
    for (vals, 0..) |v, i| ft.update(i + 1, v);
    std.debug.print("{d}\n", .{ft.prefix(4)});
}
