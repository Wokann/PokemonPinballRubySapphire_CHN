;copy from 0x0800EAAC
.func Load2RamCopy
    push r4-r5, lr
    sub sp, 8
    str r0, [sp]
    str r1, [sp, 4]
    lsl r2, r2, 0x10
    lsr r0, r2, 0x10
    mov r4, 0
    lsl r3, r3, 0x10
    asr r1, r3, 0x10
    cmp r4, r1
    bge @@End

@@StartLoad:
    ldr r2, =0x040000D4
    lsl r0, r0, 0x10
    asr r3, r0, 0xc
    mov r0, 0x80
    lsl r0, r0, 0x18
    orr r3, r0
    mov r5, r1

@@RamLoadLoop:
    lsl r1, r4, 0xa
    ldr r0, [sp]
    add r0, r0, r1
    str r0, [r2]
    ldr r0, [sp, 4]
    add r0, r0, r1
    str r0, [r2, 4]  ;0x040000D8
    str r3, [r2, 8]  ;0x040000DC
    ldr r0, [r2, 8]
    add r4, 1
    cmp r4, r5
    blt @@RamLoadLoop

@@End:
    add sp, 8
    pop r4-r5
    pop r0
    bx r0
.pool
.endfunc
    .word 0xffffffff
/*
u32 Load2Ram(int Gfx_font, int RamStore, uint16_t Widthblock, int16_t Heightblock)
{
  int widthcount; // r0
  int heightcount; // r4
  int *Ramload; // r2
  int v9; // [sp+10h] [bp-4h]

  widthcount = Widthblock;
  heightcount = 0;
  if ( Heightblock > 0 )
  {
    Ramload = (int*)0x040000D4;
    do
    {
      *Ramload = Gfx_font + (heightcount << 10);// hightcount * 0x400
      Ramload[1] = RamStore + (heightcount << 10);// hightcount * 0x400
      Ramload[2] = (widthcount << 16 >> 12) | 0x80000000;
      ++heightcount;
    }
    while ( heightcount < Heightblock );
  }
  return v9;
}
*/