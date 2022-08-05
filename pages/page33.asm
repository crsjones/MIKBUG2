*
* DUMPR BRINGS IN A DUMPAGE RECORD
*
*     RAM:  H, L (SCRATCH)
*     REGS: ACCA, ACCB (SCRATCH); IX (PERM)
*     EXIT: FALLS INTO CRCK
*
DUMPR  BSR    LDV      GET PAGE NUMBER
       STAB   H        )
       CLR    L        ) LOAD IX!
       LDX    H        )
DUM1   BSR    LDV
       BEQ    G2       OUT IFF ESCAPE
       JSR    CL       CHECK, OR LOAD
       INX             STORAGE PTR
       INC    L        BYTE COUNT
       BNE    DUM1
       DEC    V        PAGE COUNT
* FALL INTO CRCK
*
* CRCK SHECKS THE CRC AND PRINT A CHAR
*
*     RAM:  Q, R, S, TOTCNT (FROM LOADBYTE)
*     REGS:  ACCA (SCRATCH, ACCB (FROM LOADBYTE)
*
CRCK   BSR    LDV      ) INPUT CRC CHARS
       BSR    LDV      )
       LDAA   R        CHECK CRC REGISTERS
       ORAA   S
       BNE    CRCK1
       LDAA   #'G      PRINT G FOR GOOD CRC
       BRA    CRCK2
CRCK1  LDAA   #'B      PRINT B FOR BAD CRC
CRCK2  JMP    TTY01    PRINT IT!
LDV    JMP    LOADBV   GET A TAPE BYTE IN ACCB
STARTV BRA    STARTF
