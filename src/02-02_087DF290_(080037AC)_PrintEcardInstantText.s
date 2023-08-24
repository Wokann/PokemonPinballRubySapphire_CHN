PrintEcardInstantText
.org 0x37C6
ldr r0,=0x087DF290
mov pc,r0
0x087DF290
.back 0x37F6

字模地址//似乎没影响？
.org 0x0800380C: 
7C970708 ->
00A06A08

PrintEcardInstantText
.org 0x087DF290
mov r7,r2
add r7,r7,#1        ;nextGroupIndex = groupIndex + 1;
lsl r1,r2,#1        ;r1 = groupIndex * 2
add r1,r1,r2        ;r1 = groupIndex * 3
lsl r1,r1,#4        ;r1 = groupIndex * 48
lsl r0,r2,#0XB      ;r0 = groupIndex * 2048
ldr r2,=0x03001800  ;
add r6,r0,r2        ;dataPointer = Ram_03001800_0 + groupIndex * 2048
mov r0,r8          ;r0 = 0x90 * TextlistNum
add r0,r9          ;r0 = 0x90 * TextlistNum + baseaddress
mov r4,r0
add r4,r4,r1       ;textptr = groupIndex * 48 + 0x90 * TextlistNum + baseaddress
mov r5,#0x18        ;textlength = 24
mov r3,#0

_EcardLine
mov r1,#0
ldrsh r0,[r4,r1]
lsl r0,r0,#10
lsr r0,r0,#10
mov r1,r3
bl 0x087E0000   ;FixTextGfx
mov r1,#3A
mov r2,#0
ldrsh r0,[r4,r2]
lsl r0,r0,#10
lsr r0,r0,#10
lsr r0,r0,#8
cmp r0,r1
ble _jpfont
add r2,#4
_jpfont
add r2,#8
add r3,r3,r2
cmp r3,0xC0
bge _print4
add r4,#2
sub r5,#1
cmp r5,#0
bge _EcardLine

_print4
ldr r0,=0x0203A000
mov r1,r6
mov r2,#0x18
mov r3,#2
bl 0x087E0134    ;Load2Ram
ldr r0,=0x0806DB1C
ldr r1,=0x0203A000
mov r2,#0x18
mov r3,#2
bl 0x087E0134
ldr r0,=0x080037F6
mov pc,r0
0x03001800
0x0203A000
0x0806DB1C
0x080037F6


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