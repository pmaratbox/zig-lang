# 0404 — Cold vs Hot Observable

Contrast a cold observable (re-runs its producer per subscriber) with a hot one (shares a single execution, so late subscribers miss earlier values). Zig models each observer as a small struct holding a pointer to its own `ArrayListUnmanaged(u8)`, and the hot producer keeps a shared slice of subscriber pointers it emits to.

## Run

    zig run main.zig
