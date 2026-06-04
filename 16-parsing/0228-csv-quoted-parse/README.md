# 0228 — Parse Quoted CSV

Parse the CSV row `a,"b,c",d`, respecting the quoted comma, into three fields joined by pipes `a|b,c|d`. A `switch` toggles an in-quotes flag so only unquoted commas become pipes idiomatically.

## Run

    zig run main.zig
