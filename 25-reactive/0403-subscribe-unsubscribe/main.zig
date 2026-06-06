const std = @import("std");

const Observer = struct {
    sub: *Subscription,

    fn next(self: *Observer, value: i32) void {
        std.debug.print("{d}\n", .{value});
        if (value == 2) self.sub.unsubscribe();
    }
};

const Subscription = struct {
    closed: bool = false,

    fn unsubscribe(self: *Subscription) void {
        self.closed = true;
    }
};

// The source pushes 1,2,3,4 but checks the closed flag before each next.
fn subscribe(observer: *Observer) void {
    const values = [_]i32{ 1, 2, 3, 4 };
    for (values) |v| {
        if (observer.sub.closed) break;
        observer.next(v);
    }
}

pub fn main() void {
    var sub = Subscription{};
    var observer = Observer{ .sub = &sub };
    subscribe(&observer);
}
