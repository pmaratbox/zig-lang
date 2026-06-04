const std = @import("std");

const Parser = struct {
    src: []const u8,
    pos: usize = 0,

    fn factor(self: *Parser) i64 {
        const c = self.src[self.pos];
        self.pos += 1;
        return @as(i64, c - '0');
    }

    fn term(self: *Parser) i64 {
        var v = self.factor();
        while (self.pos < self.src.len and self.src[self.pos] == '*') {
            self.pos += 1;
            v *= self.factor();
        }
        return v;
    }

    fn expr(self: *Parser) i64 {
        var v = self.term();
        while (self.pos < self.src.len and self.src[self.pos] == '+') {
            self.pos += 1;
            v += self.term();
        }
        return v;
    }
};

pub fn main() void {
    var p = Parser{ .src = "2+3*4" };
    std.debug.print("{d}\n", .{p.expr()});
}
