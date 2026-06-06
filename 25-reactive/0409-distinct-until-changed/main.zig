const std = @import("std");

/// A minimal push-based observer: a context pointer plus a `next` callback.
const Observer = struct {
    ctx: *anyopaque,
    nextFn: *const fn (ctx: *anyopaque, value: i64) void,

    fn next(self: Observer, value: i64) void {
        self.nextFn(self.ctx, value);
    }
};

/// distinctUntilChanged: track the last emitted value and forward only when
/// the incoming value differs from it.
const DistinctUntilChanged = struct {
    downstream: Observer,
    last: ?i64 = null,

    fn next(ctx: *anyopaque, value: i64) void {
        const self: *DistinctUntilChanged = @ptrCast(@alignCast(ctx));
        if (self.last == null or self.last.? != value) {
            self.last = value;
            self.downstream.next(value);
        }
    }

    fn observer(self: *DistinctUntilChanged) Observer {
        return .{ .ctx = self, .nextFn = next };
    }
};

fn printNext(_: *anyopaque, value: i64) void {
    std.debug.print("{d}\n", .{value});
}

pub fn main() void {
    const sink = Observer{ .ctx = undefined, .nextFn = printNext };
    var op = DistinctUntilChanged{ .downstream = sink };
    const upstream = op.observer();

    const source = [_]i64{ 1, 1, 2, 2, 2, 3, 1 };
    for (source) |value| {
        upstream.next(value);
    }
}
