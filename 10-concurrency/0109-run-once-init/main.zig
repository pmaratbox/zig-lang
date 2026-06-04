const std = @import("std");

const Once = struct {
    state: std.atomic.Value(u8) = std.atomic.Value(u8).init(0), // 0=idle 1=running 2=done

    fn call(self: *Once, comptime f: fn () void) void {
        if (self.state.load(.acquire) == 2) return;
        if (self.state.cmpxchgStrong(0, 1, .acquire, .acquire) == null) {
            f();
            self.state.store(2, .release);
        } else {
            while (self.state.load(.acquire) != 2) std.atomic.spinLoopHint();
        }
    }
};

var count: std.atomic.Value(u32) = std.atomic.Value(u32).init(0);
var once = Once{};

fn initialize() void {
    _ = count.fetchAdd(1, .monotonic);
}

const OnceInit = struct {
    fn trigger() void {
        once.call(initialize);
    }
};

pub fn main() !void {
    var threads: [10]std.Thread = undefined;
    for (&threads) |*t| {
        t.* = try std.Thread.spawn(.{}, OnceInit.trigger, .{});
    }
    for (&threads) |*t| t.join();
    std.debug.print("init count: {d}\n", .{count.load(.monotonic)});
}
