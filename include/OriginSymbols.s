;文本显示函数
;;基本函数位置
Load2Ram                        equ 0x0800EAAC
CalRow                          equ 0x0805324C
CalColumn                       equ 0x080532E4

;;图鉴相关
PrintPokemonDexTopInfos         equ 0x080065A4
PrintPokemonDexListInfos        equ 0x080068A0
PrintPokemonDexDescription      equ 0x08006C10

;;E卡相关
CleanEcardText                  equ 0x08003774
PrintEcardInstantText           equ 0x080037AC
PrintEcardAppearText            equ 0x08003814
PrintEcardArrayAppearOrDisppear equ 0x08003884

;;进化及捕获相关
PrintEvoName                    equ 0x08021068
PrintCaughtName                 equ 0x080211D8
PrintEvoGfxandName              equ 0x08049844

;;奖励结算相关
PrintBonusCount                 equ 0x08045DA0


;GBP底座连接及震动相关函数
sub_080010B8                    equ 0x080010B8
sub_08001114                    equ 0x08001114
sub_080011F4                    equ 0x080011F4
sub_08001338                    equ 0x08001338
sub_08001824                    equ 0x08001824
sub_0804ECB4                    equ 0x0804ECB4
sub_0804EF1C                    equ 0x0804EF1C
sub_0804F01C                    equ 0x0804F01C


;文本或数据地址
;;图鉴相关
TextOfPokedex                   equ 0x0805A430
VramOffsetOfPokedex             equ 0x0868C748

;;E卡相关
TextOfEcard                     equ 0x0868AF5C
LengthOfEcard                   equ 0x0868B80E

;;进化及捕获相关
TextOfCaughtPokemon             equ 0x0868A302
TextOfCaught                    equ 0x08693238

;;奖励结算相关
TextOfBonusCount                equ 0x08696380


;图片及map
;;0-Font
GfxOfJPFont8x16                 equ 0x0807977C;-0x0807D77B
GfxOfJPFont16x16                equ 0x083E3844;-0x083E6243 
GfxOfJPFont8x8                  equ 0x084EBA44

;;1-Dex
MapOfPokeDex                    equ 0x0806C71C;-0x0806CF1B 
GfxOfSomeTileSOfPokeDex         equ 0x0807031C;-0x08070B1B 
GfxOfDexTop                     equ 0x08071C9C;-0x0807233B 
GfxOfPushSelect                 equ 0x08073BDC;-0x080745DB 
GfxOfCompleted                  equ 0x080745DC;-0x0807475B 
GfxOfDexlink1                   equ 0x0807475C;-0x08074EDB 
GfxOfDexlink2                   equ 0x08074EDC;-0x080752DB 
GfxOfDexlink3                   equ 0x080752DC;-0x080757DB 
GfxOfDexlink4                   equ 0x080757DC;-0x08075BDB 
GfxOfDexlink5                   equ 0x08075BDC;-0x08075DDB 
GfxOfPushStart                  equ 0x0807935C;-0x080794DB 
GfxOfDexCompleted               equ 0x08088BDC;-0x0808A59C

;;2-Ecard
PalOfPokeDex                    equ 0x0807375C
PalOfEcardTextLine4             equ PalOfPokeDex + 4*0x20  ;0x080737DC
GfxOfEcardRoom                  equ 0x0806AE3C;-0x086B4FB

;;3-hiscore
GfxOfHiScoreTop                 equ 0x0807E91C;-0x0807F79B 
GfxOfHiScorePushStart           equ 0x0808709C;-0x0808721B 
GfxOfHiLink                     equ 0x080873DC;-0x08088BDB

;;4-title
GfxOfLogo                       equ 0x08105E9C;-0x0810DE9B 
GfxOfTitleMenu1                 equ 0x0810DE9C;-0x08114E9B 
GfxOfTitleMenu2                 equ 0x08114EBC;-0x0811BEBB 
GfxOfPushStartTitle             equ 0x0838D584;-0x0838D6A3 

;;5-setting
GfxOfSetting                    equ 0x0850F3E0;-0x08510BDF   
GfxOfSettingTop                 equ 0x08511540;-0x08511BFF 
GfxOfButton                     equ 0x08512440;-0x08512C3F 

;;6-table
GfxOfSelectTableTop             equ 0x0808B53C;-0x0808BBFB 
GfxOfSelecttableName            equ 0x0808BBFC;-0x0808C23B 
GfxOfSelectMode                 equ 0x08093C3C;-0x0809543B 
GfxOfEvolution1                 equ 0x0813CA60;-0x0813D45F 
GfxOfEvolution2                 equ 0x0813D660;-0x0813D71F 
GfxOfRubyTable                  equ 0x08241B04;-0x0824FF03
GfxOfSapphireTable              equ 0x082BF1D8;-0x082C6DD7 
GfxOfPause1                     equ 0x08442204;-0x08442363
GfxOfPause2                     equ 0x08447764
GfxOfPause3                     equ 0x0844B884
GfxOfPause4                     equ 0x0844DF24
GfxOfPause5                     equ 0x08450D44
GfxOfPause6                     equ 0x08453BE4
GfxOfPause7                     equ 0x084593A4
GfxOfPause8                     equ 0x0845E324
GfxOfSoldOut                    equ 0x08467044;-0x084672C3 
GfxOfTableShop                  equ 0x08467544;-0x08468743 
GfxOfTableEvo                   equ 0x08468744;-0x0846A243 
GfxOfCenterChange               equ 0x084DCFC4;-0x084E06C3 
GfxOfBallSave                   equ 0x084E75C4;-0x084E83C3 
GfxOfBonusCount                 equ 0x084EA6C4;-0x084EAC43 
GfxOfEvoMode1                   equ 0x084EC044;-0x084ED043 
GfxOfEvoMode2                   equ 0x084EE204;-0x084EF203 
GfxOfGameOver                   equ 0x084F03C4;-0x084F07C3 
GfxOfMoveMode                   equ 0x084F4B44;-0x084F69E3 
GfxOfPause9                     equ 0x084F7864;-0x084F7A03 
GfxOfGetMode1                   equ 0x08509064;-0x0850B123 
GfxOfEvoMode1add                equ 0x084EDE44;-0x084EE143
GfxOfEvoMode2add                equ 0x084F0004;-0x084F0303 
GfxOfGetMode2                   equ 0x0850B124;-0x0850D2E3
GfxOfRubyBackgroundTop          equ 0x0823252C ;2BC9->2BDE(lz77)
                                ;ptr 0x0804455C: 2C252308 ->087F0000(rev)
GfxOfRubyBackgroundBottom       equ 0x082350F8 ;220A->2214(lz77)
                                ;ptr 0x08044560: F8502308 ->087F2C00(rev)
GfxOfSapphireBackgroundTop      equ 0x082B9A20 ;376F->37B6(lz77)
                                ;ptr 0x08044690: 209A2B08 ->087F4F00(rev)
GfxOfSapphireBackgroundBottom   equ 0x082BD190 ;2045->2088(lz77)
                                ;ptr 0x08044694: 90D12B08 ->087F8700(rev)
sub_08044408                    equ 0x08044408

;;7-slot
GfxOfSlot1                      equ 0x0838D6E4;-0x08391EE3 
GfxOfSlot2                      equ 0x08391EE4;-0x083966E3 
GfxOfSlot3                      equ 0x083966E4;-0x0839AEE3 
GfxOfSlot4                      equ 0x0839AEE4;-0x0839F6E3

;;8-bouns
GfxOfDusclopsBonus              equ 0x0811D010;-0x0811E40F 
GfxOfKecleonBonus               equ 0x0811F030;-0x0812042F 
GfxOfKyogreBonus                equ 0x08121050;-0x0812244F 
GfxOfGroudonBonus               equ 0x08123070;-0x0812446F 
GfxOfRayquazaBonus              equ 0x08125090;-0x0812648F

;;9-inner
GfxOfRubyInnerTile              equ 0x082309C0;(lz77)
                                ;ptr 0x0804454C: C0092308
GfxOfSapphireInnerTile          equ 0x082B7CC4;(lz77)
                                ;ptr 0x08044680: C47C2B08
GfxOfCommonInnerTile            equ 0x082E6EF8;(lz77)
                                ;6处ptr,疑似奖励关卡调用，无商店或进化，故无需改动
MapOfEvolutionSelect            equ 0x08198F60;-0x0819CF5F 
/*
共分4块-移动的背景斑点
0x198F60,0x199F60,0x19AF60,0x19BF60
文字偏移地址0x108-0x128, 0x148-0x168
A6C1 A7C1 A8C1 A9C1 AAC1 ABC1 ACC1 A8C1 F6C1 A3C1 AEC1 A6C1 A9C1 A6C1 AFC1 ABC1
A6C9 B0C1 A8C9 B1C1 A8C9 ACC9 ACC9 A8C9 F6CD A3C1 B2C1 A6C9 B1C1 A6C9 AFC9 ACC9
c1-无 c5-水平翻转 c9-垂直翻转 cd-水平、垂直翻转
*/

MapOfPokemonShop                equ 0x0819D160;-0x081a115F 
/*
4块-移动的背景斑点
0x19d160,0x19e160,0x19f160,0x1a0160
文字偏移地址0x108-0x11e, 0x148-0x15e
EDC1 A8C1 EEC1 F7C1 EFC1 F0C1 F1C1 F2C1 AEC1 ADC1 A8C5 EDC1
F3C1 A8C9 EEC9 F8C1 F4C1 F0C9 F5C1 F2C9 B2C1 ADCD A8CD F3C1
c1-无 c5-水平翻转 c9-垂直翻转 cd-水平、垂直翻转

第一行A6-B2
第二行ED-F8
*/

GfxOfEvoArray                   equ 0x084DC6A4;-0x084DC803
