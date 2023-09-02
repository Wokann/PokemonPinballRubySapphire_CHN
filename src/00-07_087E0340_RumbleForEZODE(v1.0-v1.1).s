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
