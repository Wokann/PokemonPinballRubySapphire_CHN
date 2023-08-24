字模地址,
.org 0x080038CC: 
7C970708 ->
00A06A08

与LenghtOfEcard关联

RAM:08003884 ; int __fastcall PrintEcardArrayAppearOrDisppear(char TextLength, unsigned __int16 inputChar)
RAM:08003884                 EXPORT PrintEcardArrayAppearOrDisppear
RAM:08003884 PrintEcardArrayAppearOrDisppear         ; CODE XREF: sub_8002E44+84↑p
RAM:08003884                                         ; sub_8002E44+A2↑p ...
RAM:08003884                 PUSH            {R4-R6,LR}
RAM:08003886                 MOVS            R5, R0
RAM:08003888                 MOVS            R6, R1
RAM:0800388A                 LSLS            R6, R6, #0x10
RAM:0800388C                 LSRS            R6, R6, #0x10
RAM:0800388E                 LSLS            R5, R5, #0x18
RAM:08003890                 ASRS            R5, R5, #0x18
RAM:08003892                 MOVS            R0, R5
RAM:08003894                 MOVS            R1, #0x18
RAM:08003896                 BL              CalRow
RAM:0800389A                 MOVS            R4, R0
RAM:0800389C                 LSLS            R4, R4, #0x18
RAM:0800389E                 ASRS            R4, R4, #0x18
RAM:080038A0                 MOVS            R0, R5
RAM:080038A2                 MOVS            R1, #0x18
RAM:080038A4                 BL              CalColumn
RAM:080038A8                 LSLS            R0, R0, #0x18
RAM:080038AA                 LDR             R1, =unk_807977C
RAM:080038AC                 ADDS            R6, R6, R1
RAM:080038AE                 LSLS            R4, R4, #0xB
RAM:080038B0                 ASRS            R0, R0, #0x13
RAM:080038B2                 LDR             R1, =unk_3001800
RAM:080038B4                 ADDS            R0, R0, R1
RAM:080038B6                 ADDS            R4, R4, R0
RAM:080038B8                 MOVS            R0, R6
RAM:080038BA                 MOVS            R1, R4
RAM:080038BC                 MOVS            R2, #1
RAM:080038BE                 MOVS            R3, #2
RAM:080038C0                 BL              sub_800EAAC
RAM:080038C4                 POP             {R4-R6}
RAM:080038C6                 POP             {R0}
RAM:080038C8                 BX              R0
RAM:080038C8 ; End of function PrintEcardArrayAppearOrDisppear
RAM:080038C8
RAM:080038C8 ; ---------------------------------------------------------------------------
RAM:080038CA                 DCB    0
RAM:080038CB                 DCB    0
RAM:080038CC                 EXPORT jpfont1_4
RAM:080038CC jpfont1_4       DCD unk_807977C         ; DATA XREF: PrintEcardArrayAppearOrDisppear+26↑r
RAM:080038D0                 EXPORT Ram_03001800_2
RAM:080038D0 Ram_03001800_2  DCD unk_3001800     


int __fastcall PrintEcardArrayAppearOrDisppear(char TextLength, unsigned __int16 inputChar)
{
  int NullorArray; // r6
  unsigned int v3; // r5
  int RowIndex; // r4
  unsigned int ColumnIndex; // r0
  int v7; // [sp+Ch] [bp-4h]

  NullorArray = inputChar;
  v3 = TextLength;
  RowIndex = (char)CalRow(TextLength, 24u);
  ColumnIndex = CalColumn(v3, 24u);
  sub_800EAAC(
    (int)jpfont1_4 + NullorArray,
    (int)Ram_03001800_2 + 0x800 * RowIndex + ((int)(ColumnIndex << 24) >> 19),
    1u,
    2);
  return v7;
}