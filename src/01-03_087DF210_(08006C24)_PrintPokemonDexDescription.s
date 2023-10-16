.func PrintPokemonDexDescriptionChinese
    .hword 0x4617 ;mov r7,r2
    add r7,1        ;nextGroupIndex = groupIndex + 1;
    lsl r1,r2,1        ;r1 = groupIndex * 2
    add r1,r1,r2        ;r1 = groupIndex * 3
    lsl r1,r1,4        ;r1 = groupIndex * 48
    lsl r0,r2,0XB      ;r0 = groupIndex * 2048
    ldr r2,=0x06005C00   ;
    add r6,r0,r2        ;dataPointer = (char *)Ram_06005C00 + groupIndex * 2048;
    mov r0,0xBC        ;r0 = 0xBC
    mov r2,r8           ;r2 = DexNum
    mul r2,r0           ;r2 = 188 * DexNum
    .hword 0x4610 ;mov r0,r2           ;r0 = r2
    add r0,r9           ;r0 = 188 * DexNum + baseAddress;
    add r4,r1,r0        ;textptr = (48 * groupIndex + 188 * DexNum + baseAddress);
    mov r5,0x18        ;textlength = 24
    mov r3,0

@@DexDesLineLoop:
    mov r1,0
    ldrsh r0,[r4,r1]
    lsl r0,r0,0x10
    lsr r0,r0,0x10
    .hword 0x4619 ;mov r1,r3
    bl FixTextGfx
    mov r1,0x3A
    mov r2,0
    ldrsh r0,[r4,r2]
    lsl r0,r0,0x10
    lsr r0,r0,0x10
    lsr r0,r0,8
    cmp r0,r1
    ble @@JpFont
    add r2,4

@@JpFont:
    add r2,8
    add r3,r3,r2
    cmp r3,0xC0
    bge @@Print
    add r4,2
    sub r5,1
    cmp r5,0
    bge @@DexDesLineLoop

@@Print:
    ldr r0,=0x0203A000
    .hword 0x4631 ;mov r1,r6
    mov r2,0x18
    mov r3,2
    bl Load2RamCopy
    ldr r0,=0x0806DB1C
    ldr r1,=0x0203A000
    mov r2,0x18
    mov r3,2
    bl Load2RamCopy

@@End:
    ldr r0,=(PrintPokemonDexDescription + 0x4C);0x08006C5C
    mov pc,r0
.pool
.endfunc
    .word 0xFFFFFFFF


/*
PrintPokemonDexDescription
{
  groupIndex = 0;
  baseAddress = PokemonDex_Description;
  DexNum = inputData;
  do
  {
    nextGroupIndex = groupIndex + 1;
    dataPointer = (char *)Ram_06005C00 + 2048 * groupIndex;
    textptr = (__int16 *)(48 * groupIndex + 188 * DexNum + baseAddress);
    stringwidth = 0;
    for( textlength = 24; textlength >=0; --textlength)
    {
      Currenttext = *textptr; 
      FixTextGfx(Currenttext,stringwidth);
      if(Currenttext > 0x3A00)
        width = 12;  //汉字12
      else
        width = 8;   //日文8
      stringwidth += width;
      if(stringwidth >= 0xC0)
        break;
      ++textptr;
    }
    Load2Ram(Ram_0203A000, dataPointer, 24, 2);
    load2Ram(0x0806DB1C, Ram_0203A000, 24, 2);
    groupIndex = nextGroupIndex;
  }
  while ( nextGroupIndex <= 2 );
}
*/