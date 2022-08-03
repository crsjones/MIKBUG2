*     PUNCH FRAME COUNT
       LDX    #MCONT
       BSR    PUNT2    PUNCH 2 HEX CHAR
*     PUNCH ADDRESS
       LDX    #TW
       BSR    PUNT2
       BSR    PUNT2
*     PUNCH DATA
       LDX    TW
PUN32  BSR    PUNT2    PUNCH ONE BYTE ( 2 FRAMES )
       DEC    TEMP     DEC BYTE COUNT
       BNE    PUN32
       STX    TW
       COMB
       PSHB
       TSX
       BSR    PUNT2    PUNCH CHECKSUM
       PULB            RESTORE STACK
       LDX    TW
       DEX
       CPX    ENDA
       BNE    PUN11
       JSR    PCRLF
       LDX    #MEOF
       JSR    PDATA1   OUTPUT EOF
       BRA    CTRL     BRANCH TO CONTRL

*     PUNCH 2 HEX CHAR, UPDATE CHECKSUM
PUNT2  ADDB   0,X      UPDATE CHECKSUM
       JMP    OUT2H    OUTPUT TWO HEX CHARS AND RTS
