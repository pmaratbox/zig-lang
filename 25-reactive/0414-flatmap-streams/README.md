# 0414 — FlatMap (mergeMap)

Implement flatMap/mergeMap: map each outer value to an inner timed stream and merge all inners concurrently (no cancellation). In Zig we model virtual time with a sorted `ArrayListUnmanaged(Event)` keyed by (time, seq) so all inner streams interleave deterministically.

## Run

    zig run main.zig 2>&1
