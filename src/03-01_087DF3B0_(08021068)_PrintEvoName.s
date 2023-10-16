.func PrintEvoNameChinese;0x087DF3B0
    mov r0,r12                    ;r0 = r12 = 0x02030440
    ldr r4,[r0]                   ;r4 = *0x02030440
    add r2,r4,r7                  ;r2 = *0x02030440 + 0x598
    ldrh r1,[r2]                  ;DexNum(r1) = *(*0x02030440 + 0x598)
    lsl r0,r1,1                   ;r0 = DexNum * 2
    add r0,r0,r1                  ;r0 = DexNum * 3
    lsl r0,r0,2                   ;r0 = DexNum * 12
    add r6,r0,r6                  ;textptr(r6) = Pokemonlist + DexNum * 12
    mov r1,0                      ;currenttext(r1) = 0

@@PrintLoop:
    lsl r0,r1,0x10
    lsr r3,r0,0x10                ;nowtextnum(r3) = currenttextnum
    ldrb r0,[r6]                  ;*textptr(u8)
    cmp r0,0xA0
    ble @@Print1
    ldrh r0,[r6]                  ;*textptr(u16)
    bl ConvertFont2Charmap16x16

@@Print1:
    .hword 0x4602 ;mov r2, r0     ;text(r2) = *textptr
    lsl r2,r2,0x10
    lsr r2,r2,0x10                ;text(r2) = *textptr
    lsl r0,r2,7                   ;text * 0x80
    ldr r1,=GfxOfJPCHSFont16x16   ;0x083E3844->Gfx_font_16px
    add r0,r0,r1                  ;text * 0x80 + Gfx_font_16px
    str r0,[r5]                   ;*0x040000D4 = (text * 0x80) + Gfx_font_16px;
    lsl r0,r3,7                   ;nowtextnum(r3) * 0x80
    ldr r1,=0x06015800
    add r0,r0,r1                  ;(nowtextnum * 0x80) + Ram_06015800
    str r0,[r5,4]                 ;0x040000D4[1] = (currenttextNum * 0x80) + Ram_06015800;
    ldr r0,=0x80000040
    str r0,[r5,8]                 ;0x040000D4[2] = Num_80000040;
    .hword 0x4610 ;mov r0,r2      ;r0 = text(r2)
    cmp r0,0x54
    beq @@Addspace
    cmp r0,0x53
    bne @@Print2

@@Addspace:
    ldr r0,=0x20E 
    add r1,r4,r0                  ;r1 = *0x02030440 + 0x20E
    ldrh r0,[r1]                  ;r0 =*(*0x02030440 + 0x20E)
    add r0,8                      ;r0 =*(*0x02030440 + 0x20E) +8
    strh r0,[r1]                  ;*(*0x02030440 + 0x20E) = *(*0x02030440 + 0x20E) +8

@@Print2:
    .hword 0x4610 ;mov r0,r2
    cmp r0,0x53
    ble @@Add
    add r6,1

@@Add:
    add r6,1

@@Exit:
    add r0,r3,1                   ;r0 = nowtextNum + 1
    lsl r0,r0,0x10
    lsr r1,r0,0x10                ;currenttext = nowtextNum + 1
    lsr r0,r0,0x10
    cmp r0,4
    ble @@PrintLoop

@@End:
    ldr r0,=(PrintEvoName + 0x88) ;0x080210F0
    mov pc,r0
.endfunc
.pool

/*
原函数
  v0 = Ram_02030440_0;
  *(_WORD *)(*Ram_02030440_0 + Num_20E) = 0;
  sub_801A9D0(9,0);
  *(_BYTE *)(*v0 + 0xE4) = 14;
  **(_WORD **)(*(_DWORD *)((char *)&unk_44 + Ram_0200B0C0_0) + 16) = 1;
  currenttextNum = 0;
  v2 = Ram_040000D4_2;
  v3 = v0;
  v4 = PokeNamelist;
  do
  {
    nowtextNum = currenttextNum;
    v6 = v3 = *Ram_02030440;
    v7 = (uint16 *)(*Ram_02030440 + 0x598); //DexNum
    *0x040000D4 = (*(uint8 *)(currenttextNum + 0xC * *v7 + PokeNamelist) * 0x80) + Gfx_font_16px;
    0x040000D4[1] = (currenttextNum * 0x80) + Ram_06015800;
    0x040000D4[2] = Num_80000040;
    if ( *(_BYTE *)(currenttextNum + 12 * *v7 + v4) == 0x53 )
      *(_WORD *)(*Ram_02030440 + Num_20E) += 8;
    ++currenttextNum;
  }
  while ( (__int16)(nowtextNum + 1) <= 4 );
_____________________________________
新函数
  v0 = Ram_02030440_0;
  *(_WORD *)(*Ram_02030440_0 + Num_20E) = 0;
  sub_801A9D0(9,0);
  *(_BYTE *)(*v0 + 0xE4) = 14;
  **(_WORD **)(*(_DWORD *)((char *)&unk_44 + Ram_0200B0C0_0) + 16) = 1;
  currenttextNum = 0;
  v2 = Ram_040000D4_2;
  v3 = v0;
  v4 = PokeNamelist;
  DexNumptr = (uint16 *)(*Ram_02030440(*v3) + 0x598); //DexNum
  textptr = *DexNumptr * 12 + PokeNamelist;
  do
  {
    nowtextNum = currenttextNum;
    v6 = v3 = *Ram_02030440;
    u32 text = (int8)*textptr;
    if(text > 0xA0)
    {
      text = (int16)*textptr;
      text = ConvertFont2Charmap_16x16(text);
    }
    *0x040000D4 = (text * 0x80) + Gfx_font_16px;
    0x040000D4[1] = (currenttextNum * 0x80) + Ram_06015800;
    0x040000D4[2] = Num_80000040;
    if ( text == 0x53 )
      *(_WORD *)(*Ram_02030440 + Num_20E) += 8;
    if(text > 0xA0)
        textptr++;
    textptr++;
    ++currenttextNum;
  } ( (__int16)(nowtextNum + 1) <= 4 );
*/