const std = @import("std");

const State = enum { red, green, yellow };

fn next(s: State) State {
    return switch (s) {
        .red => .green,
        .green => .yellow,
        .yellow => .red,
    };
}

pub fn main() void {
    var s: State = .red;
    var first = true;
    var i: usize = 0;
    while (i < 4) : (i += 1) {
        s = next(s);
        if (!first) std.debug.print(" ", .{});
        first = false;
        std.debug.print("{s}", .{@tagName(s)});
    }
    std.debug.print("\n", .{});
}
