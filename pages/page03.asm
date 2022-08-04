*
*      INITIALIZATION/RESET CODE
*
ADRSTR EQU    *
       FDB    STACK    INIT FOR "SP"
       FDB    SWI15    INIT FOR "SWI1"
       FDB    BRKINH   INIT FOR "SWI2"
*
       BRA    BRG      'BRA' INST IS REPLACED BY
       JMP    BRNOGO   COND BRA INST IN ROUT.
BRG    JMP    BRGO     WHICH DETERMINES IF
*                      BRA IS GO/NOGO
*
* BUILD ADDRESS
*
BADDR  BSR    BYTE     READ 2 FRAMES
       STAA   XHI
       BSR    BYTE
       STAA   XLOW
       LDX    XHI      (X) ADDRESS WE BUILT
       RTS

* INPUT BYTE (TWO FRAMES)
BYTE   BSR    INHEX    GET HEX CHAR
BYTE2  ASLA
       ASLA
       ASLA
       ASLA
       TAB
       BSR    INHEX
       ABA
       TAB
       ADDB   CKSM
       STAB   CKSM
       RTS

OUTHL  LSRA            OUT HEX LEFT BCD DIGIT
       LSRA
       LSRA
       LSRA


OUTHR  ANDA   #$F      OUT HEX RIGHT BCD DIGIT
       ADDA   #$30
       CMPA   #$39
       BLS    OUTCH
       ADDA   #$7

* OUTPUT ONE CHAR
OUTCH  JMP    OUTCH1
INCH   JMP    INCH1
* PRINT DATA POINTED AT BY X-REG
PDATA2 BSR    OUTCH
       INX
PDATA1 LDAA   0,X
       CMPA   #4
       BNE    PDATA2
       RTS             STOP ON EOT
*
* INPUT ADDRESS
*
GETADD BSR    PCRLF    PRINT  CR LF
       LDX    #MCL4
