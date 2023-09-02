_RumbleEndJump1
.org 0x08001114
ldr r0,=0x087DF6E0
mov pc,r0
0x087DF6E0
back. 0x0800111C

_RumbleEndJump1
.org 0x087DF6E0
ldr r2,=0x02019BF4
movs r1, #0
ldr r0,=0x02019C00
str r1,[r0,0]
push r2
mov r2,lr
bl 0x087E03B0 ;RumbleEnd
mov lr,r2
pop r2

_end
ldr r0,=0x0800111C
movs pc,r0
0x02019BF4
0x02019C00
0x0800111C

_RumbleEndJump2
.org 0x080012F4
ldr r0,=0x087DF710
mov pc,r0
0x087DF710
back. 0x0800131C

_RumbleEndJump2
.org 0x087DF710
ldr r1,=0x02019C00
movs r0, #0
str r0,[r1,0]
push r2
mov r2,lr
bl 0x087E03B0 ;RumbleEnd
mov lr,r2
pop r2

_end
ldr r0,=0x0800131C
movs pc,r0
0x02019C00
0x0800131C