;copy from 0x0805324C0
.func CalRowCopy
    cmp r1, 0
    beq @@a2Equ0

@@Continue:
    push r4
    mov r4, r0
    eor r4, r1
    mov r12, r4
    mov r3, 1
    mov r2, 0

@@FirstCheck:
    cmp r1, 0
    bpl @@SecondCheck
    neg r1, r1

@@SecondCheck:
    cmp r0, 0
    bpl @@Compare_a1a2
    neg r0, r0

@@Compare_a1a2:
    cmp r0, r1
    blo @@a1LessThana2

@@a1LargerEqualThana2:
@@ThirdCheck:
    mov r4, 1
    lsl r4, r4, 0x1c
    
@@FirstLoop:
    cmp r1, r4
    bhs @@FourthCheck
    cmp r1, r0
    bhs @@FourthCheck
    lsl r1, r1, 4
    lsl r3, r3, 4
    b @@FirstLoop

@@FourthCheck:
    lsl r4, r4, 3

@@SecondLoop:
    cmp r1, r4
    bhs @@ThirdLoop
    cmp r1, r0
    bhs @@ThirdLoop
    lsl r1, r1, 1
    lsl r3, r3, 1
    b @@SecondLoop

@@ThirdLoop:
@@FifthCheck:
    cmp r0, r1
    blo @@SixthCheck
    sub r0, r0, r1
    orr r2, r3

@@SixthCheck:
    lsr r4, r1, 1
    cmp r0, r4
    blo @@SeventhCheck
    sub r0, r0, r4
    lsr r4, r3, 1
    orr r2, r4

@@SeventhCheck:
    lsr r4, r1, 2
    cmp r0, r4
    blo @@EighthCheck
    sub r0, r0, r4
    lsr r4, r3, 2
    orr r2, r4

@@EighthCheck:
    lsr r4, r1, 3
    cmp r0, r4
    blo @@NinthCheck
    sub r0, r0, r4
    lsr r4, r3, 3
    orr r2, r4

@@NinthCheck:
    cmp r0, 0
    beq @@a1LessThana2
    lsr r3, r3, 4
    beq @@a1LessThana2
    lsr r1, r1, 4
    b @@ThirdLoop

@@a1LessThana2:
    mov r0, r2
    mov r4, r12
    cmp r4, 0
    bpl @@Returnv4
    neg r0, r0

@@Returnv4:
    pop {r4}
    mov pc, lr

@@a2Equ0:
    push lr
    bl EndCalRowCopy
    mov r0, 0
    pop pc
    lsl r0, r0, 0

EndCalRowCopy:
    mov pc, lr
    .byte 0,0
.endfunc
    .word 0xffffffff
    .word 0xffffffff

/*
int __fastcall sub_805324C(unsigned int a1, unsigned int a2)
{
  signed int v2; // r12
  unsigned int v3; // r3
  int v4; // r2
  int result; // r0

  if ( a2 )
  {
    v2 = a1 ^ a2;
    v3 = 1;
    v4 = 0;
    if ( (a2 & 0x80000000) != 0 )
      a2 = -a2;
    if ( (a1 & 0x80000000) != 0 )
      a1 = -a1;
    if ( a1 >= a2 )
    {
      while ( a2 < 0x10000000 && a2 < a1 )
      {
        a2 *= 16;
        v3 *= 16;
      }
      while ( a2 < 0x80000000 && a2 < a1 )
      {
        a2 *= 2;
        v3 *= 2;
      }
      while ( 1 )
      {
        if ( a1 >= a2 )
        {
          a1 -= a2;
          v4 |= v3;
        }
        if ( a1 >= a2 >> 1 )
        {
          a1 -= a2 >> 1;
          v4 |= v3 >> 1;
        }
        if ( a1 >= a2 >> 2 )
        {
          a1 -= a2 >> 2;
          v4 |= v3 >> 2;
        }
        if ( a1 >= a2 >> 3 )
        {
          a1 -= a2 >> 3;
          v4 |= v3 >> 3;
        }
        if ( !a1 )
          break;
        v3 >>= 4;
        if ( !v3 )
          break;
        a2 >>= 4;
      }
    }
    result = v4;
    if ( v2 < 0 )
      return -v4;
  }
  else
  {
    nullsub_1(a1);
    return 0;
  }
  return result;
}
*/