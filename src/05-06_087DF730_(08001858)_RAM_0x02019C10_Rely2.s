.func RumbleRelyFunction2
    mov r0, 5
    push r1
    ldr r1,=0x02019C0C
    ldrb r1,[r1,0]
    cmp r1, 1
    beq @@Store02019C10h    ;_GBPON
    mov r0, 4               ;_GBPOFF

@@Store02019C10h:
    pop r1
    strb r0, [r1,0]
    pop r4-r5
    pop r0
    bx r0
.pool
.endfunc
    .word 0xFFFFFFFF

/*
r0 = 5;
if(*0x2019C0C != 1)
    r0 = 4
pop r1;
*r1 = r0;//r1 = 0x2019C10
*/
