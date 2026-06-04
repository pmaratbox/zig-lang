# 0323 — Maybe Monad

Chain Maybe operations: Some(2) then +3 then *2 gives 10, and a None chain yields the fallback, printing `10 none`. A tagged union with a `bind` method threads the value through or short-circuits on `.none`.

## Run

    zig run main.zig
