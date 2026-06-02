# 0033 — Custom Error Types

Define a custom error, raise it from a `check` that rejects values over `100`, catch it for the input `200`, and print `error: value too large`. Errors are values from an *error set* (`error{TooLarge}`); a function returning `CheckError!void` may return `error.TooLarge`, and the caller handles it with `catch`. Error tags carry no payload, so the message is supplied where the error is handled.

## Run

    zig run main.zig
