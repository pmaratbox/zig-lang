const std = @import("std");

/// A push-based observer: receives values via `next`.
fn Observer(comptime T: type) type {
    return struct {
        ctx: *anyopaque,
        nextFn: *const fn (ctx: *anyopaque, value: T) void,

        fn next(self: @This(), value: T) void {
            self.nextFn(self.ctx, value);
        }
    };
}

/// zip(a, b, combine): buffer each source in a per-source queue; whenever both
/// queues are non-empty, dequeue one from each and emit combine(x, y).
const Zip = struct {
    qa: std.ArrayListUnmanaged(i64) = .empty,
    qb: std.ArrayListUnmanaged(i64) = .empty,
    allocator: std.mem.Allocator,
    out: Observer(i64),

    fn drain(self: *Zip) void {
        while (self.qa.items.len > 0 and self.qb.items.len > 0) {
            const x = self.qa.orderedRemove(0);
            const y = self.qb.orderedRemove(0);
            self.out.next(x + y); // combine(x, y) = x + y
        }
    }

    fn pushA(ctx: *anyopaque, value: i64) void {
        const self: *Zip = @ptrCast(@alignCast(ctx));
        self.qa.append(self.allocator, value) catch unreachable;
        self.drain();
    }

    fn pushB(ctx: *anyopaque, value: i64) void {
        const self: *Zip = @ptrCast(@alignCast(ctx));
        self.qb.append(self.allocator, value) catch unreachable;
        self.drain();
    }
};

fn emit(ctx: *anyopaque, value: i64) void {
    _ = ctx;
    std.debug.print("{d}\n", .{value});
}

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    const sink: u8 = 0;
    var sink_ctx = sink;
    var zip = Zip{
        .allocator = allocator,
        .out = .{ .ctx = @ptrCast(&sink_ctx), .nextFn = emit },
    };

    const inA = Observer(i64){ .ctx = @ptrCast(&zip), .nextFn = Zip.pushA };
    const inB = Observer(i64){ .ctx = @ptrCast(&zip), .nextFn = Zip.pushB };

    // a emits 1,2,3; b emits 10,20,30 (interleaved a,b,a,b,...).
    inA.next(1);
    inB.next(10);
    inA.next(2);
    inB.next(20);
    inA.next(3);
    inB.next(30);
}
