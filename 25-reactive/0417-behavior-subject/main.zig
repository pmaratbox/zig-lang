const std = @import("std");

const Observer = struct {
    name: []const u8,

    fn next(self: Observer, v: i64) void {
        std.debug.print("{s}: {d}\n", .{ self.name, v });
    }
};

const BehaviorSubject = struct {
    current: i64,
    observers: std.ArrayListUnmanaged(Observer) = .empty,
    allocator: std.mem.Allocator,

    fn init(allocator: std.mem.Allocator, seed: i64) BehaviorSubject {
        return .{ .current = seed, .allocator = allocator };
    }

    fn deinit(self: *BehaviorSubject) void {
        self.observers.deinit(self.allocator);
    }

    fn subscribe(self: *BehaviorSubject, obs: Observer) !void {
        // Replay the current value immediately to the new subscriber.
        obs.next(self.current);
        try self.observers.append(self.allocator, obs);
    }

    fn next(self: *BehaviorSubject, v: i64) void {
        self.current = v;
        for (self.observers.items) |obs| {
            obs.next(v);
        }
    }
};

pub fn main() !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var subject = BehaviorSubject.init(allocator, 0);
    defer subject.deinit();

    try subject.subscribe(.{ .name = "A" }); // A: 0
    subject.next(1); // A: 1
    try subject.subscribe(.{ .name = "B" }); // B: 1
    subject.next(2); // A: 2, B: 2
}
