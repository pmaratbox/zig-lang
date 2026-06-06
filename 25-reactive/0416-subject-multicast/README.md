# 0416 — Subject Multicast

Implement a Subject that multicasts each emission to all current observers; two observers both receive 1 then 2. The Subject holds an `ArrayListUnmanaged(Observer)` and `next` iterates it in registration order, fanning out each value.

## Run

    zig run main.zig
