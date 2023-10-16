.func PrintEvoGfxandNameCaseEChinese
    mov r2,0
    ldr r0,=GfxOfJPCHSFont16x16 ;0x0878e000
    mov r12,r0
    ldr r6,=GfxOfEvoArray ;0x084DC6A4
    ldr r3,=0x040000D4
    ldr r0,=0x02030440
    ldr r0,[r0]
    mov r1,0xB3
    lsl r1,r1,3
    add r4,r0,r1
    ldr r5,=TextOfCaughtPokemonChinese  ;0x087EEF00
    ldrh r2,[r4]
    lsl r0,r2,1
    add r0,r0,r2
    lsl r0,r0,2
    add r0,r1,R0;
    add r5,r5,r0;textptr = PokeNameList + DexNum * 12 
    mov r2,0

@@CaseENameLoop:
    lsl r1,r2,0x10
    lsr r1,r1,0x10
    ldrb r0,[r5]
    cmp r0,0xA0
    ble @@CaseEPrint
    ldrh r0,[r5]
    bl ConvertFont2Charmap16x16

@@CaseEPrint:
    .hword 0x4604 ;mov r4,r0
    lsl r4,r4,0x10
    lsr r4,r4,0x10
    lsl r0,r4,7
    add r0,r12
    str r0,[r3]
    lsl r0,r1,7
    ldr r2,=0x06015800
    add r0,r0,r2
    str r0,[r3,4]
    ldr r0,=0x80000040
    str r0,[r3,8]
    ;ldr r0,[r3,8]  ;可加可不加，下次更新补上
    .hword 0x4620 ;mov r0,r4
    cmp r0,0x53
    ble @@CaseEAdd
    add r5,1

@@CaseEAdd:
    add r5,1

@@CaseEExit:
    add r1,1
    lsl r1,r1,0x10
    lsr r2,r1,0x10
    lsr r1,r1,0x10
    cmp r1,4
    ble @@CaseENameLoop

@@CaseEEnd:
    ldr r0,=(PrintEvoGfxandName + 0x318);0x08049B5C
    mov pc,r0
.pool
.endfunc
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF

.func PrintEvoGfxandNameCaseDChinese
    mov r2,0
    ldr r3,=GfxOfJPCHSFont16x16  ;0x0878e000
    mov r12,r3
    ldr r3,=0x040000D4
    ldr r0,=0x02030440
    ldr r0,[r0]
    mov r1,0xB3
    lsl r1,r1,3
    add r4,r0,r1
    ldr r6,=TextOfCaughtPokemonChinese  ;0x087EEF00
    ldrh r2,[r4]
    lsl r0,r2,1
    add r0,r0,r2
    lsl r0,r0,2
    add r0,r1,R0;
    add r6,r6,r0;textptr = PokeNameList + DexNum * 12 
    mov r2,0

@@CaseDNameLoop:
    lsl r7,r2,0x10
    lsr r7,r7,0x10
    ldrb r0,[r6]
    cmp r0,0xA0
    ble @@CaseDPrint1
    ldrh r0,[r6]
    bl ConvertFont2Charmap16x16

@@CaseDPrint1:
    .hword 0x4604 ;mov r4,r0
    lsl r4,r4,0x10
    lsr r4,r4,0x10
    lsl r0,r4,7
    add r0,r12
    str r0,[r3]
    lsl r0,r7,7
    ldr r5,=0x06015800
    add r0,r0,r5
    str r0,[r3,4]
    ldr r0,=0x80000040
    str r0,[r3,8]
    ldr r0,[r3,8]
    .hword 0x4620 ;mov r0,r4
    cmp r0,0x53
    ble @@CaseDAdd
    add r6,1

@@CaseDAdd:
    add r6,1

@@CaseDExit:
    add R7,1
    lsl r7,r7,0x10
    lsr r2,r7,0x10
    lsl r7,r7,0x10  ;v1.2错打成lsl,更新需修改为lsr
    cmp r7,4
    ble @@CaseDNameLoop

    mov r2,5
    ldr r3,=0x040000D4
    mov r6,r12         ;Gfx_font_16px
    .hword 0x462C ;mov r4,r5          ;0x06015800

@@CaseDCaughtLoop:
    lsl r7,r2,0x10
    lsr r7,r7,0x10
    lsl r0,r7,1
    ldr r1,=TextOfCaughtChinese;0x08693238
    add r0,r0,r1
    mov r2,0
    ldrsh r0,[r0,r2]
    lsl r0,r0,0x10
    lsr r0,r0,0x10
    cmp r0,0xA0
    ble @@CaseDPrint2
    bl ConvertFont2Charmap16x16

@@CaseDPrint2:
    .hword 0x4600 ;mov r0,r0
    lsl r0,r0,7
    add r0,r0,r6
    str r0,[r3]
    lsl r0,r7,7
    add r0,r0,r4
    str r0,[r3,4]
    ldr r0,=0x80000040
    str r0,[r3,8]
    ldr r0,[r3,8]
    add r7,1
    lsl r7,r7,0x10
    lsr r2,r7,0x10
    lsr r7,r7,0x10
    cmp r7,8
    ble @@CaseDCaughtLoop

    ldr r0,=(PrintEvoGfxandName + 0x3C2);0x08049C06
    mov pc,r0
.pool
.endfunc
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF

/*
   case 0xD:
      v19 = 0;
      v20 = Gfx_font_16px_2;
      v21 = Ram_040000D4_5[0];
      v22 = (unsigned __int16 *)(*Ram_02030440_3 + 0x598);
      v23 = PokeNamelist_2;
      do
      {
        *v21 = (int)v20 + 0x80 * *(unsigned __int8 *)(v19 + 12 * *v22 + v23);
        v24 = (char *)Ram_06015800_2;
        *(_DWORD *)&byte_4[(_DWORD)v21] = (char *)Ram_06015800_2 + 0x80 * v19;
        *(_DWORD *)&byte_8[(_DWORD)v21] = Num_80000040_2;
        v25 = ++v19 << 16;
      }
      while ( v25 >> 16 <= 4 );
      v26 = 5;
      v27 = Ram_040000D4_5[0];
      v28 = (__int16 *)Text_caught;
      do
      {
        *v27 = (int)v20 + 128 * v28[v26];
        *(_DWORD *)&byte_4[(_DWORD)v27] = &v24[128 * v26];
        *(_DWORD *)&byte_8[(_DWORD)v27] = Num_80000040_2;
        v29 = ++v26 << 16;
      }
      while ( v29 >> 16 <= 8 );
      return v36;



    case 0xE:
      v12 = 0;
      v13 = Gfx_font_16px_1;
      v14 = Gfx_evoarry;
      v15 = Ram_040000D4_4[0];
      DexNum = (unsigned __int16 *)(*Ram_02030440_2 + 0x598);
      v17 = PokeNamelist_1 + DexNum * 12;
      do
      {
        *v15 = (int)v13 + 128 * *(unsigned __int8 *)(v12 + 12 * *v16 + v17);
        *(_DWORD *)&byte_4[(_DWORD)v15] = (v12 << 7) + Ram_06015800_1;
        *(_DWORD *)&byte_8[(_DWORD)v15] = Num_80000040_1;
        v18 = ++v12 << 16;
      }
      while ( v18 >> 16 <= 4 );
      v10 = Ram_040000D4_4[0];
      *Ram_040000D4_4[0] = (int)v14;
      *(_DWORD *)&byte_4[(_DWORD)v10] = Ram_06015C00;
      v11 = Num_800004A0;
      goto LABEL_45;
*/