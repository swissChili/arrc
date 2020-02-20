    \., # .section .data
    \s, \e, \c, \t, \i, \o, \n, \ , \., \d, \a, \t, \a, \
,

# First, iterate from a-z and print out a the assembly to reserve a quad
# for that variable
    \a A # assign 'a' to variable A
    0 N # N: is number?
:A
    a \z 1 + ? # compare A to 'z' + 1
    =B # go to b if theyre equal

    ~ # drop 'z'
    , # print the char
    # print ': .quad 0\n'
    \:, \	, \., \q, \u, \a, \d, \ , \0, \
,

    a1+A # incremenet A

    @A # back to the start!
:B
    # Print out the prelude
    \
, \., # .section .text
    \s, \e, \c, \t, \i, \o, \n, \ , \., \t, \e, \x, \t,

    \
,

    \., # .global main
    \g, \l, \o, \b, \a, \l, \ , \m, \a, \i, \n,

    \
,

    \m, # main:
    \a, \i, \n, \:,

    \
,


# Main event loop: read a char from stdin, compare it to a bunch of
# things and print the appropriate assembly.
:C
    .A # a stores the current char

    @W =0 # is it a number? go to 0, else 2
    @2

:0
    n 1 ? =1
    \	, \p, \u, \s, \h, \ , \$,
:1
    a, \
, 1 N # is number
    @C

:2
    n 1 ? =3
    @4

:3
    0 N
    \
,
:4
    # Each comparison will look like this:
    a \. ? =D # jump to C if a == '.'
    a \, ? =E # a == ','
    a \& ? =H
    a \# ? =I
    a \@ ? =J
    a \: ? =K
    a \; ? =L
    a \\ ? =M
    a \= ? =O
    a \~ ? =P
    a \+ ? =Q
    a \? ? =R
    a \- ? =S
    a \  ? =C # Match whitespace (loop)
    a \
    ? =C
    a \	? =C
    @X =F # a in 'a'..'z'
    a \A \a - - A @X =G # a in 'A'..'Z'

    @Z # jump to the end if nothing matches (no error handling lol)

:D  # .
    \	, # call getchar // .
    \c, \a, \l, \l, \ , \g, \e, \t, \c, \h, \a, \r, \	, \/, \/, \ , \.,

    \
,

    \	, \p, \u, \s, \h, \ , \%, \r, \a, \x,

    \
,

    # can't just return from the function, have to jump back
    @C

:E  # ,

    \	, \p, \o, \p, \ , \%, \r, \d, \i, \
,

    \	, \c, \a, \l, \l, \ , \p, \u, \t, \c, \h, \a, \r, \	, \/, \/, \ , \,,

    \
,

    @C

:F  # This is a lowercase letter
    \	, \p, \u, \s, \h, \ , \(, a, \), \
, @C

:G
    \	, \p, \o, \p, \ , \(, a, \), \
, @C

:H
    \	, # push (%rsp)
    \p, \u, \s, \h, \ , \(, \%, \r, \s, \p, \), \
, @C

:I
    a \
    ? =C # if it's a newline, go back to C
    .A @I # otherwise read another char

:J
    \	, \c, \a, \l, \l, \ , \_, ., \
, @C

:K
    \_, ., \:, @C

:L
    \	, \r, \e, \t, \
, @C

:M
    .A # get the next char
    \	, \p, \u, \s, \h, \ , \$, \', # '
    a \' ? =N #' # If it's a single quote or \, escape it.
    a \\ ? =N
    a, \', #'
    \
, @C
:N
    \\, a, \', #'
    \
, @C

:O
    \	, \j, \e, \ , \_, ., \
, @C

:P
    \	, \a, \d, \d, \ , \$, \8, \,, \ , \%, \r, \s, \p, \
, @C

:Q
    \	, \p, \o, \p, \ , \%, \r, \a, \x, \
,

    \	, \p, \o, \p, \ , \%, \r, \b, \x, \
,

    \	, \a, \d, \d, \ , \%, \r, \b, \x, \,, \ , \%, \r, \a, \x, \
,

    \	, \p, \u, \s, \h, \ , \%, \r, \a, \x, \
, @C

:R
    \	, \m, \o, \v, \ , \8, \(, \%, \r, \s, \p, \), \,, \ , \%, \r, \a, \x, \
,

    \	, \c, \m, \p, \q, \ , \(, \%, \r, \s, \p, \), \,, \ , \%, \r, \a, \x, \
, @C

:S
\	, \p, \o, \p, \ , \%, \r, \a, \x, \
,

    \	, \p, \o, \p, \ , \%, \r, \b, \x, \
,

    \	, \s, \u, \b, \ , \%, \r, \a, \x, \,, \ , \%, \r, \b, \x, \
,

    \	, \p, \u, \s, \h, \ , \%, \r, \b, \x, \
, @C
:W  # is this a number?
    Z # Return address
    a \0 ? =Y
    a \1 ? =Y
    a \2 ? =Y
    a \3 ? =Y
    a \4 ? =Y
    a \5 ? =Y
    a \6 ? =Y
    a \7 ? =Y
    a \8 ? =Y
    a \9 ? =Y
    @Y
:X  # is this a lowercase letter?
    Z # return address
    a \a ? =Y
    a \b ? =Y
    a \c ? =Y
    a \d ? =Y
    a \e ? =Y
    a \f ? =Y
    a \g ? =Y
    a \h ? =Y
    a \i ? =Y
    a \j ? =Y
    a \k ? =Y
    a \l ? =Y
    a \m ? =Y
    a \n ? =Y
    a \o ? =Y
    a \p ? =Y
    a \q ? =Y
    a \r ? =Y
    a \s ? =Y
    a \t ? =Y
    a \u ? =Y
    a \v ? =Y
    a \w ? =Y
    a \x ? =Y
    a \y ? =Y
    a \z ? =Y
:Y  # If they are equal, return, the carry bit will be set
    z;

:Z
    \	, \m, \o, \v, \ , \$, \0, \,, \ , \%, \r, \d, \i, \
, \	, \c, \a, \l, \l, \ , \e, \x, \i, \t, \
,
