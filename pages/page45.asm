       BRA    DL3
DL2    SUBA   1,X      NO,SUB DIVISOR FROM MSB
       INCB            SET BIT IN RESULT
DL3    DEC    0,X      DONE?
       BNE    DLOOP    NO
       SEC             SHIFT A 1 IN LS BIT OF QUOTIENT
       ROLB            CASE THATS OKAY, CORRECT LATTER
       TSTA            IS REMAINDER NEGATIVE?
       BPL    DL4      NO,EVERYTHING'S OKAY
       DECB            RESET QUOTIENT LS BIT
       ADDA   1,X      ADD DIVISOR  TO GET + REMAINDER
       CLV             INSURE V IS CLEARED
DL4    INS             CLEAN UP THE STACK
       INS
       INS
       RTS             RETURN
*
DIVOVF INS             CLEAN UP STACK
       INS
DIVOV2 INT
       SEV             SET THE OVERFLOW FLAG
       RTS
*
* INTERRUPT VECTORS
*
       ORG    BASORG+$7F8
       FBD    IO
       FDB    SFEI
       FDB    POWDWN
       FDB    START
