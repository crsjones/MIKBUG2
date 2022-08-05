*
* CONSTANT DATA
*
MEOF   FCC    /S9030000FC/
       FCB    4
MCLOFF FCB    $13      READER OFF
MCL    FCB    $A,$D,$14,0,0,0,0,'*,4 LF,CR,PUNCH
MCL1   FCB    $D,$A,0,0,0,0,4 CR LF
MCL2   FCC    /MIKBUG 2.0/
       FCB    4
MCL3   FCC    /CC B  A   X    P    S/
