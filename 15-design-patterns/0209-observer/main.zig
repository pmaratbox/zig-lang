const std = @import("std");

const Observer = struct {
    id: []const u8,

    fn update(self: Observer, value: i32) void {
        std.debug.print("{s}: {d}\n", .{ self.id, value });
    }
};

const Subject = struct {
    observers: []const Observer,

    fn notify(self: Subject, value: i32) void {
        for (self.observers) |obs| obs.update(value);
    }
};

pub fn main() void {
    const observers = [_]Observer{ .{ .id = "obs1" }, .{ .id = "obs2" } };
    const subject = Subject{ .observers = &observers };
    subject.notify(5);
}
