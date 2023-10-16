.func PrintEcardAppearTextChinese
    push r3-r7,lr
    lsl r2,r0,3         ;r2 = TextlistNum * 8
    add r2,r2,r0        ;r2 = TextlistNum * 9
    lsl r2,r2,4         ;r2 = TextlistNum * 144
    .hword 0x4614 ;mov r4,r2           ;r4 = TextlistNum * 144
    .hword 0x460F ;mov r7,r1           ;r7 = TextPrintNum
    .hword 0x4638 ;mov r0,r7           ;r0 = TextPrintNum
    mov r1,0x18         ;r1 = 24
    bl CalRowCopy
    .hword 0x4606 ;mov r6,r0           ;r6 = RowIndex
    .hword 0x4638 ;mov r0,r7           ;r0 = TextPrintNum
    mov r1,0x18         ;r1 = 24
    bl CalColumnCopy
    .hword 0x4607 ;mov r7,r0           ;r7 = ColumnIndex
    lsl r1,r6,1         ;r1 = RowIndex * 2
    add r1,r1,r6        ;r1 = RowIndex * 3
    lsl r1,r1,0x4       ;r1 = RowIndex * 48
    add r4,r4,r1        ;r4 = TextlistNum * 144 +RowIndex * 48
    ldr r2,=TextOfEcard ;0x0868AF5C
    add r4,r4,r2        ;textptr(r4) = EcardText_0 + 144 * TextlistNum + 48 * RowIndex;
    mov r5,0x18
    mov r3,0

@@PrintLineLoop:
    mov r1,0
    ldrsh r0,[r4,r1]
    lsl r0,r0,0x10
    lsr r0,r0,0x10
    .hword 0x4619 ;mov r1,r3
    bl FixTextGfx
    mov r1,0x3A
    mov r2,0
    ldrsh r0,[r4,r2]
    lsl r0,r0,0x10
    lsr r0,r0,0x10
    lsr r0,r0,8
    cmp r0,r1
    ble @@JpFont
    add r2,4

@@JpFont:
    add r2,8
    add r3,r3,r2
    cmp r3,0xC0
    bge @@Print
    add r4,2
    sub r5,1
    cmp r5,0
    bge @@PrintLineLoop

@@Print:
    lsl r0,r7,5   ;0x20 * ColumnIndex
    lsl r2,r6,0xB ;0x800 * RowIndex
    add r2,r2,r0   ;0x20 * ColumnIndex + 0x800 * RowIndex
    ldr r1,=0x0203A000
    add r0,r0,r1   ;0x0203A000 + 0x20 * ColumnIndex
    ldr r1,=0x03001800
    add r1,r1,r2  ;0x03001800 + 0x20 * ColumnIndex + 0x800 * RowIndex
    mov r2,1
    mov r3,2
    bl Load2RamCopy
    ldr r0,=0x0806DB1C
    ldr r1,=0x0203A000
    mov r2,0x18
    ;mov r3,2 ;代码未写进去，需补回，待更新
    bl Load2RamCopy
    pop r3-r7

@@End:
    ldr r0,=(PrintEcardAppearText + 0x60);0x08003874
    mov pc,r0
.pool
.endfunc
    .word 0xFFFFFFFF

/*
int __fastcall PrintEcardAppearText(char TextlistNum, char TextPrintNum)
{
  int RowIndex; // r6
  char ColumnIndex; // r7
  int v7; // [sp+Ch] [bp-4h]

    RowIndex(r6) = (char)CalRow(TextPrintNum, 24u);
    ColumnInde(r7) = CalColumn(TextPrintNum, 24u);
    textptr(r4) = EcardText_0 + 72 * TextlistNum + 48 * RowIndex;
    stringwidth(r3) = 0;
    for( textlength(r5) = 24; textlength >=0; --textlength)
    {
      Currenttext(r0) = *textptr; 
      FixTextGfx(Currenttext,stringwidth);
      if(Currenttext > 0x3A00)
        width = 12;  //汉字12
      else
        width = 8;   //日文8
      stringwidth += width;
      if(stringwidth >= 0xC0)
        break;
      ++textptr;
    }
    Load2Ram(Ram_0203A000 + 0x20 * ColumnIndex, Ram_03001800_1 + 0x800 * RowIndex + 0x20 * ColumnIndex, 1, 2);
    load2Ram(0x0806DB1C, Ram_0203A000, 24, 2);

  return v7;
}
*/