;图鉴相关
.org PrintPokemonDexTopInfos + 0xBA             ;0x0800665E
  ldr r0, =PrintPokemonDexTopInfosChinese       ;0x087DF000
  mov pc,r0
.pool
;.back (PrintPokemonDexTopInfos + 0x190)        ;0x08006734

.org PrintPokemonDexListInfos + 0x106           ;0x080069A6
    ldr r0,=PrintPokemonDexListInfosChinese     ;0x087DF140
    mov pc,r0
.pool
;.back (PrintPokemonDexListInfos + 0x1AA)       ;0x08006A4A

.org PrintPokemonDexDescription + 0x14          ;0x08006C24
    ldr r0,=PrintPokemonDexDescriptionChinese   ;0x087DF210
    mov pc,r0
.pool
;.back (PrintPokemonDexDescription + 0x4C)      ;0x08006C5C

;E卡相关
.org PrintEcardInstantText + 0x1A               ;0x080037C6
    ldr r0,=PrintEcardInstantTextChinese        ;0x087DF290
    mov pc,r0
.pool
;.back (PrintEcardInstantText + 0x4A)           ;0x080037F6
.skip 0x3C                                      ;0x0800380C
    .word GfxOfJP8x16CHS12x12Font               ;0x086AA000 新字模地址，似乎不改也没影响？

.org PrintEcardAppearText                       ;0x08003814
    ldr r2,=PrintEcardAppearTextChinese         ;0x087DF310
    mov pc,r2
.pool
;.back (PrintEcardAppearText + 0x60)            ;0x08003874
.skip 0x60                                      ;0x0800387C
    .word GfxOfJP8x16CHS12x12Font               ;0x086AA000

.org PrintEcardArrayAppearOrDisppear + 0x48     ;0x080038CC
    .word GfxOfJP8x16CHS12x12Font               ;0x086AA000

;;进化及捕获相关
.org PrintEvoName + 0x32                        ;0x0802109A
    ldr r0, =PrintEvoNameChinese                ;0x087DF3B0
    mov pc,r0
.pool
;.back (PrintEvoName + 0x88)                    ;0x080210F0
.skip 0x64                                      ;0x08021108
    .word TextOfCaughtPokemonChinese            ;0x087EEF00

.org PrintCaughtName + 0x50                     ;0x08021228
    ldr r0,=PrintCaughtNameChinese              ;0x087DF430
    mov pc,r0
.pool
;.back (PrintCaughtName + 0xE8)                 ;0x080212C0
.skip 0x114                                     ;0x08021344
    .word TextOfCaughtPokemonChinese            ;0x087EEF00

.org PrintEvoGfxandName + 0x2D0                 ;0x08049B14 case-E
    ldr r0, =PrintEvoGfxandNameCaseEChinese     ;0x087DF520
    mov pc,r0
.pool
;.back (PrintEvoGfxandName + 0x318)             ;0x08049B5C
.skip 0x70                                      ;0x08049B8C case-D
    ldr r0, =PrintEvoGfxandNameCaseDChinese     ;0x087DF5B0
    mov pc,r0
.pool
;.back (PrintEvoGfxandName + 0x3C2)             ;0x08049C06

;;奖励结算相关
;用于解锁8x8码表上限
.org PrintBonusCount + 0x56                     ;0x08045FD6
    lsl r0,r0,0x10
    asr r0,r0,0x10
.skip 0x56                                      ;0x08045E50
    .word GfxOfJPCHSFont8x8

;;GBP底座连接及震动相关函数
.org sub_080010B8 + 0x4                         ;0x080010BC
    mov r2,1                                    ;EnableGBPFunctionRely_02019C0C

.org sub_08001114                               ;0x08001114
    ldr r0,=RumbleEndJump1                      ;0x087DF6B0
    mov pc,r0
.pool
;.back (sub_08001114 + 0x8)                     ;0x0800111C

.org sub_080011F4 + 0x6                         ;0x080011FA
    cmp r0,r0                                   ;EnableGBPFunctionRely_02019C0C
.skip 0xCC                                      ;0x080012C8
    ldr r0,=RumbleStartOrNot                    ;0x087DF680
    mov pc,r0
.pool
;.back (sub_080011F4 + 0x128)                   ;0x0800131c
.skip 0x24                                      ;0x080012F4
    ldr r0,=RumbleEndJump2                      ;0x087DF6E0
    mov pc,r0
.pool
;.back (sub_080011F4 + 0x128)                   ;0x0800131c

.org sub_08001338 + 0x54                        ;0x0800138C
    ldr r1,=RumbleRelyFunction1
    mov pc,r1
.pool
;.back (sub_08001338 + 0x5C)                    ;0x08001394

.org sub_08001824 + 0x34                        ;0x08001858
    ldr r0,=RumbleRelyFunction2
    mov pc,r0
.pool

.org sub_0804ECB4 + 0x186                       ;0x0804EE3A
    cmp r0,r0                                   ;EnableGBPFunctionRely_02019C0C

.org sub_0804EF1C + 0x94                        ;0x0804EFB0
    mov r4,1                                    ;EnableGBPFunctionRely_02019C0C

.org sub_0804F01C + 0xC2                        ;0x0804F0DE
    mov r0,1                                    ;EnableGBPFunctionRely_02019C0C
.skip 0x26                                      ;0x0804F106
    mov r0,1                                    ;EnableGBPFunctionRely_02019C0C
.skip 0x152                                     ;0x0804F25A
    mov r0,1                                    ;EnableGBPFunctionRely_02019C0C
.skip 0x3A                                      ;0x0804F296
    mov r4,1                                    ;EnableGBPFunctionRely_02019C0C
