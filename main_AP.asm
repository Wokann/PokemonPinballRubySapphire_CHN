.gba
.thumb
.create "./Pokemon_Pinball_chs_v1.2_AP.gba",0x08000000
.close
.open "./Pokemon_Pinball_chs_v1.2.gba","./Pokemon_Pinball_chs_v1.2_AP.gba",0x08000000

.org 0x080000A0
    .ascii "DRILL DOZER" :: .byte 0x00 :: .ascii "V49E"
.skip 0xD
    .byte 0xCD

.close