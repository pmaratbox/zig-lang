const std = @import("std");

/// A minimal push-based Observable implemented from scratch.
///
/// An Observer receives `next` values and a `complete` signal. A producer is
/// driven on subscribe; it can be stopped by flipping the `active` flag, which
/// is how `take` unsubscribes the (otherwise infinite) source.
const Observer = struct {
    ctx: *anyopaque,
    nextFn: *const fn (ctx: *anyopaque, value: i64) void,
    completeFn: *const fn (ctx: *anyopaque) void,

    fn next(self: Observer, value: i64) void {
        self.nextFn(self.ctx, value);
    }
    fn complete(self: Observer) void {
        self.completeFn(self.ctx);
    }
};

/// Subscription handle: while `active` is true the source keeps producing.
const Subscription = struct {
    active: bool = true,

    fn unsubscribe(self: *Subscription) void {
        self.active = false;
    }
};

/// Unbounded source of the natural numbers 1, 2, 3, ... It keeps emitting until
/// the subscription is torn down, so it must be driven cooperatively.
const NaturalsSource = struct {
    fn subscribe(observer: Observer, sub: *Subscription) void {
        var n: i64 = 1;
        while (sub.active) : (n += 1) {
            observer.next(n);
            if (!sub.active) break;
        }
    }
};

/// take(n): forward the first n values, then complete and unsubscribe the
/// source so the infinite producer stops being driven.
const Take = struct {
    downstream: Observer,
    limit: i64,
    taken: i64 = 0,
    sub: *Subscription,

    fn onNext(ctx: *anyopaque, value: i64) void {
        const self: *Take = @ptrCast(@alignCast(ctx));
        if (self.taken >= self.limit) return;
        self.downstream.next(value);
        self.taken += 1;
        if (self.taken >= self.limit) {
            self.downstream.complete();
            self.sub.unsubscribe();
        }
    }

    fn onComplete(ctx: *anyopaque) void {
        const self: *Take = @ptrCast(@alignCast(ctx));
        self.downstream.complete();
    }

    fn observer(self: *Take) Observer {
        return .{ .ctx = self, .nextFn = onNext, .completeFn = onComplete };
    }
};

const Printer = struct {
    fn onNext(ctx: *anyopaque, value: i64) void {
        _ = ctx;
        std.debug.print("{d}\n", .{value});
    }
    fn onComplete(ctx: *anyopaque) void {
        _ = ctx;
        std.debug.print("completed\n", .{});
    }
    fn observer(self: *Printer) Observer {
        return .{ .ctx = self, .nextFn = onNext, .completeFn = onComplete };
    }
};

pub fn main() void {
    var printer = Printer{};
    var sub = Subscription{};
    var take = Take{ .downstream = printer.observer(), .limit = 3, .sub = &sub };

    NaturalsSource.subscribe(take.observer(), &sub);
}
