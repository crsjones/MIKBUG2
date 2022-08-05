TIN5   STX    TOTCNT
TIN8   LDX    #MSG2    SEND MODE QUESTION
TI2    BSR    PDATA    C=CHECK; L=LOAD
       JSR    INCH     D=DUMP; S= SPEED
       CMPA   #'S
       BEQ    TI2A
*
*
TIN6   STAA   T1       STORE MODE CHAR
       LDX    #MSG3    SEND FILE ID PROMPT
TI4    BSR    PDATA
       JSR    BADDR    GET FILE ID
       STX    FIDH
       JSR    PCRLF
       LDAA   T1
       CMPA   #'D      DUMP MODE?
       BNE    TIN7
       LDX    #MSG4    SEND START/STOP PROMPT
       BSR    PDATA1P
       JSR    BADDR
       STX    STARTP
       JSR    PCRLF
       JMP    MASTER
TIN7   CMPA   #'C      CHECK MODE?
       BEQ    CHECK
       CMPA   #'L      CHECK FOR LOAD
       BEQ    LOAD2
       JMP    ERR
*
* FALL INTO LOAD
