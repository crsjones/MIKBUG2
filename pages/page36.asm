*
*  CRC ENTERS A BIT INTO CRC REGISTERS R AND S
*     USES CRC POLYNOMIAL:  X16 + X15 + X2 + X0
*
*     ENTRY:  ACCA HOLDS NEW BIT
*     RAM:  R, S (PERM)
*     REGS:  ACCA, ACCB (SCRATCH)
*     EXIT:  ACCB = Q, Z = 1 IFF ESC
*
CRC1   RORA            LSB INTO CARRY
       RORA            CARRY INTO MSB
CRC2   ANDA   #$80     MASK MSB (DATA BIT)
       EORA   R        ENTER DATA BIT
       LDAB   S
       ASLB            SHIFT 16 BITS LEFT
       ROLA
       BCC    CRC3     IF B16 HIGH. . .
       EORA   #$80     ENTER CRC POLYNOMIAL
       EORB   #$05
CRC3   STAA   R
       STAB   S
       LDAB   Q
       JSR    TTYIN1   CHECK FOR ESCAPE
       ANDA   #$7F     MASK PARITY
       CMPA   #ESC
       RTS
TAIN1V JMP    TAIN1
