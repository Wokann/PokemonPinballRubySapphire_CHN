_RumblePrepare
push r0-r2
ldr r0,=0x02019C0C
ldrb r0, [r0,0]
cmp r0, #1
beq _end ;检测到gbp时，跳过烧录卡震动

_RumbleType1
ldr r0,=0x080000C8
movs r1, #1
strb r1, [r0,0]
ldr r0,=0x080000C6
movs r1, #8
strb r1, [r0,0]
b _RumbleType2 / b _end
.word 00 00
;used for skip type2 or not

_RumbleType2(for ezode & ez3in1)
ldr r1,=0xD200
ldr r2,=0x1500
ldr r0,=0x09FE0000
strh r1,[r0,0]
ldr r0,=0x08000000
strh r2,[r0,0]
ldr r0,=0x08020000
strh r1,[r0,0]
ldr r0,=0x08040000
strh r2,[r0,0]
ldr r0,=0x09E20000
ldr r1,#0xF1 ; 0xF1 ezode 0x1,0x3,0x7 ez3in1
strh r1,[r0,0]
ldr r0,=0x09FC0000
strh r2,[r0,0]

_end
pop r0-r2
bx lr
0x02019C0C 37c
0x080000C8
0x080000C6
0x0000D200
0x00001500
0x09FE0000
0x08000000
0x08020000
0x08040000
0x09E20000
0x000000F1;data
0x09FC0000
0x08001000


RumblePrepare
{
    if(*0x02019C0C != 1)
    {
        //type1
        *0x080000C8 = 1;
        *0x080000C6 = 8;

        //type2
        *(0x09FE0000) = 0xD200;
        *(0x08000000) = 0x1500;
        *(0x08020000) = 0xD200;
        *(0x08040000) = 0x1500;
        *(0x09E20000) = data;//data = 0xF1 in ezode rumble patch tutorial
        *(0x09FC0000) = 0x1500;
    }
}

RumbleStart
{
    //type1
    *0x080000C4 = 0x8; //GPIO_Data.bit3 = 1

    //type2
    *0x08001000 = 0x2;
}

RumbleEnd
{
    //type1
    *0x080000C4 = 0x0; //GPIO_Data.bit3 = 0

    //type2
    *0x08001000 = 0x0;
}