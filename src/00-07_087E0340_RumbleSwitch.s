_RumblePrepare
push r1-r3
ldr r1,=0x02019C0C
ldrb r1, [r1,0]
cmp r1, #1
beq _end ;检测到gbp时，跳过烧录卡震动
b _RumbleType1
0x02019C0C

_RumbleType1
ldr r1,=0x080000C8
movs r2, #1
strb r2, [r1,0]
ldr r1,=0x080000C6
movs r2, #8
strb r2, [r1,0]
ldr r1,=0x080000C4
lsl r2,r0,3         ;0(0)-OFF, 1(8)-ON
strb r2, [r1,0]
b _RumbleType2
0x080000C8
0x080000C6
0x080000C4

_RumbleType2(for ezode & ez3in1)
ldr r2,=0xD200
ldr r3,=0x1500
ldr r1,=0x09FE0000
strh r2,[r1,0]
ldr r1,=0x08000000
strh r3,[r1,0]
ldr r1,=0x08020000
strh r2,[r1,0]
ldr r1,=0x08040000
strh r3,[r1,0]
ldr r1,=0x09E20000
cmp r0,1
beq _rumblestart
mov r2,#0x08        ;8-Off-ez3in1
b _switch

_rumblestart
ldr r2,#0x07        ;data: 0xF1-ezode,0x1,0x3,0x7-ez3in1

_switchez3in1
strh r2,[r1,0]
ldr r1,=0x09FC0000
strh r3,[r1,0]

_ezode
ldr r1,=0x08001000
lsl r2,r0,1        ;0(0)-OFF, 1(2)-ON
strb r2, [r1,0]
b _end
0x0000D200
0x00001500
0x09FE0000
0x08000000
0x08020000
0x08040000
0x09E20000
0x00000007;data
0x09FC0000
0x08001000

_end
pop r1-r3
bx lr
 37c




void RumbleSwitch(bool IfIsRumble)
{
    if(*0x02019C0C != 1)
    {
        //TYPE1
        *0x080000C8 = 1;
        *0x080000C6 = 8;
        *0x080000C4 = IfIsRumble * 8;  //GPIO rumble ON(8)/OFF(0) (ezode,IG)

        //TYPE2
        *0x09FE0000 = 0xD200;
        *0x08000000 = 0x1500;
        *0x08020000 = 0xD200;
        *0x08040000 = 0x1500;
        if(IfIsRumble == TRUE)
            data = 0x7;  //ez3in1 rumble ON (data = 7)
        else
            data = 0x8;  //ez3in1 rumble OFF (data = 8)
        *0x09E20000 = data;  //ez3in1 rumble OFF (data = 8)
        *0x09FC0000 = 0x1500;

        *0x08001000 = IfIsRumble * 2;  //ezode rumble ON(2)/OFF(0)
    }
}
