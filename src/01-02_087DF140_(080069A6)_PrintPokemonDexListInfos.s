.func PrintPokemonDexListInfosChinese
    mov r6,0              ;currentdexlist = 0
    ldr r0,=0x0202A170
    mov r10,r0

@@CycleList:
    add r0,r6,1
    mov r8,r0             ;dexlistadd = currentdexlist + 1;
    ldr r1,[sp,0xC]
    lsr r0,r1,0x10
    add r0,r6            ;vba不兼容add r0,r6指令,改为adds r0,r6
    lsl r0,r0,1
    add r0,r10
    mov r2,0
    ldrsh r0,[r0,r2]
    cmp r0,0   ;v6[(v17 >> 16) + currentdexlist] <= 0 
    ble @@Hyphen

@@Text:
    ldr r1,=0x0805A446
    mov r9,r1
    ldr r0,=0x0202B50C
    mov r1,0
    ldrsh r0,[r0,r1]
    add r0,r6            ;vba不兼容add r0,r6指令,改为adds r0,r6
    mov r1,0xBC
    mul r0,r1
    add r0,r9
    .hword 0x4604 ;mov r4,r0           ;188 * (*Ram_0202B50C[0] + currentdexlist) + PokemonDex_name
    mov r5,4           ;(textlength)
    mov r3,0

@@ListChineseCycle:
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
    lsr r0,r0,0x8
    cmp r0,r1
    ble @@JpFont
    add r2,4

@@JpFont:
    add r2,8
    add r3,r3,r2
    add r4,2
    sub r5,1
    bge @@ListChineseCycle
    b @@Print

@@Hyphen:
    mov r5,4
    mov r3,0

@@ListHyphenCycle:
    mov r0,0xF8
    mov r1,0xA2
    lsl r0,r0,8
    add r0,r0,r1
    .hword 0x4619 ;mov r1,r3
    bl FixTextGfx
    add r3,0xC
    sub r5,1
    bge @@ListHyphenCycle

@@Print:
    lsl r5,r6,1
    ldr r0,=0x0868C748
    add r6,r5,r0         
    mov r5,0x06
    lsl r5,r5,0x18        ;v13 = 0x6000000;
    mov r0,0
    ldrsh r1,[r6,r0]      ;v12 = &listNameinRamoff_0[currentdexlist];
    add r1,r1,r5          ;*v12 + v13
    ldr r0,=0x0203A000
    mov r2,8
    mov r3,2
    bl 0x087E0134
    ldr r0,=0x0806DB1C
    ldr r1,=0x0203A000
    mov r2,8
    mov r3,2
    bl 0x087E0134
    mov r6,r8
    cmp r6,4
    ble @@CycleList

@@End:
    ldr r0,=(PrintPokemonDexListInfos + 0x1AA);0x08006A4A
    mov pc,r0
.pool
.endfunc
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF
    .ascii "v1.2"

/*
PrintPokemonDexListInfos
{
  currentdexlist = 0;
  v6 = Ram_0202A170;
  do
  {
    dexlistadd = currentdexlist + 1;
    if ( v6[(v17 >> 16) + currentdexlist] <= 0 )
    {
      stringwidth = 0;
      for( textlength = 5; textlength >=0; --textlength)
      {
        Currenttext = 0xF8A2;//图鉴列表名-----
        FixTextGfx(Currenttext,stringwidth);
        stringwidth += 12;
      }
    }
    else
    {
      textptr = *(__int16 *)(188 * (*Ram_0202B50C[0] + currentdexlist) + PokemonDex_name);// 图鉴列表名
      stringwidth = 0;
      width = 0
      for( textlength(r5) = 5; textlength >=0; --textlength)
      {
        Currenttext = *textptr; 
        FixTextGfx(Currenttext,stringwidth);
        if(Currenttext > 0x3A00)
          width = 12;  //汉字12
        else
          width = 8;   //日文8
        stringwidth += width;
        ++textptr;
      }
    }
    v12 = &listNameinRamoff_0[currentdexlist];
    v13 = 0x6000000;
    Load2Ram(Ram_0203A000, *v12 + v13, 8, 2);
    load2Ram(0x0806DB1C, Ram_0203A000, 8, 2);
    currentdexlist = dexlistadd;
  }
  while ( dexlistadd <= 4 );
}
*/