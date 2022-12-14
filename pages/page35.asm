*
* LOADBYTE RECOVERS OF DATA IN Q AND ACCB, AND DOES CRC
*
*     RAM:  Q, R, S, TOTCNT (PERM)
*     REGS:  ACCA, ACCB (SCRATCH ONLY)
*     EXIT:  FALLS INTO LOADBIT, WHICH
*            FALLS INTO CRC
*
LOADBY LDAB   #$02     SET STOP
       STAB   Q
LOAD1  BSR    LOADB1
       BEQ    G2       OUT IFF ESCAPE
       ASL    Q        STOP INTO CARRY?
       BCC    LOAD1    BRANCH IF NO
* FALL INTO LOADBIT FOR LAST BIT
*
* LOADBIT RECOVERS ONE BIT OF DATA IN Q AND ACCB,
*     AND DOES CRC IN R AND S
*
*     RAM:  Q, R, S, TOTCNT (PERM)
*     REGS:  ACCA, ACCB (SCRATCH ONLY)
*     EXIT:  BRANCHES OR FALLS INTO CRC ROUTINE
*            DATA BIT GOES INTO Q LSB
*
LOADB1 CLRB
LOADB6 DECB
       BEQ    LOADB5
       BSR    TAIN1V   GET TAPE DATA IN CARRY
       BCS    LOADB6   WAIT FOR LOW
LOADB2 DECB
       BEQ    LOADB5
       BSR    TAIN1V   WAIT FOR HIGH
       BCC    LOADB2   )  (FRONT OF SYNC EL)
       LDAB   TOTCNT   3.5 ELS DELAY
LOADB3 DECB
       BEQ    LOADB5
       BSR    TAIN1V   )  WAIT FOR LOW
       BCS    LOADB3   )  (END OF SYNC EL)
LOADB4 DECB
       BEQ    LOADB5   DONE YET?
       BSR    TAIN1V
       BCC    LOADB4
       INC    Q        STORE A '1' BIT
LOADB5 LDAA   Q        GET DATA FOR CRC
* FALL INTO CRC1
