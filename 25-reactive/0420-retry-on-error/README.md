# 0420 — Retry On Error

Implement retry(n) that resubscribes to the source on error up to n times; the source succeeds on the 3rd subscription. In Zig, observers are plain structs of function pointers and resubscription is just re-invoking the source's subscribe callback.

## Run

    zig run main.zig
