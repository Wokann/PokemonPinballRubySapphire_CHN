_RumbleEnd
push r0-r1
movs r0,0

_EndType1
ldr r1,=0x080000C4
strb r0, [r1,0]

_EndType2
ldr r1,=0x08001000
strb r0, [r1,0]

_end
pop r0-r1
bx lr
0x080000C4
0x08001000