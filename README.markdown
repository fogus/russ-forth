# Russforth

Russforth is a teeny-tiny Forth implementation in Ruby.

It currently supports the following:

 - Shuffling words: `drop`, `dup`, `swap`, `rot`, `over`, `qdup`
 - Mathematical words: `+`, `-`, `*`, `/`, `min`, `max`
 - Stack words: `.`
 - I/O words: `emit`, `cr`, `.S` 
 - Comments: Skip lines via `\`
 
In addition, Russforth allows user defined words via the `:` operator:

    : sq dup * ;
    2 sq
    .
    \ prints 4

Things that I would like to add:

 - User-defined immediate words
 - Return stack
 - `( ... )` style comments
 - A standard lib
 - A more robust interactive prompt
 - Navigable lexicon 
 - Richer types

More to come.

## References and inspirations

 - *Starting Forth* by Leo Brodie
 - *Thinking Forth* by Leo Brodie
 - *Object-oriented Forth* by Dick Pountain
 - *Scientific Forth* by Noble

## License

Copyright 2012-2015 Mike Fogus and Russ Olsen.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

See the [LICENSE](LICENSE.md) file for further details.

