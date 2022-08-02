       BSR    PDATA1   ASK FOR BEGADDR
       BSR    BADDR    GET BEG ADDR
       STX    BEGA
       BSR    PCRLF    PRINT CR LF
       LDX    MCL5
       BSR    PDATA1   ASK FOR END ADDR
       BSR    BADDR    GET END ADDRESS
       STX    ENDA
       RTS             *
* PRINT CR LF
*
PCRLF  STX    XHI      SAVE XR
       LDX    #MCL1
       BSR    PDATA1   PRINT CRLF
       LDX    XHI
       RTS
*
INHEX  BSR    INCH
INHEX2 SUBA   #$30
       BMI    C1       NOT HEX
       CMPA   #$09
       BLE    IN1HG
       CMPA   #$11
       BMI    C1       NOT HEX
       CMPA   #$16
       BGT    C1       NOT HEX
       SUBA   #7
IN1HG  RTS
*
OUT2H  LDAA   0,X      OUTPUT 2 HEX CHAR
OUT2HA BSR    OUTHL    OUT LEFT HEX CHAR
       LDAA   0,X      PICK UP BYTE AGAIN
       INX
       BRA    OUTHR    OUTPUT RIGHT HEX CHAR AND RTS
OUT4HS BSR    OUT2H    OUTPUT 4 HEX CHAR + SPACE
OUT2HS BSR    OUT2H    OUTPUT 2 HEX CHAR + SPACE
OUTS   LDAA   #$20     SPACE
       BRA    OUTCH    ( BSR & RTS )
LOAD   EQU    *
       LDAAA  #$21
       BSR    OUTCH    OUTPUT CHAR
*
* TURN READER RELAY ON
*
       LDAA   ACIAT    GET ACIA CONTROL REG FORMAT
       ORAA   #$40     SET RTS TO TURN RDR RELAY ON
       STAA   ACIAS    TURN IT ON
*
       INC    OUTSW    DO NOT ECHO TAPE
*
LOAD3  BSR    INCH
       BRA    LOAD4
ENTER  JMP    ENT1     MIKBUG 1 ENTRY POINT
LOAD4  EQU    *
       CMPA   #'S
       BNE    LOAD3    1ST CHAR NOT ( S )
       BSR    INCH     READ CHAR
