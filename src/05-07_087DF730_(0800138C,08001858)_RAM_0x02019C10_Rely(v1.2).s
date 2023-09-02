_RelyFunction1
.org 0x0800138C
ldr r1,=0x087df730
mov pc,r1
0x087df730
back. 0x08001394

_RelyFunction1
.org 0x087df730
ldr r1,=0x02019C0C
ldrb r1,[r1,0]
cmp r1, #1
beq _Store2019c10 ;_GBPON
movs r3, #4       ;_GBPOFF

_Store2019c10
strb r3,[r0,0]
movs r5, #0
str r5,[sp,0]
ldr r1,=0x02002808

_end
ldr r2,=0x08001394
mov pc,r2
0x02019C0C
0x02002808
0x08001394

if(*0x02019C0C != 1)
    r3 = 4;
*r0 = r3;//r0 = 0x2019C10 r3(origin)=0
r5 = 0;

_RelyFunction2
.org 0x08001858
ldr r0,=0x087df760
mov pc,r0
0x087df760

_RelyFunction2
.org 0x087df760
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
