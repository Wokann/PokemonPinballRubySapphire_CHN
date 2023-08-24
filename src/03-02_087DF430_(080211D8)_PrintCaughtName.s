PrintCaughtName
.org 0x21228
ldr r0, =0x087DF430
mov pc,r0
0x087DF430
back. 0x212C0

.org 0x21344
02 A3 68 08 -> 00 EF 7E 08

PrintCaughtName
.org 0x087DF430
mov r0,r8   ;r0 = r8 = 0x02030440
ldr r3,[r0] ;r3 = *0x02030440
mov r4,r12  ;r4 = r12 = 0x598
add r1,r3,r4;r1 =r3+r4 =*0x02030440+0x598
ldrh r7,[r1];DexNumptr=*(*0x02030440+0x598)
lsl r0,r7,#1;r0 = DexNumptr*2
mov r4,r7   ;r4 = DexNumptr
add r0,r0,r4;r0 = DexNumptr*3
lsl r0,r0,#2;r0 = DexNumptr*12
add r9,r0;textptr = DexNumptr *12 + PokeNameList

_NameCycle
lsl r0,r2,#0x10 ;r0 = r2 <<16
asr r2,r0,#0x10 ;r2 = (r2<<16) >>16
mov r3,r9
ldrb r0,[r3] ;text = *textptr(u8)
cmp r0,#0xA0
ble _print
ldrh r0,[r3] ;text = *textptr(u16)
bl _ConvertFont2Charmap_16x16

_print
mov r3,r0
lsl r3,r3,#0x10
lsr r3,r3,#0x10 ;text = *textptr
lsl r0,r3,#7    ;r0 = text * 0x80
ldr r6,=0x0878e000;0x083E3844;Gfx_font_16px
add r0,r0,r6;r0 = text * 0x80 + Gfx_font_16px
str r0,[r5] ;*0x040000D4 = r0
lsl r0,r2,#7
ldr r4,=0x06015800
add r0,r0,r4
str r0,[r5,4];0x040000D4[1] = Currenttext * 0x80 + 0x6015800
ldr r0,=0x80000040
str r0,[r5,8];0x040000D4[2] = 0x80000040
ldr r0,[r5,8]
mov r0,r3
cmp r0,#0x54
beq _addspace
cmp r0,#0x53
bne _print2
_addspace
ldr r0,=0x20E 
mov r1,r8
ldr r4,[r1];r4 = *0x02030440
add r1,r4,r0 ;r1 = *0x02030440 + 0x20E
ldrh r0,[r1]  ;r0 =*(*0x02030440 + 0x20E)
add r0,#8     ;r0 =*(*0x02030440 + 0x20E) +8
strh r0,[r1]  ;*(*0x02030440 + 0x20E) = *(*0x02030440 + 0x20E) +8

_print2
mov r0,r3
mov r1,r9
cmp r0,0x53
ble _add2
add r1,r1,1
_add2
add r1,r1,1
mov r9,r1

_exit
add r0,r2,#1
lsl r0,r0,#0x10
lsr r2,r0,#0x10
lsr r0,r0,#0x10
cmp r0,#4
ble _NameCycle

ldr r0,=0x0200B0C0
ldr r0,[r0,#0x44]
ldr r1,[r0,#0x14]
mov r0,#1
strh r0,[r1]
mov r2,#5
ldr r3,=0x040000D4
ldr r7,=0x08693238
mov r5,r6

_caughtcycle
lsl r6,r2,#0x10
lsr r6,r6,#0x10
lsl r0,r6,#1
add r0,r0,r7
mov r2,#0
ldrsh r0,[r0,r2]
lsl r0,r0,#0x10
lsr r0,r0,#0x10
cmp r0,#0xA0
ble _print
bl _ConvertFont2Charmap_16x16
mov r0,r0

_print
lsl r0,r0,#7
add r0,r0,r5
str r0,[r3]
lsl r0,r6,#7
ldr r4,=0x06015800
mov r0,r0
add r0,r0,r4
str r0,[r3,#4]
ldr r0,=0x80000040
str r0,[r3,#8]
ldr r0,[r3,#8]
add r6,#1
lsl r6,r6,#0x10
lsr r2,r6,#0x10
lsr r6,r6,#0x10
cmp r6,#8
ble _caughtcycle

ldr r0,=0x080212C0
mov pc,r0
0x0878e000;0x083E3844
0x06015800
0x80000040
0x0000020E
0x0200B0C0
0x040000D4
0x08693238
0x080212C0



RAM:080211D8             PrintCaughtName                         ; CODE XREF: sub_80282D0+1C6C↓p
RAM:080211D8 F0 B5                       PUSH            {R4-R7,LR}
RAM:080211DA 4F 46                       MOV             R7, R9
RAM:080211DC 46 46                       MOV             R6, R8
RAM:080211DE C0 B4                       PUSH            {R6,R7}
RAM:080211E0 53 4C                       LDR             R4, =Ram_02030440_4 ;r4 = 0x02030440
RAM:080211E2 20 68                       LDR             R0, [R4]            ;r0 = *0x02030440
RAM:080211E4 53 4A                       LDR             R2, =0x20E          ;r2 = 0x20E
RAM:080211E6 81 18                       ADDS            R1, R0, R2     ;r1 = *0x02030440 + 0x20E
RAM:080211E8 00 22                       MOVS            R2, #0              ;r2 = 0
RAM:080211EA 00 23                       MOVS            R3, #0              ;r3 = 0
RAM:080211EC 0B 80                       STRH            R3, [R1];*(*0x02030440 + 0x20E) = r3 = 0
RAM:080211EE 52 4F                       LDR             R7, =0x6DB          ;r7 = 0x6DB
RAM:080211F0 C0 19                       ADDS            R0, R0, R7     ;r0 = *0x02030440 + 0x6DB
RAM:080211F2 02 70                       STRB            R2, [R0];*(*0x02030440 + 0x6DB) = r2 = 0
RAM:080211F4 20 68                       LDR             R0, [R4]            ;r0 = *0x02030440
RAM:080211F6 84 21 89 00                 MOVS            R1, #0x210          ;r1 = 0x210
RAM:080211FA 40 18                       ADDS            R0, R0, R1     ;r0 = *0x02030440 + 0x210
RAM:080211FC 03 80                       STRH            R3, [R0];*(*0x02030440 + 0x210) = r3 = 0
RAM:080211FE 03 20                       MOVS            R0, #3              ;r0 = 3
RAM:08021200 00 21                       MOVS            R1, #0              ;r1 = 0
RAM:08021202 F9 F7 E5 FB                 BL              sub_801A9D0         ;sub_801A9D0(3,0)
RAM:08021202
RAM:08021206             ; ---------------------------------------------------------------------------
RAM:08021206 20 68                       LDR             R0, [R4]            ;r0 = *0x02030440
RAM:08021208 E4 30                       ADDS            R0, #0xE4      ;r0 = *0x02030440 + 0xE4
RAM:0802120A 0D 21                       MOVS            R1, #0xD            ;r1 = 0xD
RAM:0802120C 01 70                       STRB            R1, [R0];*(*0x02030440 + 0xE4) = 0xD
RAM:0802120E 4B 48                       LDR             R0, =unk_200B0C0    ;r0 = 0x0200B0C0
RAM:08021210 40 6C                       LDR             R0, [R0,#0x44];r0 = *(0x0200B0C0+0x44)
RAM:08021212 01 69                       LDR             R1, [R0,#0x10];r1 = *(*(0x0200B0C0+0x44)+0x10)
RAM:08021214 01 20                       MOVS            R0, #1              ;r0 = 1
RAM:08021216 08 80                       STRH            R0, [R1];**(*(0x0200B0C0+0x44)+0x10) = 1
RAM:08021218 00 22                       MOVS            R2, #0              ;r2 = 0
RAM:0802121A 49 4D                       LDR             R5, =Ram_040000D4_6 ;r5 = 0x040000D4
RAM:0802121C A0 46                       MOV             R8, R4              ;r8 = 0x02030440
RAM:0802121E B3 24 E4 00                 MOVS            R4, #0x598          ;r4 = 0x598
RAM:08021222 A4 46                       MOV             R12, R4             ;r12 = r4 = 0x598
RAM:08021224 47 4F                       LDR             R7, =0x868A302      ;r7 = PokeNamelist
RAM:08021226 B9 46                       MOV             R9, R7              ;r9 = r7
RAM:08021226
RAM:08021228
RAM:08021228             loc_8021228                             ; CODE XREF: PrintCaughtName+AA↓j
RAM:08021228 10 04                       LSLS            R0, R2, #0x10 ;r0 = r2 <<16
RAM:0802122A 02 14                       ASRS            R2, R0, #0x10 ;r2 = (r2<<16) >>16
RAM:0802122C 40 46                       MOV             R0, R8        ;r0 = r8 = 0x02030440
RAM:0802122E 03 68                       LDR             R3, [R0]      ;r3 = *0x02030440
RAM:08021230 64 46                       MOV             R4, R12       ;r4 = r12 = 0x598
RAM:08021232 19 19                       ADDS            R1, R3, R4;r1 =r3+r4 =*0x02030440+0x598
RAM:08021234 0F 88                       LDRH            R7, [R1] ;DexNumptr=*(*0x02030440+0x598)
RAM:08021236 78 00                       LSLS            R0, R7, #1;r0 = DexNumptr*2
RAM:08021238 3C 1C                       MOVS            R4, R7    ;r4 = DexNumptr
RAM:0802123A 00 19                       ADDS            R0, R0, R4;r0 = DexNumptr*3
RAM:0802123C 80 00                       LSLS            R0, R0, #2;r0 =DexNumptr*12
RAM:0802123E 10 18                       ADDS            R0, R2, R0;r0 =DexNumptr*12+r2
RAM:08021240 48 44                       ADD             R0, R9;textptr=DexNumptr*12+r2+PkNameLi
RAM:08021242 00 78                       LDRB            R0, [R0]  ;text = *textptr
RAM:08021244 C0 01                       LSLS            R0, R0, #7;r0 = text * 0x80
RAM:08021246 40 4E                       LDR             R6, =Gfx_font_16px_3
RAM:08021248 80 19                       ADDS            R0, R0, R6;r0 = text * 0x80+Gfx_font_16px
RAM:0802124A 28 60                       STR             R0, [R5] ;*0x040000D4 = r0
RAM:0802124C D0 01                       LSLS            R0, R2, #7
RAM:0802124E 3F 4C                       LDR             R4, =Ram_06015800_3
RAM:08021250 00 19                       ADDS            R0, R0, R4
RAM:08021252 68 60                       STR             R0, [R5,#(dword_40000D8 - 0x40000D4)]
RAM:08021254 3E 48                       LDR             R0, =0x80000040
RAM:08021256 A8 60                       STR             R0, [R5,#(dword_40000DC - 0x40000D4)]
RAM:08021258 A8 68                       LDR             R0, [R5,#(dword_40000DC - 0x40000D4)]
RAM:0802125A 0F 88                       LDRH            R7, [R1]
RAM:0802125C 78 00                       LSLS            R0, R7, #1
RAM:0802125E 39 1C                       MOVS            R1, R7
RAM:08021260 40 18                       ADDS            R0, R0, R1
RAM:08021262 80 00                       LSLS            R0, R0, #2
RAM:08021264 10 18                       ADDS            R0, R2, R0
RAM:08021266 48 44                       ADD             R0, R9
RAM:08021268 00 78                       LDRB            R0, [R0]
RAM:0802126A 53 28                       CMP             R0, #0x53
RAM:0802126C 04 D1                       BNE             loc_8021278
RAM:0802126C
RAM:0802126E 31 48                       LDR             R0, =0x20E
RAM:08021270 19 18                       ADDS            R1, R3, R0
RAM:08021272 08 88                       LDRH            R0, [R1]
RAM:08021274 08 30                       ADDS            R0, #8
RAM:08021276 08 80                       STRH            R0, [R1]
RAM:08021276
RAM:08021278
RAM:08021278             loc_8021278                             ; CODE XREF: PrintCaughtName+94↑j
RAM:08021278 50 1C                       ADDS            R0, R2, #1
RAM:0802127A 00 04                       LSLS            R0, R0, #0x10
RAM:0802127C 02 0C                       LSRS            R2, R0, #0x10
RAM:0802127E 00 14                       ASRS            R0, R0, #0x10
RAM:08021280 04 28                       CMP             R0, #4
RAM:08021282 D1 DD                       BLE             loc_8021228
RAM:08021282
RAM:08021284 2D 48                       LDR             R0, =unk_200B0C0
RAM:08021286 40 6C                       LDR             R0, [R0,#(dword_200B104 - 0x200B0C0)]
RAM:08021288 41 69                       LDR             R1, [R0,#0x14]
RAM:0802128A 01 20                       MOVS            R0, #1
RAM:0802128C 08 80                       STRH            R0, [R1]
RAM:0802128E 05 22                       MOVS            R2, #5
RAM:08021290 2B 4B                       LDR             R3, =Ram_040000D4_6
RAM:08021292 30 4F                       LDR             R7, =Text_caught_0
RAM:08021294 35 1C                       MOVS            R5, R6
RAM:08021294
RAM:08021296
RAM:08021296             loc_8021296                             ; CODE XREF: PrintCaughtName+E6↓j
RAM:08021296 11 04                       LSLS            R1, R2, #0x10
RAM:08021298 09 14                       ASRS            R1, R1, #0x10
RAM:0802129A 48 00                       LSLS            R0, R1, #1
RAM:0802129C C0 19                       ADDS            R0, R0, R7
RAM:0802129E 00 22                       MOVS            R2, #0
RAM:080212A0 80 5E                       LDRSH           R0, [R0,R2]
RAM:080212A2 C0 01                       LSLS            R0, R0, #7
RAM:080212A4 40 19                       ADDS            R0, R0, R5
RAM:080212A6 18 60                       STR             R0, [R3]
RAM:080212A8 C8 01                       LSLS            R0, R1, #7
RAM:080212AA 00 19                       ADDS            R0, R0, R4
RAM:080212AC 58 60                       STR             R0, [R3,#(dword_40000D8 - 0x40000D4)]
RAM:080212AE 28 48                       LDR             R0, =0x80000040
RAM:080212B0 98 60                       STR             R0, [R3,#(dword_40000DC - 0x40000D4)]
RAM:080212B2 98 68                       LDR             R0, [R3,#(dword_40000DC - 0x40000D4)]
RAM:080212B4 01 31                       ADDS            R1, #1
RAM:080212B6 09 04                       LSLS            R1, R1, #0x10
RAM:080212B8 0A 0C                       LSRS            R2, R1, #0x10
RAM:080212BA 09 14                       ASRS            R1, R1, #0x10
RAM:080212BC 08 29                       CMP             R1, #8
RAM:080212BE EA DD                       BLE             loc_8021296
RAM:080212BE
RAM:080212C0 00 22                       MOVS            R2, #0
RAM:080212C2 1B 4F                       LDR             R7, =Ram_02030440_4
RAM:080212C4 24 4E                       LDR             R6, =0x212
RAM:080212C6 00 25                       MOVS            R5, #0
RAM:080212C8 8A 24 A4 00                 MOVS            R4, #0x228
RAM:080212C8
RAM:080212CC
RAM:080212CC             loc_80212CC                             ; CODE XREF: PrintCaughtName+114↓j
RAM:080212CC 3B 68                       LDR             R3, [R7]
RAM:080212CE 11 04                       LSLS            R1, R2, #0x10
RAM:080212D0 09 14                       ASRS            R1, R1, #0x10
RAM:080212D2 4A 00                       LSLS            R2, R1, #1
RAM:080212D4 98 19                       ADDS            R0, R3, R6
RAM:080212D6 80 18                       ADDS            R0, R0, R2
RAM:080212D8 8A 00                       LSLS            R2, R1, #2
RAM:080212DA 02 80                       STRH            R2, [R0]
RAM:080212DC 9B 18                       ADDS            R3, R3, R2
RAM:080212DE 1B 19                       ADDS            R3, R3, R4
RAM:080212E0 1D 80                       STRH            R5, [R3]
RAM:080212E2 01 31                       ADDS            R1, #1
RAM:080212E4 09 04                       LSLS            R1, R1, #0x10
RAM:080212E6 0A 0C                       LSRS            R2, R1, #0x10
RAM:080212E8 09 14                       ASRS            R1, R1, #0x10
RAM:080212EA 04 29                       CMP             R1, #4
RAM:080212EC EE DD                       BLE             loc_80212CC
RAM:080212EC
RAM:080212EE 00 22                       MOVS            R2, #0
RAM:080212F0 0F 4C                       LDR             R4, =Ram_02030440_4
RAM:080212F2 A4 46                       MOV             R12, R4
RAM:080212F4 18 4F                       LDR             R7, =0x212
RAM:080212F6 00 26                       MOVS            R6, #0
RAM:080212F8 8A 25 AD 00                 MOVS            R5, #0x228
RAM:080212F8
RAM:080212FC
RAM:080212FC             loc_80212FC                             ; CODE XREF: PrintCaughtName+148↓j
RAM:080212FC 60 46                       MOV             R0, R12
RAM:080212FE 04 68                       LDR             R4, [R0]
RAM:08021300 11 04                       LSLS            R1, R2, #0x10
RAM:08021302 09 14                       ASRS            R1, R1, #0x10
RAM:08021304 4A 1D                       ADDS            R2, R1, #5
RAM:08021306 53 00                       LSLS            R3, R2, #1
RAM:08021308 E0 19                       ADDS            R0, R4, R7
RAM:0802130A C0 18                       ADDS            R0, R0, R3
RAM:0802130C 92 00                       LSLS            R2, R2, #2
RAM:0802130E 02 80                       STRH            R2, [R0]
RAM:08021310 A4 18                       ADDS            R4, R4, R2
RAM:08021312 64 19                       ADDS            R4, R4, R5
RAM:08021314 26 80                       STRH            R6, [R4]
RAM:08021316 01 31                       ADDS            R1, #1
RAM:08021318 09 04                       LSLS            R1, R1, #0x10
RAM:0802131A 0A 0C                       LSRS            R2, R1, #0x10
RAM:0802131C 09 14                       ASRS            R1, R1, #0x10
RAM:0802131E 03 29                       CMP             R1, #3
RAM:08021320 EC DD                       BLE             loc_80212FC
RAM:08021320
RAM:08021322 18 BC                       POP             {R3,R4}
RAM:08021324 98 46                       MOV             R8, R3
RAM:08021326 A1 46                       MOV             R9, R4
RAM:08021328 F0 BC                       POP             {R4-R7}
RAM:0802132A 01 BC                       POP             {R0}
RAM:0802132C 00 47                       BX              R0
RAM:0802132C
RAM:0802132C             ; End of function PrintCaughtName
RAM:0802132C
RAM:0802132C             ; ---------------------------------------------------------------------------
RAM:0802132E 00                          DCB    0
RAM:0802132F 00                          DCB    0
RAM:08021330                             EXPORT Ram_02030440_1
RAM:08021330 40 04 03 02 Ram_02030440_1  DCD Ram_02030440_4      ; DATA XREF: PrintCaughtName+8↑r
RAM:08021330                                                     ; PrintCaughtName+EA↑r ...
RAM:08021334                             EXPORT Num_20E_0
RAM:08021334 0E 02 00 00 Num_20E_0       DCD 0x20E               ; DATA XREF: PrintCaughtName+C↑r
RAM:08021334                                                     ; PrintCaughtName+96↑r
RAM:08021338                             EXPORT Num_6DB
RAM:08021338 DB 06 00 00 Num_6DB         DCD 0x6DB               ; DATA XREF: PrintCaughtName+16↑r
RAM:0802133C                             EXPORT Ram_0200B0C0_1
RAM:0802133C C0 B0 00 02 Ram_0200B0C0_1  DCD unk_200B0C0         ; DATA XREF: PrintCaughtName+36↑r
RAM:0802133C                                                     ; PrintCaughtName+AC↑r
RAM:08021340                             EXPORT Ram_040000D4_3
RAM:08021340 D4 00 00 04 Ram_040000D4_3  DCD Ram_040000D4_6      ; DATA XREF: PrintCaughtName+42↑r
RAM:08021340                                                     ; PrintCaughtName+B8↑r
RAM:08021344                             EXPORT PokeNamelist_0
RAM:08021344 02 A3 68 08 PokeNamelist_0  DCD 0x868A302           ; DATA XREF: PrintCaughtName+4C↑r
RAM:08021348                             EXPORT Gfx_font_16px_0
RAM:08021348 44 38 3E 08 Gfx_font_16px_0 DCD Gfx_font_16px_3     ; DATA XREF: PrintCaughtName+6E↑r
RAM:0802134C                             EXPORT Ram_06015800_0
RAM:0802134C 00 58 01 06 Ram_06015800_0  DCD Ram_06015800_3      ; DATA XREF: PrintCaughtName+76↑r
RAM:08021350                             EXPORT Num_80000040_0
RAM:08021350 40 00 00 80 Num_80000040_0  DCD 0x80000040          ; DATA XREF: PrintCaughtName+7C↑r
RAM:08021350                                                     ; PrintCaughtName+D6↑r
RAM:08021354                             EXPORT Add_8693238
RAM:08021354 38 32 69 08 Add_8693238     DCD Text_caught_0       ; DATA XREF: PrintCaughtName+BA↑r
RAM:08021358                             EXPORT Num_0x212
RAM:08021358 12 02 00 00 Num_0x212       DCD 0x212               ; DATA XREF: PrintCaughtName+EC↑r
RAM:08021358                                                     ; PrintCaughtName+11C↑r

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