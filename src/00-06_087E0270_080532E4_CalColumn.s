;copy from 0x080532E4
.func CalColumnCopy
    mov r3, 1
    cmp r1, 0
    beq @@a2Equ0
    bpl @@continue2
    neg r1, r1

@@continue2:
    push r4
    push r0

@@FirstCheck:
    cmp r0, 0
    bpl @@SecondCheck
    neg r0, r0
  
@@SecondCheck:
    cmp r0, r1
    blo @@resultLessThana2
    mov r4, 1
    lsl r4, r4, 0x1c

@@sub_87e028c:
    cmp r1, r4
    bhs @@sub_87e029a
    cmp r1, r0
    bhs @@sub_87e029a
    lsl r1, r1, 4
    lsl r3, r3, 4
    b @@sub_87e028c

@@sub_87e029a:
    lsl r4, r4, 3

@@sub_87e029c:
    cmp r1, r4
    bhs @@sub_87e02aa
    cmp r1, r0
    bhs @@sub_87e02aa
    lsl r1, r1, 1
    lsl r3, r3, 1
    b @@sub_87e029c

@@sub_87e02aa:
    mov r2, 0
    cmp r0, r1
    blo @@sub_87e02b2
    sub r0, r0, r1

@@sub_87e02b2:
    lsr r4, r1, 1
    cmp r0, r4
    blo @@sub_87e02c4
    sub r0, r0, r4
    mov r12, r3
    mov r4, 1
    ror r3, r4
    orr r2, r3
    mov r3, r12

@@sub_87e02c4:
    lsr r4, r1, 2
    cmp r0, r4
    blo @@sub_87e02d6
    sub r0, r0, r4
    mov r12, r3
    mov r4, 2
    ror r3, r4
    orr r2, r3
    mov r3, r12

@@sub_87e02d6:
    lsr r4, r1, 3
    cmp r0, r4
    blo @@sub_87e02e8
    sub r0, r0, r4
    mov r12, r3
    mov r4, 3
    ror r3, r4
    orr r2, r3
    mov r3, r12

@@sub_87e02e8:
    mov r12, r3
    cmp r0, 0
    beq @@sub_87e02f6
    lsr r3, r3, 4
    beq @@sub_87e02f6
    lsr r1, r1, 4
    b @@sub_87e02aa

@@sub_87e02f6:
    mov r4, 0xe
    lsl r4, r4, 0x1c
    and r2, r4
    beq @@resultLessThana2

    mov r3, r12
    mov r4, 3
    ror r3, r4
    tst r2, r3
    beq @@sub_87e030c
    lsr r4, r1, 3
    add r0, r0, r4

@@sub_87e030c:
    mov r3, r12
    mov r4, 2
    ror r3, r4
    tst r2, r3
    beq @@sub_87e031a
    lsr r4, r1, 2
    add r0, r0, r4

@@sub_87e031a:
    mov r3, r12
    mov r4, 1
    ror r3, r4
    tst r2, r3
    beq @@resultLessThana2
    lsr r4, r1, 1
    add r0, r0, r4

@@resultLessThana2:
    pop r4
    cmp r4, 0
    bpl @@EndCalColumn
    neg r0, r0

@@EndCalColumn:
    pop r4
    mov pc, lr

@@a2Equ0:
    push lr
    bl (CalColumnCopy - 4);应该为EndCalRowCopy，待更新修改
    mov r0, 0
    pop pc
    lsl r0, r0, 0
.endfunc


/*
unsigned int __fastcall sub_80532E4(unsigned int result, unsigned int a2)
{
  unsigned int v2; // r3
  int v3; // r2
  unsigned int v4; // r12
  unsigned int v5; // r2
  signed int v6; // [sp-8h] [bp-8h]

  v2 = 1;
  if ( a2 )
  {
    if ( (a2 & 0x80000000) != 0 )
      a2 = -a2;
    v6 = result;
    if ( (result & 0x80000000) != 0 )
      result = -result;
    if ( result >= a2 )
    {
      while ( a2 < 0x10000000 && a2 < result )
      {
        a2 *= 16;
        v2 *= 16;
      }
      while ( a2 < 0x80000000 && a2 < result )
      {
        a2 *= 2;
        v2 *= 2;
      }
      while ( 1 )
      {
        v3 = 0;
        if ( result >= a2 )
          result -= a2;
        if ( result >= a2 >> 1 )
        {
          result -= a2 >> 1;
          v3 = __ROR4__(v2, 1);
        }
        if ( result >= a2 >> 2 )
        {
          result -= a2 >> 2;
          v3 |= __ROR4__(v2, 2);
        }
        if ( result >= a2 >> 3 )
        {
          result -= a2 >> 3;
          v3 |= __ROR4__(v2, 3);
        }
        v4 = v2;
        if ( !result )
          break;
        v2 >>= 4;
        if ( !v2 )
          break;
        a2 >>= 4;
      }
      v5 = v3 & 0xE0000000;
      if ( v5 )
      {
        if ( (v5 & __ROR4__(v4, 3)) != 0 )
          result += a2 >> 3;
        if ( (v5 & __ROR4__(v4, 2)) != 0 )
          result += a2 >> 2;
        if ( (v5 & __ROR4__(v4, 1)) != 0 )
          result += a2 >> 1;
      }
    }
    if ( v6 < 0 )
      return -result;
  }
  else
  {
    nullsub_1(result);
    return 0;
  }
  return result;
}
*/