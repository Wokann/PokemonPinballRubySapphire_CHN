0x02019C0C-用于判断是否接入在gameboyplayer上
0-no 1-active

相关函数：
0xEB0 (bool) 判断是否接入gameboypalyer。
    可将
    0xFC6 00 20 mov r0,#0
    改为
    0xFC6 01 20 mov r0,#1
    强制识别为gbp

0xFE0 读取0xEB0的结果，写入0x02019C0C地址。



0x02019C00 震动类型?        0-norumble 1-may rumble? 2-rumble
0x02019C10 震动相关值？ @djedditt调用此值



0x0200294A 震动选项开/关   0-off 1-on
0x0200294E 火稚鸡图标震动  0-normal 1-rumble


TYPE1
#define GPIO_Data      0x080000C4
#define GPIO_Direction 0x080000C6
#define GPIO_Control   0x080000C8

RumblePrepare
{
    *(GPIO_Control) = 0x1; //GPIO_Control.bit0 = 1
    *(GPIO_Direction) = 0x8; //GPIO_Direction.bit3 = 1
}

RumbleStart
{
    *(GPIO_Data) = 0x8; //GPIO_Data.bit3 = 1
}

RumbleEnd
{
    *(GPIO_Data) = 0x0; //GPIO_Data.bit3 = 0
}

TYPE2
RumblePrepare
{
    *(0x09FE0000) = 0xD200;
    *(0x08000000) = 0x1500;
    *(0x08020000) = 0xD200;
    *(0x08040000) = 0x1500;
    *(0x09E20000) = data;     //data = 0xF1 in ezode rumble patch tutorial
    *(0x09FC0000) = 0x1500;
}

RumbleStart
{
    *(0x08001000) = 0x2;
}

RumbleEnd
{
    *(0x08001000) = 0x0;
}