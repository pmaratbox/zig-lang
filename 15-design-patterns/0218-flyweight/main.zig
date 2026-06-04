const std = @import("std");

const Glyph = struct {
    ch: u8,
};

const Factory = struct {
    cache: std.AutoHashMap(u8, Glyph),
    created: i32 = 0,

    fn get(self: *Factory, ch: u8) *Glyph {
        if (self.cache.getPtr(ch)) |existing| return existing;
        self.created += 1;
        self.cache.put(ch, .{ .ch = ch }) catch unreachable;
        return self.cache.getPtr(ch).?;
    }
};

pub fn main() void {
    var gpa = std.heap.DebugAllocator(.{}){};
    defer _ = gpa.deinit();
    var factory = Factory{ .cache = std.AutoHashMap(u8, Glyph).init(gpa.allocator()) };
    defer factory.cache.deinit();

    const keys = [_]u8{ 'a', 'b', 'a' };
    for (keys) |k| _ = factory.get(k);
    std.debug.print("{d}\n", .{factory.created});
}
