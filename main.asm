.gba
.thumb
.create "./Pokemon_Pinball_chs_v1.2.gba",0x08000000
.close
.open "./baserom.gba","./Pokemon_Pinball_chs_v1.2.gba",0x08000000
 
;定义函数地址
.include "./include/OriginSymbols.s"
.include "./include/HackSymbols.s"

;原函数跳转及修改的部分
.include "./src/HackInOrigin.s"

;依赖函数
.org HackStart1
;;原rom依赖函数拷贝
;;中文显示依赖函数
;;震动依赖函数
.include "./src/00-01_087E0000_FixTextGfx.s"
.include "./src/00-02_087E00F0_ConvertFont2Charmap_12x12.s"
.include "./src/00-03_087E0134_0800EAAC_Load2Ram.s"
.include "./src/00-04_087E0180_ConvertFont2Charmap_16x16.s"
.include "./src/00-05_087E01D0_0805324C_CalRow.s"
.include "./src/00-06_087E0270_080532E4_CalColumn.s"
.include "./src/00-07_087E0340_RumbleSwitch.s"
.include "./data/00-01_087E1000-087EE367_Font2Charmap_12x12.s"
.include "./data/00-02_087EE400-087EEE67_Font2Charmap_16x16.s"

;中文兼容修改
.org HackStart2
;;图鉴文本显示
.include "./src/01-01_087DF000_(0800665E)_PrintPokemonDexTopInfos.s"
.include "./src/01-02_087DF140_(080069A6)_PrintPokemonDexListInfos.s"
.include "./src/01-03_087DF210_(08006C24)_PrintPokemonDexDescription.s"
;;E卡房间文本显示
.include "./src/02-02_087DF290_(080037AC)_PrintEcardInstantText.s"
.include "./src/02-03_087DF310_(08003814)_PrintEcardAppearText.s"
;;进化模式选择，捕获成功界面文本显示
.include "./src/03-01_087DF3B0_(08021068)_PrintEvoName.s"
.include "./src/03-02_087DF430_(080211D8)_PrintCaughtName.s"
.include "./src/03-03_087DF520_(08049844)_PrintEvoGfxandName.s"
;;奖励结算文本显示
.include "./src/04-01_08045DF6_08045E50_PrintBonusCount.s"
;;震动功能相关
.include "./src/05-02_087DF680_(080012C8)_RumbleStartOrNot.s"
.include "./src/05-03_087DF6B0_(08001114)_RumbleEndJump1.s"
.include "./src/05-04_087DF6E0_(080012F6)_RumbleEndJump2.s"
.include "./src/05-05_087DF700_(0800138C)_RAM_0x02019C10_Rely1.s"
.include "./src/05-06_087DF730_(08001858)_RAM_0x02019C10_Rely2.s"

;图片及中文字模
.include "./graphic/graphic.s"

;汉化文本
.include "./data/01-01_0805A430-08063ABB_TextOfPokedex.s"
.include "./data/01-02_0868c748-0868c751_VramOffsetOfPokedex.s"
.include "./data/02-01_0868AF5C-0868B7CB_TextOfEcard.s"
.include "./data/02-02_0868B80E-0868B81C_LengthOfEcard.s"
.include "./data/03-01_08693238-08693249_TextOfCaught.s"
.include "./data/03-02_087EEF00-087EF89B_(0868A302-0868AC9D)_TextOfCaughtPokemon.s"
.include "./data/04-01_08696380-08696523_TextOfBonusCount.s"

.close

