;汉化主函数存放位置
HackStart1                          equ 0x087E0000
HackStart2                          equ 0x087DF000

;;图鉴相关
TextOfPokedexChinese                equ TextOfPokedex
VramOffsetOfPokedexChinese          equ VramOffsetOfPokedex   
;;E卡相关      
TextOfEcardChinese                  equ TextOfEcard
LengthOfEcardChinese                equ LengthOfEcard
;;进化及捕获相关
TextOfCaughtChinese                 equ TextOfCaught
TextOfCaughtPokemonChinese          equ 0x087EEF00
;;奖励结算相关
TextOfBonusCountChinese             equ TextOfBonusCount


ConvertFont2Charmap12x12Table       equ 0x087E1000
ConvertFont2Charmap16x16Table       equ 0x087EE400

;字体
GfxOfJP8x16CHS12x12Font             equ 0x086AA000
GfxOfJPCHSFont16x16                 equ 0x0878E000
GfxOfJPCHSFont8x8                   equ 0x0879E000

;图片
GfxOfRubyBackgroundTopChinese           equ 0x087F0000 ;2BC9->2BDE(lz77)
                                        ;ptr 0x0804455C: 2C252308 ->087F0000(rev)
GfxOfRubyBackgroundBottomChinese        equ 0x087F2C00 ;220A->2214(lz77)
                                        ;ptr 0x08044560: F8502308 ->087F2C00(rev)
GfxOfSapphireBackgroundTopChinese       equ 0x087F4F00 ;376F->37B6(lz77)
                                        ;ptr 0x08044690: 209A2B08 ->087F4F00(rev)
GfxOfSapphireBackgroundBottomChinese    equ 0x087F8700 ;2045->2088(lz77)
                                        ;ptr 0x08044694: 90D12B08 ->087F8700(rev)
