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

const Channel = struct {
    mutex: SpinLock = .{},
    buf: [8]u32 = undefined,
    len: usize = 0,
    head: usize = 0,
    closed: bool = false,

    fn send(self: *Channel, v: u32) void {
        self.mutex.lock();
        defer self.mutex.unlock();
        self.buf[(self.head + self.len) % self.buf.len] = v;
        self.len += 1;
    }

    fn close(self: *Channel) void {
        self.mutex.lock();
        defer self.mutex.unlock();
        self.closed = true;
    }

    fn recv(self: *Channel) ?u32 {
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

fn messagepassing(ch: *Channel) void {
    ch.send(1);
    ch.send(2);
    ch.send(3);
    ch.close();
}

pub fn main() !void {
    var ch = Channel{};
    const t = try std.Thread.spawn(.{}, messagepassing, .{&ch});
    var first = true;
    while (ch.recv()) |v| {
        if (!first) std.debug.print(" ", .{});
        std.debug.print("{d}", .{v});
        first = false;
    }
    std.debug.print("\n", .{});
    t.join();
}
