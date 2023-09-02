_RelyFunction2
.org 0x08001858
ldr r0,=0x087df730
mov pc,r0
0x087df730

_RelyFunction2
.org 0x087df730
movs r0, #5
push {r1}
ldr r1,=0x02019C0C
ldrb r1,[r1,0]
cmp r1, #1
beq _Store2019c10 ;_GBPON
movs r0, #4       ;_GBPOFF

_Store2019c10
pop {r1}
strb r0, [r1,0]
pop r4-r5
pop r0
bx r0
0x02019C0C

r0 = 5;
if(*0x2019C0C != 1)
    r0 = 4
pop r1;
*r1 = r0;//r1 = 0x2019C10
