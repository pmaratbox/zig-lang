const std = @import("std");

const AddCommand = struct {
    counter: *i32,
    amount: i32,

    fn execute(self: AddCommand) void {
        self.counter.* += self.amount;
    }

    fn undo(self: AddCommand) void {
        self.counter.* -= self.amount;
    }
};

pub fn main() void {
    var counter: i32 = 0;
    const cmd = AddCommand{ .counter = &counter, .amount = 5 };
    cmd.execute();
    const after_execute = counter;
    cmd.undo();
    std.debug.print("{d} {d}\n", .{ after_execute, counter });
}
