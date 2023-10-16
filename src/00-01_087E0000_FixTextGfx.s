.func FixTextGfx
    push r3-r7, lr
    mov r7, r8
    push r7
    mov r3, r0
    mov r2, r1
    mov r0, r2
    cmp r2, 0
    bge @@CalStartBlockAndStartPiexl
    add r0, r2, 7

@@CalStartBlockAndStartPiexl:
    asr r4, r0, 3
    mov r0, r4
    lsl r1, r0, 3
    sub r4, r2, r1
    ldr r7, =0x02038000
    lsl r0, r0, 5
    ldr r1, =0x0203A000
    add r6, r0, r1
    ldr r0, =0x00004DFF
    cmp r3, r0
    ble @@GetJapGlyphAndWidth

@@GetChsGlyphAndWidth:
    mov r0, 0x10
    mov r8, r0
    mov r0, r3
    bl ConvertFont2Charmap12x12
    mov r3, r0
    b @@TempStoreGlyph
.pool

@@GetJapGlyphAndWidth:
    mov r1, 8
    mov r8, r1

@@TempStoreGlyph:
    ldr r0, =0x086AA000;JapGlyph8x16
    add r1, r3, r0
    mov r0, r8
    lsl r0, r0, 0xd
    lsr r5, r0, 0x10
    mov r0, r1
    mov r1, r7
    mov r2, r5
    mov r3, 2
    bl Load2RamCopy

@@CheckIfStartPiexlEqu0:
    cmp r4, 0
    bne @@CheckIfStartPiexlEqu4
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, 2
    bl Load2RamCopy
    b @@End
.pool

@@CheckIfStartPiexlEqu4:
    cmp r4, 4
    bne @@End

@@StartCombineGlyph:
    mov r0, r6
    mov r2, 0x80
    lsl r2, r2, 3
    add r6, r0, r2
    mov r1, 0x84
    lsl r1, r1, 3
    add r4, r0, r1
    mov r3, r7
    add r5, r3, r2
    add r7, r3, r1
    mov r1, 7
    mov r12, r1
    mov r2, r0
  
@@CombineLoop:
    ldr r1, [r3]
    lsl r1, r1, 0x10
    ldr r0, [r2]
    orr r0, r1
    str r0, [r2]
    ldr r1, [r5]
    lsl r1, r1, 0x10
    ldr r0, [r6]
    orr r0, r1
    str r0, [r6]
    mov r1, 2
    ldrsh r0, [r3, r1]
    str r0, [r2, 0x20]
    mov r1, 2
    ldrsh r0, [r5, r1]
    str r0, [r4]
    mov r0, r8
    cmp r0, 0x10
    bne @@AddGlyphPiexlColumn

@@CombineChsGlyph:
    ldr r1, [r3, 0x20]
    lsl r1, r1, 0x10
    ldr r0, [r2, 0x20]
    orr r0, r1
    str r0, [r2, 0x20]
    ldr r1, [r7]
    lsl r1, r1, 0x10
    ldr r0, [r4]
    orr r0, r1
    str r0, [r4]

@@AddGlyphPiexlColumn:
    add r2, 4
    add r6, 4
    add r4, 4
    add r3, 4
    add r5, 4
    add r7, 4
    mov r1, 1
    neg r1, r1
    add r12, r1
    mov r0, r12
    cmp r0, 0
    bge @@CombineLoop

@@End:
    pop r3
    mov r8, r3
    pop r3-r7
    pop r0
    bx r0
.endfunc
    .byte 00,00

/*
void FixTextGfx(int Currenttext,int stringwidth)//0x087E0000
{
    int width;
    int *TempStoreBase;
    int *RamTempStore;
    int *FixStoreBase;

    int startblock = stringwidth / 8;
    int startpiexl = stringwidth % 8;// = stringwidth - startblock * 8;

    TempStoreBase = (int*)0x02038000;
    RamTempStore = (int*)0x0203A000;
    FixStoreBase = RamTempStore + 0x8 * startblock;

    if(Currenttext >= 0x4E00)
    {  
      width = 16;  //汉字16
      Currenttext = ConvertFont2Charmap(Currenttext);
    }
    else
      width = 8;   //日文8
    Load2Ram((0x086AA000 + Currenttext), (int)TempStoreBase, (width/8), 2);

    if(startpiexl == 0)
      Load2Ram((int)TempStoreBase, (int)FixStoreBase, (width/8), 2);
    else if(startpiexl == 4)
    {
        int i = 0;
        int *FixStoreTop1, *FixStoreTop2, *FixStoreBottom1, *FixStoreBottom2;
        int *TempStoreTop1, *TempStoreTop2, *TempStoreBottom1, *TempStoreBottom2;

        FixStoreTop1 = FixStoreBase;
        FixStoreTop2 = FixStoreBase + 0x20;
        FixStoreBottom1 = FixStoreBase + 0x400;
        FixStoreBottom2 = FixStoreBase + 0x420;
        TempStoreTop1 = TempStoreBase;
        TempStoreTop2 = TempStoreBase + 0x20;
        TempStoreBottom1 = TempStoreBase + 0x400;
        TempStoreBottom2 = TempStoreBase + 0x420;
        
        for(i = 0; i < 8; i++)
        {
            *FixStoreTop1 |= *TempStoreTop1 << 16;
            *FixStoreBottom1 |= *TempStoreBottom1 << 16;
            *FixStoreTop2 = *TempStoreTop1 >> 16;
            *FixStoreBottom2 = *TempStoreBottom1 >> 16;
            if(width == 16)
            {
                *FixStoreTop2  |= *TempStoreTop2 << 16;
                *FixStoreBottom2 |= *TempStoreBottom2 << 16;
            }
            FixStoreTop1 += 1;
            FixStoreTop2 += 1;
            FixStoreBottom1 += 1;
            FixStoreBottom2 += 1;
            TempStoreTop1 += 1;
            TempStoreTop2 += 1;
            TempStoreBottom1 += 1;
            TempStoreBottom2 += 1;
        }
    }
}
*/