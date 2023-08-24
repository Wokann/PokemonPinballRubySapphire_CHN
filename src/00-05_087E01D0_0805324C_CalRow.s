copy of 0x0805324C

RAM:0805324C ; int __fastcall CalRow(unsigned int, unsigned int)
RAM:0805324C                 EXPORT CalRow
RAM:0805324C CalRow                                  ; CODE XREF: sub_80007C0+22↑p
RAM:0805324C                                         ; sub_80007C0+34↑p ...
RAM:0805324C                 CMP             R1, #0
RAM:0805324E                 BEQ             loc_80532D4
RAM:08053250                 PUSH            {R4}
RAM:08053252                 MOVS            R4, R0
RAM:08053254                 EORS            R4, R1
RAM:08053256                 MOV             R12, R4
RAM:08053258                 MOVS            R3, #1
RAM:0805325A                 MOVS            R2, #0
RAM:0805325C                 CMP             R1, #0
RAM:0805325E                 BPL             loc_8053262
RAM:08053260                 NEGS            R1, R1
RAM:08053262
RAM:08053262 loc_8053262                             ; CODE XREF: CalRow+12↑j
RAM:08053262                 CMP             R0, #0
RAM:08053264                 BPL             loc_8053268
RAM:08053266                 NEGS            R0, R0
RAM:08053268
RAM:08053268 loc_8053268                             ; CODE XREF: CalRow+18↑j
RAM:08053268                 CMP             R0, R1
RAM:0805326A                 BCC             loc_80532C6
RAM:0805326C                 MOVS            R4, #0x10000000
RAM:08053270
RAM:08053270 loc_8053270                             ; CODE XREF: CalRow+30↓j
RAM:08053270                 CMP             R1, R4
RAM:08053272                 BCS             loc_805327E
RAM:08053274                 CMP             R1, R0
RAM:08053276                 BCS             loc_805327E
RAM:08053278                 LSLS            R1, R1, #4
RAM:0805327A                 LSLS            R3, R3, #4
RAM:0805327C                 B               loc_8053270
RAM:0805327E ; ---------------------------------------------------------------------------
RAM:0805327E
RAM:0805327E loc_805327E                             ; CODE XREF: CalRow+26↑j
RAM:0805327E                                         ; CalRow+2A↑j
RAM:0805327E                 LSLS            R4, R4, #3
RAM:08053280
RAM:08053280 loc_8053280                             ; CODE XREF: CalRow+40↓j
RAM:08053280                 CMP             R1, R4
RAM:08053282                 BCS             loc_805328E
RAM:08053284                 CMP             R1, R0
RAM:08053286                 BCS             loc_805328E
RAM:08053288                 LSLS            R1, R1, #1
RAM:0805328A                 LSLS            R3, R3, #1
RAM:0805328C                 B               loc_8053280
RAM:0805328E ; ---------------------------------------------------------------------------
RAM:0805328E
RAM:0805328E loc_805328E                             ; CODE XREF: CalRow+36↑j
RAM:0805328E                                         ; CalRow+3A↑j ...
RAM:0805328E                 CMP             R0, R1
RAM:08053290                 BCC             loc_8053296
RAM:08053292                 SUBS            R0, R0, R1
RAM:08053294                 ORRS            R2, R3
RAM:08053296
RAM:08053296 loc_8053296                             ; CODE XREF: CalRow+44↑j
RAM:08053296                 LSRS            R4, R1, #1
RAM:08053298                 CMP             R0, R4
RAM:0805329A                 BCC             loc_80532A2
RAM:0805329C                 SUBS            R0, R0, R4
RAM:0805329E                 LSRS            R4, R3, #1
RAM:080532A0                 ORRS            R2, R4
RAM:080532A2
RAM:080532A2 loc_80532A2                             ; CODE XREF: CalRow+4E↑j
RAM:080532A2                 LSRS            R4, R1, #2
RAM:080532A4                 CMP             R0, R4
RAM:080532A6                 BCC             loc_80532AE
RAM:080532A8                 SUBS            R0, R0, R4
RAM:080532AA                 LSRS            R4, R3, #2
RAM:080532AC                 ORRS            R2, R4
RAM:080532AE
RAM:080532AE loc_80532AE                             ; CODE XREF: CalRow+5A↑j
RAM:080532AE                 LSRS            R4, R1, #3
RAM:080532B0                 CMP             R0, R4
RAM:080532B2                 BCC             loc_80532BA
RAM:080532B4                 SUBS            R0, R0, R4
RAM:080532B6                 LSRS            R4, R3, #3
RAM:080532B8                 ORRS            R2, R4
RAM:080532BA
RAM:080532BA loc_80532BA                             ; CODE XREF: CalRow+66↑j
RAM:080532BA                 CMP             R0, #0
RAM:080532BC                 BEQ             loc_80532C6
RAM:080532BE                 LSRS            R3, R3, #4
RAM:080532C0                 BEQ             loc_80532C6
RAM:080532C2                 LSRS            R1, R1, #4
RAM:080532C4                 B               loc_805328E
RAM:080532C6 ; ---------------------------------------------------------------------------
RAM:080532C6
RAM:080532C6 loc_80532C6                             ; CODE XREF: CalRow+1E↑j
RAM:080532C6                                         ; CalRow+70↑j ...
RAM:080532C6                 MOVS            R0, R2
RAM:080532C8                 MOV             R4, R12
RAM:080532CA                 CMP             R4, #0
RAM:080532CC                 BPL             loc_80532D0
RAM:080532CE                 NEGS            R0, R0
RAM:080532D0
RAM:080532D0 loc_80532D0                             ; CODE XREF: CalRow+80↑j
RAM:080532D0                 POP             {R4}
RAM:080532D2                 MOV             PC, LR
RAM:080532D4 ; ---------------------------------------------------------------------------
RAM:080532D4
RAM:080532D4 loc_80532D4                             ; CODE XREF: CalRow+2↑j
RAM:080532D4                 PUSH            {LR}
RAM:080532D6                 BL              nullsub_1
RAM:080532DA                 MOVS            R0, #0
RAM:080532DC                 POP             {PC}
RAM:080532DC ; End of function CalRow
RAM:080532DC
RAM:080532DC ; ---------------------------------------------------------------------------
RAM:080532DE                 DCB    0
RAM:080532DF                 DCB    0
RAM:080532E0 ; [00000002 BYTES: COLLAPSED FUNCTION nullsub_1. PRESS CTRL-NUMPAD+ TO EXPAND]
RAM:080532E2                 DCB    0
RAM:080532E3                 DCB    0
RAM:080532E4


int __fastcall sub_805324C(unsigned int a1, unsigned int a2)
{
  signed int v2; // r12
  unsigned int v3; // r3
  int v4; // r2
  int result; // r0

  if ( a2 )
  {
    v2 = a1 ^ a2;
    v3 = 1;
    v4 = 0;
    if ( (a2 & 0x80000000) != 0 )
      a2 = -a2;
    if ( (a1 & 0x80000000) != 0 )
      a1 = -a1;
    if ( a1 >= a2 )
    {
      while ( a2 < 0x10000000 && a2 < a1 )
      {
        a2 *= 16;
        v3 *= 16;
      }
      while ( a2 < 0x80000000 && a2 < a1 )
      {
        a2 *= 2;
        v3 *= 2;
      }
      while ( 1 )
      {
        if ( a1 >= a2 )
        {
          a1 -= a2;
          v4 |= v3;
        }
        if ( a1 >= a2 >> 1 )
        {
          a1 -= a2 >> 1;
          v4 |= v3 >> 1;
        }
        if ( a1 >= a2 >> 2 )
        {
          a1 -= a2 >> 2;
          v4 |= v3 >> 2;
        }
        if ( a1 >= a2 >> 3 )
        {
          a1 -= a2 >> 3;
          v4 |= v3 >> 3;
        }
        if ( !a1 )
          break;
        v3 >>= 4;
        if ( !v3 )
          break;
        a2 >>= 4;
      }
    }
    result = v4;
    if ( v2 < 0 )
      return -v4;
  }
  else
  {
    nullsub_1(a1);
    return 0;
  }
  return result;
}