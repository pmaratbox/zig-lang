const std = @import("std");

fn squareSum(n: u64) u64 {
    var m = n;
    var sum: u64 = 0;
    while (m != 0) : (m = @divFloor(m, 10)) {
        const d = m % 10;
        sum += d * d;
    }
    return sum;
}

pub fn main() void {
    var seen = std.AutoHashMap(u64, void).init(std.heap.page_allocator);
    defer seen.deinit();
    var n: u64 = 19;
    while (n != 1) {
        if (seen.contains(n)) break;
        seen.put(n, {}) catch unreachable;
        n = squareSum(n);
    }
    std.debug.print("{s}\n", .{if (n == 1) "yes" else "no"});
}
