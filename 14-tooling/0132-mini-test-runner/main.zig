const std = @import("std");

fn testAddition() bool {
    return 1 + 1 == 2;
}

fn testMultiplication() bool {
    return 2 * 3 == 6;
}

fn testSubtraction() bool {
    return 10 - 4 == 6;
}

pub fn main() void {
    const tests = [_]*const fn () bool{
        testAddition,
        testMultiplication,
        testSubtraction,
    };

    var passed: usize = 0;
    var failed: usize = 0;
    for (tests) |t| {
        if (t()) {
            passed += 1;
        } else {
            failed += 1;
        }
    }

    std.debug.print("{d} passed, {d} failed\n", .{ passed, failed });
}
