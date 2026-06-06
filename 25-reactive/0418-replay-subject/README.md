# 0418 — ReplaySubject

Implement a ReplaySubject with a buffer of the last 2 values, replayed to a late subscriber, which then also receives new values. In Zig the subject holds a fixed `[2]i64` ring buffer plus an `ArrayListUnmanaged(Observer)` of function pointers.

## Run

    zig run main.zig
