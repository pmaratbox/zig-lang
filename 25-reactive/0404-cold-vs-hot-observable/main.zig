const std = @import("std");

// A minimal push-based Observer: a callback plus the list it collects into.
const Observer = struct {
    list: *std.ArrayListUnmanaged(u8),
    allocator: std.mem.Allocator,

    fn next(self: *Observer, value: i32) void {
        if (self.list.items.len != 0) self.list.append(self.allocator, ' ') catch unreachable;
        var buf: [16]u8 = undefined;
        const s = std.fmt.bufPrint(&buf, "{d}", .{value}) catch unreachable;
        self.list.appendSlice(self.allocator, s) catch unreachable;
    }
};

pub fn main() void {
    var arena_state = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena_state.deinit();
    const a = arena_state.allocator();

    // COLD: subscribing re-runs the producer independently for each subscriber.
    var cold_a: std.ArrayListUnmanaged(u8) = .empty;
    var cold_b: std.ArrayListUnmanaged(u8) = .empty;
    {
        var oa = Observer{ .list = &cold_a, .allocator = a };
        var ob = Observer{ .list = &cold_b, .allocator = a };
        // Each subscription runs the producer from scratch.
        for ([_]*Observer{ &oa, &ob }) |o| {
            o.next(1);
            o.next(2);
            o.next(3);
        }
    }

    // HOT: one shared producer; late subscribers miss earlier values.
    var hot_a: std.ArrayListUnmanaged(u8) = .empty;
    var hot_b: std.ArrayListUnmanaged(u8) = .empty;
    {
        var ha = Observer{ .list = &hot_a, .allocator = a };
        var hb = Observer{ .list = &hot_b, .allocator = a };
        // Shared observer registry; subscribing appends to it.
        var subs: std.ArrayListUnmanaged(*Observer) = .empty;

        // A subscribes first.
        subs.append(a, &ha) catch unreachable;
        // producer emits 1 to current subscribers (only A).
        for (subs.items) |o| o.next(1);
        // B subscribes late.
        subs.append(a, &hb) catch unreachable;
        // producer emits 2 and 3 to all current subscribers (A and B).
        for (subs.items) |o| o.next(2);
        for (subs.items) |o| o.next(3);
    }

    std.debug.print("cold A: {s}\n", .{cold_a.items});
    std.debug.print("cold B: {s}\n", .{cold_b.items});
    std.debug.print("hot A: {s}\n", .{hot_a.items});
    std.debug.print("hot B: {s}\n", .{hot_b.items});
}
