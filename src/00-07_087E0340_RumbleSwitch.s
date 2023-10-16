.func RumbleSwitch
@@RumblePrepare:
    push r1-r3
    ldr r1,=0x02019C0C
    ldrb r1, [r1,0]
    cmp r1, 1
    beq @@End                   ;检测到gbp时，跳过烧录卡震动
    b @@RumbleType1
.pool

@@RumbleType1:                  ;GPIO Rumble
    ldr r1,=0x080000C8
    mov r2, 1
    strb r2, [r1,0]
    ldr r1,=0x080000C6
    mov r2, 8
    strb r2, [r1,0]
    ldr r1,=0x080000C4

@@Type1GPIOOnOff:
    lsl r2,r0,3                 ;GPIO Rumble: 0(0)-OFF, 1(8)-ON
    strb r2, [r1,0]
    b @@RumbleType2
.pool

@@RumbleType2:                  ;(for ezode & ez3in1)
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

@@Type2EZ3in1OnOff:
    cmp r0,1
    beq @@Type2EZ3in1on

@@Type2EZ3in1Off:
    mov r2,0x08                 ;EZ3in1 Rumble: 0(8)-OFF
    b @@ContinueType2Set

@@Type2EZ3in1On:
    ldr r2,=0x07                ;EZ3in1 Rumble: 1(1/3/7)-ON     ;EZODE Rumble: data=0xF1

@@ContinueType2Set:
    strh r2,[r1,0]
    ldr r1,=0x09FC0000
    strh r3,[r1,0]

@@Type2EZODEOnOff:
    ldr r1,=0x08001000
    lsl r2,r0,1                 ;EZODE Rumble: 0(0)-OFF, 1(2)-ON
    strb r2, [r1,0]
    b @@End
.pool

@@End:
    pop r1-r3
    bx lr
.endfunc



/*
void RumbleSwitch(bool IfIsRumble)
{
    if(*0x02019C0C != 1)
    {
        //TYPE1(GPIO)
        *0x080000C8 = 1;
        *0x080000C6 = 8;
        *0x080000C4 = IfIsRumble * 8;   //GPIO rumble ON(8)/OFF(0) (ezode,IG)

        //TYPE2(EZ)
        *0x09FE0000 = 0xD200;
        *0x08000000 = 0x1500;
        *0x08020000 = 0xD200;
        *0x08040000 = 0x1500;
        if(IfIsRumble == TRUE)
            data = 0x7;                 //ez3in1 rumble ON (data = 7)
        else
            data = 0x8;                 //ez3in1 rumble OFF (data = 8)
        *0x09E20000 = data;             //ez3in1 rumble OFF (data = 8)
        *0x09FC0000 = 0x1500;

        *0x08001000 = IfIsRumble * 2;  //ezode rumble ON(2)/OFF(0)
    }
}
*/