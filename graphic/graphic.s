;0-Font
.org GfxOfJP8x16CHS12x12Font    ;0x086AA000
    .incbin "./graphic/0-Font/GfxOfJPFontNew8x16.4bpp"
    .incbin "./graphic/0-Font/GfxOfCHSFont12x12.4bpp"

.org GfxOfJPCHSFont16x16        ;0x0878E000
    .incbin "./graphic/0-Font/GfxOfJPCHSFont16x16.4bpp"

.org GfxOfJPCHSFont8x8          ;0x0879E000
    .incbin "./graphic/0-Font/GfxOfJPCHSFont8x8.4bpp"


;1-Dex
.org MapOfPokeDex               ;0x0806C71C;-0x0806CF1B
    .incbin "./graphic/1-Dex/1-1 TileMapOfPokeDex-ch.map"

.org GfxOfSomeTileSOfPokeDex    ;0x0807031C;-0x08070B1B 
    .incbin "./graphic/1-Dex/1-3 SomeTileOfPokeDex-cn.4bpp"

.org GfxOfDexTop                ;0x08071C9C;-0x0807233B 
    .incbin "./graphic/1-Dex/1-4 dextop-cn.4bpp"

.org GfxOfPushSelect            ;0x08073BDC;-0x080745DB 
    .incbin "./graphic/1-Dex/1-5 pushselect-cn.4bpp"

.org GfxOfCompleted             ;0x080745DC;-0x0807475B 
    .incbin "./graphic/1-Dex/1-6 completed-cn.4bpp"

.org GfxOfDexlink1              ;0x0807475C;-0x08074EDB 
    .incbin "./graphic/1-Dex/1-7 Dexlink1-cn.4bpp"

.org GfxOfDexlink2              ;0x08074EDC;-0x080752DB 
    .incbin "./graphic/1-Dex/1-8 Dexlink2-cn.4bpp"

.org GfxOfDexlink3              ;0x080752DC;-0x080757DB 
    .incbin "./graphic/1-Dex/1-9 Dexlink3-cn.4bpp"

.org GfxOfDexlink4              ; 0x080757DC;-0x08075BDB 
    .incbin "./graphic/1-Dex/1-10 Dexlink4-cn.4bpp"

.org GfxOfDexlink5              ;0x08075BDB;-0x08075DDB 
    .incbin "./graphic/1-Dex/1-11 Dexlink5-cn.4bpp"

.org GfxOfPushStart             ;0x0807935C;-0x080794DB 
    .incbin "./graphic/1-Dex/1-12 pushstart-cn.4bpp"

.org GfxOfDexCompleted          ;0x08088BDC;-0x0808A59C
    .incbin "./graphic/1-Dex/1-13 DexCompleted-cn.4bpp"


;2-Ecard
.org PalOfPokeDex               ;0x0807375C
    .incbin "./graphic/2-Ecard/PalOfPokeDex-cn.gbapal"

.org GfxOfEcardRoom             ;0x0806AE3C;-0x086B4FB
    .incbin "./graphic/2-Ecard/2-2 EcardRoom-cn.4bpp"


;3-hiscore
.org GfxOfHiScoreTop            ;0x0807E91C;-0x0807F79B 
    .incbin "./graphic/3-hiscore/3-1 hiscoretop-cn.4bpp"

.org GfxOfHiScorePushStart      ;0x0808709C;-0x0808721B 
    .incbin "./graphic/3-hiscore/3-2 hiscorepushstart-cn.4bpp"

.org GfxOfHiLink                ;0x080873DC;-0x08088BDB
    .incbin "./graphic/3-hiscore/3-3 hilink-cn.4bpp"


;4-title
.org GfxOfLogo                  ;0x08105E9C;-0x0810DE9B
    .incbin "./graphic/4-title/4-1 logo-cn.8bpp"

.org GfxOfTitleMenu1            ;0x0810DE9C;-0x08114E9B
    .incbin "./graphic/4-title/4-2 title_menu1-cn.4bpp"

.org GfxOfTitleMenu2            ;0x08114EBC;-0x0811BEBB
    .incbin "./graphic/4-title/4-3 title_menu2-cn.4bpp"

.org GfxOfPushStartTitle        ;0x0838D584;-0x0838D6A3 
    .incbin "./graphic/4-title/4-5 pushstart-cn.4bpp"


;5-setting
.org GfxOfSetting               ;0x0850F3E0;-0x08510BDF  
    .incbin "./graphic/5-setting/5-1 setting-cn.4bpp"

.org GfxOfSettingTop            ;0x08511540;-0x08511BFF 
    .incbin "./graphic/5-setting/5-2 settingtop-cn-v1.2.4bpp"

.org GfxOfButton                ;0x08512440;-0x08512C3F 
    .incbin "./graphic/5-setting/5-3 button-cn.4bpp"


;6-table
.org GfxOfSelectTableTop        ;0x0808B53C;-0x0808BBFB 
    .incbin "./graphic/6-table/6-1 selecttabletop-cn.4bpp"

.org GfxOfSelecttableName       ;0x0808BBFC;-0x0808C23B 
    .incbin "./graphic/6-table/6-2 selecttablename-cn.4bpp"

.org GfxOfSelectMode            ;0x08093C3C;-0x0809543B 
    .incbin "./graphic/6-table/6-3 selectmode-cn.4bpp"

.org GfxOfEvolution1            ;0x0813CA60;-0x0813D45F
    .incbin "./graphic/6-table/6-4 evolution1-cn.4bpp"

.org GfxOfEvolution2            ;0x0813D660;-0x0813D71F
    .incbin "./graphic/6-table/6-5 evolution2-cn.4bpp"

.org GfxOfRubyTable             ;0x08241B04;-0x0824FF03
    .incbin "./graphic/6-table/6-6 rubytable-cn.4bpp"

.org GfxOfSapphireTable         ;0x082BF1D8;-0x082C6DD7
    .incbin "./graphic/6-table/6-7 sapphiretable-cn.4bpp"

.org GfxOfPause1                ;0x08442204;-0x08442363
    .incbin "./graphic/6-table/6-8 pause-cn.4bpp"

.org GfxOfPause2                ;0x08447764
    .incbin "./graphic/6-table/6-8 pause-cn.4bpp"

.org GfxOfPause3                ;0x0844B884
    .incbin "./graphic/6-table/6-8 pause-cn.4bpp"

.org GfxOfPause4                ;0x0844DF24
    .incbin "./graphic/6-table/6-8 pause-cn.4bpp"

.org GfxOfPause5                ;0x08450D44
    .incbin "./graphic/6-table/6-8 pause-cn.4bpp"

.org GfxOfPause6                ;0x08453BE4
    .incbin "./graphic/6-table/6-8 pause-cn.4bpp"

.org GfxOfPause7                ;0x084593A4
    .incbin "./graphic/6-table/6-8 pause-cn.4bpp"

.org GfxOfPause8                ;0x0845E324
    .incbin "./graphic/6-table/6-8 pause-cn.4bpp"

.org GfxOfSoldOut               ;0x08467044;-0x084672C3
    .incbin "./graphic/6-table/6-9 soldout-cn.4bpp"

.org GfxOfTableShop             ;0x08467544;-0x08468743
    .incbin "./graphic/6-table/6-10 tableshop-cn.4bpp"

.org GfxOfTableEvo              ;0x08468744;-0x0846A243
    .incbin "./graphic/6-table/6-11 tableevo-cn.4bpp"

.org GfxOfCenterChange          ;0x084DCFC4;-0x084E06C3
    .incbin "./graphic/6-table/6-12 centerchange-cn.4bpp"

.org GfxOfBallSave              ;0x084E75C4;-0x084E83C3
    .incbin "./graphic/6-table/6-13 ballsave-cn.4bpp"

.org GfxOfBonusCount            ;0x084EA6C4;-0x084EAC43 
    .incbin "./graphic/6-table/6-14 endcount-cn.4bpp"

.org GfxOfEvoMode1              ;0x084EC044;-0x084ED043 
    .incbin "./graphic/6-table/6-15 evomode1-cn.4bpp"

.org GfxOfEvoMode2              ;0x084EE204;-0x084EF203 
    .incbin "./graphic/6-table/6-16 evomode2-cn.4bpp"

.org GfxOfGameOver              ;0x084F03C4;-0x084F07C3
    .incbin "./graphic/6-table/6-17 gameover-cn.4bpp"

.org GfxOfMoveMode              ;0x084F4B44;-0x084F69E3 
    .incbin "./graphic/6-table/6-18 movemode-cn.4bpp"

;.org GfxOfPause9                ;0x084F7864;-0x084F7A03 
;    .incbin "./graphic/6-table/"

.org GfxOfGetMode1              ;0x08509064;-0x0850B123
    .incbin "./graphic/6-table/6-20 getmode1-cn.4bpp"

.org GfxOfEvoMode1add           ;0x084EDE44;-0x084EE143
    .incbin "./graphic/6-table/6-21 evomode1-2-cn.4bpp"

.org GfxOfEvoMode2add           ;0x084F0004;-0x084F0303 
    .incbin "./graphic/6-table/6-22 evomode2-2-cn.4bpp"

.org GfxOfGetMode2              ;0x0850B124;-0x0850D2E3
    .incbin "./graphic/6-table/6-23 getmode2-cn.4bpp"

.org GfxOfRubyBackgroundTopChinese
    .incbin "./graphic/6-table/lz77/0009-0023252C-2BDE-cn.lz77"

.org GfxOfRubyBackgroundBottomChinese
    .incbin "./graphic/6-table/lz77/0010-002350F8-2214-cn.lz77"

.org GfxOfSapphireBackgroundTopChinese
    .incbin "./graphic/6-table/lz77/0012-002B9A20-37B6-cn.lz77"

.org GfxOfSapphireBackgroundBottomChinese
    .incbin "./graphic/6-table/lz77/0013-002BD190-2088-cn.lz77"

.org sub_08044408 + 0x154                           ;0x0804455C
    .word GfxOfRubyBackgroundTopChinese
    .word GfxOfRubyBackgroundBottomChinese
.skip 0x12C                                         ;0x08044690
    .word GfxOfSapphireBackgroundTopChinese
    .word GfxOfSapphireBackgroundBottomChinese


;7-slot
.org GfxOfSlot1                 ;0x0838D6E4;-0x08391EE3
    .incbin "./graphic/7-slot/7-1 slot1-cn.4bpp" 

.org GfxOfSlot2                 ;0x08391EE4;-0x083966E3 
    .incbin "./graphic/7-slot/7-2 slot2-cn.4bpp" 

.org GfxOfSlot3                 ;0x083966E4;-0x0839AEE3 
    .incbin "./graphic/7-slot/7-3 slot3-cn.4bpp" 

.org GfxOfSlot4                 ;0x0839AEE4;-0x0839F6E3
    .incbin "./graphic/7-slot/7-4 slot4-cn.4bpp" 


;8-bouns
.org GfxOfDusclopsBonus         ;0x0811D010;-0x0811E40F
    .incbin "./graphic/8-bouns/8-1 DusclopsBonus-cn.4bpp"

.org GfxOfKecleonBonus          ;0x0811F030;-0x0812042F 
    .incbin "./graphic/8-bouns/8-2 KecleonBonus-cn.4bpp"

.org GfxOfKyogreBonus           ;0x08121050;-0x0812244F 
    .incbin "./graphic/8-bouns/8-3 KyogreBonus-cn.4bpp"

.org GfxOfGroudonBonus          ;0x08123070;-0x0812446F 
    .incbin "./graphic/8-bouns/8-4 GroudonBonus-cn.4bpp"

.org GfxOfRayquazaBonus         ;0x08125090;-0x0812648F
    .incbin "./graphic/8-bouns/8-5 RayquazaBonus-cn.4bpp"


;9-inner
.org GfxOfRubyInnerTile         ;0x082309C0;(lz77)
    .incbin "./graphic/9-inner/lz77/0008-002309C0-1B35-cn.lz77"
    .fill 0x37,0x00

.org GfxOfSapphireInnerTile     ;0x082B7CC4;(lz77)
    .incbin "./graphic/9-inner/lz77/0011-002B7CC4-1D42-cn.lz77"
    .fill 0x1A,0x00

.org MapOfEvolutionSelect       ;0x08198F60;-0x0819CF5F 
    .incbin "./graphic/9-inner/map/9-4 EvolutionSelect-cn.map"

.org MapOfPokemonShop           ;0x0819D160;-0x081a115F
    .incbin "./graphic/9-inner/map/9-5 PokemonShop-cn.map"

.org GfxOfEvoArray              ;0x084DC6A4 
    .incbin "./graphic/9-inner/9-6 evo-cn.4bpp"

