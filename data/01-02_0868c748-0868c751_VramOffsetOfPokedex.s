;宝可梦图鉴界面内，列表的5个名字预先存放于显存内
;由于汉字长度5*12=60，大于旧有字体5*8=40
;故需要修改存放在显存内的偏移地址

.org VramOffsetOfPokedexChinese
    .hword 0x4E00
    .hword 0x5400
    .hword 0x5500
    .hword 0x5600
    .hword 0x5700

/*
.org VramOffsetOfPokedex
    .hword 0x4D40
    .hword 0x4DE0
    .hword 0x4E80
    .hword 0x4F20
    .hword 0x5400
*/