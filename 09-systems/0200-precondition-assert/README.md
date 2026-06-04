# 0200 — Precondition Assert

Check a precondition arg>0: for 5 print `ok`, and for -1 report the failure `error: must be positive`, on two lines. The precondition is encoded as an error union and handled with `catch` rather than a panic.

## Run

    zig run main.zig
