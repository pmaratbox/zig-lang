const std = @import("std");

const State = enum { locked, unlocked };
const Event = enum { coin, push };

fn transition(s: State, e: Event) State {
    return switch (s) {
        .locked => switch (e) {
            .coin => .unlocked,
            .push => .locked,
        },
        .unlocked => switch (e) {
            .coin => .unlocked,
            .push => .locked,
        },
    };
}

pub fn main() void {
    var s: State = .locked;
    const events = [_]Event{ .coin, .push, .push };
    var first = true;
    for (events) |e| {
        s = transition(s, e);
        if (!first) std.debug.print(" ", .{});
        first = false;
        std.debug.print("{s}", .{@tagName(s)});
    }
    std.debug.print("\n", .{});
}
