const std = @import("std");

const Observer = struct {
    next: *const fn (value: i64) void,
};

const Observable = struct {
    subscribeFn: *const fn (observer: Observer) void,

    fn subscribe(self: Observable, observer: Observer) void {
        self.subscribeFn(observer);
    }
};

fn sourceSubscribe(observer: Observer) void {
    var value: i64 = 1;
    while (value <= 6) : (value += 1) {
        observer.next(value);
    }
}

fn isEven(value: i64) bool {
    return @rem(value, 2) == 0;
}

var filtered_observer: Observer = undefined;

fn filterForward(value: i64) void {
    if (isEven(value)) {
        filtered_observer.next(value);
    }
}

fn filterSubscribe(observer: Observer) void {
    filtered_observer = observer;
    const source = Observable{ .subscribeFn = sourceSubscribe };
    source.subscribe(.{ .next = filterForward });
}

fn printNext(value: i64) void {
    std.debug.print("{d}\n", .{value});
}

pub fn main() void {
    const filtered = Observable{ .subscribeFn = filterSubscribe };
    filtered.subscribe(.{ .next = printNext });
}
