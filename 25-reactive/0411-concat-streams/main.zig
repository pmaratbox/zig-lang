const std = @import("std");

const Observer = struct {
    next: *const fn (i32) void,
    complete: *const fn () void,
};

const Source = struct {
    subscribe: *const fn (Observer) void,
};

fn sourceA(obs: Observer) void {
    obs.next(1);
    obs.next(2);
    obs.complete();
}

fn sourceB(obs: Observer) void {
    obs.next(3);
    obs.next(4);
    obs.complete();
}

// concat(a, b): subscribe to a; on a.complete, subscribe to b; on b.complete, complete.
var g_a: Source = undefined;
var g_b: Source = undefined;
var g_downstream: Observer = undefined;

fn forwardNext(v: i32) void {
    g_downstream.next(v);
}

fn onAComplete() void {
    g_b.subscribe(.{ .next = forwardNext, .complete = onBComplete });
}

fn onBComplete() void {
    g_downstream.complete();
}

fn concat(a: Source, b: Source, downstream: Observer) void {
    g_a = a;
    g_b = b;
    g_downstream = downstream;
    a.subscribe(.{ .next = forwardNext, .complete = onAComplete });
}

fn printNext(v: i32) void {
    std.debug.print("{d}\n", .{v});
}

fn printComplete() void {}

pub fn main() void {
    const a = Source{ .subscribe = sourceA };
    const b = Source{ .subscribe = sourceB };
    concat(a, b, .{ .next = printNext, .complete = printComplete });
}
