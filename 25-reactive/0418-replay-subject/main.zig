const std = @import("std");

const Observer = struct {
    next: *const fn (value: i64) void,
};

const ReplaySubject = struct {
    buffer: [2]i64 = .{ 0, 0 },
    len: usize = 0,
    observers: std.ArrayListUnmanaged(Observer) = .empty,

    fn emit(self: *ReplaySubject, value: i64) void {
        // push into the ring of the last 2 values
        if (self.len < 2) {
            self.buffer[self.len] = value;
            self.len += 1;
        } else {
            self.buffer[0] = self.buffer[1];
            self.buffer[1] = value;
        }
        for (self.observers.items) |obs| obs.next(value);
    }

    fn subscribe(self: *ReplaySubject, allocator: std.mem.Allocator, obs: Observer) void {
        // replay the buffered values to the late subscriber
        var i: usize = 0;
        while (i < self.len) : (i += 1) obs.next(self.buffer[i]);
        self.observers.append(allocator, obs) catch unreachable;
    }
};

fn print(value: i64) void {
    std.debug.print("{d}\n", .{value});
}

pub fn main() void {
    const allocator = std.heap.page_allocator;

    var subject = ReplaySubject{};
    defer subject.observers.deinit(allocator);

    subject.emit(1);
    subject.emit(2);
    subject.emit(3); // buffer now [2, 3]

    // late subscriber: receives buffered 2 then 3
    subject.subscribe(allocator, .{ .next = print });

    subject.emit(4); // subscriber receives 4
}
