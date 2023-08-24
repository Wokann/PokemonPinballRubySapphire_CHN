RAM:08003774 ; int CleanEcardText()
RAM:08003774                 EXPORT CleanEcardText
RAM:08003774 CleanEcardText                          ; CODE XREF: sub_8002C7C+D4↑p
RAM:08003774                                         ; sub_8002E44:loc_8002F5C↑p ...
RAM:08003774                 PUSH            {R4-R7,LR}
RAM:08003776                 MOVS            R1, #0
RAM:08003778                 LDR             R7, =unk_3001800
RAM:0800377A
RAM:0800377A loc_800377A                             ; CODE XREF: CleanEcardText+26↓j
RAM:0800377A                 MOVS            R5, #0
RAM:0800377C                 LSLS            R0, R1, #0xB
RAM:0800377E                 ADDS            R6, R1, #1
RAM:08003780                 ADDS            R4, R7, R0
RAM:08003782
RAM:08003782 loc_8003782                             ; CODE XREF: CleanEcardText+20↓j
RAM:08003782                 LDR             R0, =0x807977C
RAM:08003784                 MOVS            R1, R4
RAM:08003786                 MOVS            R2, #1
RAM:08003788                 MOVS            R3, #2
RAM:0800378A                 BL              sub_800EAAC
RAM:0800378E                 ADDS            R4, #0x20 ; ' '
RAM:08003790                 ADDS            R5, #1
RAM:08003792                 CMP             R5, #0x17
RAM:08003794                 BLE             loc_8003782
RAM:08003796                 MOVS            R1, R6
RAM:08003798                 CMP             R1, #2
RAM:0800379A                 BLE             loc_800377A
RAM:0800379C                 POP             {R4-R7}
RAM:0800379E                 POP             {R0}
RAM:080037A0                 BX              R0
RAM:080037A0 ; End of function CleanEcardText
RAM:080037A0
RAM:080037A0 ; ---------------------------------------------------------------------------
RAM:080037A2                 DCB    0
RAM:080037A3                 DCB    0
RAM:080037A4                 EXPORT Ram_03001800
RAM:080037A4 Ram_03001800    DCD unk_3001800         ; DATA XREF: CleanEcardText+4↑r
RAM:080037A8                 EXPORT jpfont1_1
RAM:080037A8 jpfont1_1       DCD 0x807977C 


int CleanEcardText()
{
  int index; // r1
  void *BaseAdd; // r7
  int columnIndex; // r5
  int rowIndex; // r6
  int WhereToWrite; // r4
  int returnValue; // [sp+10h] [bp-4h]

  index = 0;
  BaseAdd = Ram_03001800;
  do
  {
    columnIndex = 0;
    rowIndex = index + 1;
    WhereToWrite = (int)BaseAdd + 0x800 * index;
    do
    {
      sub_800EAAC(jpfont1_1, WhereToWrite, 1u, 2);
      WhereToWrite += 32;
      ++columnIndex;
    }
    while ( columnIndex <= 23 );
    index = rowIndex;
  }
  while ( rowIndex <= 2 );
  return returnValue;
}