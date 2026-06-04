const std = @import("std");

const Inner = struct { b: i32 };
const Outer = struct { a: Inner };

// Lens over outer.a.b
const BLens = struct {
    fn get(o: Outer) i32 {
        return o.a.b;
    }
    fn set(o: Outer, v: i32) Outer {
        var copy = o;
        copy.a.b = v;
        return copy;
    }
};

pub fn main() void {
    const original = Outer{ .a = Inner{ .b = 1 } };
    const got = BLens.get(original);
    const updated = BLens.set(original, 2);
    std.debug.print("{d} {d}\n", .{ got, BLens.get(updated) });
}
