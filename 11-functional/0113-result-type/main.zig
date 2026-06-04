const std = @import("std");

const Result = union(enum) {
    ok: i32,
    err: []const u8,
};

fn safeDiv(a: i32, b: i32) Result {
    if (b == 0) return Result{ .err = "divide by zero" };
    return Result{ .ok = @divTrunc(a, b) };
}

fn report(r: Result) void {
    switch (r) {
        .ok => |v| std.debug.print("ok: {d}\n", .{v}),
        .err => |m| std.debug.print("err: {s}\n", .{m}),
    }
}

pub fn main() void {
    report(safeDiv(10, 2));
    report(safeDiv(1, 0));
}
