const std = @import("std");

const Observer = struct {
    next: *const fn (value: i32) void,
    complete: *const fn () void,
};

fn observableCreate(observer: Observer) void {
    observer.next(1);
    observer.next(2);
    observer.next(3);
    observer.complete();
}

fn onNext(value: i32) void {
    std.debug.print("{d}\n", .{value});
}

fn onComplete() void {
    std.debug.print("done\n", .{});
}

pub fn main() void {
    observableCreate(.{ .next = onNext, .complete = onComplete });
}
