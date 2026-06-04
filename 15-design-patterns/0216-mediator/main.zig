const std = @import("std");

const Colleague = struct {
    name: []const u8,

    fn receive(self: Colleague, msg: []const u8) void {
        std.debug.print("{s} got: {s}\n", .{ self.name, msg });
    }
};

const Mediator = struct {
    b: Colleague,

    fn send(self: Mediator, msg: []const u8) void {
        self.b.receive(msg);
    }
};

pub fn main() void {
    const b = Colleague{ .name = "B" };
    const mediator = Mediator{ .b = b };
    mediator.send("hi");
}
