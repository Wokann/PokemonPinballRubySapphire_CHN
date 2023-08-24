push r1-r5

_CheckIfRumbleOn
ldr r1,=0x0200294A
ldrb r1,[r1,#0]
cmp r1,#1
bne _End

_RumblePrepare
ldr r1,=0xD200
ldr r2,=0x1500
ldr r3,=0x09FE0000
strh r1,[r3]
ldr r3,=0x08000000
strh r2,[r3]
ldr r3,=0x08020000
strh r1,[r3]
ldr r3,=0x08040000
strh r2,[r3]
ldr r3,=0x09E20000
mov r1,#0xF1
strh r1,[r3]
ldr r3,=0x09FC0000
strh r2,[r3]
LDR	R4,=0x08001000

_StartRumble
mov	r5,#2
strb r5,[r4]	
nop
nop
nop
nop

_EndRumble
mov	r5,#0
strb r5,[r4]

_End
pop r1-r5
bx lr
0x0000D200
0x00001500
0x09FE0000
0x08000000
0x08020000
0x08040000
0x09E20000
0x09FC0000
0x08001000
0x0200294A


0xEB0 的bool函数返回用于存入0x02019C0C的值给0xFE0。(应该是用于检测GBPlayer的函数)
可在
0xFC6 00 20 mov r0,#0
改为
0xFC6 01 20 mov r0,#1
强制开启

0xFE0 的函数控制0x02019C0C的值,用于自己及其他函数判定震动选项禁用或显示。

0x02019C0C 震动选项禁用/显示 0-banned 1-can be selected
0x0200294A 震动开/关        0-off 1-on
0x0200294E 火稚鸡图标震动       0-normal 1-rumble
0x02019C00 震动类型?        0-norumble 1-may rumble? 2-rumble