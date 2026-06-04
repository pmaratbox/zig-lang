# 0140 — Tower of Hanoi

Count the moves needed to solve Tower of Hanoi for 3 disks recursively and print `7`. Zig expresses the recurrence `moves(n)=2*moves(n-1)+1` directly with a typed `u64`.

## Run

    zig run main.zig
