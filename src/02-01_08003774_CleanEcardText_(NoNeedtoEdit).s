.func CleanEcardText;0x08003774
    push r4-r7,lr
    mov r1,0
    ldr r7,=0x03001800

@@Loop1:
    mov r5,0
    lsl r0,r1,0xB
    add r6,r1,1
    add r4,r7,r0

@@Loop2:
    ldr r0,=GfxOfJPFont8x16;0x0807977C
    mov r1,r4
    mov r2,1
    mov r3,2
    bl Load2Ram
    add r4,0x20
    add r5,1
    cmp r5,0x17
    ble @@Loop2
    mov r1,r6
    cmp r1,2
    ble @@Loop1
    pop r4-r7
    pop r0
    bx r0
.pool
.endfunc

/*
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
*/