_RumbleStartornot
.org 0x080012C8
ldr r0,=0x087DF6A0
mov pc,r0
0x087DF6A0
back. 0x0800131c

_RumbleStartornot
.org 0x087DF6A0
ldr r0,=0x02019C00
str r3,[r0,0]
push r0-r3
ldr r0,=0x02019C0C
ldrb r0,[r0,0]
cmp r0, #1
beq _end
cmp r3, #2
bne _NotStartRumble
movs r1, #8    ;StartRumbleType1
movs r2, #2    ;StartRumbleType2
b _DecideRumble

_NotStartRumble
movs r1, #0
movs r2, #0

_DecideRumble
ldr r0,=0x080000C4 ;Type1
strb r1,[r0,0]
ldr r0,=0x08001000 ;Type2
strb r2,[r0,0]

_end
pop r0-r3
ldr r0,=0x0800131C
mov pc,r0
0x02019C00 6cc
0x02019C0C 
0x080000C4
0x08001000
0x0800131C


*0x02019C00 = r3;
if(*0x02019C0C != 1)
{
    if(r3 == 2)
        *0x080000C4 = 8;
    else
        *0x080000C4 = 0;
}
