*
* OP CODE TO NUMBER OF BYTES CONVERSION TABLE
*
*           # BYTES  TOP 4 BITS OF OPCODE
*           -------  --------------------
*
OPBTTB EQU    *
       FCB    1        0
       FCB    1        1
       FCB    2+%10000000 2 ( MINUS=> BRANCHES )
       FCB    1        3
       FCB    1        4
       FCB    1        5
       FCB    2        6
       FCB    3        7
       FCB    0        8 # BYTES=2 EXCEPT 8C,8E
       FCB    2        9
       FCB    2        A
       FCB    3        B
       FCB    0        C # BYTES = 2 EXCEPT CE
       FCB    2        D
       FCB    2        E
       FCB    3        F
