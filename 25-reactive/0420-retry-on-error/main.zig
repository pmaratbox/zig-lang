const std = @import("std");

/// A minimal push-based Observer: callbacks for next/error/complete.
const Observer = struct {
    next: *const fn (value: i32) void,
    err: *const fn () void,
    complete: *const fn () void,
};

/// A producer wired to an observer when subscribed.
const Observable = struct {
    subscribe_fn: *const fn (self: *Observable, obs: Observer) void,

    fn subscribe(self: *Observable, obs: Observer) void {
        self.subscribe_fn(self, obs);
    }
};

// Tracks how many times the source has been subscribed.
var attempt_count: u32 = 0;

fn sourceSubscribe(_: *Observable, obs: Observer) void {
    attempt_count += 1;
    const k = attempt_count;
    std.debug.print("attempt {d}\n", .{k});
    if (k < 3) {
        obs.err();
    } else {
        obs.next(42);
        obs.complete();
    }
}

var source = Observable{ .subscribe_fn = sourceSubscribe };

// retry(n): on error, resubscribe to the source up to n more times.
var retries_left: u32 = 0;
var downstream: Observer = undefined;

fn retrySubscribe(_: *Observable, obs: Observer) void {
    downstream = obs;
    source.subscribe(retryObserver);
}

const retryObserver = Observer{
    .next = retryNext,
    .err = retryError,
    .complete = retryComplete,
};

fn retryNext(value: i32) void {
    downstream.next(value);
}

fn retryError() void {
    if (retries_left > 0) {
        retries_left -= 1;
        source.subscribe(retryObserver);
    } else {
        downstream.err();
    }
}

fn retryComplete() void {
    downstream.complete();
}

fn retry(n: u32) *Observable {
    retries_left = n;
    return &retried;
}

var retried = Observable{ .subscribe_fn = retrySubscribe };

// Final observer: the success branch prints "ok".
fn onNext(_: i32) void {
    std.debug.print("ok\n", .{});
}

fn onError() void {}

fn onComplete() void {}

pub fn main() void {
    const obs = Observer{ .next = onNext, .err = onError, .complete = onComplete };
    const stream = retry(2);
    stream.subscribe(obs);
}
