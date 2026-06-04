const std = @import("std");

const SpinLock = struct {
    locked: std.atomic.Value(bool) = std.atomic.Value(bool).init(false),

    fn lock(self: *SpinLock) void {
        while (self.locked.swap(true, .acquire)) std.atomic.spinLoopHint();
    }
    fn unlock(self: *SpinLock) void {
        self.locked.store(false, .release);
    }
};

const SharedCounter = struct {
    mutex: SpinLock = .{},
    value: u32 = 0,
};

fn sharedcounter(c: *SharedCounter) void {
    var i: u32 = 0;
    while (i < 100) : (i += 1) {
        c.mutex.lock();
        c.value += 1;
        c.mutex.unlock();
    }
}

pub fn main() !void {
    var counter = SharedCounter{};
    var threads: [10]std.Thread = undefined;
    for (&threads) |*t| {
        t.* = try std.Thread.spawn(.{}, sharedcounter, .{&counter});
    }
    for (&threads) |*t| t.join();
    std.debug.print("{d}\n", .{counter.value});
}
