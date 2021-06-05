# A fount of static extensions
Fount contains types and extensions I felt where missing from the standard library. Find them in `fount.core.*`, or import everything with `using fount.Core`.

Fount is the result of me tidying up my previous utility library, [Ingot](https://github.com/BJogart/ingot). There is---and for the time being, will be---little in the way of documentation; I don't have that kind of spare time at the time of writing. Feel free to shoot me a message if you're interested though.

Highlights, at time of writing, include:

### Data structures & interfaces to enforce good programming practices
`Eq` (deep equality), `Hash` (object hashing), `Ord` (object comparison), `Display` (user-facing output), and `Debug` (programmer-facing output). Each of these comes with a corresponding interface (IEq, IHash, IOrd, etc.) and a heap of static extensions. Implement `eq` (equality) on a type and you get `ne` (non-equality). Implement `cmp` and static extensions will fill in `lt` (<), `le` (<=), `gt` (>) and `ge` (>=) for free.

### Static extensions for the std
Includes extensions to simplify code dealing with the null-safe `haxe.ds.Option`, with methods like `expect`/`unwrap` (extracts the value, throws an exception if no value is present), shorthands for a lot of `Math.*`, and some conversion methods. Also includes some string methods, like `escape()` (escapes `\n`, `\r`, `\t` etc.), `repeat(n)`, and so on.

Special mention to the [Tinkerbell Core Library](https://haxetink.github.io/tink_core/#/), whose all-too-tempting Pair class gets automatic static extensions if the abovementioned interfaces are implemented on wrapped types.
