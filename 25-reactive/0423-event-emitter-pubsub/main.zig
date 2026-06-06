const std = @import("std");

const Handler = struct {
    func: *const fn ([]const u8, []const u8) void,
};

const EventEmitter = struct {
    topics: std.StringHashMapUnmanaged(std.ArrayListUnmanaged(Handler)) = .{},
    allocator: std.mem.Allocator,

    fn init(allocator: std.mem.Allocator) EventEmitter {
        return .{ .allocator = allocator };
    }

    fn on(self: *EventEmitter, topic: []const u8, func: *const fn ([]const u8, []const u8) void) !void {
        const gop = try self.topics.getOrPut(self.allocator, topic);
        if (!gop.found_existing) gop.value_ptr.* = .empty;
        try gop.value_ptr.append(self.allocator, .{ .func = func });
    }

    fn emit(self: *EventEmitter, topic: []const u8, payload: []const u8) void {
        if (self.topics.getPtr(topic)) |list| {
            for (list.items) |h| h.func(topic, payload);
        }
    }

    fn off(self: *EventEmitter, topic: []const u8, func: *const fn ([]const u8, []const u8) void) void {
        if (self.topics.getPtr(topic)) |list| {
            var i: usize = 0;
            while (i < list.items.len) {
                if (list.items[i].func == func) {
                    _ = list.orderedRemove(i);
                } else {
                    i += 1;
                }
            }
        }
    }
};

fn greetHandler(topic: []const u8, payload: []const u8) void {
    _ = topic;
    std.debug.print("hi {s}\n", .{payload});
}

fn byeHandler(topic: []const u8, payload: []const u8) void {
    _ = topic;
    std.debug.print("bye {s}\n", .{payload});
}

pub fn main() !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var emitter = EventEmitter.init(allocator);
    defer {
        var it = emitter.topics.valueIterator();
        while (it.next()) |list| list.deinit(allocator);
        emitter.topics.deinit(allocator);
    }

    try emitter.on("greet", greetHandler);
    try emitter.on("bye", byeHandler);

    emitter.emit("greet", "ada");
    emitter.emit("bye", "ada");

    emitter.off("greet", greetHandler);
    emitter.emit("greet", "x");
}
