# ArrC

This is a self-hosting compiler for Arr--a tiny, turing complete
programming language. The original compiler written in C is less
than 100 lines long. The bootstrap version is much longer, but
functions the same as the C version. This compiler was an attempt
to see how small I could make a self hosted compiler.

## Building

Use the makefile. You need clang installed. The python script is
used to generate the weird string syntax needed by Arr.

## Example

```rb
. # . pops from the front of the input array
, # , writes the last thing to the front of the output array

.A # a capital letter stores the last thing in that variable
a # a lowercase letter gets the value from that variable

:B # makes a label called B

@D # @ calls D

\A # \ makes a literal char
? # = compares the top two things on the stack
=F # jumps to F if the comparison is true

123 # numbers are literals
A # store 123 in a
2 1 - # == 1

:D # d label
; # ; returns

2 & + # & duplicates the top item on the stack

\A \B \C \D 1 ! , # prints C
# !:
# let n = the top item on the stack
# duplicate the n-th value on the stack (starting at 0)
# and put it on the top of the stack
```
