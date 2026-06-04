const std = @import("std");

const State = enum { A, B, C };

fn next(s: State) State {
    return switch (s) {
        .A => .B,
        .B => .C,
        .C => .A,
    };
}

pub fn main() void {
    var s: State = .A;
    var first = true;
    var i: usize = 0;
    while (i < 3) : (i += 1) {
        s = next(s);
        if (!first) std.debug.print(" ", .{});
        first = false;
        std.debug.print("{s}", .{@tagName(s)});
    }
    std.debug.print("\n", .{});
}
