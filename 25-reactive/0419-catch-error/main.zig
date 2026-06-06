const std = @import("std");

/// A push-based observer: a producer pushes values via `next`, terminates with
/// `complete`, or fails with `error_`. Each callback carries the observer's own
/// context pointer so closures can keep state.
const Observer = struct {
    ctx: *anyopaque,
    next: *const fn (ctx: *anyopaque, n: i64) void,
    complete: *const fn (ctx: *anyopaque) void,
    error_: *const fn (ctx: *anyopaque) void,
};

/// A source: emits 1, then 2, then signals error.
fn source(obs: Observer) void {
    obs.next(obs.ctx, 1);
    obs.next(obs.ctx, 2);
    obs.error_(obs.ctx);
}

/// The fallback source: emits 9, then completes.
fn fallback(obs: Observer) void {
    obs.next(obs.ctx, 9);
    obs.complete(obs.ctx);
}

/// catchError's state: it wraps a downstream observer. next/complete pass
/// straight through, but error() switches to the fallback stream instead of
/// propagating the error downstream.
const CatchError = struct {
    down: Observer,

    fn onNext(ctx: *anyopaque, n: i64) void {
        const self: *CatchError = @ptrCast(@alignCast(ctx));
        self.down.next(self.down.ctx, n);
    }
    fn onComplete(ctx: *anyopaque) void {
        const self: *CatchError = @ptrCast(@alignCast(ctx));
        self.down.complete(self.down.ctx);
    }
    fn onError(ctx: *anyopaque) void {
        const self: *CatchError = @ptrCast(@alignCast(ctx));
        // Switch to the fallback stream rather than propagating the error.
        fallback(self.down);
    }

    fn observer(self: *CatchError) Observer {
        return .{ .ctx = self, .next = onNext, .complete = onComplete, .error_ = onError };
    }
};

fn printNext(_: *anyopaque, n: i64) void {
    std.debug.print("{d}\n", .{n});
}
fn printComplete(_: *anyopaque) void {}
fn printError(_: *anyopaque) void {}

pub fn main() void {
    var sink: u8 = 0;
    const downstream: Observer = .{
        .ctx = &sink,
        .next = printNext,
        .complete = printComplete,
        .error_ = printError,
    };

    var ce: CatchError = .{ .down = downstream };
    source(ce.observer());
}
