.func ConvertFont2Charmap16x16
    push r2-r7, lr
    mov r3, r0
    mov r4, 0
    ldr r5, =333        ;仅包含丰缘图鉴宝可梦名及“已捕获”和空格
    ldr r6, =0x087EE404 ;(ConvertFont2Charmap16x16Table + 4)
    sub r7, r6, 4

@@CompareLoop:
    cmp r4, r5
    bgt @@End

@@CalSearchResult:
    add r0, r4, r5
    lsr r1, r0, 0x1f
    add r0, r0, r1
    asr r1, r0, 1
    lsl r2, r1, 3
    add r0, r2, r7
    ldr r0, [r0]

@@CheckIfLarger:
    cmp r0, r3
    ble @@CheckIfSmaller

@@ResultLarger:
    sub r5, r1, 1
    b @@CompareLoop
.pool

@@CheckIfSmaller:
    cmp r0, r3
    bge @@ResultMatch

@@ResultSmaller:
    add r4, r1, 1
    b @@CompareLoop

@@ResultMatch:
    add r0, r2, r6
    ldr r3, [r0]

@@End:
    mov r0, r3
    pop r2-r7
    pop r1
    bx r1
.endfunc
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff




/*
int ConvertFont2Charmap_16x16(int Currenttext)
{
    int left = 0;
    int right = FONT_COUNT - 1;
    int mid;
    int searchtext;
    while(left <= right)
    {
        mid = (left + right) / 2;
        searchtext = Font2Charmap_16x16[mid].font;
        if(searchtext > Currenttext)
            right = mid - 1;
        else if(searchtext < Currenttext)
            left = mid + 1;
        else
        {
            Currenttext = Font2Charmap_16x16[mid].charmap;
            break;
        }
    }
    return Currenttext;
}
*/