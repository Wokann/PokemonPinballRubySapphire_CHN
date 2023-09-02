RumbleJump
.org 0x080011A8
ldr r1,=0x087DF680
mov pc,r1
0x087DF680


RumbleForJump
.org 0x087DF680
mov r1,r0
ldr r0,=0x0200B134
add r0,#0xCD
ldrb r0,[r0]

push r2
mov r2,lr
bl 0x087E0340 ;RumbleForEZODE
mov lr,r2
pop r2
cmp r0,0
beq _exit

ldr r0,=0x02019BF8
str r1,[r0]
ldr r0,=0x02019BFC
mov r1,0
str r1,[r0]
ldr r0,=0x02019BE4
str r1,[r0]
ldr r0,=0x02019BE8
str r1,[r0]

_exit
bx lr

0x0200B134
0x02019BF8
0x02019BFC
0x02019BE4
0x02019BE8
0x0200294A