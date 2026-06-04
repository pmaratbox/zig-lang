const std = @import("std");

const Step = union(enum) {
    more: struct { n: u32, acc: u32 },
    done: u32,
};

fn sumStep(n: u32, acc: u32) Step {
    if (n == 0) return .{ .done = acc };
    return .{ .more = .{ .n = n - 1, .acc = acc + n } };
}

fn trampoline(start: Step) u32 {
    var step = start;
    while (true) {
        switch (step) {
            .done => |v| return v,
            .more => |m| step = sumStep(m.n, m.acc),
        }
    }
}

pub fn main() void {
    const result = trampoline(sumStep(100, 0));
    std.debug.print("{d}\n", .{result});
}
