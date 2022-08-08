# MIKBUG version 2.0

A PDF file containing the listing of MIKBUG 2.0 can be found in a few
places on the internet.  There does not appear to be a source file
available.

In a moment of stupidity or bravery I suggested to the MOTOROLA 6809 /
6309, 6800 ASSEMBLY LANGUAGE PROGRAMMING group on Facebook that we could
share the work in converting this PDF into a source file so we could run
it again.

The source compiles (albeit with one syntactical change) using
[as0](https://github.com/JimInCA/motorola-6800-assembler).  The
change is replacing uses of `X` when used as an indirection
pointer with `0,X`.

* `mikbug20.pdf` is the original file.
* `mikbug20srconly.pdf` is the original file with only the listing of the code.
* `pages/*` are the transcriptions of the individual pages
* `mikbug2.asm` is the combined output of the transcription effort
* `mikbug2.lst` is the output listing from the assembler

### craigrsjones@gmail.com

Note for transcribers:

* Comment lines start with an asterisk - `*`
* Labels start in column 1
* Opcodes start in column 8
* Operands start in column 15
* In-line comments usually start in column 24

e.g.

```
000000000111111111122222222223333333333
123456789012345678901234567890123456789
|------|------|--------|---------------
SWI    EQU    $3F      SWI OP CODE
```
