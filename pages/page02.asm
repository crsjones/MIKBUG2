*
* JUMP TABLE TO ROUTINES PERFORMING MIKBUG FCTN'S
*
FCTABL EQU    *
       FCC    /B/      "B" - PRINT ALL BREAKS
       FDB    PNTBRK
       FCC    /C/      "C" - CONTINUE
       FDB    CONT
       FCC    /D/      "D" - DELETE ALL BREAKS
       FDB    DELBRK
       FCC    /G/      "G" - GO TO ENTERED ADDRESS
       FDB    GOTO
       FCC    /L/      "L" - LOAD
       FDB    LOAD
       FCC    /M/      "M" - MEMORY CHANGE
       FDB    CHANGE
       FCC    /N/      "N" - NEXT (TRACE 1 INSTR)
       FDB    NEXT
       FCC    /P/      "P" - PUNCH
       FDB    PUNCH
       FCC    /R/      "R" - PRINT STACK
       FDB    PSTAK1
       FCC    /S/      "S" - CHANGE SPEED FOR TTY
       FDB    SPD
       FCC    /T/      "T" - TRACE N INSTRUCTIONS
       FDB    TRACE
       FCC    /U/      "U" - RESET A BREAKPOINT
       FDB    RSTBRK
       FCC    /E/      "E" - EXORTAPE CASSETT INTERFACE
       FDB    EXORT
       FCC    /V/      "V" - SET A BREAKPOINT
       FDB    SETBRK
FCTBEN EQU    *
