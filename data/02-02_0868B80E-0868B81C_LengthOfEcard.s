;此处每条文本长度，与TextOfEcard绑定，用于显示闪烁的“↓”位置
.org LengthOfEcardChinese
;[0]准备连接
    .byte 0x41
;[1]E卡A002（客串）通讯成功
    .byte 0x07
;[2]E卡A002（客串）介绍
    .byte 0x25
;[3]E卡A005（稀有）通讯成功
    .byte 0x07
;[4]E卡A005（稀有）介绍
    .byte 0x22
;[5]E卡A004（豪华）通讯成功
    .byte 0x07
;[6]E卡A004（豪华）介绍1
    .byte 0x0A
;[7]E卡A004（豪华）介绍2
    .byte 0x29
;[8]E卡A004（豪华）介绍3
    .byte 0x29
;[9]E卡A003（遗迹）通讯成功
    .byte 0x07
;[10]E卡A003（遗迹）介绍
    .byte 0x3B
;[11]E卡A001（奖励）通讯成功
    .byte 0x07
;[12]E卡A001（奖励）介绍
    .byte 0x10
;[13]通讯失败1
    .byte 0x07
;[14]通讯失败2
    .byte 0x22

/*
.org LengthOfEcard
;[0]准备连接
    .byte 0x35
;[1]E卡A002（客串）通讯成功
    .byte 0x0F
;[2]E卡A002（客串）介绍
    .byte 0x34
;[3]E卡A005（稀有）通讯成功
    .byte 0x0F
;[4]E卡A005（稀有）介绍
    .byte 0x23
;[5]E卡A004（豪华）通讯成功
    .byte 0x0F
;[6]E卡A004（豪华）介绍1
    .byte 0x10
;[7]E卡A004（豪华）介绍2
    .byte 0x2A
;[8]E卡A004（豪华）介绍3
    .byte 0x35
;[9]E卡A003（遗迹）通讯成功
    .byte 0x0F
;[10]E卡A003（遗迹）介绍
    .byte 0x41
;[11]E卡A001（奖励）通讯成功
    .byte 0x0F
;[12]E卡A001（奖励）介绍
    .byte 0x17
;[13]通讯失败1
    .byte 0x0F
;[14]通讯失败2
    .byte 0x29
*/
