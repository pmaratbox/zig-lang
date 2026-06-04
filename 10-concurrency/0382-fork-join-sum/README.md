# 0382 — Fork-Join Sum

Recursively fork the sum of [1..8] into halves and join the partial sums, printing `36`. Each recursive split forks a `std.Thread` for the left half and computes the right half inline, then joins to add the partial sums.

## Run

    zig run main.zig
