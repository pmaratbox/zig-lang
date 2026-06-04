const std = @import("std");

// Wrap the self-passing function in a struct so its type can refer to itself.
// The recursive call is supplied via `self`, so the generator never names itself.
const Recur = struct {
    call: *const fn (*const Recur, u64) u64,
};

fn factGen(self: *const Recur, n: u64) u64 {
    if (n == 0) return 1;
    return n * self.call(self, n - 1);
}

// fix: tie the knot by handing the generator a reference to itself.
fn fix(n: u64) u64 {
    const r = Recur{ .call = factGen };
    return r.call(&r, n);
}

pub fn main() void {
    std.debug.print("{d}\n", .{fix(5)});
}
