const std = @import("std");

/// A minimal push-based Observer: a callback plus its context.
const Observer = struct {
    ctx: *anyopaque,
    nextFn: *const fn (ctx: *anyopaque, value: i64) void,

    fn next(self: Observer, value: i64) void {
        self.nextFn(self.ctx, value);
    }
};

/// A push-based Observable: subscribe wires a producer to an observer.
const Observable = struct {
    ctx: *anyopaque,
    subscribeFn: *const fn (ctx: *anyopaque, observer: Observer) void,

    fn subscribe(self: Observable, observer: Observer) void {
        self.subscribeFn(self.ctx, observer);
    }
};

/// Source that synchronously emits a fixed slice of values.
const ArraySource = struct {
    values: []const i64,

    fn observable(self: *ArraySource) Observable {
        return .{ .ctx = self, .subscribeFn = subscribe };
    }

    fn subscribe(ctx: *anyopaque, observer: Observer) void {
        const self: *ArraySource = @ptrCast(@alignCast(ctx));
        for (self.values) |v| observer.next(v);
    }
};

/// map(source, f) returns a new Observable whose next forwards f(value).
const MapOperator = struct {
    source: Observable,
    f: *const fn (value: i64) i64,
    downstream: Observer = undefined,

    fn observable(self: *MapOperator) Observable {
        return .{ .ctx = self, .subscribeFn = subscribe };
    }

    fn subscribe(ctx: *anyopaque, observer: Observer) void {
        const self: *MapOperator = @ptrCast(@alignCast(ctx));
        self.downstream = observer;
        self.source.subscribe(.{ .ctx = self, .nextFn = onNext });
    }

    fn onNext(ctx: *anyopaque, value: i64) void {
        const self: *MapOperator = @ptrCast(@alignCast(ctx));
        self.downstream.next(self.f(value));
    }
};

fn timesTwo(value: i64) i64 {
    return value * 2;
}

fn printNext(_: *anyopaque, value: i64) void {
    std.debug.print("{d}\n", .{value});
}

pub fn main() void {
    var source = ArraySource{ .values = &[_]i64{ 1, 2, 3, 4 } };
    var mapped = MapOperator{ .source = source.observable(), .f = timesTwo };

    mapped.observable().subscribe(.{ .ctx = undefined, .nextFn = printNext });
}
