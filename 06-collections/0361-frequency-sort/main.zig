const std = @import("std");

const Entry = struct {
    value: i32,
    count: usize,
    order: usize,
};

pub fn main() void {
    const nums = [_]i32{ 1, 1, 2, 3, 3, 3 };

    var entries: [16]Entry = undefined;
    var n: usize = 0;
    for (nums) |v| {
        var found = false;
        for (entries[0..n]) |*e| {
            if (e.value == v) {
                e.count += 1;
                found = true;
                break;
            }
        }
        if (!found) {
            entries[n] = .{ .value = v, .count = 1, .order = n };
            n += 1;
        }
    }

    // sort by count desc, ties keep first-seen order (ascending order field)
    std.mem.sort(Entry, entries[0..n], {}, lessThan);

    var first = true;
    for (entries[0..n]) |e| {
        var k: usize = 0;
        while (k < e.count) : (k += 1) {
            if (!first) std.debug.print(" ", .{});
            std.debug.print("{d}", .{e.value});
            first = false;
        }
    }
    std.debug.print("\n", .{});
}

fn lessThan(_: void, a: Entry, b: Entry) bool {
    if (a.count != b.count) return a.count > b.count;
    return a.order < b.order;
}
