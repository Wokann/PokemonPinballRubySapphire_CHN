;原句为“皮卡丘”“已捕获!”
;实际只需用改后半部分，“皮卡丘”估计只是演示用

;不同于原日文已捕获宝可梦名列表为单字节编码
;此处的宝可梦名及捕获提示均为双字节编码

.loadtable "./charmap_16x16_2.txt"
.org TextOfCaughtChinese + 0xA
    .strn "已捕获!"

/*
.loadtable "./charmap_16x16_2.txt"
.org TextOfCaught
    .strn "ピカチュウ"  ;pikachu    0x08693238
    .strn "ゲット!"     ;get!       0x08693242
*/
