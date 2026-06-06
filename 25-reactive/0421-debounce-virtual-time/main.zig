const std = @import("std");

const Task = struct {
    time: u64,
    seq: u64,
    cancelled: bool,
    ctx: *anyopaque,
    cb: *const fn (ctx: *anyopaque) void,
};

const Scheduler = struct {
    tasks: std.ArrayListUnmanaged(Task) = .empty,
    next_seq: u64 = 0,
    now: u64 = 0,
    alloc: std.mem.Allocator,

    fn init(alloc: std.mem.Allocator) Scheduler {
        return .{ .alloc = alloc };
    }

    fn schedule(self: *Scheduler, time: u64, ctx: *anyopaque, cb: *const fn (ctx: *anyopaque) void) u64 {
        const seq = self.next_seq;
        self.next_seq += 1;
        self.tasks.append(self.alloc, .{
            .time = time,
            .seq = seq,
            .cancelled = false,
            .ctx = ctx,
            .cb = cb,
        }) catch unreachable;
        return seq;
    }

    fn cancel(self: *Scheduler, seq: u64) void {
        for (self.tasks.items) |*t| {
            if (t.seq == seq) t.cancelled = true;
        }
    }

    fn run(self: *Scheduler) void {
        while (true) {
            var best: ?usize = null;
            for (self.tasks.items, 0..) |t, i| {
                if (t.cancelled) continue;
                if (best) |b| {
                    const bt = self.tasks.items[b];
                    if (t.time < bt.time or (t.time == bt.time and t.seq < bt.seq)) best = i;
                } else best = i;
            }
            const idx = best orelse break;
            const task = self.tasks.items[idx];
            self.tasks.items[idx].cancelled = true;
            self.now = task.time;
            task.cb(task.ctx);
        }
    }
};

const Debouncer = struct {
    sched: *Scheduler,
    window: u64,
    pending_seq: ?u64 = null,
    pending_value: []const u8 = "",

    fn fire(ctx: *anyopaque) void {
        const self: *Debouncer = @ptrCast(@alignCast(ctx));
        std.debug.print("{s}\n", .{self.pending_value});
        self.pending_seq = null;
    }

    fn onValue(self: *Debouncer, value: []const u8) void {
        if (self.pending_seq) |s| self.sched.cancel(s);
        self.pending_value = value;
        self.pending_seq = self.sched.schedule(self.sched.now + self.window, self, fire);
    }
};

const Event = struct { time: u64, value: []const u8 };

const SourceCtx = struct {
    deb: *Debouncer,
    value: []const u8,
};

fn emit(ctx: *anyopaque) void {
    const sc: *SourceCtx = @ptrCast(@alignCast(ctx));
    sc.deb.onValue(sc.value);
}

pub fn main() void {
    const alloc = std.heap.page_allocator;

    var sched = Scheduler.init(alloc);
    var deb = Debouncer{ .sched = &sched, .window = 30 };

    const events = [_]Event{
        .{ .time = 10, .value = "a" },
        .{ .time = 20, .value = "b" },
        .{ .time = 100, .value = "c" },
    };

    var ctxs: [events.len]SourceCtx = undefined;
    for (events, 0..) |ev, i| {
        ctxs[i] = .{ .deb = &deb, .value = ev.value };
        _ = sched.schedule(ev.time, &ctxs[i], emit);
    }

    sched.run();
}
