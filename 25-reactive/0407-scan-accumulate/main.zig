const std = @import("std");

const Observer = struct {
    ctx: *anyopaque,
    nextFn: *const fn (ctx: *anyopaque, value: i64) void,

    fn next(self: Observer, value: i64) void {
        self.nextFn(self.ctx, value);
    }
};

const Observable = struct {
    values: []const i64,

    fn subscribe(self: Observable, observer: Observer) void {
        for (self.values) |v| {
            observer.next(v);
        }
    }
};

const ScanState = struct {
    state: i64,
    f: *const fn (acc: i64, value: i64) i64,
    downstream: Observer,

    fn onNext(ctx: *anyopaque, value: i64) void {
        const self: *ScanState = @ptrCast(@alignCast(ctx));
        self.state = self.f(self.state, value);
        self.downstream.next(self.state);
    }

    fn observer(self: *ScanState) Observer {
        return .{ .ctx = self, .nextFn = onNext };
    }
};

fn add(acc: i64, value: i64) i64 {
    return acc + value;
}

fn printNext(ctx: *anyopaque, value: i64) void {
    _ = ctx;
    std.debug.print("{d}\n", .{value});
}

pub fn main() void {
    const source = Observable{ .values = &[_]i64{ 1, 2, 3, 4 } };

    const sink = Observer{ .ctx = undefined, .nextFn = printNext };

    var scan = ScanState{ .state = 0, .f = add, .downstream = sink };

    source.subscribe(scan.observer());
}
