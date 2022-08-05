       CMPA   #'9
       BEQ    C1
       CMPA   #'1
       BNE    LOAD3    2ND CHAR NOT (1)
       CLR    CKSM     ZERO CHECKSUM
       JSR    BYTE     READ BYTE
       SUBA   #2
       STAA   BYTECT   BYTE COUNT
* BUILD ADDRESS
       JSR    BADDR
* STORE DATA
LOAD11 JSR    BYTE
       DEC    BYTECT
       BEQ    LOAD15   ZERO BYTE COUNT
       STAA   X        STORE DATA
       CMPA   0,X      CHECK DATA
       BNE    LOAD19   DATA NOT STORED
       INX
       BRA    LOAD11
*
* DOES CHECKSUM CHECK?
*
LOAD15 INCB
       BEQ    LOAD3
LOAD19 LDAA   #'?      PRINT QUESTION MARK
       BSR    OUTCH1
C1     JMP    CONTRL
*
* CHANGE MEMORY (M AAAA DD NN)
*
CHANGE JSR    BADDR    BUILD ADDRESS
       BSR    OUTS     OUTPUT SPACE
CHANG  LDX    XHI
       BSR    OUT2HS   PRINT DATA OLD
       DEX
CHA1   BSR    INCH1    INPUT CHAR
       CMPA   #$0A
       BEQ    LF       CHECK FOR LINE FEED
       CMPA   #$5E
       BEQ    UA       CHECK FOR ^
       JSR    INHEX2   S BSR BYTE
       JSR    BYTE2    GET NEW BYTE
       STAA   X        CHANGE MEMORY
       CMPA   X
       BNE    LOAD19   NO CHANGE
       BRA    CHA1
LF     INX             INC ADDR
       BRA    UA1
UA     LDAA   #$0A
       BSR    OUTCH1   OUTPUT LF
       DEX             DEC ADDR
UA1    STX    XHI      SAV DATA ADDR
       LDX    #MCL+1
       JSR    PDATA1   PRINT CR
       LDX    #XHI
       JSR    OUT4HS   OUTPUT DATA ADDR
       BRA    CHANG
*
