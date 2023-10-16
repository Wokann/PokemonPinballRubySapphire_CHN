.func RumbleStartOrNot
    ldr r0,=0x02019C00
    str r3,[r0,0]
    cmp r3, 2
    bne @@RumbleOff     ;RumbleOFF
    mov r0,1            ;RumbleON
    b @@DecideRumble

@@RumbleOff:
    mov r0,0

@@DecideRumble:
    push r3
    mov r3,lr
    bl RumbleSwitch     ;0x087E0340
    mov lr,r3
    pop r3

@@End:
    ldr r0,=(sub_080011F4 + 0x128)
    mov pc,r0
.pool
.endfunc
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF

/*
*0x02019C00 = r3;
if(r3 == 2)
    RumbleSwitch(1);//ON
else
    RumbleSwitch(0);//OFF
*/