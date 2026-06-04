const std = @import("std");

const Pool = struct {
    inputs: [4]u32 = .{ 1, 2, 3, 4 },
    results: [4]u32 = undefined,
};

fn worker(p: *Pool, idx: usize) void {
    const x = p.inputs[idx];
    p.results[idx] = x * x;
}

pub fn main() !void {
    var p = Pool{};
    var threads: [4]std.Thread = undefined;
    for (&threads, 0..) |*t, i| {
        t.* = try std.Thread.spawn(.{}, worker, .{ &p, i });
    }
    for (&threads) |*t| t.join();

    std.mem.sort(u32, &p.results, {}, std.sort.asc(u32));

    for (p.results, 0..) |r, i| {
        if (i != 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{r});
    }
    std.debug.print("\n", .{});
}
