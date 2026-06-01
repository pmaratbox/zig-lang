const std = @import("std");

const Squares = struct {
    n: u32 = 0,

    fn next(self: *Squares) u32 {
        self.n += 1;
        return self.n * self.n;
    }
};

pub fn main() void {
    var squares = Squares{};
    const a = squares.next();
    const b = squares.next();
    const c = squares.next();
    std.debug.print("{d} {d} {d}\n", .{ a, b, c });
}
