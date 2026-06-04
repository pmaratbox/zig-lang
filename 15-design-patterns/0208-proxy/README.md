# 0208 — Virtual Proxy

Use a lazy virtual proxy that loads the real subject only on first access, printing `loaded`. The proxy holds an optional that stays `null` until the first `request()` creates the real subject.

## Run

    zig run main.zig
