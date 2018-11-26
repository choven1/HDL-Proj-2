T0: EORS    R2,R2,R2
    BNE     T0
    AND     R3,R2,#0
    ORR     R4,R3,#0x30
T1: ADD     R2,R2,R4
    ADDS    R2,R2,R2
    EORCS   R2,R2,R2
    SUB     R4,R4,#1
    CMPPL   R4,#0
    BNE     T1
    STR     R2,[R3]
    LDR     R5,[R3]
T2: BAL     T2
