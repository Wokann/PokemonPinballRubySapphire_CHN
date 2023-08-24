PrintEvoGfxandName-case-E
.org 0x49B14
ldr r0, =0x087DF520
mov pc,r0
0x087DF520
back. 0x49B5C

PrintEvoGfxandName-case-D
.org 0x49B8C
ldr r0, =0x087DF5B0
mov pc,r0
0x087DF5B0
back. 0x49C06

PrintEvoGfxandName-case-E
.org 0x087DF520
mov r2,#0
ldr r0,=0x0878e000 ;Gfx_font_16px
mov r12,r0
ldr r6,=0x084DC6A4 ;Gfx_evo_array
ldr r3,=0x040000D4
ldr r0,=0x02030440
ldr r0,[r0]
mov r1,#0x598
add r4,r0,r1
ldr r5,=0x087EEF00 ;PokeNameList
ldrh r2,[r4]
lsl r0,r2,#1
add r0,r0,r2
lsl r0,r0,#2
add r0,r1,R0;
add r5,r5,r0;textptr = PokeNameList + DexNum * 12 
mov r2,#0

_caseEnamecycle
lsl r1,r2,0x10
lsr r1,r1,0x10
ldrb r0,[r5]
cmp r0,0xA0
ble _print1
ldrh r0,[r5]
bl ConvertFont2Charmap_16x16

_print1
mov r4,r0
lsl r4,r4,0x10
lsr r4,r4,0x10
lsl r0,r4,#7
add r0,r12
str r0,[r3]
lsl r0,r1,#7
ldr r2,=0x06015800
add r0,r0,r2
str r0,[r3,4]
ldr r0,=0x80000040
str r0,[r3,8]
ldr r0,[r3,8]
mov r0,r4
cmp r0,0x53
ble _add2
add r5,r5,1
_add2
add r5,r5,1
_exit
add r1,1
lsl r1,r1,0x10
lsr r2,r1,0x10
lsr r1,r1,0x10
cmp r1,4
ble _caseEnamecycle

ldr r0,=0x08049B5C
mov pc,r0
0x0878e000
0x084DC6A4
0x040000D4
0x02030440
0x087EEF00
0x06015800
0x80000040
0x08049B5C

PrintEvoGfxandName-case-D
.org 0x087DF5B0
mov r2,#0
ldr r3,=0x0878e000 ;Gfx_font_16px
mov r12,r3
ldr r3,=0x040000D4
ldr r0,=0x02030440
ldr r0,[r0]
mov r1,#0x598
add r4,r0,r1
ldr r6,=0x087EEF00 ;PokeNameList
ldrh r2,[r4]
lsl r0,r2,#1
add r0,r0,r2
lsl r0,r0,#2
add r0,r1,R0;
add r6,r6,r0;textptr = PokeNameList + DexNum * 12 
mov r2,#0

_caseDnamecycle
lsl r7,r2,0x10
lsr r7,r7,0x10
ldrb r0,[r6]
cmp r0,0xA0
ble _print2
ldrh r0,[r6]
bl ConvertFont2Charmap_16x16

_print2
mov r4,r0
lsl r4,r4,0x10
lsr r4,r4,0x10
lsl r0,r4,#7
add r0,r12
str r0,[r3]
lsl r0,r7,#7
ldr r5,=0x06015800
add r0,r0,r5
str r0,[r3,4]
ldr r0,=0x80000040
str r0,[r3,8]
ldr r0,[r3,8]
mov r0,r4
cmp r0,0x53
ble _add2
add r6,r6,1
_add2
add r6,r6,1
_exit
add R7,1
lsl r7,r7,0x10
lsr r2,r7,0x10
lsr r7,r7,0x10
cmp r7,4
ble _caseDnamecycle

mov r2,5
ldr r3,=0x040000D4
mov r6,r12         ;Gfx_font_16px
mov r4,r5          ;0x06015800

_caseDcaughtcycle
lsl r7,r2,0x10
lsr r7,r7,0x10
lsl r0,r7,1
ldr r1,=0x08693238 ;Textcaught
add r0,r0,r1
mov r2,0
ldrsh r0,[r0,r2]
lsl r0,r0,#0x10
lsr r0,r0,#0x10
cmp r0,#0xA0
ble _print3
bl _ConvertFont2Charmap_16x16

_print3
mov r0,r0
lsl r0,r0,#7
add r0,r0,r6
str r0,[r3]
lsl r0,r7,#7
add r0,r0,r4
str r0,[r3,#4]
ldr r0,=0x80000040
str r0,[r3,#8]
ldr r0,[r3,#8]
add r7,#1
lsl r7,r7,#0x10
lsr r2,r7,#0x10
lsr r7,r7,#0x10
cmp r7,#8
ble _caseDcaughtcycle

ldr r0,=0x08049C06
mov pc,r0
0x0878e000
0x040000D4
0x02030440
0x087EEF00
0x06015800
0x80000040
0x08693238
0x08049C06



{
    RAM:08049B8C 00 22                       MOVS            R2, #0
    RAM:08049B8E 1E 4B                       LDR             R3, =Gfx_font_16px_3;0x0878e000 Gfx_font_16px
    RAM:08049B90 9C 46                       MOV             R12, R3
    RAM:08049B92 1E 4B                       LDR             R3, =Ram_040000D4_6
    RAM:08049B94 1E 48                       LDR             R0, =Ram_02030440_4
    RAM:08049B96 00 68                       LDR             R0, [R0]
    RAM:08049B98 B3 21 C9 00                 MOVS            R1, #0x598
    RAM:08049B9C 44 18                       ADDS            R4, R0, R1
    RAM:08049B9E 1D 4E                       LDR             R6, =0x868A302 ;0x087EEF00 PokeNameList
    RAM:08049B9E
    RAM:08049BA0
    RAM:08049BA0             loc_8049BA0                             ; CODE XREF: PrintEvoGfxandName+38C↓j
    RAM:08049BA0 11 04                       LSLS            R1, R2, #0x10
    RAM:08049BA2 09 14                       ASRS            R1, R1, #0x10
    RAM:08049BA4 22 88                       LDRH            R2, [R4]
    RAM:08049BA6 50 00                       LSLS            R0, R2, #1
    RAM:08049BA8 80 18                       ADDS            R0, R0, R2
    RAM:08049BAA 80 00                       LSLS            R0, R0, #2
    RAM:08049BAC 08 18                       ADDS            R0, R1, R0
    RAM:08049BAE 80 19                       ADDS            R0, R0, R6
    RAM:08049BB0 00 78                       LDRB            R0, [R0]
    RAM:08049BB2 C0 01                       LSLS            R0, R0, #7
    RAM:08049BB4 60 44                       ADD             R0, R12
    RAM:08049BB6 18 60                       STR             R0, [R3]
    RAM:08049BB8 C8 01                       LSLS            R0, R1, #7
    RAM:08049BBA 17 4D                       LDR             R5, =Ram_06015800_3
    RAM:08049BBC 40 19                       ADDS            R0, R0, R5
    RAM:08049BBE 58 60                       STR             R0, [R3,#(dword_40000D8 - 0x40000D4)]
    RAM:08049BC0 16 48                       LDR             R0, =0x80000040
    RAM:08049BC2 98 60                       STR             R0, [R3,#(dword_40000DC - 0x40000D4)]
    RAM:08049BC4 98 68                       LDR             R0, [R3,#(dword_40000DC - 0x40000D4)]
    RAM:08049BC6 01 31                       ADDS            R1, #1
    RAM:08049BC8 09 04                       LSLS            R1, R1, #0x10
    RAM:08049BCA 0A 0C                       LSRS            R2, R1, #0x10
    RAM:08049BCC 09 14                       ASRS            R1, R1, #0x10
    RAM:08049BCE 04 29                       CMP             R1, #4
    RAM:08049BD0 E6 DD                       BLE             loc_8049BA0
    RAM:08049BD0
    RAM:08049BD2 05 22                       MOVS            R2, #5
    RAM:08049BD4 0D 4B                       LDR             R3, =Ram_040000D4_6
    RAM:08049BD6 12 4F                       LDR             R7, =Text_caught_0;08693238
    RAM:08049BD8 66 46                       MOV             R6, R12
    RAM:08049BDA 2C 1C                       MOVS            R4, R5
    RAM:08049BDA
    RAM:08049BDC
    RAM:08049BDC             loc_8049BDC                             ; CODE XREF: PrintEvoGfxandName+3C0↓j
    RAM:08049BDC 11 04                       LSLS            R1, R2, #0x10
    RAM:08049BDE 09 14                       ASRS            R1, R1, #0x10
    RAM:08049BE0 48 00                       LSLS            R0, R1, #1
    RAM:08049BE2 C0 19                       ADDS            R0, R0, R7
    RAM:08049BE4 00 22                       MOVS            R2, #0
    RAM:08049BE6 80 5E                       LDRSH           R0, [R0,R2]
    RAM:08049BE8 C0 01                       LSLS            R0, R0, #7
    RAM:08049BEA 80 19                       ADDS            R0, R0, R6
    RAM:08049BEC 18 60                       STR             R0, [R3]
    RAM:08049BEE C8 01                       LSLS            R0, R1, #7
    RAM:08049BF0 00 19                       ADDS            R0, R0, R4
    RAM:08049BF2 58 60                       STR             R0, [R3,#(dword_40000D8 - 0x40000D4)]
    RAM:08049BF4 09 48                       LDR             R0, =0x80000040
    RAM:08049BF6 98 60                       STR             R0, [R3,#(dword_40000DC - 0x40000D4)]
    RAM:08049BF8 98 68                       LDR             R0, [R3,#(dword_40000DC - 0x40000D4)]
    RAM:08049BFA 01 31                       ADDS            R1, #1
    RAM:08049BFC 09 04                       LSLS            R1, R1, #0x10
    RAM:08049BFE 0A 0C                       LSRS            R2, R1, #0x10
    RAM:08049C00 09 14                       ASRS            R1, R1, #0x10
    RAM:08049C02 08 29                       CMP             R1, #8
    RAM:08049C04 EA DD                       BLE             loc_8049BDC
    RAM:08049C04
    RAM:08049C06 FD E0                       B               loc_8049E04
    RAM:08049C06
    RAM:08049C06             ; ---------------------------------------------------------------------------
    RAM:08049C08                             EXPORT Gfx_font_16px_2
    RAM:08049C08 44 38 3E 08 Gfx_font_16px_2 DCD Gfx_font_16px_3     ; DATA XREF: PrintEvoGfxandName+34A↑r
    RAM:08049C0C                             EXPORT Ram_040000D4_5
    RAM:08049C0C D4 00 00 04 Ram_040000D4_5  DCD Ram_040000D4_6      ; DATA XREF: PrintEvoGfxandName+34E↑r
    RAM:08049C0C                                                     ; PrintEvoGfxandName+390↑r
    RAM:08049C10                             EXPORT Ram_02030440_3
    RAM:08049C10 40 04 03 02 Ram_02030440_3  DCD Ram_02030440_4      ; DATA XREF: PrintEvoGfxandName+350↑r
    RAM:08049C14                             EXPORT PokeNamelist_2
    RAM:08049C14 02 A3 68 08 PokeNamelist_2  DCD 0x868A302           ; DATA XREF: PrintEvoGfxandName+35A↑r
    RAM:08049C18                             EXPORT Ram_06015800_2
    RAM:08049C18 00 58 01 06 Ram_06015800_2  DCD Ram_06015800_3      ; DATA XREF: PrintEvoGfxandName+376↑r
    RAM:08049C1C                             EXPORT Num_80000040_2
    RAM:08049C1C 40 00 00 80 Num_80000040_2  DCD 0x80000040          ; DATA XREF: PrintEvoGfxandName+37C↑r
    RAM:08049C1C                                                     ; PrintEvoGfxandName+3B0↑r
    RAM:08049C20                             EXPORT Text_caught
    RAM:08049C20 38 32 69 08 Text_caught     DCD Text_caught_0 
}
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



{
    RAM:08049B14 00 22                       MOVS            R2, #0
    RAM:08049B16 14 48                       LDR             R0, =Gfx_font_16px_3
    RAM:08049B18 84 46                       MOV             R12, R0
    RAM:08049B1A 14 4E                       LDR             R6, =unk_84DC6A4
    RAM:08049B1C 14 4B                       LDR             R3, =Ram_040000D4_6
    RAM:08049B1E 15 48                       LDR             R0, =Ram_02030440_4
    RAM:08049B20 00 68                       LDR             R0, [R0]
    RAM:08049B22 B3 21 C9 00                 MOVS            R1, #0x598
    RAM:08049B26 44 18                       ADDS            R4, R0, R1
    RAM:08049B28 13 4D                       LDR             R5, =0x868A302
    RAM:08049B28
    RAM:08049B2A
    RAM:08049B2A             loc_8049B2A                             ; CODE XREF: PrintEvoGfxandName+316↓j
    RAM:08049B2A 11 04                       LSLS            R1, R2, #0x10
    RAM:08049B2C 09 14                       ASRS            R1, R1, #0x10
    RAM:08049B2E 22 88                       LDRH            R2, [R4]
    RAM:08049B30 50 00                       LSLS            R0, R2, #1
    RAM:08049B32 80 18                       ADDS            R0, R0, R2
    RAM:08049B34 80 00                       LSLS            R0, R0, #2
    RAM:08049B36 08 18                       ADDS            R0, R1, R0
    RAM:08049B38 40 19                       ADDS            R0, R0, R5
    RAM:08049B3A 00 78                       LDRB            R0, [R0]
    RAM:08049B3C C0 01                       LSLS            R0, R0, #7
    RAM:08049B3E 60 44                       ADD             R0, R12
    RAM:08049B40 18 60                       STR             R0, [R3]
    RAM:08049B42 C8 01                       LSLS            R0, R1, #7
    RAM:08049B44 0D 4A                       LDR             R2, =0x6015800
    RAM:08049B46 80 18                       ADDS            R0, R0, R2
    RAM:08049B48 58 60                       STR             R0, [R3,#(dword_40000D8 - 0x40000D4)]
    RAM:08049B4A 0D 48                       LDR             R0, =0x80000040
    RAM:08049B4C 98 60                       STR             R0, [R3,#(dword_40000DC - 0x40000D4)]
    RAM:08049B4E 98 68                       LDR             R0, [R3,#(dword_40000DC - 0x40000D4)]
    RAM:08049B50 01 31                       ADDS            R1, #1
    RAM:08049B52 09 04                       LSLS            R1, R1, #0x10
    RAM:08049B54 0A 0C                       LSRS            R2, R1, #0x10
    RAM:08049B56 09 14                       ASRS            R1, R1, #0x10
    RAM:08049B58 04 29                       CMP             R1, #4
    RAM:08049B5A E6 DD                       BLE             loc_8049B2A
    RAM:08049B5A
    RAM:08049B5C 04 49                       LDR             R1, =Ram_040000D4_6
    RAM:08049B5E 0E 60                       STR             R6, [R1]
    RAM:08049B60 08 48                       LDR             R0, =0x6015C00
    RAM:08049B62 48 60                       STR             R0, [R1,#(dword_40000D8 - 0x40000D4)]
    RAM:08049B64 08 48                       LDR             R0, =0x800004A0
    RAM:08049B66 4B E1                       B               loc_8049E00
    RAM:08049B66
    RAM:08049B66             ; ---------------------------------------------------------------------------
    RAM:08049B68                             EXPORT Gfx_font_16px_1
    RAM:08049B68 44 38 3E 08 Gfx_font_16px_1 DCD Gfx_font_16px_3     ; DATA XREF: PrintEvoGfxandName+2D2↑r
    RAM:08049B6C                             EXPORT Gfx_evoarry
    RAM:08049B6C A4 C6 4D 08 Gfx_evoarry     DCD unk_84DC6A4         ; DATA XREF: PrintEvoGfxandName+2D6↑r
    RAM:08049B70                             EXPORT Ram_040000D4_4
    RAM:08049B70 D4 00 00 04 Ram_040000D4_4  DCD Ram_040000D4_6      ; DATA XREF: PrintEvoGfxandName+2D8↑r
    RAM:08049B70                                                     ; PrintEvoGfxandName+318↑r
    RAM:08049B74                             EXPORT Ram_02030440_2
    RAM:08049B74 40 04 03 02 Ram_02030440_2  DCD Ram_02030440_4      ; DATA XREF: PrintEvoGfxandName+2DA↑r
    RAM:08049B78                             EXPORT PokeNamelist_1
    RAM:08049B78 02 A3 68 08 PokeNamelist_1  DCD 0x868A302           ; DATA XREF: PrintEvoGfxandName+2E4↑r
    RAM:08049B7C                             EXPORT Ram_06015800_1
    RAM:08049B7C 00 58 01 06 Ram_06015800_1  DCD 0x6015800           ; DATA XREF: PrintEvoGfxandName+300↑r
    RAM:08049B80                             EXPORT Num_80000040_1
    RAM:08049B80 40 00 00 80 Num_80000040_1  DCD 0x80000040          ; DATA XREF: PrintEvoGfxandName+306↑r
    RAM:08049B84                             EXPORT Ram_06015C00
    RAM:08049B84 00 5C 01 06 Ram_06015C00    DCD 0x6015C00           ; DATA XREF: PrintEvoGfxandName+31C↑r
    RAM:08049B88                             EXPORT Num_800004A0
    RAM:08049B88 A0 04 00 80 Num_800004A0    DCD 0x800004A0     
} 

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