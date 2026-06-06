const std = @import("std");

const Observer = struct {
    name: []const u8,

    fn next(self: Observer, v: i64) void {
        std.debug.print("{s}: {d}\n", .{ self.name, v });
    }
};

const Subject = struct {
    observers: std.ArrayListUnmanaged(Observer) = .empty,

    fn subscribe(self: *Subject, allocator: std.mem.Allocator, obs: Observer) !void {
        try self.observers.append(allocator, obs);
    }

    fn next(self: *Subject, v: i64) void {
        for (self.observers.items) |obs| {
            obs.next(v);
        }
    }
};

pub fn main() !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var subject = Subject{};
    defer subject.observers.deinit(allocator);

    try subject.subscribe(allocator, .{ .name = "obs1" });
    try subject.subscribe(allocator, .{ .name = "obs2" });

    subject.next(1);
    subject.next(2);
}
