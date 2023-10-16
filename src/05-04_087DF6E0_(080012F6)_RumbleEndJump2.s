.func RumbleEndJump2
    ldr r1,=0x02019C00
    mov r0, 0
    str r0,[r1,0]
    push r2
    mov r2,lr
    bl RumbleSwitch
    mov lr,r2
    pop r2

@@End:
    ldr r0,=(sub_080011F4 + 0x128)
    mov pc,r0
.pool
.endfunc
