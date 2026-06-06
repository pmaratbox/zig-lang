const std = @import("std");

/// A writable signal: holds a value and a list of subscriber callbacks.
const Signal = struct {
    value: i64,
    subs: std.ArrayListUnmanaged(*Computed) = .empty,

    fn init(value: i64) Signal {
        return .{ .value = value };
    }

    fn get(self: *Signal) i64 {
        return self.value;
    }

    fn set(self: *Signal, value: i64) void {
        self.value = value;
        // Notify subscribers so they recompute.
        for (self.subs.items) |c| c.recompute();
    }

    fn subscribe(self: *Signal, allocator: std.mem.Allocator, c: *Computed) void {
        self.subs.append(allocator, c) catch unreachable;
    }
};

/// A derived value that caches the result of reading its dependencies.
const Computed = struct {
    a: *Signal,
    b: *Signal,
    cached: i64 = 0,

    fn recompute(self: *Computed) void {
        self.cached = self.a.get() + self.b.get();
    }

    fn get(self: *Computed) i64 {
        return self.cached;
    }
};

pub fn main() void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    var a = Signal.init(2);
    var b = Signal.init(3);

    var sum = Computed{ .a = &a, .b = &b };
    // computed registers a recompute callback as a subscriber of the signals it reads.
    a.subscribe(allocator, &sum);
    b.subscribe(allocator, &sum);
    sum.recompute();

    std.debug.print("{d}\n", .{sum.get()});

    a.set(10);
    std.debug.print("{d}\n", .{sum.get()});
}
