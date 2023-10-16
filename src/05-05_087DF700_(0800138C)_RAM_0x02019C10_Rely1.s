.func RumbleRelyFunction1
    ldr r1,=0x02019C0C
    ldrb r1,[r1,0]
    cmp r1, 1
    beq @@Store02019C10h    ;_GBPON
    mov r3, 4               ;_GBPOFF

@@Store02019C10h:
    strb r3,[r0,0]
    mov r5, 0
    str r5,[sp,0]
    ldr r1,=0x02002808

@@End:
    ldr r2,=(sub_08001338 + 0x5C);0x08001394
    mov pc,r2
.pool
.endfunc
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF

/*
if(*0x02019C0C != 1)
    r3 = 4;
*r0 = r3;//r0 = 0x2019C10 r3(origin)=0
r5 = 0;
*/