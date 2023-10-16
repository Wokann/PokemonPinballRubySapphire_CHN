.func PrintEcardInstantTextChinese
    .hword 0x4617 ;mov r7,r2
    add r7,1        ;nextGroupIndex = groupIndex + 1;
    lsl r1,r2,1        ;r1 = groupIndex * 2
    add r1,r1,r2        ;r1 = groupIndex * 3
    lsl r1,r1,4        ;r1 = groupIndex * 48
    lsl r0,r2,4        ;r0 = groupIndex * 16;无用，下次可删，待更新修改
    lsl r0,r2,0xB      ;r0 = groupIndex * 2048
    ldr r2,=0x03001800  ;
    add r6,r0,r2        ;dataPointer = Ram_03001800_0 + groupIndex * 2048
    mov r0,r8          ;r0 = 0x90 * TextlistNum
    add r0,r9          ;r0 = 0x90 * TextlistNum + baseaddress
    .hword 0x4604 ;mov r4,r0
    add r4,r4,r1       ;textptr = groupIndex * 48 + 0x90 * TextlistNum + baseaddress
    mov r5,0x18        ;textlength = 24
    mov r3,0

@@EcardLineLoop:
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
    bge @@EcardLineLoop

@@Print:
    ldr r0,=0x0203A000
    .hword 0x4631 ;mov r1,r6
    mov r2,0x18
    mov r3,2
    bl Load2RamCopy
    ldr r0,=0x0806DB1C
    ldr r1,=0x0203A000
    mov r2,0x18
    mov r3,2
    bl Load2RamCopy

@@End:
    ldr r0,=(PrintEcardInstantText + 0x4A);0x0x080037F6
    mov pc,r0
.pool
.endfunc
    .word 0xFFFFFFFF
    
/*
PrintEcardInstantText
{
  groupIndex(r2) = 0;
  baseaddress(r9) = (char *)EcardText;
  charOffset(r8) = 0x90 * TextlistNum;
  do
  {
    rowIndex = groupIndex + 1;
    dataPointer = Ram_03001800_0 + groupIndex * 2048
    *textptr = &baseaddress + 0x30 * groupIndex + charOffset;
    stringwidth = 0;
    for( textlength = 24; textlength >=0; --textlength)
    {
      Currenttext = *textptr; 
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
    Load2Ram(Ram_0203A000, dataPointer, 24, 2);
    load2Ram(0x0806DB1C, Ram_0203A000, 24, 2);
    groupIndex = rowIndex;
  }
  while ( rowIndex <= 2 );
}
*/