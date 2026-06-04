const std = @import("std");

const Account = struct {
    balance: i64,

    fn deposit(self: *Account, amount: i64) void {
        self.balance += amount;
    }

    fn getBalance(self: Account) i64 {
        return self.balance;
    }
};

pub fn main() void {
    var account = Account{ .balance = 100 };
    account.deposit(50);
    std.debug.print("{d}\n", .{account.getBalance()});
}
