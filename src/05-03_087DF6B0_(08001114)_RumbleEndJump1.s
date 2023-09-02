_RumbleEndJump1
.org 0x08001114
ldr r0,=0x087DF6B0
mov pc,r0
0x087DF6B0
back. 0x0800111C

_RumbleEndJump1
.org 0x087DF6B0
ldr r2,=0x02019BF4
movs r1, #0
ldr r0,=0x02019C00
str r1,[r0,0]
push r2
mov r2,lr
mov r0,0
bl 0x087E0340 ;RumbleSwitch
mov lr,r2
pop r2

_end
ldr r0,=0x0800111C
movs pc,r0
0x02019BF4
0x02019C00
0x0800111C
