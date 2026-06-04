# 0151 — Singleton

Obtain a singleton instance twice and confirm both references are the same object, printing `same: yes`. A `var` inside the struct namespace acts as lazily-initialized static state, and both `getInstance()` calls return a pointer to it.

## Run

    zig run main.zig
