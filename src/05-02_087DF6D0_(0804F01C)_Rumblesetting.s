Rumblesetting
.org 0x0804F2B8
ldr r0,=0x087DF6C0
mov pc,r0
0x087DF6C0
.org 0x0804F2C4
mov r0,0xB
bl 0x080011A8

Rumblesetting
.org 0x087DF6C0
add r1,r2,0//
add r1,0x2B//
mov r0,0//
strb r0,[r1]//
adds r1,1
strb r0,[r1]
add r0,r2,0
add r0,0x2A
strb r4,[r0]


ldr r0,=0x0804F2C4
mov pc,r0
0x0804F2C4