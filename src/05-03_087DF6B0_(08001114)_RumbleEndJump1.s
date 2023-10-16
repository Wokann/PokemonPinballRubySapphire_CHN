.func RumbleEndJump1
    ldr r2,=0x02019BF4
    mov r1, 0
    ldr r0,=0x02019C00
    str r1,[r0,0]
    push r2
    mov r2,lr
    mov r0,0
    bl RumbleSwitch
    mov lr,r2
    pop r2

@@End:
    ldr r0,=(sub_08001114 + 0x8);0x0800111C
    mov pc,r0
.pool
.endfunc
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF
