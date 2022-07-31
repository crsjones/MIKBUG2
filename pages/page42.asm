*
******* COPYRIGHT (C0 1977 MOTOROLA INC - AUSTIN TEXAS
*
*
*********************
*
* UNSIGNED MULTIPLY -----
*
*   THIS ROUTINE MULTIPLIES THE UNSIGNED NUMBER IN THE
*   A REGISTER WITH THE UNSIGNED NUMBER IN THE B
*   REGISTER AND PUTS THE ANSWERS IN THE CONCATENATED
*   A:B WHERE A IS THE MSB. THE ROUTINE IS
*   RE-ENTRANT AND POSITION INDEPENDENT AS WELL
*   AS BEING ROMABLE. THE X REGISTER IS DESTROYED
*   BY THE ROUTINE.
*
*   DURING EXECUTION THE STACK CONTAINS:
*   0,X  =  LOOP COUNTER
*   1,X  =  MULTIPLIER (B REG ON ENTRY)
*
*   THE ALGORITHM USED MAY NOT APPEAR THE FASTEST
*   ON PAPER BECAUSE IT ALWAYS REQUIRES 8 PASSES
*   THE THE LOOP BUT BECAUSE OF THE FACT ALL
*   CALCULATIONS CAN BE DONE IN THE REGISTERS IT
*   IS FASTER EXCEPT FOR WHEN THE MULTIPLICAND
*   IS VERY SMALL (<10). THE METHOD IS A SHIFT AND
*   ADD TECHNIQUE THAT BEGINGS WITH THE MS BIT
*   AND WORKS DOWN TO THE LS BIT.
*
*   EXECUTION TIME: (29 + ZEROES*19 + ONES*26) CYCLES
*     WHERE ZEROES AND ONES ARE THE 0'S AND 1'S IN
*     THE A-REG ON CALL.
*
*     AVERAGE EXECUTION TIME: 209 CYCLES
*
*********************
*
MUL    PSHB            PUT MULTIPLIER ON THE STACK
       LDAB   #8       PUT COUNTER ON STACK
       PSHB
       TSX             SET X TO POINT TO STACK
       CLRB            CLEAR PLACE TO START ANSWER
ML1    ASLB            SHIFT ANS 1 LEFT AND INTO A
       ROLA            SHIFT WHATS LEFT OF THE MULTIPLIER
       BCC    ML2      BRANCH IF NO ADD NEEDED
       ADCA   #0       ADD CARRY TO A IF ANY
ML2    DEC    0,X      DONE?
       BNE    ML1      NOPE
       INS             YES,CLEAN UP THE STACK
       INS
       RTS
