;此函数用于显示E卡文本光标闪烁
;与LenghtOfEcard关联，用于确定光标位置
;已在HackInOrigin中修改字模指针（新字模改用红蓝宝石字模，增添了阴影）
.func PrintEcardArrayAppearOrDisppear;0x08003884
    push r4-r6,lr
    mov r5,r0
    mov r6,r1
    lsl r6,r6,0x10
    lsr r6,r6,0x10
    lsl r5,r5,0x18
    asr r5,r5,0x18
    mov r0,r5
    mov r1,0x18
    bl CalRow
    mvo r4,r0
    lsl r4,r4,0x18
    asr r4,r4,0x18
    mov r0,r5
    mov r1,0x18
    bl CalColumn
    lsl r0,r0,0x18
    ldr r1,=GfxOfJPFont8x16
    add r6,r6,r1
    lsl r4,r4,0xB
    asr r0,r0,0x13
    ldr r1,=0x03001800
    add r0,r0,r1
    add r4,r4,r0
    mov r0,r6
    mov r1,r4
    mov r2,1
    mov r3,2
    bl Load2Ram
    pop r4-r6
    pop r0
    bx r0
.pool
.endfunc

/*
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
*/