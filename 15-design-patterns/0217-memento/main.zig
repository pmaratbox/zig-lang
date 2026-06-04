const std = @import("std");

const Memento = struct {
    state: i32,
};

const Originator = struct {
    state: i32,

    fn save(self: Originator) Memento {
        return .{ .state = self.state };
    }

    fn restore(self: *Originator, memento: Memento) void {
        self.state = memento.state;
    }
};

pub fn main() void {
    var originator = Originator{ .state = 1 };
    const memento = originator.save();
    originator.state = 2;
    const current = originator.state;
    originator.restore(memento);
    std.debug.print("{d} {d}\n", .{ current, originator.state });
}
