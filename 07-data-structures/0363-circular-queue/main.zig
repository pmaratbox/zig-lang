const std = @import("std");

const Queue = struct {
    data: [3]i32 = undefined,
    head: usize = 0,
    len: usize = 0,

    fn enqueue(self: *Queue, v: i32) void {
        if (self.len == 3) return;
        const idx = (self.head + self.len) % 3;
        self.data[idx] = v;
        self.len += 1;
    }

    fn dequeue(self: *Queue) i32 {
        const v = self.data[self.head];
        self.head = (self.head + 1) % 3;
        self.len -= 1;
        return v;
    }
};

pub fn main() void {
    var q = Queue{};
    q.enqueue(1);
    q.enqueue(2);
    q.enqueue(3);
    _ = q.dequeue();
    q.enqueue(4);

    var i: usize = 0;
    while (i < q.len) : (i += 1) {
        if (i != 0) std.debug.print(" ", .{});
        std.debug.print("{d}", .{q.data[(q.head + i) % 3]});
    }
    std.debug.print("\n", .{});
}
