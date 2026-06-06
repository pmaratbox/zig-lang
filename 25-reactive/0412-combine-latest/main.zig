const std = @import("std");

/// A scheduled event in virtual time: (time, seq) ordering, with a callback.
const Event = struct {
    time: u64,
    seq: u64,
    value: i64,
    source: u8, // 0 = A, 1 = B
};

fn lessThan(_: void, a: Event, b: Event) bool {
    if (a.time != b.time) return a.time < b.time;
    return a.seq < b.seq;
}

pub fn main() void {
    // VIRTUAL CLOCK scheduler driven by a fixed array of events sorted by (time, seq).
    // A schedules (1->1),(3->2); B schedules (2->10).
    var events = [_]Event{
        .{ .time = 1, .seq = 0, .value = 1, .source = 0 },
        .{ .time = 3, .seq = 1, .value = 2, .source = 0 },
        .{ .time = 2, .seq = 2, .value = 10, .source = 1 },
    };
    std.mem.sort(Event, &events, {}, lessThan);

    // Keep the latest of each source (initially absent).
    var latest_a: ?i64 = null;
    var latest_b: ?i64 = null;

    // run(): pop smallest (time, seq), set clock, invoke.
    for (events) |e| {
        if (e.source == 0) {
            latest_a = e.value;
        } else {
            latest_b = e.value;
        }
        // combineLatest: emit only once BOTH have a latest.
        if (latest_a) |a| {
            if (latest_b) |b| {
                std.debug.print("({d}, {d})\n", .{ a, b });
            }
        }
    }
}
