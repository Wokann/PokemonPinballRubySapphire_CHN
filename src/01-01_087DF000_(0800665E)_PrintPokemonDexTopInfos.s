PrintPokemonDexTopInfos
.org 0x665E
ldr r0, =0x087DF000
mov pc,r0
0x087DF000
back. 0x6734

PrintPokemonDexTopInfos
.org 0x087DF000
ldr r0,=0x0202A170
asr r2,r7,#0x10
lsl r1,r2,#1
add r1,r1,r0
mov r3,#0
ldrsh r0,[r1,r3]
cmp r0,#0
ble _hyphen

_text1
ldr r0,=0x0805A430
mov r1,#0xBC
mul r1,r2
add r0,#0x16
add r4,r1,r0
mov r5,#4
mov r3,#0

_titlenamecycle
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
add r4,#2
sub r5,#1
cmp r5,#0
bge _titlenamecycle
b _print

_hyphen
movs r5,#4
movs r3,#0

_titlehyphencycle
mov r0,#0xF8
mov r1,#0xA2
lsl r0,r0,#8
add r0,r0,r1
mov r1,r3
bl 0x087E0000   ;FixTextGfx
add r3,#0xC
sub r5,#1
bge _titlehyphencycle

_print
ldr r0,=0x0203A000
ldr r1,=0x06004C00
mov r2,#8
mov r3,#2
bl 0x087E0134    ;Load2Ram
ldr r0,=0x0806DB1C
ldr r1,=0x0203A000
mov r2,#8
mov r3,#2
bl 0x087E0134    ;Load2Ram
b _category
0x0202A170
0x0805A430
0x0203A000
0x06004C00
0x0806DB1C

_category 
.org 0x087DF0A0
ldr r1,=0x0202A170
asr r2,r7,#0x10
lsl r0,r2,#1
add r0,r0,r1
mov r3,#0
ldrsh r0,[r0,r3]
cmp r0,#1
beq _text2
cmp r0,#2
ble _hyphen2

_text2
ldr r0,=0x0805A430
mov r1,#0xBC
mul r1,r2
add r0,#0x20
add r4,r1,r0
mov r5,#4
mov r3,#0

_titlecategorycycle
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
ble _jpfont2
add r2,#4
_jpfont2
add r2,#8
add r3,r3,r2
add r4,#2
sub r5,#1
cmp r5,#0
bge _titlecategorycycle
b _print2

_hyphen2
movs r5,#4
movs r3,#0

_titlehyphencycle2
mov r0,#0xF8
mov r1,#0xA2
lsl r0,r0,#8
add r0,r0,r1
mov r1,r3
bl 0x087E0000   ;FixTextGfx
add r3,#0xC
sub r5,#1
bge _titlehyphencycle2

_print2
ldr r0,=0x0203A000
ldr r1,=0x06004D00
mov r2,#8
mov r3,#2
bl 0x087E0134    ;Load2Ram
ldr r0,=0x0806DB1C
ldr r1,=0x0203A000
mov r2,#8
mov r3,#2
bl 0x087E0134    ;Load2Ram
ldr r0,=0x08006734
mov pc,r0
0x0202A170
0x0805A430
0x0203A000
0x06004D00
0x0806DB1C
0x08006734

MapOfDexTile
0x0806C71C

PrintPokemonDexTopInfos
{
  if ( Ram_0202A170_1[v2(r7) >> 16] <= 0 )
  {
    stringwidth = 0;
    for( textlength = 5; textlength >=0; --textlength)
    {
      Currenttext = 0xF8A2;//图鉴抬头名-----
      FixTextGfx(Currenttext,stringwidth);
      stringwidth += 12;
    }
  }
  else
  {
    textptr(r4) = (__int16 *)(0xBC * (v2 >> 16) + PokemonDex_0 + 0x16);// 图鉴抬头名
    stringwidth = 0;
    width = 0
    for( textlength(r5) = 5; textlength >=0; --textlength)
    {
      Currenttext = *textptr; 
      FixTextGfx(Currenttext,stringwidth);
      if(Currenttext > 0x3A00)
        width = 12;  //汉字12
      else
        width = 8;   //日文8
      stringwidth += width;
      ++textptr;
    }
  }
  Load2Ram(Ram_0203A000, Ram_06004C00, 8, 2);
  load2Ram(0x0806DB1C, Ram_0203A000, 8, 2);
  v10 = Ram_0202A170_2[v2 >> 16];
  if ( v10 == 1 || v10 > 2 )
  {
    textptr_2 = (__int16 *)(188 * (v2 >> 16) + PokemonDex + 32);// 图鉴抬头分类名
    stringwidth = 0;
    width = 0
    for( textlength = 5; textlength >=0; --textlength)
    {
      Currenttext = *textptr_2; 
      FixTextGfx(Currenttext,stringwidth);
      if(Currenttext > 0x3A00)
        width = 12;  //汉字12
      else
        width = 8;   //日文8
      stringwidth += width;
      ++textptr;
    }
  }
  else
  {
    stringwidth = 0;
    for( textlength = 5; textlength >=0; --textlength)
    {
      Currenttext = 0xF8A2;//图鉴抬头分类-----
      FixTextGfx(Currenttext,stringwidth);
      stringwidth += 12;
    }
  }
  Load2Ram(Ram_0203A000, Ram_06004D00, 8, 2);
  load2Ram(0x0806DB1C, Ram_0203A000, 8, 2);
}