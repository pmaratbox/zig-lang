const std = @import("std");

/// An observer that enforces the contract: next* then a single terminal.
/// Once `stopped` is set by the first terminal (complete or error),
/// all further next/error/complete calls become no-ops.
const Observer = struct {
    stopped: bool = false,

    fn next(self: *Observer, value: i32) void {
        if (self.stopped) return;
        std.debug.print("{d}\n", .{value});
    }

    fn err(self: *Observer, message: []const u8) void {
        if (self.stopped) return;
        self.stopped = true;
        std.debug.print("error: {s}\n", .{message});
    }

    fn complete(self: *Observer) void {
        if (self.stopped) return;
        self.stopped = true;
        std.debug.print("complete\n", .{});
    }
};

pub fn main() void {
    var obs = Observer{};
    obs.next(1);
    obs.next(2);
    obs.complete();
    obs.next(3); // ignored: observer already stopped
}
