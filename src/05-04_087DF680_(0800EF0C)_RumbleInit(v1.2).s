_RumbleInit
.org 0x0800EF0C
ldr r0,=0x087DF680
mov pc,r0
0x087DF680

RumbleForJump
.org 0x087DF680
movs r0,0
strb r0,[r3,0]
bl 0x087E0340  ;RumblePrepare
strb r0,[r3,7]
strb r0,[r5,0xD]

_end
ldr r0,=0x0800EF14
mov pc,r0
0x0800EF14
