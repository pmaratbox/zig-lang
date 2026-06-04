# 0196 — Error Wrapping

Wrap an inner error "inner" inside an outer context and print the combined message `outer: inner`. Zig error sets carry no payload, so wrapping is done by formatting an outer context string around the inner message.

## Run

    zig run main.zig
