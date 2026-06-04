# 0109 — Run-Once Initialization

Ensure an initializer runs exactly once even when several threads race to trigger it, printing `init count: 1`. A tiny `Once` built on atomic `cmpxchgStrong` lets only the first caller run the init body while the rest spin until it is done.

## Run

    zig run main.zig
