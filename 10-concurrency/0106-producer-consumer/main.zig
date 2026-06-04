const std = @import("std");

const SpinLock = struct {
    locked: std.atomic.Value(bool) = std.atomic.Value(bool).init(false),

    fn lock(self: *SpinLock) void {
        while (self.locked.swap(true, .acquire)) std.atomic.spinLoopHint();
    }
    fn unlock(self: *SpinLock) void {
        self.locked.store(false, .release);
    }
};

const Consumer = struct {
    mutex: SpinLock = .{},
    buf: [4]u32 = undefined,
    len: usize = 0,
    head: usize = 0,
    closed: bool = false,

    fn send(self: *Consumer, v: u32) void {
        while (true) {
            self.mutex.lock();
            if (self.len < self.buf.len) {
                self.buf[(self.head + self.len) % self.buf.len] = v;
                self.len += 1;
                self.mutex.unlock();
                return;
            }
            self.mutex.unlock();
            std.atomic.spinLoopHint();
        }
    }

    fn close(self: *Consumer) void {
        self.mutex.lock();
        defer self.mutex.unlock();
        self.closed = true;
    }

    fn recv(self: *Consumer) ?u32 {
        while (true) {
            self.mutex.lock();
            if (self.len > 0) {
                const v = self.buf[self.head];
                self.head = (self.head + 1) % self.buf.len;
                self.len -= 1;
                self.mutex.unlock();
                return v;
            }
            if (self.closed) {
                self.mutex.unlock();
                return null;
            }
            self.mutex.unlock();
            std.atomic.spinLoopHint();
        }
    }
};

fn producer(ch: *Consumer) void {
    var i: u32 = 1;
    while (i <= 5) : (i += 1) ch.send(i);
    ch.close();
}

pub fn main() !void {
    var ch = Consumer{};
    const t = try std.Thread.spawn(.{}, producer, .{&ch});
    var sum: u32 = 0;
    while (ch.recv()) |v| sum += v;
    std.debug.print("{d}\n", .{sum});
    t.join();
}
