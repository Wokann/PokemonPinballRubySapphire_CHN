_RumbleStartornot
.org 0x080012C8
ldr r0,=0x087DF680
mov pc,r0
0x087DF680
back. 0x0800131c

_RumbleStartornot
.org 0x087DF680
ldr r0,=0x02019C00
str r3,[r0,0]
cmp r3, #2
bne _RumbleOff  ;RumbleOFF
mov r0,1        ;RumbleON
b _DecideRumble

_RumbleOff
mov r0,0

_DecideRumble
push r3
mov r3,lr
bl 0x087E0340; _RumbleSwitch
mov lr,r3
pop r3

_end
ldr r0,=0x0800131C
mov pc,r0
0x02019C00
0x0800131C


*0x02019C00 = r3;
if(r3 == 2)
    RumbleSwitch(1);//ON
else
    RumbleSwitch(0);//OFF
