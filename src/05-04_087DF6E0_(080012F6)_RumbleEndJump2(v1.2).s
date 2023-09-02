_RumbleEndJump2
.org 0x080012F4
ldr r0,=0x087DF6E0
mov pc,r0
0x087DF6E0
back. 0x0800131C

_RumbleEndJump2
.org 0x087DF6E0
ldr r1,=0x02019C00
movs r0, #0
str r0,[r1,0]
push r2
mov r2,lr
bl 0x087E0340 ;RumbleSwitch
mov lr,r2
pop r2

_end
ldr r0,=0x0800131C
movs pc,r0
0x02019C00
0x0800131C