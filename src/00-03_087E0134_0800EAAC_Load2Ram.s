copy of 0x0800EAAC

RAM:0800EAAC ; int __fastcall Load2Ram(int Gfx_font, int RamStore, unsigned __int16 Widthblock, __int16 Heightblock)
RAM:0800EAAC                 EXPORT Load2Ram
RAM:0800EAAC Load2Ram                                ; CODE XREF: CleanEcardText+16↑p
RAM:0800EAAC                                         ; PrintEcardText+3E↑p ...
RAM:0800EAAC
RAM:0800EAAC var_14          = -0x14
RAM:0800EAAC var_10          = -0x10
RAM:0800EAAC
RAM:0800EAAC                 PUSH            {R4,R5,LR}
RAM:0800EAAE                 SUB             SP, SP, #8
RAM:0800EAB0                 STR             R0, [SP,#0x14+var_14]
RAM:0800EAB2                 STR             R1, [SP,#0x14+var_10]
RAM:0800EAB4                 LSLS            R2, R2, #0x10
RAM:0800EAB6                 LSRS            R0, R2, #0x10
RAM:0800EAB8                 MOVS            R4, #0
RAM:0800EABA                 LSLS            R3, R3, #0x10
RAM:0800EABC                 ASRS            R1, R3, #0x10
RAM:0800EABE                 CMP             R4, R1
RAM:0800EAC0                 BGE             loc_800EAE8
RAM:0800EAC2                 LDR             R2, =Ram_040000D4_6
RAM:0800EAC4                 LSLS            R0, R0, #0x10
RAM:0800EAC6                 ASRS            R3, R0, #0xC
RAM:0800EAC8                 MOVS            R0, #0x80000000
RAM:0800EACC                 ORRS            R3, R0
RAM:0800EACE                 MOVS            R5, R1
RAM:0800EAD0
RAM:0800EAD0 loc_800EAD0                             ; CODE XREF: Load2Ram+3A↓j
RAM:0800EAD0                 LSLS            R1, R4, #0xA
RAM:0800EAD2                 LDR             R0, [SP,#0x14+var_14]
RAM:0800EAD4                 ADDS            R0, R0, R1
RAM:0800EAD6                 STR             R0, [R2]
RAM:0800EAD8                 LDR             R0, [SP,#0x14+var_10]
RAM:0800EADA                 ADDS            R0, R0, R1
RAM:0800EADC                 STR             R0, [R2,#(dword_40000D8 - 0x40000D4)]
RAM:0800EADE                 STR             R3, [R2,#(dword_40000DC - 0x40000D4)]
RAM:0800EAE0                 LDR             R0, [R2,#(dword_40000DC - 0x40000D4)]
RAM:0800EAE2                 ADDS            R4, #1
RAM:0800EAE4                 CMP             R4, R5
RAM:0800EAE6                 BLT             loc_800EAD0
RAM:0800EAE8
RAM:0800EAE8 loc_800EAE8                             ; CODE XREF: Load2Ram+14↑j
RAM:0800EAE8                 ADD             SP, SP, #8
RAM:0800EAEA                 POP             {R4,R5}
RAM:0800EAEC                 POP             {R0}
RAM:0800EAEE                 BX              R0
RAM:0800EAEE ; End of function Load2Ram
RAM:0800EAEE
RAM:0800EAEE ; ---------------------------------------------------------------------------
RAM:0800EAF0                 EXPORT Ram_040000D4_0
RAM:0800EAF0 Ram_040000D4_0  DCD Ram_040000D4_6      ; DATA XREF: Load2Ram+16↑r


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