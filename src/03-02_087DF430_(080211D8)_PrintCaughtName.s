.func PrintCaughtNameChinese
    mov r0,r8             ;r0 = r8 = 0x02030440
    ldr r3,[r0]           ;r3 = *0x02030440
    mov r4,r12            ;r4 = r12 = 0x598
    add r1,r3,r4          ;r1 =r3+r4 =*0x02030440+0x598
    ldrh r7,[r1]          ;DexNumptr=*(*0x02030440+0x598)
    lsl r0,r7,1           ;r0 = DexNumptr*2
    .hword 0x463C ;mov r4,r7   ;r4 = DexNumptr
    add r0,r0,r4          ;r0 = DexNumptr*3
    lsl r0,r0,2           ;r0 = DexNumptr*12
    add r9,r0             ;textptr = DexNumptr *12 + PokeNameList

@@NameLoop:
    lsl r0,r2,0x10        ;r0 = r2 <<16
    lsr r2,r0,0x10        ;r2 = (r2<<16) >>16
    mov r3,r9
    ldrb r0,[r3]          ;text = *textptr(u8)
    cmp r0,0xA0
    ble @@Print1
    ldrh r0,[r3]          ;text = *textptr(u16)
    bl ConvertFont2Charmap16x16

@@Print1:
    .hword 0x4603 ;mov r3,r0
    lsl r3,r3,0x10
    lsr r3,r3,0x10        ;text = *textptr
    lsl r0,r3,7           ;r0 = text * 0x80
    ldr r6,=GfxOfJPCHSFont16x16;0x083E3844;Gfx_font_16px
    add r0,r0,r6          ;r0 = text * 0x80 + Gfx_font_16px
    str r0,[r5]           ;*0x040000D4 = r0
    lsl r0,r2,7
    ldr r4,=0x06015800
    add r0,r0,r4
    str r0,[r5,4]         ;0x040000D4[1] = Currenttext * 0x80 + 0x6015800
    ldr r0,=0x80000040
    str r0,[r5,8]         ;0x040000D4[2] = 0x80000040
    ldr r0,[r5,8]
    .hword 0x4618 ;mov r0,r3
    cmp r0,0x54
    beq @@Addspace
    cmp r0,0x53
    bne @@Print2

@@Addspace:
    ldr r0,=0x20E 
    mov r1,r8
    ldr r4,[r1]         ;r4 = *0x02030440
    add r1,r4,r0        ;r1 = *0x02030440 + 0x20E
    ldrh r0,[r1]        ;r0 =*(*0x02030440 + 0x20E)
    add r0,8            ;r0 =*(*0x02030440 + 0x20E) +8
    strh r0,[r1]        ;*(*0x02030440 + 0x20E) = *(*0x02030440 + 0x20E) +8

@@Print2:
    .hword 0x4618 ;mov r0,r3
    mov r1,r9
    cmp r0,0x53
    ble @@Add
    add r1,1

@@Add:
    add r1,1
    mov r9,r1

@@Exit:
    add r0,r2,1
    lsl r0,r0,0x10
    lsr r2,r0,0x10
    lsr r0,r0,0x10
    cmp r0,4
    ble @@NameLoop

    ldr r0,=0x0200B0C0
    ldr r0,[r0,0x44]
    ldr r1,[r0,0x14]
    mov r0,1
    strh r0,[r1]
    mov r2,5
    ldr r3,=0x040000D4
    ldr r7,=TextOfCaught
    .hword 0x4635 ;mov r5,r6

;@@CaughtLoop:  旧循环地址，可以改回来也可不改回来
    lsl r6,r2,0x10
    lsr r6,r6,0x10

@@CaughtLoop:
    lsl r0,r6,1
    add r0,r0,r7
    mov r2,0
    ldrsh r0,[r0,r2]
    lsl r0,r0,0x10
    lsr r0,r0,0x10
    cmp r0,0xA0
    ble @@Print3
    bl ConvertFont2Charmap16x16
    .hword 0x4600 ;mov r0,r0

@@Print3:
    lsl r0,r0,7
    add r0,r0,r5
    str r0,[r3]
    lsl r0,r6,7
    ldr r4,=0x06015800
    .hword 0x4600 ;mov r0,r0
    add r0,r0,r4
    str r0,[r3,4]
    ldr r0,=0x80000040
    str r0,[r3,8]
    ldr r0,[r3,8]
    add r6,1
    lsl r6,r6,0x10
    lsr r2,r6,0x10
    lsr r6,r6,0x10
    cmp r6,8
    ble @@CaughtLoop

@@End:
    ldr r0,=(PrintCaughtName + 0xE8);0x080212C0
    mov pc,r0
.pool
.endfunc
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF
/*
原函数
  v0 = Ram_02030440_1;
  v1 = *Ram_02030440_1;
  *(_WORD *)(*Ram_02030440_1 + Num_20E_0) = 0;
  *(_BYTE *)(v1 + Num_6DB) = 0;
  *(_WORD *)(*v0 + 0x210) = 0;
  *(_BYTE *)(*v0 + 0xE4) = 13;
  **(_WORD **)(*(_DWORD *)((char *)&unk_44 + (_DWORD)Ram_0200B0C0_1) + 0x10) = 1;
  v2 = 0;
  v3 = Ram_040000D4_3;
  v4 = v0;
  v5 = PokeNamelist_0;
  do
  {
    v6 = *v4;
    v7 = (unsigned __int16 *)(*v4 + 0x598);
    v8 = Gfx_font_16px_0;
    *v3 = (int)Gfx_font_16px_0 + 0x80 * *(unsigned __int8 *)(v2 + 0xC * *v7 + v5);
    v9 = (char *)Ram_06015800_0;
    *(_DWORD *)&byte_4[(_DWORD)v3] = (char *)Ram_06015800_0 + 128 * v2;
    *(_DWORD *)&byte_8[(_DWORD)v3] = Num_80000040_0;
    if ( *(_BYTE *)(v2 + 12 * *v7 + v5) == 0x53 )
      *(_WORD *)(v6 + Num_20E_0) += 8;
    v10 = ++v2 << 16;
  }
  while ( v10 >> 16 <= 4 );
  **(_WORD **)(*(_DWORD *)((char *)&unk_44 + (_DWORD)Ram_0200B0C0_1) + 20) = 1;
  v11 = 5;
  v12 = Ram_040000D4_3;
  v13 = (__int16 *)Add_8693238;
  do
  {
    *v12 = (int)v8 + 0x80 * v13[v11];
    *(_DWORD *)&byte_4[(_DWORD)v12] = &v9[0x80 * v11];
    *(_DWORD *)&byte_8[(_DWORD)v12] = Num_80000040_0;
    v14 = ++v11 << 16;
  }
  while ( v14 >> 16 <= 8 );
  LOWORD(v15) = 0;
  v16 = Ram_02030440_1;
  v17 = Num_0x212;
  do
  {
    v18 = *v16;
    v19 = (__int16)v15;
    v20 = (_WORD *)(*v16 + v17 + 2 * (__int16)v15);
    v21 = 4 * (__int16)v15;
    *v20 = v21;
    *(_WORD *)(v18 + v21 + 0x228) = 0;
    v22 = (v19 + 1) << 16;
    v15 = HIWORD(v22);
  }
  while ( v22 >> 16 <= 4 );
  LOWORD(v23) = 0;
  v24 = Ram_02030440_1;
  v25 = Num_0x212;
  do
  {
    v26 = *v24;
    v27 = (__int16)v23;
    v28 = (__int16)v23 + 5;
    v29 = (_WORD *)(*v24 + v25 + 2 * v28);
    v28 *= 4;
    *v29 = v28;
    *(_WORD *)(v26 + v28 + 0x228) = 0;
    v30 = (v27 + 1) << 16;
    v23 = HIWORD(v30);
  }
  while ( v30 >> 16 <= 3 );
}


_________________________________________
新函数
  v0 = Ram_02030440_1;
  v1 = *Ram_02030440_1;
  *(_WORD *)(*Ram_02030440_1 + Num_20E_0) = 0;
  *(_BYTE *)(v1 + Num_6DB) = 0;
  *(_WORD *)(*v0 + 0x210) = 0;
  *(_BYTE *)(*v0 + 0xE4) = 13;
  **(_WORD **)(*(_DWORD *)((char *)&unk_44 + (_DWORD)Ram_0200B0C0_1) + 0x10) = 1;
  currenttextNum = 0;
  v3 = Ram_040000D4_3;
  v4 = v0 = Ram_02030440_1;
  v5 = PokeNamelist_0;
  DexNumptr = (unsigned __int16 *)(*v4 + 0x598);
  textptr = *DexNumptr * 12 + PokeNamelist;
  do
  {
    v6 = *v4 = *02030440;
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
    v10 = currenttextNum << 0x10;
    v10 >>= v10;
  }
  while ( v10 <= 4 );
  **(_WORD **)(*(_DWORD *)((char *)&unk_44 + (_DWORD)Ram_0200B0C0_1) + 20) = 1;
  v11 = 5;
  v12 = Ram_040000D4_3;
  v13 = (__int16 *)Add_8693238;
  do
  {
    *v12 = (int)v8 + 0x80 * v13[v11];
    *(_DWORD *)&byte_4[(_DWORD)v12] = &v9[0x80 * v11];
    *(_DWORD *)&byte_8[(_DWORD)v12] = Num_80000040_0;
    v14 = ++v11 << 16;
  }
  while ( v14 >> 16 <= 8 );
*/