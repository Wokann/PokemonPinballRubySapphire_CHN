PrintEvoName
.org 0x2109A
ldr r0, =0x087DF3B0
mov pc,r0
0x087DF3B0
back. 0x210F0

.org 0x21108
02 A3 68 08 -> 00 EF 7E 08

PrintEvoName
.org 0x087DF3B0
mov r0,r12   ;r0 = r12 = 0x02030440
ldr r4,[r0]  ;r4 = *0x02030440
add r2,r4,r7 ;r2 = *0x02030440 + 0x598
ldrh r1,[r2] ;DexNum(r1) = *(*0x02030440 + 0x598)
lsls r0,r1,1 ;r0 = DexNum * 2
add r0,r0,r1 ;r0 = DexNum * 3
lsl r0,r0,2  ;r0 = DexNum * 12
add r6,r0,r6 ;textptr(r6) = Pokemonlist + DexNum * 12
mov r1,#0    ;currenttext(r1) = 0

_printcycle
lsl r0,r1,0x10
lsr r3,r0,0x10 ;nowtextnum(r3) = currenttextnum
ldrb r0,[r6]  ;*textptr(u8)
cmp r0,#0xA0
ble _print
ldrh r0,[r6]  ;*textptr(u16)
bl _ConvertFont2Charmap_16x16

_print
mov r2, r0     ;text(r2) = *textptr
lsl r2,r2,#0x10
lsr r2,r2,#0x10;text(r2) = *textptr
lsl r0,r2,#7   ;text * 0x80
ldr r1,=0x0878e000;0x083E3844  ;Gfx_font_16px
add r0,r0,r1   ;text * 0x80 + Gfx_font_16px
str r0,[r5]    ;*0x040000D4 = (text * 0x80) + Gfx_font_16px;
lsl r0,r3,#7   ;nowtextnum(r3) * 0x80
ldr r1,=0x06015800 ;
add r0,r0,r1 ;(nowtextnum * 0x80) + Ram_06015800
str r0,[r5,#4] ;0x040000D4[1] = (currenttextNum * 0x80) + Ram_06015800;
ldr r0,=0x80000040
str r0,[r5,#8] ;0x040000D4[2] = Num_80000040;
mov r0,r2      ;r0 = text(r2)
cmp r0,0x54
beq _addspace
cmp r0,0x53
bne _print2
_addspace
Ldr r0,=0x20E 
add r1,r4,r0 ;r1 = *0x02030440 + 0x20E
ldrh r0,[r1]  ;r0 =*(*0x02030440 + 0x20E)
add r0,#8     ;r0 =*(*0x02030440 + 0x20E) +8
strh r0,[r1]  ;*(*0x02030440 + 0x20E) = *(*0x02030440 + 0x20E) +8

_print2
mov r0,r2
cmp r0,0x53
ble _add2
add r6,r6,1
_add2
add r6,r6,1

_exit
add r0,r3,1   ;r0 = nowtextNum + 1
lsl r0,r0,0x10
lsr r1,r0,0x10;currenttext = nowtextNum + 1
lsr r0,r0,0x10
cmp r0,4
ble _printcycle

ldr r0,=0x080210F0
mov pc,r0
0x0878e000;0x083E3844
0x06015800
0x80000040
0x0000020E
0x080210F0

RAM:08021068             PrintEvoName                            ; CODE XREF: sub_8019CF4:loc_8019E84↑p
RAM:08021068                                                     ; sub_8019CF4:loc_8019F96↑p ...
RAM:08021068 F0 B5                       PUSH            {R4-R7,LR}
RAM:0802106A 23 4C                       LDR             R4, =Ram_02030440_4 ;r4 = 0x02030440
RAM:0802106C 20 68                       LDR             R0, [R4]            ;r0 = *r4
RAM:0802106E 23 49                       LDR             R1, =0x20E          ;r1 = 0x20E
RAM:08021070 40 18                       ADDS            R0, R0, R1          ;r0 = *r4 + 0x20E
RAM:08021072 00 21                       MOVS            R1, #0              ;r1 = 0
RAM:08021074 01 80                       STRH            R1, [R0]           ;*(*r4 + 0x20E) = r1 = 0    
RAM:08021076 09 20                       MOVS            R0, #9              ;r0 = 9
RAM:08021078 F9 F7 AA FC                 BL              sub_801A9D0         ;
RAM:0802107C 20 68                       LDR             R0, [R4]            ;r0 = *r4
RAM:0802107E E4 30                       ADDS            R0, #0xE4           ;r0 = *r4 + 0xE4
RAM:08021080 0E 21                       MOVS            R1, #0xE            ;r1 = 0xE
RAM:08021082 01 70                       STRB            R1, [R0]            ;*(*r4 + 0xE4) = r1 = 0xE
RAM:08021084 1E 48                       LDR             R0, =0x200B0C0      ;r0 = 0x0200B0C0
RAM:08021086 40 6C                       LDR             R0, [R0,#(dword_200B104 - 0x200B0C0)];r0 = *0x0200B104
RAM:08021088 01 69                       LDR             R1, [R0,#0x10]      ;r1 = *0x0200B104 + 0x10
RAM:0802108A 01 20                       MOVS            R0, #1              ;r0 = 1
RAM:0802108C 08 80                       STRH            R0, [R1]            ;*(*0x0200B104 + 0x10) = r0 = 1
RAM:0802108E 00 21                       MOVS            R1, #0              ;currenttext(r1) = 0
RAM:08021090 1C 4D                       LDR             R5, =0x40000D4      ;r5 = 0x040000D4
RAM:08021092 A4 46                       MOV             R12, R4             ;r12 = 0x02030440
RAM:08021094 B3 27 FF 00                 MOVS            R7, #0x598          ;r7 = 0x598
RAM:08021098 1B 4E                       LDR             R6, =0x868A302      ;r6 = Pokemonlist
RAM:08021098
RAM:0802109A
RAM:0802109A             loc_802109A                             ; CODE XREF: PrintEvoName+86↓j
RAM:0802109A 08 04                       LSLS            R0, R1, #0x10       ;r0 = r1 * 0x1000
RAM:0802109C 03 14                       ASRS            R3, R0, #0x10;nowtextnum(r3) = r0 / 0x1000 = currenttext
RAM:0802109E 60 46                       MOV             R0, R12             ;r0 = r12 = 0x02030440
RAM:080210A0 04 68                       LDR             R4, [R0]            ;r4 = *0x02030440
RAM:080210A2 E2 19                       ADDS            R2, R4, R7          ;r2 = *0x02030440 + 0x598
RAM:080210A4 11 88                       LDRH            R1, [R2]   ;DexNum(r1) = *(*0x02030440 + 0x598)
RAM:080210A6 48 00                       LSLS            R0, R1, #1          ;r0 = DexNum * 2
RAM:080210A8 40 18                       ADDS            R0, R0, R1          ;r0 = DexNum * 3
RAM:080210AA 80 00                       LSLS            R0, R0, #2          ;r0 = DexNum * 12
RAM:080210AC 18 18                       ADDS            R0, R3, R0          ;r0 = nowtextnum + DexNum * 12
RAM:080210AE 80 19                       ADDS            R0, R0, R6          ;textptr(r0) = Pokemonlis + DexNum * 12t + nowtextnum
RAM:080210B0 00 78                       LDRB            R0, [R0]            ;text = *textptr
RAM:080210B2 C0 01                       LSLS            R0, R0, #7          ;r0 = text * 0x80
RAM:080210B4 15 49                       LDR             R1, =0x83E3844
RAM:080210B6 40 18                       ADDS            R0, R0, R1
RAM:080210B8 28 60                       STR             R0, [R5]
RAM:080210BA D8 01                       LSLS            R0, R3, #7
RAM:080210BC 14 49                       LDR             R1, =0x6015800
RAM:080210BE 40 18                       ADDS            R0, R0, R1
RAM:080210C0 68 60                       STR             R0, [R5,#(dword_40000D8 - 0x40000D4)]
RAM:080210C2 14 48                       LDR             R0, =0x80000040
RAM:080210C4 A8 60                       STR             R0, [R5,#(dword_40000DC - 0x40000D4)]
RAM:080210C6 A8 68                       LDR             R0, [R5,#(dword_40000DC - 0x40000D4)]
RAM:080210C8 11 88                       LDRH            R1, [R2]
RAM:080210CA 48 00                       LSLS            R0, R1, #1
RAM:080210CC 40 18                       ADDS            R0, R0, R1
RAM:080210CE 80 00                       LSLS            R0, R0, #2 ;DexNum * 12
RAM:080210D0 18 18                       ADDS            R0, R3, R0 ;r0 = nowtextnum + DexNum * 12
RAM:080210D2 80 19                       ADDS            R0, R0, R6 ;textptr(r0) = Pokemonlis + DexNum * 12t + nowtextnum
RAM:080210D4 00 78                       LDRB            R0, [R0]   ;text = *textptr
RAM:080210D6 53 28                       CMP             R0, #0x53
RAM:080210D8 04 D1                       BNE             loc_80210E4
RAM:080210D8
RAM:080210DA 08 48                       LDR             R0, =0x20E
RAM:080210DC 21 18                       ADDS            R1, R4, R0
RAM:080210DE 08 88                       LDRH            R0, [R1]
RAM:080210E0 08 30                       ADDS            R0, #8
RAM:080210E2 08 80                       STRH            R0, [R1]
RAM:080210E2
RAM:080210E4
RAM:080210E4             loc_80210E4                             ; CODE XREF: PrintEvoName+70↑j
RAM:080210E4 58 1C                       ADDS            R0, R3, #1      ;r0 = nowtextNum + 1
RAM:080210E6 00 04                       LSLS            R0, R0, #0x10   ;r0 = r0 <<16
RAM:080210E8 01 0C                       LSRS            R1, R0, #0x10   ;r1 = r0 >>16
RAM:080210EA 00 14                       ASRS            R0, R0, #0x10   ;r0 = r0 >>16
RAM:080210EC 04 28                       CMP             R0, #4          ;
RAM:080210EE D4 DD                       BLE             loc_802109A
RAM:080210EE
RAM:080210F0 F0 BC                       POP             {R4-R7}
RAM:080210F2 01 BC                       POP             {R0}
RAM:080210F4 00 47                       BX              R0
RAM:080210F4
RAM:080210F4             ; End of function PrintEvoName
RAM:080210F4
RAM:080210F4             ; ---------------------------------------------------------------------------
RAM:080210F6 00                          DCB    0
RAM:080210F7 00                          DCB    0
RAM:080210F8                             EXPORT Ram_02030440_0
RAM:080210F8 40 04 03 02 Ram_02030440_0  DCD Ram_02030440_4      ; DATA XREF: PrintEvoName+2↑r
RAM:080210FC                             EXPORT Num_20E
RAM:080210FC 0E 02 00 00 Num_20E         DCD 0x20E               ; DATA XREF: PrintEvoName+6↑r
RAM:080210FC                                                     ; PrintEvoName+72↑r
RAM:08021100                             EXPORT Ram_0200B0C0_0
RAM:08021100 C0 B0 00 02 Ram_0200B0C0_0  DCD 0x200B0C0           ; DATA XREF: PrintEvoName+1C↑r
RAM:08021104                             EXPORT Ram_040000D4_2
RAM:08021104 D4 00 00 04 Ram_040000D4_2  DCD 0x40000D4           ; DATA XREF: PrintEvoName+28↑r
RAM:08021108                             EXPORT PokeNamelist
RAM:08021108 02 A3 68 08 PokeNamelist    DCD 0x868A302           ; DATA XREF: PrintEvoName+30↑r
RAM:0802110C                             EXPORT Gfx_font_16px
RAM:0802110C 44 38 3E 08 Gfx_font_16px   DCD 0x83E3844           ; DATA XREF: PrintEvoName+4C↑r
RAM:08021110                             EXPORT Ram_06015800
RAM:08021110 00 58 01 06 Ram_06015800    DCD 0x6015800           ; DATA XREF: PrintEvoName+54↑r
RAM:08021114                             EXPORT Num_80000040
RAM:08021114 40 00 00 80 Num_80000040    DCD 0x80000040          ; DATA XREF: PrintEvoName+5A↑r


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
