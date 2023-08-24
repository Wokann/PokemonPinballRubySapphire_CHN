copy of 0x080532E4

RAM:080532E4 ; unsigned int __fastcall CalColumn(unsigned int result, unsigned int)
RAM:080532E4                 EXPORT CalColumn
RAM:080532E4 CalColumn                               ; CODE XREF: PrintEcardTextyAppear+20↑p
RAM:080532E4                                         ; PrintEcardArrayAppearOrDisppear+20↑p ...
RAM:080532E4                 MOVS            R3, #1
RAM:080532E6                 CMP             R1, #0
RAM:080532E8                 BEQ             loc_80533A8
RAM:080532EA                 BPL             loc_80532EE
RAM:080532EC                 NEGS            R1, R1
RAM:080532EE
RAM:080532EE loc_80532EE                             ; CODE XREF: CalColumn+6↑j
RAM:080532EE                 PUSH            {R4}
RAM:080532F0                 PUSH            {R0}
RAM:080532F2                 CMP             R0, #0
RAM:080532F4                 BPL             loc_80532F8
RAM:080532F6                 NEGS            R0, R0
RAM:080532F8
RAM:080532F8 loc_80532F8                             ; CODE XREF: CalColumn+10↑j
RAM:080532F8                 CMP             R0, R1
RAM:080532FA                 BCC             loc_805339C
RAM:080532FC                 MOVS            R4, #0x10000000
RAM:08053300
RAM:08053300 loc_8053300                             ; CODE XREF: CalColumn+28↓j
RAM:08053300                 CMP             R1, R4
RAM:08053302                 BCS             loc_805330E
RAM:08053304                 CMP             R1, R0
RAM:08053306                 BCS             loc_805330E
RAM:08053308                 LSLS            R1, R1, #4
RAM:0805330A                 LSLS            R3, R3, #4
RAM:0805330C                 B               loc_8053300
RAM:0805330E ; ---------------------------------------------------------------------------
RAM:0805330E
RAM:0805330E loc_805330E                             ; CODE XREF: CalColumn+1E↑j
RAM:0805330E                                         ; CalColumn+22↑j
RAM:0805330E                 LSLS            R4, R4, #3
RAM:08053310
RAM:08053310 loc_8053310                             ; CODE XREF: CalColumn+38↓j
RAM:08053310                 CMP             R1, R4
RAM:08053312                 BCS             loc_805331E
RAM:08053314                 CMP             R1, R0
RAM:08053316                 BCS             loc_805331E
RAM:08053318                 LSLS            R1, R1, #1
RAM:0805331A                 LSLS            R3, R3, #1
RAM:0805331C                 B               loc_8053310
RAM:0805331E ; ---------------------------------------------------------------------------
RAM:0805331E
RAM:0805331E loc_805331E                             ; CODE XREF: CalColumn+2E↑j
RAM:0805331E                                         ; CalColumn+32↑j ...
RAM:0805331E                 MOVS            R2, #0
RAM:08053320                 CMP             R0, R1
RAM:08053322                 BCC             loc_8053326
RAM:08053324                 SUBS            R0, R0, R1
RAM:08053326
RAM:08053326 loc_8053326                             ; CODE XREF: CalColumn+3E↑j
RAM:08053326                 LSRS            R4, R1, #1
RAM:08053328                 CMP             R0, R4
RAM:0805332A                 BCC             loc_8053338
RAM:0805332C                 SUBS            R0, R0, R4
RAM:0805332E                 MOV             R12, R3
RAM:08053330                 MOVS            R4, #1
RAM:08053332                 RORS            R3, R4
RAM:08053334                 ORRS            R2, R3
RAM:08053336                 MOV             R3, R12
RAM:08053338
RAM:08053338 loc_8053338                             ; CODE XREF: CalColumn+46↑j
RAM:08053338                 LSRS            R4, R1, #2
RAM:0805333A                 CMP             R0, R4
RAM:0805333C                 BCC             loc_805334A
RAM:0805333E                 SUBS            R0, R0, R4
RAM:08053340                 MOV             R12, R3
RAM:08053342                 MOVS            R4, #2
RAM:08053344                 RORS            R3, R4
RAM:08053346                 ORRS            R2, R3
RAM:08053348                 MOV             R3, R12
RAM:0805334A
RAM:0805334A loc_805334A                             ; CODE XREF: CalColumn+58↑j
RAM:0805334A                 LSRS            R4, R1, #3
RAM:0805334C                 CMP             R0, R4
RAM:0805334E                 BCC             loc_805335C
RAM:08053350                 SUBS            R0, R0, R4
RAM:08053352                 MOV             R12, R3
RAM:08053354                 MOVS            R4, #3
RAM:08053356                 RORS            R3, R4
RAM:08053358                 ORRS            R2, R3
RAM:0805335A                 MOV             R3, R12
RAM:0805335C
RAM:0805335C loc_805335C                             ; CODE XREF: CalColumn+6A↑j
RAM:0805335C                 MOV             R12, R3
RAM:0805335E                 CMP             R0, #0
RAM:08053360                 BEQ             loc_805336A
RAM:08053362                 LSRS            R3, R3, #4
RAM:08053364                 BEQ             loc_805336A
RAM:08053366                 LSRS            R1, R1, #4
RAM:08053368                 B               loc_805331E
RAM:0805336A ; ---------------------------------------------------------------------------
RAM:0805336A
RAM:0805336A loc_805336A                             ; CODE XREF: CalColumn+7C↑j
RAM:0805336A                                         ; CalColumn+80↑j
RAM:0805336A                 MOVS            R4, #0xE0000000
RAM:0805336E                 ANDS            R2, R4
RAM:08053370                 BEQ             loc_805339C
RAM:08053372                 MOV             R3, R12
RAM:08053374                 MOVS            R4, #3
RAM:08053376                 RORS            R3, R4
RAM:08053378                 TST             R2, R3
RAM:0805337A                 BEQ             loc_8053380
RAM:0805337C                 LSRS            R4, R1, #3
RAM:0805337E                 ADDS            R0, R0, R4
RAM:08053380
RAM:08053380 loc_8053380                             ; CODE XREF: CalColumn+96↑j
RAM:08053380                 MOV             R3, R12
RAM:08053382                 MOVS            R4, #2
RAM:08053384                 RORS            R3, R4
RAM:08053386                 TST             R2, R3
RAM:08053388                 BEQ             loc_805338E
RAM:0805338A                 LSRS            R4, R1, #2
RAM:0805338C                 ADDS            R0, R0, R4
RAM:0805338E
RAM:0805338E loc_805338E                             ; CODE XREF: CalColumn+A4↑j
RAM:0805338E                 MOV             R3, R12
RAM:08053390                 MOVS            R4, #1
RAM:08053392                 RORS            R3, R4
RAM:08053394                 TST             R2, R3
RAM:08053396                 BEQ             loc_805339C
RAM:08053398                 LSRS            R4, R1, #1
RAM:0805339A                 ADDS            R0, R0, R4
RAM:0805339C
RAM:0805339C loc_805339C                             ; CODE XREF: CalColumn+16↑j
RAM:0805339C                                         ; CalColumn+8C↑j ...
RAM:0805339C                 POP             {R4}
RAM:0805339E                 CMP             R4, #0
RAM:080533A0                 BPL             loc_80533A4
RAM:080533A2                 NEGS            R0, R0
RAM:080533A4
RAM:080533A4 loc_80533A4                             ; CODE XREF: CalColumn+BC↑j
RAM:080533A4                 POP             {R4}
RAM:080533A6                 MOV             PC, LR
RAM:080533A8 ; ---------------------------------------------------------------------------
RAM:080533A8
RAM:080533A8 loc_80533A8                             ; CODE XREF: CalColumn+4↑j
RAM:080533A8                 PUSH            {LR}
RAM:080533AA                 BL              nullsub_1
RAM:080533AE                 MOVS            R0, #0
RAM:080533B0                 POP             {PC}
RAM:080533B0 ; End of function CalColumn
RAM:080533B0
RAM:080533B0 ; ---------------------------------------------------------------------------
RAM:080533B2                 DCB    0
RAM:080533B3                 DCB    0




unsigned int __fastcall sub_80532E4(unsigned int result, unsigned int a2)
{
  unsigned int v2; // r3
  int v3; // r2
  unsigned int v4; // r12
  unsigned int v5; // r2
  signed int v6; // [sp-8h] [bp-8h]

  v2 = 1;
  if ( a2 )
  {
    if ( (a2 & 0x80000000) != 0 )
      a2 = -a2;
    v6 = result;
    if ( (result & 0x80000000) != 0 )
      result = -result;
    if ( result >= a2 )
    {
      while ( a2 < 0x10000000 && a2 < result )
      {
        a2 *= 16;
        v2 *= 16;
      }
      while ( a2 < 0x80000000 && a2 < result )
      {
        a2 *= 2;
        v2 *= 2;
      }
      while ( 1 )
      {
        v3 = 0;
        if ( result >= a2 )
          result -= a2;
        if ( result >= a2 >> 1 )
        {
          result -= a2 >> 1;
          v3 = __ROR4__(v2, 1);
        }
        if ( result >= a2 >> 2 )
        {
          result -= a2 >> 2;
          v3 |= __ROR4__(v2, 2);
        }
        if ( result >= a2 >> 3 )
        {
          result -= a2 >> 3;
          v3 |= __ROR4__(v2, 3);
        }
        v4 = v2;
        if ( !result )
          break;
        v2 >>= 4;
        if ( !v2 )
          break;
        a2 >>= 4;
      }
      v5 = v3 & 0xE0000000;
      if ( v5 )
      {
        if ( (v5 & __ROR4__(v4, 3)) != 0 )
          result += a2 >> 3;
        if ( (v5 & __ROR4__(v4, 2)) != 0 )
          result += a2 >> 2;
        if ( (v5 & __ROR4__(v4, 1)) != 0 )
          result += a2 >> 1;
      }
    }
    if ( v6 < 0 )
      return -result;
  }
  else
  {
    nullsub_1(result);
    return 0;
  }
  return result;
}