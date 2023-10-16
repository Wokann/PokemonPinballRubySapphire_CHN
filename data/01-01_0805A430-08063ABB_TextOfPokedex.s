/*
宝可梦数据[188]
{0xBC
  u16 编号[3] 0000 0000 0100
  u16 身高[4] 0a00 0a00 0000 0500
  u16 体重[4] 0a00 0a00 0500 0000
  u16 名字[5] **** **** **** **** ****
  u16 分类[5] 0000 0000 **** **** ****
  u16 描述[72] 每0x30-48字节（24字）1行
  u16 结束[1] 0000
}
0x07069C **宝可梦图片

宝可梦数据美版[572]
{0x23C
  u16 编号[3] 0000 0000 0100
  u16 身高[4] 0a00 0a00 0000 0500
  u16 体重[5] 0a00 0a00 0500 0000 0000
  u16 名字[10] **** **** **** **** 0000
  u16 分类[11] 0000 0000 **** **** ****
  u16 描述[252] 每0x54-84字节（42字）1行
  u16 结束[1] 0000
}
*/

;为确保显示美观，宝可梦分类的5个双字节
;汉字部分统一在第4个双字节处右对齐
;且前后没有汉字的位置，不填充原默认0x0000(8x16的空格)
;改为填充自定码表0xF8A1(12x12的空格)
;名字、描述内的空余填充，维持0x0000默认
;当宝可梦未遇见时显示的内容，改为填充0xF8A1(12x12的—)

;图鉴描述文本为双字节编码，
;每条文本包含3行句子，
;每行句子最多可输入24个8x16字，即48个字节，共192像素宽。
;中文12x12字体，最多显示16个汉字，即32字节，剩余16字节（8个字符空间）默认填充0x0000。
;程序已修改为可同时显示8x16原字符和12x12汉字字符，
;设定每行句子字符总长度达到192像素上限时，即不再继续读取文本。

.loadtable "./charmap_8x16.txt"
.org TextOfPokedexChinese
;[0]木守宫  
    .hword 0x0, 0x0, 0x1
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0xA, 0x5, 0x0
    .strn "木守宫  "
    .strn "　　林蜥　"
    .strn "能够用脚底的小刺钩住垂直的墙壁         "
    .strn "攀爬。会甩动粗粗的尾巴进行摔打。        "
    .strn "                        "
    .hword 0x0

;[1]森林蜥蜴 
    .hword 0x0, 0x0, 0x2
    .hword 0xA, 0xA, 0x0, 0x9
    .hword 0xA, 0x2, 0x1, 0x6
    .strn "森林蜥蜴 "
    .strn "　　林蜥　"
    .strn "靠着体内长出的叶子,可以方便地在        "
    .strn "森林里隐藏身形躲避敌人。是生活在        "
    .strn "密林里的爬树高手。               "
    .hword 0x0

;[2]蜥蜴王  
    .hword 0x0, 0x0, 0x3
    .hword 0xA, 0xA, 0x1, 0x7
    .hword 0xA, 0x5, 0x2, 0x2
    .strn "蜥蜴王  "
    .strn "　　密林　"
    .strn "体内长出的叶子非常锋利。会用敏捷        "
    .strn "的动作在树枝间跳来跳去,从敌人的        "
    .strn "头上或背后猛扑过去。              "
    .hword 0x0

;[3]火稚鸡  
    .hword 0x0, 0x0, 0x4
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0xA, 0x2, 0x5
    .strn "火稚鸡  "
    .strn "　　雏鸡　"
    .strn "会紧贴着训练家摇摇晃晃地走路。         "
    .strn "能从嘴里喷出摄氏1000度的灼热        "
    .strn "火球把对手烧焦。                "
    .hword 0x0

;[4]力壮鸡  
    .hword 0x0, 0x0, 0x5
    .hword 0xA, 0xA, 0x0, 0x9
    .hword 0xA, 0x1, 0x9, 0x5
    .strn "力壮鸡  "
    .strn "　　幼鸡　"
    .strn "会在山野上跑来跑去锻炼腰腿。能用        "
    .strn "兼具速度和力量的腿在1秒内连踢         "
    .strn "10次。                    "
    .hword 0x0

;[5]火焰鸡  
    .hword 0x0, 0x0, 0x6
    .hword 0xA, 0xA, 0x1, 0x9
    .hword 0xA, 0x5, 0x2, 0x0
    .strn "火焰鸡  "
    .strn "　　猛火　"
    .strn "战斗时会从手腕喷出灼热的火焰,         "
    .strn "勇敢地迎战对手。对手越强,火焰就        "
    .strn "会烧得越旺。                  "
    .hword 0x0

;[6]水跃鱼  
    .hword 0x0, 0x0, 0x7
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0xA, 0x7, 0x6
    .strn "水跃鱼  "
    .strn "　　沼鱼　"
    .strn "在水里时会用脸颊上的腮呼吸。如果        "
    .strn "遇到危险,会发挥出惊人的力量,能        "
    .strn "击碎比自己身体还大的岩石。           "
    .hword 0x0

;[7]沼跃鱼  
    .hword 0x0, 0x0, 0x8
    .hword 0xA, 0xA, 0x0, 0x7
    .hword 0xA, 0x2, 0x8, 0x0
    .strn "沼跃鱼  "
    .strn "　　沼鱼　"
    .strn "能在烂泥中快速移动。这绝对比在         "
    .strn "水中游动要来的更快。腰腿很发达,        "
    .strn "可以用2条腿走路。               "
    .hword 0x0

;[8]巨沼怪  
    .hword 0x0, 0x0, 0x9
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0xA, 0x8, 0x1, 0x9
    .strn "巨沼怪  "
    .strn "　　沼鱼　"
    .strn "巨沼怪能通过用鳍感知波涛声和海风        "
    .strn "的细微变化来预测暴风雨。发生          "
    .strn "暴风雨时,会堆积岩石保护巢穴。         "
    .hword 0x0

;[9]土狼犬  
    .hword 0x0, 0x1, 0x0
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0x1, 0x3, 0x6
    .strn "土狼犬  "
    .strn "　　紧咬　"
    .strn "找到动的东西会立刻咬上去。虽然在        "
    .strn "猎物精疲力尽之前会一直追着不放,        "
    .strn "但受到反击的话,有时也会被吓退。        "
    .hword 0x0

;[10]大狼犬  
    .hword 0x0, 0x1, 0x1
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0xA, 0x3, 0x7, 0x0
    .strn "大狼犬  "
    .strn "　　紧咬　"
    .strn "发出凶猛的吼声并压低身体的时候,        "
    .strn "就是它准备发动攻击的前兆。会用         "
    .strn "锋利的尖牙一口咬住对手。            "
    .hword 0x0

;[11]蛇纹熊  
    .hword 0x0, 0x1, 0x2
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0x1, 0x7, 0x5
    .strn "蛇纹熊  "
    .strn "　　豆狸　"
    .strn "之所以会一直之字形地到处乱走,         "
    .strn "是因为它的好奇心太过旺盛,对看到        "
    .strn "的各种东西都很感兴趣。             "
    .hword 0x0

;[12]直冲熊  
    .hword 0x0, 0x1, 0x3
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0x3, 0x2, 0x5
    .strn "直冲熊  "
    .strn "　　猛冲　"
    .strn "会笔直地猛跑,发现障碍物时就会         "
    .strn "通过直角转弯来躲避。非常不擅长         "
    .strn "慢慢转弯的道路。                "
    .hword 0x0

;[13]刺尾虫  
    .hword 0x0, 0x1, 0x4
    .hword 0xA, 0xA, 0x0, 0x3
    .hword 0xA, 0xA, 0x3, 0x6
    .strn "刺尾虫  "
    .strn "　虫宝宝　"
    .strn "会把尾部的刺对准想捉自己当食物的        "
    .strn "大王燕进行抵抗。能用渗出的毒来         "
    .strn "削弱对方。                   "
    .hword 0x0

;[14]甲壳茧  
    .hword 0x0, 0x1, 0x5
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x1, 0x0, 0x0
    .strn "甲壳茧  "
    .strn "　　　蛹　"
    .strn "虽然过去它被认为在进化之前会忍着        "
    .strn "什么都不吃,但实际上它好像会喝         "
    .strn "挂在丝线上的雨水解渴。             "
    .hword 0x0

;[15]狩猎凤蝶 
    .hword 0x0, 0x1, 0x6
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0xA, 0x2, 0x8, 0x4
    .strn "狩猎凤蝶 "
    .strn "　　蝴蝶　"
    .strn "像针一样的长长嘴巴圆圆卷起,          "
    .strn "在采集花粉时非常方便。会随着春风        "
    .strn "四处采集花粉。                 "
    .hword 0x0

;[16]盾甲茧  
    .hword 0x0, 0x1, 0x7
    .hword 0xA, 0xA, 0x0, 0x7
    .hword 0xA, 0x1, 0x1, 0x5
    .strn "盾甲茧  "
    .strn "　　　蛹　"
    .strn "一旦动了就无法进化出强壮的身体,        "
    .strn "所以无论受到怎样痛击都不会动。不        "
    .strn "过那时受到的疼痛它永远不会忘记。        "
    .hword 0x0

;[17]毒粉蛾  
    .hword 0x0, 0x1, 0x8
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0xA, 0x3, 0x1, 0x6
    .strn "毒粉蛾  "
    .strn "　　毒蛾　"
    .strn "扇动翅膀会扬起细小的剧毒粉末。一        "
    .strn "旦吸入连职业摔角手也会卧病不起。        "
    .strn "会用像雷达一样的触角寻找食物。         "
    .hword 0x0

;[18]莲叶童子 
    .hword 0x0, 0x1, 0x9
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0xA, 0x2, 0x6
    .strn "莲叶童子 "
    .strn "　　浮萍　"
    .strn "据说原本是生活在陆地上的,但因为        "
    .strn "头上的叶子变重了,所以变成了浮在        "
    .strn "水面上生活。                  "
    .hword 0x0

;[19]莲帽小童 
    .hword 0x0, 0x2, 0x0
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0xA, 0x3, 0x2, 0x5
    .strn "莲帽小童 "
    .strn "　　爽朗　"
    .strn "全身覆盖着黏糊糊的粘液,如果被它        "
    .strn "的手摸到,就会感觉很恶心。经常被        "
    .strn "误认为是人类的孩子。              "
    .hword 0x0

;[20]乐天河童 
    .hword 0x0, 0x2, 0x1
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0xA, 0x5, 0x5, 0x0
    .strn "乐天河童 "
    .strn "　　乐天　"
    .strn "它有着听到欢快的节奏,身上的细胞        "
    .strn "就会活跃起来的体质。这让它在战斗        "
    .strn "时也能发挥出强大的力量。            "
    .hword 0x0

;[21]橡实果  
    .hword 0x0, 0x2, 0x2
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0xA, 0x4, 0x0
    .strn "橡实果  "
    .strn "　　橡实　"
    .strn "会把头顶粘在树枝上悬挂着吸收水分        "
    .strn "水喝得越多,身体就会越滑越光亮。        "
    .strn "                        "
    .hword 0x0

;[22]长鼻叶  
    .hword 0x0, 0x2, 0x3
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0xA, 0x2, 0x8, 0x0
    .strn "长鼻叶  "
    .strn "　　捉弄　"
    .strn "住在茂密繁盛的森林里的宝可梦。         "
    .strn "偶尔从森林里出来吓唬人。非常讨厌        "
    .strn "有谁抓自己的长鼻子。              "
    .hword 0x0

;[23]狡猾天狗 
    .hword 0x0, 0x2, 0x4
    .hword 0xA, 0xA, 0x1, 0x3
    .hword 0xA, 0x5, 0x9, 0x6
    .strn "狡猾天狗 "
    .strn "　　邪恶　"
    .strn "据说是在树龄超过1000年的大树        "
    .strn "顶上居住的谜之宝可梦。会用叶子         "
    .strn "团扇掀起强风。                 "
    .hword 0x0

;[24]傲骨燕  
    .hword 0x0, 0x2, 0x5
    .hword 0xA, 0xA, 0x0, 0x3
    .hword 0xA, 0xA, 0x2, 0x3
    .strn "傲骨燕  "
    .strn "　　幼燕　"
    .strn "不管是怎样强大的对手都会勇敢地         "
    .strn "前去挑战。有着就算输了也不会气馁        "
    .strn "的毅力。肚子饿了就会大声痛哭。         "
    .hword 0x0

;[25]大王燕  
    .hword 0x0, 0x2, 0x6
    .hword 0xA, 0xA, 0x0, 0x7
    .hword 0xA, 0x1, 0x9, 0x8
    .strn "大王燕  "
    .strn "　　燕子　"
    .strn "会盘旋在遥远的高空,发现猎物后就        "
    .strn "会俯冲而下,用脚爪紧紧抓住猎物         "
    .strn "令其无法逃脱。                 "
    .hword 0x0

;[26]长翅鸥  
    .hword 0x0, 0x2, 0x7
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0xA, 0x9, 0x5
    .strn "长翅鸥  "
    .strn "　　海鸥　"
    .strn "有用鸟嘴衔着食物和重要的东西,         "
    .strn "并把它们藏到各处的习性。会乘着风        "
    .strn "滑翔般地在空中飞行。              "
    .hword 0x0

;[27]大嘴鸥  
    .hword 0x0, 0x2, 0x8
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0xA, 0x2, 0x8, 0x0
    .strn "大嘴鸥  "
    .strn "　　水鸟　"
    .strn "把小型宝可梦和蛋放进鸟嘴里           "
    .strn "运送的空中运送员。会在海边的          "
    .strn "峭壁上筑巢。                  "
    .hword 0x0

;[28]拉鲁拉丝 
    .hword 0x0, 0x2, 0x9
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0xA, 0x6, 0x6
    .strn "拉鲁拉丝 "
    .strn "　　心情　"
    .strn "能用头上的角感知人的情绪。虽然         "
    .strn "几乎不会出现在人的面前,但感受到        "
    .strn "积极向上的情绪后就会靠过来。          "
    .hword 0x0

;[29]奇鲁莉安 
    .hword 0x0, 0x3, 0x0
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0x2, 0x0, 0x2
    .strn "奇鲁莉安 "
    .strn "　　感情　"
    .strn "据说经常接触训练家开朗情绪的          "
    .strn "奇鲁莉安会成长得十分美丽。会用         "
    .strn "发达的头脑来操纵精神力量。           "
    .hword 0x0

;[30]沙奈朵  
    .hword 0x0, 0x3, 0x1
    .hword 0xA, 0xA, 0x1, 0x6
    .hword 0xA, 0x4, 0x8, 0x4
    .strn "沙奈朵  "
    .strn "　　包容　"
    .strn "据说在使用预知未来的能力察觉到         "
    .strn "训练家有危险时,就会使出最强的         "
    .strn "精神能量。                   "
    .hword 0x0

;[31]溜溜糖球 
    .hword 0x0, 0x3, 0x2
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0xA, 0x1, 0x7
    .strn "溜溜糖球 "
    .strn "　　水黾　"
    .strn "感觉到危险的时候会从头顶上的尖端        "
    .strn "处分泌出像糖稀一样的甜甜液体。         "
    .strn "也有喜欢这液体的宝可梦哦。           "
    .hword 0x0

;[32]雨翅蛾  
    .hword 0x0, 0x3, 0x3
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0xA, 0x3, 0x6
    .strn "雨翅蛾  "
    .strn "　　眼珠　"
    .strn "据说怒目而视般的眼珠花纹看起来         "
    .strn "悲伤且下垂的时候,就是傍晚要下雨        "
    .strn "的前兆。                    "
    .hword 0x0

;[33]蘑蘑菇  
    .hword 0x0, 0x3, 0x4
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0xA, 0x4, 0x5
    .strn "蘑蘑菇  "
    .strn "　　蘑菇　"
    .strn "栖息在森林深处潮湿的地面上。经常        "
    .strn "会一动不动地待在落叶下面。会以落        "
    .strn "叶堆积起来后形成的腐叶土为食。         "
    .hword 0x0

;[34]斗笠菇  
    .hword 0x0, 0x3, 0x5
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0xA, 0x3, 0x9, 0x2
    .strn "斗笠菇  "
    .strn "　　蘑菇　"
    .strn "会用轻巧的步法接近敌人,然后用         "
    .strn "能伸缩的手臂出拳。有着能令拳击手        "
    .strn "汗颜的技术。                  "
    .hword 0x0

;[35]懒人獭  
    .hword 0x0, 0x3, 0x6
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0x2, 0x4, 0x0
    .strn "懒人獭  "
    .strn "　　懒人　"
    .strn "心脏每分钟只跳动1次。因为是不管        "
    .strn "怎样都会一直趴着的宝可梦,所以         "
    .strn "几乎不会看到它动的样子。            "
    .hword 0x0

;[36]过动猿  
    .hword 0x0, 0x3, 0x7
    .hword 0xA, 0xA, 0x1, 0x4
    .hword 0xA, 0x4, 0x6, 0x5
    .strn "过动猿  "
    .strn "　　暴猿　"
    .strn "一刻也停不下来的宝可梦。就算想         "
    .strn "睡觉了,全身血液也还会沸腾,不去        "
    .strn "森林里到处奔跑就无法平息下来。         "
    .hword 0x0

;[37]请假王  
    .hword 0x0, 0x3, 0x8
    .hword 0xA, 0xA, 0x2, 0x0
    .hword 0x1, 0x3, 0x0, 0x5
    .strn "请假王  "
    .strn "　怕麻烦　"
    .strn "刻在草原上半径1米的圆圈,是由         "
    .strn "请假王横躺着吃光了身边的草后          "
    .strn "所形成的。                   "
    .hword 0x0

;[38]凯西   
    .hword 0x0, 0x3, 0x9
    .hword 0xA, 0xA, 0x0, 0x9
    .hword 0xA, 0x1, 0x9, 0x5
    .strn "凯西   "
    .strn "　　念力　"
    .strn "每天不睡够18个小时的话,就会因        "
    .strn "睡眠不足而无法使用超能力。受到         "
    .strn "袭击会睡着使用瞬间移动逃走。          "
    .hword 0x0

;[39]勇基拉  
    .hword 0x0, 0x4, 0x0
    .hword 0xA, 0xA, 0x1, 0x3
    .hword 0xA, 0x5, 0x6, 0x5
    .strn "勇基拉  "
    .strn "　　念力　"
    .strn "银汤匙可以增强阿尔法波。据说如果        "
    .strn "没有汤匙的话,就只能使出平时一半        "
    .strn "的超能力。                   "
    .hword 0x0

;[40]胡地   
    .hword 0x0, 0x4, 0x1
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0xA, 0x4, 0x8, 0x0
    .strn "胡地   "
    .strn "　　念力　"
    .strn "无限增多的脑细胞造就了智商高达         "
    .strn "5000的超级大脑。会记住世上         "
    .strn "发生的所有事。                 "
    .hword 0x0

;[41]土居忍士 
    .hword 0x0, 0x4, 0x2
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0xA, 0x5, 0x5
    .strn "土居忍士 "
    .strn "　　入门　"
    .strn "长年生活在漆黑的土里。会从树根处        "
    .strn "吸取营养,一动不动地等待进化时刻        "
    .strn "的到来。                    "
    .hword 0x0

;[42]铁面忍者 
    .hword 0x0, 0x4, 0x3
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0x1, 0x2, 0x0
    .strn "铁面忍者 "
    .strn "　　忍者　"
    .strn "会在四周飞快地移动,无法看见身影        "
    .strn "因为只能听见叫声,所以很长一段时        "
    .strn "间里一直被认为是透明的宝可梦。         "
    .hword 0x0

;[43]脱壳忍者 
    .hword 0x0, 0x4, 0x4
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0xA, 0x1, 0x2
    .strn "脱壳忍者 "
    .strn "　　空壳　"
    .strn "坚硬的身体一动都不会动。人们相信        "
    .strn "如果从背上窥视它体内的空洞,灵魂        "
    .strn "就会被吸走。                  "
    .hword 0x0

;[44]咕妞妞  
    .hword 0x0, 0x4, 0x5
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x1, 0x6, 0x3
    .strn "咕妞妞  "
    .strn "　　细语　"
    .strn "一旦大叫起来,就会被自己的声音         "
    .strn "吓到,然后以更大的声音大吼大叫         "
    .strn "起来。停止大叫后就会累得睡着。         "
    .hword 0x0

;[45]吼爆弹  
    .hword 0x0, 0x4, 0x6
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0xA, 0x4, 0x0, 0x5
    .strn "吼爆弹  "
    .strn "　　大声　"
    .strn "会一边跺脚一边大叫。大叫后的一段        "
    .strn "时间内无法听到任何声音是其弱点。        "
    .strn "                        "
    .hword 0x0

;[46]爆音怪  
    .hword 0x0, 0x4, 0x7
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0xA, 0x8, 0x4, 0x0
    .strn "爆音怪  "
    .strn "　　噪音　"
    .strn "会从身上的洞里传出笛声一样的声音        "
    .strn "并以此来将向伙伴传递感情。只有在        "
    .strn "战斗时才会发出大叫声。             "
    .hword 0x0

;[47]幕下力士 
    .hword 0x0, 0x4, 0x8
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0xA, 0x8, 0x6, 0x4
    .strn "幕下力士 "
    .strn "　　毅力　"
    .strn "有着决不放弃的毅力。通过多吃饭、        "
    .strn "好好睡觉以及足够的运动,体内就会        "
    .strn "充满能量。                   "
    .hword 0x0

;[48]铁掌力士 
    .hword 0x0, 0x4, 0x9
    .hword 0xA, 0xA, 0x2, 0x3
    .hword 0x2, 0x5, 0x3, 0x8
    .strn "铁掌力士 "
    .strn "　　猛推　"
    .strn "肥大的身体里面全是肌肉块。如果         "
    .strn "使劲将力量聚集到全身的话,肌肉就        "
    .strn "会变得和岩石一样坚硬。             "
    .hword 0x0

;[49]角金鱼  
    .hword 0x0, 0x5, 0x0
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x1, 0x5, 0x0
    .strn "角金鱼  "
    .strn "　　金鱼　"
    .strn "非常喜欢在河流或池塘里游动,若把        "
    .strn "它放入水槽之类的话,就算是厚厚的        "
    .strn "玻璃,它也能用角一击撞碎后逃走。        "
    .hword 0x0

;[50]金鱼王  
    .hword 0x0, 0x5, 0x1
    .hword 0xA, 0xA, 0x1, 0x3
    .hword 0xA, 0x3, 0x9, 0x0
    .strn "金鱼王  "
    .strn "　　金鱼　"
    .strn "为了保护蛋,雄鱼和雌鱼会轮流在巢        "
    .strn "的周围来回游动进行巡逻。这样的行        "
    .strn "为会持续一个月以上直到蛋孵化。         "
    .hword 0x0

;[51]鲤鱼王  
    .hword 0x0, 0x5, 0x2
    .hword 0xA, 0xA, 0x0, 0x9
    .hword 0xA, 0x1, 0x0, 0x0
    .strn "鲤鱼王  "
    .strn "　　　鱼　"
    .strn "虽然只会一直地跳,无法尽力战斗的        "
    .strn "它被认为很弱,但它却是能在任何污        "
    .strn "水里生活的顽强宝可梦。             "
    .hword 0x0

;[52]暴鲤龙  
    .hword 0x0, 0x5, 0x3
    .hword 0xA, 0xA, 0x6, 0x5
    .hword 0x2, 0x3, 0x5, 0x0
    .strn "暴鲤龙  "
    .strn "　　凶恶　"
    .strn "一旦发起狂来,不烧尽世间一切,         "
    .strn "体内的暴戾之气就无法平息。           "
    .strn "有留下持续发狂一个月的记录。          "
    .hword 0x0

;[53]露力丽  
    .hword 0x0, 0x5, 0x4
    .hword 0xA, 0xA, 0x0, 0x2
    .hword 0xA, 0xA, 0x2, 0x0
    .strn "露力丽  "
    .strn "　　水珠　"
    .strn "尾巴里贮满了成长时所需的营养。         "
    .strn "会坐在充满弹性的尾巴上玩耍。          "
    .strn "                        "
    .hword 0x0

;[54]玛力露  
    .hword 0x0, 0x5, 0x5
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0xA, 0x8, 0x5
    .strn "玛力露  "
    .strn "　　水鼠　"
    .strn "在水流湍急的河中捕食的时候,会用        "
    .strn "尾巴缠住岸边的树干。尾巴有弹性,        "
    .strn "有着可以伸长的构造。              "
    .hword 0x0

;[55]玛力露丽 
    .hword 0x0, 0x5, 0x6
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0x2, 0x8, 0x5
    .strn "玛力露丽 "
    .strn "　　水兔　"
    .strn "可以制造空气球。如果碰到溺水的         "
    .strn "宝可梦,就会把空气球拿出来给它,        "
    .strn "以便让它能够呼吸。               "
    .hword 0x0

;[56]小拳石  
    .hword 0x0, 0x5, 0x7
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0x2, 0x0, 0x0
    .strn "小拳石  "
    .strn "　　岩石　"
    .strn "会把一半的身体埋入地下熟睡。就算        "
    .strn "被登山者踩到也完全不会醒来哦。         "
    .strn "早上为了觅食会从坡道上滚下去。         "
    .hword 0x0

;[57]隆隆石  
    .hword 0x0, 0x5, 0x8
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0x1, 0x0, 0x5, 0x0
    .strn "隆隆石  "
    .strn "　　岩石　"
    .strn "在从山脚爬到山顶的过程中,会嘎嘣        "
    .strn "嘎嘣地吃自己非常爱吃的岩石。到达        "
    .strn "山顶后就会再滚下来。              "
    .hword 0x0

;[58]隆隆岩  
    .hword 0x0, 0x5, 0x9
    .hword 0xA, 0xA, 0x1, 0x4
    .hword 0x3, 0x0, 0x0, 0x0
    .strn "隆隆岩  "
    .strn "　重量级　"
    .strn "山坡上那些挖好的沟槽其实是人们         "
    .strn "为了不让滚下来的隆隆岩撞到民房         "
    .strn "而准备好的通道。                "
    .hword 0x0

;[59]朝北鼻  
    .hword 0x0, 0x6, 0x0
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0xA, 0x9, 0x7, 0x0
    .strn "朝北鼻  "
    .strn "　　罗盘　"
    .strn "磁铁鼻子总是朝向北方。由于磁铁         "
    .strn "同极会相斥,因此朝北鼻之间无法将        "
    .strn "脸靠在一起。                  "
    .hword 0x0

;[60]向尾喵  
    .hword 0x0, 0x6, 0x1
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x1, 0x1, 0x0
    .strn "向尾喵  "
    .strn "　　小猫　"
    .strn "该宝可梦有看到动的东西就会不顾         "
    .strn "一切追着到处跑的习性。会追自己的        "
    .strn "尾巴追得头晕眼花。               "
    .hword 0x0

;[61]优雅猫  
    .hword 0x0, 0x6, 0x2
    .hword 0xA, 0xA, 0x1, 0x1
    .hword 0xA, 0x3, 0x2, 0x6
    .strn "优雅猫  "
    .strn "　　清高　"
    .strn "我行我素喜欢自由散漫的生活。因为        "
    .strn "会想吃就吃,想睡就睡,所以每天都        "
    .strn "毫无规律可言。                 "
    .hword 0x0

;[62]超音蝠  
    .hword 0x0, 0x6, 0x3
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0xA, 0x7, 0x5
    .strn "超音蝠  "
    .strn "　　蝙蝠　"
    .strn "受到阳光照射身体就会不适,所以         "
    .strn "白天它会倒挂在洞窟里或老房子的         "
    .strn "屋檐下睡觉。                  "
    .hword 0x0

;[63]大嘴蝠  
    .hword 0x0, 0x6, 0x4
    .hword 0xA, 0xA, 0x1, 0x6
    .hword 0xA, 0x5, 0x5, 0x0
    .strn "大嘴蝠  "
    .strn "　　蝙蝠　"
    .strn "会用4颗尖牙咬住对手吸食血液。         "
    .strn "在没有月亮的漆黑夜晚,会频繁地         "
    .strn "飞来飞去袭击人和宝可梦。            "
    .hword 0x0

;[64]叉字蝠  
    .hword 0x0, 0x6, 0x5
    .hword 0xA, 0xA, 0x1, 0x8
    .hword 0xA, 0x7, 0x5, 0x0
    .strn "叉字蝠  "
    .strn "　　蝙蝠　"
    .strn "能用小到不仔细听就无法听到的振翅        "
    .strn "声悄悄接近它盯上的猎物。能用相当        "
    .strn "于后肢的翅膀抓住树枝休息。           "
    .hword 0x0

;[65]玛瑙水母 
    .hword 0x0, 0x6, 0x6
    .hword 0xA, 0xA, 0x0, 0x9
    .hword 0xA, 0x4, 0x5, 0x5
    .strn "玛瑙水母 "
    .strn "　　水母　"
    .strn "因为身体绝大部分都是水组成,所以        "
    .strn "离开大海后就会变得干巴巴。它变得        "
    .strn "干巴巴时,就把它放回大海里去吧。        "
    .hword 0x0

;[66]毒刺水母 
    .hword 0x0, 0x6, 0x7
    .hword 0xA, 0xA, 0x1, 0x6
    .hword 0xA, 0x5, 0x5, 0x0
    .strn "毒刺水母 "
    .strn "　　水母　"
    .strn "头上的红色珠子发光时,会向周围         "
    .strn "发射强烈的超音波。据说那时海面就        "
    .strn "会掀起巨大的波浪。               "
    .hword 0x0

;[67]勾魂眼  
    .hword 0x0, 0x6, 0x8
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0x1, 0x1, 0x0
    .strn "勾魂眼  "
    .strn "　　黑暗　"
    .strn "会用锋利的爪子从泥土中挖石头吃。        "
    .strn "石头中含有的成分会变成结晶,浮现        "
    .strn "在它身体的表面。                "
    .hword 0x0

;[68]大嘴娃  
    .hword 0x0, 0x6, 0x9
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x1, 0x1, 0x5
    .strn "大嘴娃  "
    .strn "　　欺骗　"
    .strn "钢角变化成了一张大颚。如果因为它        "
    .strn "温顺的长相而大意的话,就会被它         "
    .strn "突然转过来的大颚咬住。             "
    .hword 0x0

;[69]可可多拉 
    .hword 0x0, 0x7, 0x0
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0x6, 0x0, 0x0
    .strn "可可多拉 "
    .strn "　　铁铠　"
    .strn "如果用钢铁之躯全力撞击,就连          "
    .strn "翻斗车也能一次撞碎。会大口大口地        "
    .strn "将被撞坏的翻斗车吃掉。             "
    .hword 0x0

;[70]可多拉  
    .hword 0x0, 0x7, 0x1
    .hword 0xA, 0xA, 0x0, 0x9
    .hword 0x1, 0x2, 0x0, 0x0
    .strn "可多拉  "
    .strn "　　铁铠　"
    .strn "会吃石头或水中含有的铁质。在埋藏        "
    .strn "有铁矿石的山上筑巢,会和那些前来        "
    .strn "挖铁矿的人争斗。                "
    .hword 0x0

;[71]波士可多拉
    .hword 0x0, 0x7, 0x2
    .hword 0xA, 0xA, 0x2, 0x1
    .hword 0x3, 0x6, 0x0, 0x0
    .strn "波士可多拉"
    .strn "　　铁铠　"
    .strn "当山体因滑坡或山火而变得荒芜起来        "
    .strn "时,它就会不断地运土、种上树苗,        "
    .strn "将自己的领地打扫得漂漂亮亮的。         "
    .hword 0x0

;[72]腕力   
    .hword 0x0, 0x7, 0x3
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0x1, 0x9, 0x5
    .strn "腕力   "
    .strn "　　怪力　"
    .strn "拥有特殊肌肉的宝可梦。不管怎样         "
    .strn "运动都不会疼。有着可以扔飞100        "
    .strn "个成年人的力量。                "
    .hword 0x0

;[73]豪力   
    .hword 0x0, 0x7, 0x4
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0xA, 0x7, 0x0, 0x5
    .strn "豪力   "
    .strn "　　怪力　"
    .strn "锻炼过的肌肉硬如钢铁。它是有着         "
    .strn "怪力,只需1根手指就能轻松举起         "
    .strn "相扑力士的宝可梦。               "
    .hword 0x0

;[74]怪力   
    .hword 0x0, 0x7, 0x5
    .hword 0xA, 0xA, 0x1, 0x6
    .hword 0x1, 0x3, 0x0, 0x0
    .strn "怪力   "
    .strn "　　怪力　"
    .strn "有着可以扔飞一切东西的力量,但         "
    .strn "如果是做细活,手臂就会缠在一起。        "
    .strn "身体会比大脑先一步行动。            "
    .hword 0x0

;[75]玛沙那  
    .hword 0x0, 0x7, 0x6
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x1, 0x1, 0x2
    .strn "玛沙那  "
    .strn "　　冥想　"
    .strn "会通过冥想来提高精神能量。1天         "
    .strn "只吃1个树果。少吃也是修行的一个        "
    .strn "环节。                     "
    .hword 0x0

;[76]恰雷姆  
    .hword 0x0, 0x7, 0x7
    .hword 0xA, 0xA, 0x1, 0x3
    .hword 0xA, 0x3, 0x1, 0x5
    .strn "恰雷姆  "
    .strn "　　冥想　"
    .strn "因瑜伽的力量第6感得到了提高,         "
    .strn "自己也变得可以操纵精神力量。会在        "
    .strn "1个月里不吃任何东西进行冥想。         "
    .hword 0x0

;[77]落雷兽  
    .hword 0x0, 0x7, 0x8
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x1, 0x5, 0x2
    .strn "落雷兽  "
    .strn "　　闪电　"
    .strn "长长的体毛中积蓄着电。会用电流         "
    .strn "刺激脚部的肌肉,以此产生强大的         "
    .strn "瞬间爆发力。                  "
    .hword 0x0

;[78]雷电兽  
    .hword 0x0, 0x7, 0x9
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0xA, 0x4, 0x0, 0x2
    .strn "雷电兽  "
    .strn "　　放电　"
    .strn "因为一直在从鬃毛中放电,所以有时        "
    .strn "也会因火花而引发山火。开始战斗后        "
    .strn "就会制造出雷云。                "
    .hword 0x0

;[79]正电拍拍 
    .hword 0x0, 0x8, 0x0
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0xA, 0x4, 0x2
    .strn "正电拍拍 "
    .strn "　　加油　"
    .strn "一直在给伙伴加油的宝可梦。伙伴         "
    .strn "加油努力的话,它就会让身体短路,        "
    .strn "产生噼里啪啦的火花声来表达喜悦。        "
    .hword 0x0

;[80]负电拍拍 
    .hword 0x0, 0x8, 0x1
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0xA, 0x4, 0x2
    .strn "负电拍拍 "
    .strn "　　加油　"
    .strn "比起自己来,给伙伴加油更重要。         "
    .strn "会通过让体内发出的电流短路,一边        "
    .strn "放出华丽的火花,一边给伙伴加油。        "
    .hword 0x0

;[81]小磁怪  
    .hword 0x0, 0x8, 0x2
    .hword 0xA, 0xA, 0x0, 0x3
    .hword 0xA, 0xA, 0x6, 0x0
    .strn "小磁怪  "
    .strn "　　磁铁　"
    .strn "会从左右的组件里放出电磁波屏蔽         "
    .strn "重力浮在空中。体内的电力消失了就        "
    .strn "飞不起来了。                  "
    .hword 0x0

;[82]三合一磁怪
    .hword 0x0, 0x8, 0x3
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0xA, 0x6, 0x0, 0x0
    .strn "三合一磁怪"
    .strn "　　磁铁　"
    .strn "会用强力的磁力破坏精密机器,所以        "
    .strn "据说在有些城镇不将其放入精灵球,        "
    .strn "就会受到警告。                 "
    .hword 0x0

;[83]霹雳电球 
    .hword 0x0, 0x8, 0x4
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0x1, 0x0, 0x4
    .strn "霹雳电球 "
    .strn "　　　球　"
    .strn "最早在制造精灵球的公司被发现,         "
    .strn "以及它的外观十分酷似精灵球,          "
    .strn "这两点之间的联系至今还是个谜。         "
    .hword 0x0

;[84]顽皮雷弹 
    .hword 0x0, 0x8, 0x5
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0xA, 0x6, 0x6, 0x6
    .strn "顽皮雷弹 "
    .strn "　　　球　"
    .strn "会吃空气中的电能。在有雷落下的         "
    .strn "日子里,吃下过多电力的顽皮雷弹         "
    .strn "会在各处大爆炸。                "
    .hword 0x0

;[85]电萤虫  
    .hword 0x0, 0x8, 0x6
    .hword 0xA, 0xA, 0x0, 0x7
    .hword 0xA, 0x1, 0x7, 0x7
    .strn "电萤虫  "
    .strn "　萤火虫　"
    .strn "会利用尾巴的亮光,成群结队地          "
    .strn "在夜空中描绘几何图形。非常喜欢         "
    .strn "甜甜萤放出的甜甜香气。             "
    .hword 0x0

;[86]甜甜萤  
    .hword 0x0, 0x8, 0x7
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x1, 0x7, 0x7
    .strn "甜甜萤  "
    .strn "　萤火虫　"
    .strn "会利用甜甜的香气引诱电萤虫。然后        "
    .strn "诱导大量聚集而来的电萤虫,让它们        "
    .strn "在夜空中描绘几何图形。             "
    .hword 0x0

;[87]走路草  
    .hword 0x0, 0x8, 0x8
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0xA, 0x5, 0x4
    .strn "走路草  "
    .strn "　　杂草　"
    .strn "找到肥沃的土地后会把自己埋进去。        "
    .strn "白天埋在土里的时候,脚好像会变成        "
    .strn "像是树根那样的形状。              "
    .hword 0x0

;[88]臭臭花  
    .hword 0x0, 0x8, 0x9
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0xA, 0x8, 0x6
    .strn "臭臭花  "
    .strn "　　杂草　"
    .strn "臭臭花好像特别喜欢从嘴里流出的         "
    .strn "强烈臭味。闻到那味道后会分泌出         "
    .strn "更多的花蜜。                  "
    .hword 0x0

;[89]霸王花  
    .hword 0x0, 0x9, 0x0
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0xA, 0x1, 0x8, 0x6
    .strn "霸王花  "
    .strn "　　　花　"
    .strn "会用世界上最大的花瓣引诱猎物靠近        "
    .strn "然后将毒花粉撒在它的身上。等猎物        "
    .strn "不能动后,就会将它抓起来吃掉。         "
    .hword 0x0

;[90]美丽花  
    .hword 0x0, 0x9, 0x1
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0xA, 0x5, 0x8
    .strn "美丽花  "
    .strn "　　　花　"
    .strn "进化前的臭臭花越臭,就越是能进化        "
    .strn "为带着美丽花儿的美丽花哦。到了         "
    .strn "晚上就会合上花瓣睡觉。             "
    .hword 0x0

;[91]嘟嘟   
    .hword 0x0, 0x9, 0x2
    .hword 0xA, 0xA, 0x1, 0x4
    .hword 0xA, 0x3, 0x9, 0x2
    .strn "嘟嘟   "
    .strn "　两头鸟　"
    .strn "2个脑袋从来不会同时睡着。           "
    .strn "为了防止在睡着时受到敌人袭击,         "
    .strn "所以它们会轮流望风。              "
    .hword 0x0

;[92]嘟嘟利  
    .hword 0x0, 0x9, 0x3
    .hword 0xA, 0xA, 0x1, 0x8
    .hword 0xA, 0x8, 0x5, 0x2
    .strn "嘟嘟利  "
    .strn "　三头鸟　"
    .strn "3个脑袋朝着不同方向时,就是它在        "
    .strn "进行警戒的证明。不小心靠近的话就        "
    .strn "会被鸟嘴啄。                  "
    .hword 0x0

;[93]毒蔷薇  
    .hword 0x0, 0x9, 0x4
    .hword 0xA, 0xA, 0x0, 0x3
    .hword 0xA, 0xA, 0x2, 0x0
    .strn "毒蔷薇  "
    .strn "　　荆棘　"
    .strn "据说有极个别的毒蔷薇会开出色彩         "
    .strn "罕见的花朵。头上的刺带有剧毒。         "
    .strn "                        "
    .hword 0x0

;[94]溶食兽  
    .hword 0x0, 0x9, 0x5
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0x1, 0x0, 0x3
    .strn "溶食兽  "
    .strn "　　胃袋　"
    .strn "身体的大部分都是胃,心脏和大脑         "
    .strn "非常小。有着能溶化任何东西的特殊        "
    .strn "胃液。                     "
    .hword 0x0

;[95]吞食兽  
    .hword 0x0, 0x9, 0x6
    .hword 0xA, 0xA, 0x1, 0x7
    .hword 0xA, 0x8, 0x0, 0x0
    .strn "吞食兽  "
    .strn "　　毒袋　"
    .strn "嘴里1颗牙齿都没有,所以会吞食         "
    .strn "任何东西。嘴巴完全张开的时候非常        "
    .strn "大,可以将汽车轮胎整个塞进去。         "
    .hword 0x0

;[96]利牙鱼  
    .hword 0x0, 0x9, 0x7
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0x2, 0x0, 0x8
    .strn "利牙鱼  "
    .strn "　　凶猛　"
    .strn "发达的颚与尖锐的牙齿有着能咬碎         "
    .strn "船底的破坏力。有很多船只因遭到         "
    .strn "利牙鱼的袭击而沉没。              "
    .hword 0x0

;[97]巨牙鲨  
    .hword 0x0, 0x9, 0x8
    .hword 0xA, 0xA, 0x1, 0x8
    .hword 0xA, 0x8, 0x8, 0x8
    .strn "巨牙鲨  "
    .strn "　　凶暴　"
    .strn "被称为大海恶霸而让人闻风丧胆。有        "
    .strn "着折断后可以迅速再生的牙齿,单枪        "
    .strn "匹马就能把大型油船咬得稀巴烂。         "
    .hword 0x0

;[98]吼吼鲸  
    .hword 0x0, 0x9, 0x9
    .hword 0xA, 0xA, 0x2, 0x0
    .hword 0x1, 0x3, 0x0, 0x0
    .strn "吼吼鲸  "
    .strn "　　球鲸　"
    .strn "它是很喜欢将体内储存的海水,从         "
    .strn "眼睛上面的鼻孔中喷出来吓唬人的         "
    .strn "宝可梦。                    "
    .hword 0x0

;[99]吼鲸王  
    .hword 0x1, 0x0, 0x0
    .hword 0xA, 0x1, 0x4, 0x5
    .hword 0x3, 0x9, 0x8, 0x0
    .strn "吼鲸王  "
    .strn "　　浮鲸　"
    .strn "已发现的最大的宝可梦。会悠然地在        "
    .strn "汪洋大海中游动,并用大嘴一口气         "
    .strn "吃掉大量的食物。                "
    .hword 0x0

;[100]呆火驼  
    .hword 0x1, 0x0, 0x1
    .hword 0xA, 0xA, 0x0, 0x7
    .hword 0xA, 0x2, 0x4, 0x0
    .strn "呆火驼  "
    .strn "　　迟钝　"
    .strn "虽然迟钝到被人敲打也不会察觉,         "
    .strn "但是对于饥饿1秒都无法忍耐。          "
    .strn "体内的熔岩一直在沸腾。             "
    .hword 0x0

;[101]喷火驼  
    .hword 0x1, 0x0, 0x2
    .hword 0xA, 0xA, 0x1, 0x9
    .hword 0x2, 0x2, 0x0, 0x0
    .strn "喷火驼  "
    .strn "　　喷火　"
    .strn "体内有着火山的宝可梦。时不时          "
    .strn "会从背上的驼峰里喷出体内储存的         "
    .strn "1万摄氏度的熔岩。               "
    .hword 0x0

;[102]熔岩虫  
    .hword 0x1, 0x0, 0x3
    .hword 0xA, 0xA, 0x0, 0x7
    .hword 0xA, 0x3, 0x5, 0x0
    .strn "熔岩虫  "
    .strn "　　熔岩　"
    .strn "虽然体内有灼热的熔岩不断卷动,         "
    .strn "但变冷后就会凝固崩裂,             "
    .strn "身体也会变小。                 "
    .hword 0x0

;[103]熔岩蜗牛 
    .hword 0x1, 0x0, 0x4
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0x5, 0x5, 0x0
    .strn "熔岩蜗牛 "
    .strn "　　熔岩　"
    .strn "壳是由皮肤冷却后凝固而成的。只要        "
    .strn "碰一下就会崩裂成碎片。进入熔岩中        "
    .strn "就会恢复到原来的大小。             "
    .hword 0x0

;[104]煤炭龟  
    .hword 0x1, 0x0, 0x5
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0x8, 0x0, 0x4
    .strn "煤炭龟  "
    .strn "　　煤炭　"
    .strn "会不停地在山上挖煤,然后将它们         "
    .strn "放入甲壳的洞里燃烧的宝可梦。          "
    .strn "遭到袭击后会喷出黑烟逃走。           "
    .hword 0x0

;[105]臭泥   
    .hword 0x1, 0x0, 0x6
    .hword 0xA, 0xA, 0x0, 0x9
    .hword 0xA, 0x3, 0x0, 0x0
    .strn "臭泥   "
    .strn "　　污泥　"
    .strn "诞生于被污染的海底污泥。非常喜欢        "
    .strn "脏东西,会从体内流出全是细菌的         "
    .strn "液体。                     "
    .hword 0x0

;[106]臭臭泥  
    .hword 0x1, 0x0, 0x7
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0xA, 0x3, 0x0, 0x0
    .strn "臭臭泥  "
    .strn "　　污泥　"
    .strn "因为十分喜欢脏东西,所以臭臭泥         "
    .strn "会聚集在有人往街边乱扔垃圾的城镇        "
    .strn "里。                      "
    .hword 0x0

;[107]瓦斯弹  
    .hword 0x1, 0x0, 0x8
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0xA, 0x1, 0x0
    .strn "瓦斯弹  "
    .strn "　　毒气　"
    .strn "刺激它的话,瓦斯的毒素就会变强,        "
    .strn "并会从身体各处猛烈喷出。胀成一个        "
    .strn "圆圆的球后会发生大爆炸。            "
    .hword 0x0

;[108]双弹瓦斯 
    .hword 0x1, 0x0, 0x9
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0xA, 0xA, 0x9, 0x5
    .strn "双弹瓦斯 "
    .strn "　　毒气　"
    .strn "非常喜欢腐烂湿垃圾所产生的瓦斯。        "
    .strn "会定居在不打扫卫生的人家中,并在        "
    .strn "夜深人静时去垃圾箱中寻找瓦斯。         "
    .hword 0x0

;[109]跳跳猪  
    .hword 0x1, 0x1, 0x0
    .hword 0xA, 0xA, 0x0, 0x7
    .hword 0xA, 0x3, 0x0, 0x6
    .strn "跳跳猪  "
    .strn "　　弹跳　"
    .strn "会用尾巴蹦来蹦去弹跳的宝可梦。         "
    .strn "靠着跳跃的震动来使心脏跳动,所以        "
    .strn "不能停止弹跳。                 "
    .hword 0x0

;[110]噗噗猪  
    .hword 0x1, 0x1, 0x1
    .hword 0xA, 0xA, 0x0, 0x9
    .hword 0xA, 0x7, 0x1, 0x5
    .strn "噗噗猪  "
    .strn "　　操纵　"
    .strn "会用黑珍珠增强精神力量的波动,         "
    .strn "并能随意操纵对手的宝可梦。           "
    .strn "使出力量的时候鼻息会变得粗重。         "
    .hword 0x0

;[111]穿山鼠  
    .hword 0x1, 0x1, 0x2
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x1, 0x2, 0x0
    .strn "穿山鼠  "
    .strn "　　　鼠　"
    .strn "干巴巴的皮肤非常坚硬,蜷成一团后        "
    .strn "可以反弹任何攻击。深夜会钻入沙漠        "
    .strn "的沙子里睡觉。                 "
    .hword 0x0

;[112]穿山王  
    .hword 0x1, 0x1, 0x3
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0xA, 0x2, 0x9, 0x5
    .strn "穿山王  "
    .strn "　　　鼠　"
    .strn "将背部蜷起时,看上去就像个刺球。        "
    .strn "它会扑向因被刺到而畏缩的对手,         "
    .strn "然后用锋利的爪子不停地抓挠对手。        "
    .hword 0x0

;[113]晃晃斑  
    .hword 0x1, 0x1, 0x4
    .hword 0xA, 0xA, 0x1, 0x1
    .hword 0xA, 0xA, 0x5, 0x0
    .strn "晃晃斑  "
    .strn "斑点熊猫　"
    .strn "据说世上所有晃晃斑的斑点花纹都长        "
    .strn "在不一样的地方。摇摆不定的步伐看        "
    .strn "起来好像在跳舞。                "
    .hword 0x0

;[114]盔甲鸟  
    .hword 0x1, 0x1, 0x5
    .hword 0xA, 0xA, 0x1, 0x7
    .hword 0xA, 0x5, 0x0, 0x5
    .strn "盔甲鸟  "
    .strn "　钢甲鸟　"
    .strn "全身覆盖着坚硬的铠甲。会以时速         "
    .strn "300公里的速度在空中飞行,并用        "
    .strn "锋利如刀的翅膀切割对手。            "
    .hword 0x0

;[115]大颚蚁  
    .hword 0x1, 0x1, 0x6
    .hword 0xA, 0xA, 0x0, 0x7
    .hword 0xA, 0x1, 0x5, 0x0
    .strn "大颚蚁  "
    .strn "　　蚁狮　"
    .strn "在沙漠里建造了猎物无法逃脱的洞穴        "
    .strn "并在洞穴里一心等着猎物的到来。         "
    .strn "即使1周不喝水,也完全没问题。         "
    .hword 0x0

;[116]超音波幼虫
    .hword 0x1, 0x1, 0x7
    .hword 0xA, 0xA, 0x1, 0x1
    .hword 0xA, 0x1, 0x5, 0x3
    .strn "超音波幼虫"
    .strn "　　震动　"
    .strn "超音波幼虫的翅膀还在发育中。比起        "
    .strn "长距离飞行,它更擅长振动翅膀发出        "
    .strn "超音波。                    "
    .hword 0x0

;[117]沙漠蜻蜓 
    .hword 0x1, 0x1, 0x8
    .hword 0xA, 0xA, 0x2, 0x0
    .hword 0xA, 0x8, 0x2, 0x0
    .strn "沙漠蜻蜓 "
    .strn "　　神秘　"
    .strn "由于从挥动翅膀掀起的沙暴中传来了        "
    .strn "像歌声一样的振翅声,因此沙漠蜻蜓        "
    .strn "被称为沙漠精灵。                "
    .hword 0x0

;[118]刺球仙人掌
    .hword 0x1, 0x1, 0x9
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0x5, 0x1, 0x3
    .strn "刺球仙人掌"
    .strn "　仙人掌　"
    .strn "越是在少雨严酷的环境中,就越是会        "
    .strn "绽放出美丽且香味浓郁的花朵。          "
    .strn "会挥舞带刺的手臂战斗。             "
    .hword 0x0

;[119]梦歌仙人掌
    .hword 0x1, 0x2, 0x0
    .hword 0xA, 0xA, 0x1, 0x3
    .hword 0xA, 0x7, 0x7, 0x4
    .strn "梦歌仙人掌"
    .strn "　稻草人　"
    .strn "深夜会成群结队紧紧跟在行走在沙漠        "
    .strn "上的旅行者身后。会一直等到他累得        "
    .strn "无法动弹为止。                 "
    .hword 0x0

;[120]青绵鸟  
    .hword 0x1, 0x2, 0x1
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0xA, 0x1, 0x2
    .strn "青绵鸟  "
    .strn "　　绵鸟　"
    .strn "看到脏东西就会用棉花一样的翅膀         "
    .strn "不停地擦拭,是爱干净的宝可梦。         "
    .strn "翅膀脏了的话就会去河里冲洗干净。        "
    .hword 0x0

;[121]七夕青鸟 
    .hword 0x1, 0x2, 0x2
    .hword 0xA, 0xA, 0x1, 0x1
    .hword 0xA, 0x2, 0x0, 0x6
    .strn "七夕青鸟 "
    .strn "　　哼唱　"
    .strn "会用优美的高音歌唱的宝可梦。能用        "
    .strn "棉花云一样的翅膀借助上升气流飞向        "
    .strn "高空。                     "
    .hword 0x0

;[122]猫鼬斩  
    .hword 0x1, 0x2, 0x3
    .hword 0xA, 0xA, 0x1, 0x3
    .hword 0xA, 0x4, 0x0, 0x3
    .strn "猫鼬斩  "
    .strn "　　猫鼬　"
    .strn "与宿敌饭匙蛇战斗的记忆已被刻入它        "
    .strn "体内的细胞中。会用敏捷的身手来         "
    .strn "躲避攻击。                   "
    .hword 0x0

;[123]饭匙蛇  
    .hword 0x1, 0x2, 0x4
    .hword 0xA, 0xA, 0x2, 0x7
    .hword 0xA, 0x5, 0x2, 0x5
    .strn "饭匙蛇  "
    .strn "　　牙蛇　"
    .strn "在用刀刃般的尾巴切开敌人的同时,        "
    .strn "会将渗出的剧毒撒向对方。一直在和        "
    .strn "宿敌猫鼬斩战斗。                "
    .hword 0x0

;[124]月石   
    .hword 0x1, 0x2, 0x5
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0x1, 0x6, 0x8, 0x0
    .strn "月石   "
    .strn "　　陨石　"
    .strn "有着会在满月期间活跃起来的习性。        "
    .strn "会飘浮在空中移动,红色的眼睛充满        "
    .strn "魄力,能让看到它的对方心生恐惧。        "
    .hword 0x0

;[125]太阳岩  
    .hword 0x1, 0x2, 0x6
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0x1, 0x5, 0x4, 0x0
    .strn "太阳岩  "
    .strn "　　陨石　"
    .strn "据说是从宇宙中落下来的新品种。         "
    .strn "会飘浮在空中无声无息地移动。          "
    .strn "在战斗中会放出强光。              "
    .hword 0x0

;[126]泥泥鳅  
    .hword 0x1, 0x2, 0x7
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0xA, 0x1, 0x9
    .strn "泥泥鳅  "
    .strn "　　须鱼　"
    .strn "身上覆盖着黏糊糊的膜,所以就算被        "
    .strn "敌人捉住也可以哧溜一下挣脱出来。        "
    .strn "粘液干掉后身体就会变弱。            "
    .hword 0x0

;[127]鲶鱼王  
    .hword 0x1, 0x2, 0x8
    .hword 0xA, 0xA, 0x0, 0x9
    .hword 0xA, 0x2, 0x3, 0x6
    .strn "鲶鱼王  "
    .strn "　　须鱼　"
    .strn "如果狂暴起来的话,沼泽周围5公里        "
    .strn "的范围内就会产生类似地震的晃动。        "
    .strn "也有着能预知真正地震的能力。          "
    .hword 0x0

;[128]龙虾小兵 
    .hword 0x1, 0x2, 0x9
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x1, 0x1, 0x5
    .strn "龙虾小兵 "
    .strn "　　无赖　"
    .strn "会用锋利的钳子捕捉猎物。不挑食,        "
    .strn "所以什么都吃。住在脏水里也无所谓        "
    .strn "的宝可梦。                   "
    .hword 0x0

;[129]铁螯龙虾 
    .hword 0x1, 0x3, 0x0
    .hword 0xA, 0xA, 0x1, 0x1
    .hword 0xA, 0x3, 0x2, 0x8
    .strn "铁螯龙虾 "
    .strn "　　流氓　"
    .strn "刚蜕完皮时的甲壳是软的。在甲壳         "
    .strn "变硬之前,为了躲避敌人的攻击会         "
    .strn "藏身在河底的洞穴中。              "
    .hword 0x0

;[130]天秤偶  
    .hword 0x1, 0x3, 0x1
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0x2, 0x1, 0x5
    .strn "天秤偶  "
    .strn "　　泥偶　"
    .strn "发现伙伴后就会马上聚集起来一起         "
    .strn "发出叫声,所以很吵。能灵活地用         "
    .strn "单脚站着睡觉。                 "
    .hword 0x0

;[131]念力土偶 
    .hword 0x1, 0x3, 0x2
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0x1, 0x0, 0x8, 0x0
    .strn "念力土偶 "
    .strn "　　泥偶　"
    .strn "从2万年前繁华一时的古文明泥偶中        "
    .strn "诞生的谜之宝可梦。双手会发射出         "
    .strn "光束。                     "
    .hword 0x0

;[132]触手百合 
    .hword 0x1, 0x3, 0x3
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0xA, 0x2, 0x3, 0x8
    .strn "触手百合 "
    .strn "　海百合　"
    .strn "它是大约1亿年前灭绝了的宝可梦。        "
    .strn "会吸附在海底岩石上,用花瓣一样的        "
    .strn "触手捕捉接近自己的猎物。            "
    .hword 0x0

;[133]摇篮百合 
    .hword 0x1, 0x3, 0x4
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0xA, 0x6, 0x0, 0x4
    .strn "摇篮百合 "
    .strn "　　藤壶　"
    .strn "会在海底来回走动寻找食物。会随意        "
    .strn "地伸长如同树枝般的脖子,然后再用        "
    .strn "8只触手捕捉猎物。               "
    .hword 0x0

;[134]太古羽虫 
    .hword 0x1, 0x3, 0x5
    .hword 0xA, 0xA, 0x0, 0x7
    .hword 0xA, 0x1, 0x2, 0x5
    .strn "太古羽虫 "
    .strn "　　古虾　"
    .strn "据说是宝可梦的某个先祖。会通过         "
    .strn "扭动长在体侧的8根翅膀在远古的         "
    .strn "大海里游动。                  "
    .hword 0x0

;[135]太古盔甲 
    .hword 0x1, 0x3, 0x6
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0xA, 0x6, 0x8, 0x2
    .strn "太古盔甲 "
    .strn "　　甲胄　"
    .strn "很久以前就灭绝了的某种宝可梦。         "
    .strn "据说为了能在地上更便利地生活,         "
    .strn "变成了用双脚走路。               "
    .hword 0x0

;[136]宝宝丁  
    .hword 0x1, 0x3, 0x7
    .hword 0xA, 0xA, 0x0, 0x3
    .hword 0xA, 0xA, 0x1, 0x0
    .strn "宝宝丁  "
    .strn "　　气球　"
    .strn "摸起来像棉花糖一样的身上会飘出         "
    .strn "微甜的气味哦。这香味会抚平敌人的        "
    .strn "情绪。                     "
    .hword 0x0

;[137]胖丁   
    .hword 0x1, 0x3, 0x8
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0xA, 0x5, 0x5
    .strn "胖丁   "
    .strn "　　气球　"
    .strn "唱歌时一口气都不会换。所以当遇上        "
    .strn "不容易睡着的对手时,唱歌不换气的        "
    .strn "胖丁也相当于是在拼命了。            "
    .hword 0x0

;[138]胖可丁  
    .hword 0x1, 0x3, 0x9
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0xA, 0x1, 0x2, 0x0
    .strn "胖可丁  "
    .strn "　　气球　"
    .strn "能通过深深地吸气,让充满弹性的         "
    .strn "身体越胀越大。胀大后的胖可丁会         "
    .strn "轻飘飘地跳起来哦。               "
    .hword 0x0

;[139]丑丑鱼  
    .hword 0x1, 0x4, 0x0
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0xA, 0x7, 0x4
    .strn "丑丑鱼  "
    .strn "　　　鱼　"
    .strn "该宝可梦虽然身上破破烂烂的,          "
    .strn "但有着在哪都能生存的顽强生命力。        "
    .strn "不过它行动迟缓,很容易被捉住。         "
    .hword 0x0

;[140]美纳斯  
    .hword 0x1, 0x4, 0x1
    .hword 0xA, 0xA, 0x6, 0x2
    .hword 0x1, 0x6, 0x2, 0x0
    .strn "美纳斯  "
    .strn "　　慈爱　"
    .strn "居住在大湖的湖底。身上发出鲜艳的        "
    .strn "粉红色光辉时,就会放出能安抚暴躁        "
    .strn "之心的波动。                  "
    .hword 0x0

;[141]飘浮泡泡 
    .hword 0x1, 0x4, 0x2
    .hword 0xA, 0xA, 0x0, 0x3
    .hword 0xA, 0xA, 0x0, 0x8
    .strn "飘浮泡泡 "
    .strn "　　天气　"
    .strn "受到自然之力,就会把样子变成          "
    .strn "太阳、雨水或雪云的宝可梦。           "
    .strn "天气变化的话,脾气也会变化。          "
    .hword 0x0

;[142]海星星  
    .hword 0x1, 0x4, 0x3
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0x3, 0x4, 0x5
    .strn "海星星  "
    .strn "　　星形　"
    .strn "在夏天快结束的晚上前往沙滩就能看        "
    .strn "到海星星让身上被称为核心的器官发        "
    .strn "出红光,变得像天上的星星一样哦。        "
    .hword 0x0

;[143]宝石海星 
    .hword 0x1, 0x4, 0x4
    .hword 0xA, 0xA, 0x1, 0x1
    .hword 0xA, 0x8, 0x0, 0x0
    .strn "宝石海星 "
    .strn "　　　谜　"
    .strn "因为位于身体中间被称为核心的部分        "
    .strn "会发出七彩光芒,所以它被冠上了         "
    .strn "海之宝石这一别名。               "
    .hword 0x0

;[144]变隐龙  
    .hword 0x1, 0x4, 0x5
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0xA, 0x2, 0x2, 0x0
    .strn "变隐龙  "
    .strn "　　变色　"
    .strn "将身体的颜色变得和周围景色相同,        "
    .strn "神不知鬼不觉地靠近猎物。能把舌头        "
    .strn "伸得长长的,飞快地捕捉猎物。          "
    .hword 0x0

;[145]怨影娃娃 
    .hword 0x1, 0x4, 0x6
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0xA, 0x2, 0x3
    .strn "怨影娃娃 "
    .strn "　　人偶　"
    .strn "会被嫉妒怨恨的感情所吸引。如果         "
    .strn "有人怨恨心变强,怨影娃娃就会成排        "
    .strn "地挂在那人的屋檐下。              "
    .hword 0x0

;[146]诅咒娃娃 
    .hword 0x1, 0x4, 0x7
    .hword 0xA, 0xA, 0x1, 0x1
    .hword 0xA, 0x1, 0x2, 0x5
    .strn "诅咒娃娃 "
    .strn "　　布偶　"
    .strn "用针刺伤自己的身体时,就会产生         "
    .strn "强烈的诅咒能量。原本是个被丢弃的        "
    .strn "可怜玩偶。                   "
    .hword 0x0

;[147]夜巡灵  
    .hword 0x1, 0x4, 0x8
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0x1, 0x5, 0x0
    .strn "夜巡灵  "
    .strn "　　渡魂　"
    .strn "隐匿在深夜的黑暗中,四处游荡着。        "
    .strn "传说,那些被妈妈斥责的坏孩子会被        "
    .strn "夜巡灵给拐走。                 "
    .hword 0x0

;[148]彷徨夜灵 
    .hword 0x1, 0x4, 0x9
    .hword 0xA, 0xA, 0x1, 0x6
    .hword 0xA, 0x3, 0x0, 0x6
    .strn "彷徨夜灵 "
    .strn "　　招手　"
    .strn "无论多大的东西都能吸进去。会用         "
    .strn "怪异的手部动作和独眼的力量让对手        "
    .strn "陷入催眠状态,将其控制。            "
    .hword 0x0

;[149]热带龙  
    .hword 0x1, 0x5, 0x0
    .hword 0xA, 0xA, 0x2, 0x0
    .hword 0x1, 0x0, 0x0, 0x0
    .strn "热带龙  "
    .strn "　　水果　"
    .strn "南国的孩子们会把热带龙脖子上结出        "
    .strn "的一串水果当零食吃哦。会挥动背上        "
    .strn "的叶子在空中飞翔。               "
    .hword 0x0

;[150]风铃铃  
    .hword 0x1, 0x5, 0x1
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0xA, 0x1, 0x0
    .strn "风铃铃  "
    .strn "　　风铃　"
    .strn "风力变强的话,会用头部的吸盘悬挂        "
    .strn "在树枝或是屋檐下,发出叫声。          "
    .strn "用长长的尾巴抓住树果食用。           "
    .hword 0x0

;[151]阿勃梭鲁 
    .hword 0x1, 0x5, 0x2
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0xA, 0x4, 0x7, 0x0
    .strn "阿勃梭鲁 "
    .strn "　　灾祸　"
    .strn "拥有感知自然灾害的力量。栖息在险        "
    .strn "峻的山岳地带,很少会到山脚下来。        "
    .strn "                        "
    .hword 0x0

;[152]六尾   
    .hword 0x1, 0x5, 0x3
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0xA, 0x9, 0x9
    .strn "六尾   "
    .strn "　　狐狸　"
    .strn "出生的时候是1根白色的尾巴。          "
    .strn "受到足够的爱情滋润后,             "
    .strn "就会分成6根漂亮的卷毛尾。           "
    .hword 0x0

;[153]九尾   
    .hword 0x1, 0x5, 0x4
    .hword 0xA, 0xA, 0x1, 0x1
    .hword 0xA, 0x1, 0x9, 0x9
    .strn "九尾   "
    .strn "　　狐狸　"
    .strn "能从鲜红的眼睛里放出奇异之光,         "
    .strn "自由操纵对手的心灵。              "
    .strn "据说它可以活上1000年。           "
    .hword 0x0

;[154]皮丘   
    .hword 0x1, 0x5, 0x5
    .hword 0xA, 0xA, 0x0, 0x3
    .hword 0xA, 0xA, 0x2, 0x0
    .strn "皮丘   "
    .strn "　　小鼠　"
    .strn "在有雷云出现的时候或空气干燥的         "
    .strn "日子里比较容易蓄电。              "
    .strn "会发出噼里啪啦的静电声音哦。          "
    .hword 0x0

;[155]皮卡丘  
    .hword 0x1, 0x5, 0x6
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0xA, 0x6, 0x0
    .strn "皮卡丘  "
    .strn "　　　鼠　"
    .strn "会用电去电击它第一次看到的东西。        "
    .strn "如果有烧焦的树果落下,那就是它         "
    .strn "搞错了电击强度的证明哦。            "
    .hword 0x0

;[156]雷丘   
    .hword 0x1, 0x5, 0x7
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0x3, 0x0, 0x0
    .strn "雷丘   "
    .strn "　　　鼠　"
    .strn "电力袋中的电力储存过多时,就会把        "
    .strn "尾巴贴着地面放电。因此巢穴附近的        "
    .strn "地面上会有烧焦的痕迹。             "
    .hword 0x0

;[157]可达鸭  
    .hword 0x1, 0x5, 0x8
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0x1, 0x9, 0x6
    .strn "可达鸭  "
    .strn "　　　鸭　"
    .strn "从发挥着神奇力量的可达鸭身上,         "
    .strn "观测到了本应只在睡着时才会出现的        "
    .strn "脑波,因此成为了学术界的话题。         "
    .hword 0x0

;[158]哥达鸭  
    .hword 0x1, 0x5, 0x9
    .hword 0xA, 0xA, 0x1, 0x7
    .hword 0xA, 0x7, 0x6, 0x6
    .strn "哥达鸭  "
    .strn "　　　鸭　"
    .strn "手脚上的蹼和流线型的身体使它能以        "
    .strn "惊人的速度在水里游动。速度绝对比        "
    .strn "金牌运动员快得多。               "
    .hword 0x0

;[159]小果然  
    .hword 0x1, 0x6, 0x0
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x1, 0x4, 0x0
    .strn "小果然  "
    .strn "　　开朗　"
    .strn "小果然总是一脸笑眯眯的。            "
    .strn "生气的时候,注意看尾巴,            "
    .strn "会啪嗒啪嗒地敲击地面。             "
    .hword 0x0

;[160]果然翁  
    .hword 0x1, 0x6, 0x1
    .hword 0xA, 0xA, 0x1, 0x3
    .hword 0xA, 0x2, 0x8, 0x5
    .strn "果然翁  "
    .strn "　　忍耐　"
    .strn "2只以上聚在一起就会开始比拼忍耐        "
    .strn "就算肚子饿了也会一直忍耐下去,所        "
    .strn "以果然翁的训练家对此要多加注意。        "
    .hword 0x0

;[161]天然雀  
    .hword 0x1, 0x6, 0x2
    .hword 0xA, 0xA, 0x0, 0x2
    .hword 0xA, 0xA, 0x2, 0x0
    .strn "天然雀  "
    .strn "　　小鸟　"
    .strn "因为翅膀还没发育成熟所以无法飞行        "
    .strn "对上视线后就会一直盯着对方,只要        "
    .strn "对方有一点动作就会立刻跳起逃走。        "
    .hword 0x0

;[162]天然鸟  
    .hword 0x1, 0x6, 0x3
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0xA, 0x1, 0x5, 0x0
    .strn "天然鸟  "
    .strn "　　神秘　"
    .strn "人们相信天然鸟之所以会整天一动不        "
    .strn "动,是因为它被预知到的未来要发生        "
    .strn "的可怕事情吓到了。               "
    .hword 0x0

;[163]麒麟奇  
    .hword 0x1, 0x6, 0x4
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0xA, 0x4, 0x1, 0x5
    .strn "麒麟奇  "
    .strn "　　长颈　"
    .strn "尾巴上的脑袋里也有着小小的大脑。        "
    .strn "会对臭味和声音产生反应进行攻击,        "
    .strn "因此从后面靠近的话会被突然咬住。        "
    .hword 0x0

;[164]小小象  
    .hword 0x1, 0x6, 0x5
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0x3, 0x3, 0x5
    .strn "小小象  "
    .strn "　　长鼻　"
    .strn "会用长鼻子冲凉。伙伴们聚集起来后        "
    .strn "就会互相喷水。会在岸边晒干湿透的        "
    .strn "身体哦。                    "
    .hword 0x0

;[165]顿甲   
    .hword 0x1, 0x6, 0x6
    .hword 0xA, 0xA, 0x1, 0x1
    .hword 0x1, 0x2, 0x0, 0x0
    .strn "顿甲   "
    .strn "　　铠甲　"
    .strn "就算是房屋都会被它那坚硬的身体         "
    .strn "撞毁。会用这种力量帮忙把山体滑坡        "
    .strn "中滚落下来阻塞山路的泥石移开哦。        "
    .hword 0x0

;[166]凯罗斯  
    .hword 0x1, 0x6, 0x7
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0xA, 0x5, 0x5, 0x0
    .strn "凯罗斯  "
    .strn "　锹形虫　"
    .strn "具有能将自己2倍重的对手用角夹住        "
    .strn "并轻松举起的怪力。在寒冷的地方身        "
    .strn "体会变得迟钝。                 "
    .hword 0x0

;[167]赫拉克罗斯
    .hword 0x1, 0x6, 0x8
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0xA, 0x5, 0x4, 0x0
    .strn "赫拉克罗斯"
    .strn "　　独角　"
    .strn "会笔直地钻进对手的怀里,然后用         "
    .strn "强壮的角将其顶起后再抛出去。          "
    .strn "有着连大树都可以连根拔起的力量。        "
    .hword 0x0

;[168]独角犀牛 
    .hword 0x1, 0x6, 0x9
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0x1, 0x1, 0x5, 0x0
    .strn "独角犀牛 "
    .strn "　　尖尖　"
    .strn "会一个劲儿地向前直冲不停地破坏。        "
    .strn "即使是撞上钢块也完全没事,但过了        "
    .strn "1天会感到稍微有点疼。             "
    .hword 0x0

;[169]钻角犀兽 
    .hword 0x1, 0x7, 0x0
    .hword 0xA, 0xA, 0x1, 0x9
    .hword 0x1, 0x2, 0x0, 0x0
    .strn "钻角犀兽 "
    .strn "　　钻锥　"
    .strn "角能粉碎钻石原石,尾巴能一击扫塌        "
    .strn "大楼。坚硬的皮肤连大炮也无法伤及        "
    .strn "分毫。                     "
    .hword 0x0

;[170]雪童子  
    .hword 0x1, 0x7, 0x1
    .hword 0xA, 0xA, 0x0, 0x7
    .hword 0xA, 0x1, 0x6, 0x8
    .strn "雪童子  "
    .strn "　　雪笠　"
    .strn "该宝可梦生活在经常下雪的地方。         "
    .strn "在不下雪的春夏季节,会安静地生活        "
    .strn "在钟乳石洞的深处。               "
    .hword 0x0

;[171]冰鬼护  
    .hword 0x1, 0x7, 0x2
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0x2, 0x5, 0x6, 0x5
    .strn "冰鬼护  "
    .strn "　　脸面　"
    .strn "用冰之铠甲加固自己的岩石身体。         "
    .strn "该宝可梦拥有令空气中的水分冻结成        "
    .strn "任何形状的能力。                "
    .hword 0x0

;[172]海豹球  
    .hword 0x1, 0x7, 0x3
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0x3, 0x9, 0x5
    .strn "海豹球  "
    .strn "　　拍手　"
    .strn "翻滚的话会比走路快很多。吃饭的         "
    .strn "时候会大家一起高兴地拍手,所以会        "
    .strn "相当的吵。                   "
    .hword 0x0

;[173]海魔狮  
    .hword 0x1, 0x7, 0x4
    .hword 0xA, 0xA, 0x1, 0x1
    .hword 0xA, 0x8, 0x7, 0x6
    .strn "海魔狮  "
    .strn "　　滚球　"
    .strn "有着遇上第一次看到的物体时,          "
    .strn "必定会用鼻子顶着转转看的习性。         "
    .strn "有时候也会转海豹球玩。             "
    .hword 0x0

;[174]帝牙海狮 
    .hword 0x1, 0x7, 0x5
    .hword 0xA, 0xA, 0x1, 0x4
    .hword 0x1, 0x5, 0x0, 0x6
    .strn "帝牙海狮 "
    .strn "　　破冰　"
    .strn "2根发达的獠牙连10吨重的冰山也        "
    .strn "能一击粉碎。脂肪丰厚,即使在冰点        "
    .strn "下也很淡定。                  "
    .hword 0x0

;[175]珍珠贝  
    .hword 0x1, 0x7, 0x6
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0x5, 0x2, 0x5
    .strn "珍珠贝  "
    .strn "　双壳贝　"
    .strn "被坚硬的贝壳保护着长大。            "
    .strn "如果身体无法再藏进壳里了,           "
    .strn "就证明进化的时刻快到了。            "
    .hword 0x0

;[176]猎斑鱼  
    .hword 0x1, 0x7, 0x7
    .hword 0xA, 0xA, 0x1, 0x7
    .hword 0xA, 0x2, 0x7, 0x0
    .strn "猎斑鱼  "
    .strn "　　深海　"
    .strn "用形如小鱼的尾巴引诱猎物靠近 ,        "
    .strn "然后用大嘴一口吞下。              "
    .strn "像蛇一样扭动着身体游泳。            "
    .hword 0x0

;[177]樱花鱼  
    .hword 0x1, 0x7, 0x8
    .hword 0xA, 0xA, 0x1, 0x8
    .hword 0xA, 0x2, 0x2, 0x6
    .strn "樱花鱼  "
    .strn "　　南海　"
    .strn "游泳的样子非常优雅漂亮,但如果         "
    .strn "发现猎物,就会用细细的嘴刺入对方        "
    .strn "身体,咻咻地吸取体液。             "
    .hword 0x0

;[178]古空棘鱼 
    .hword 0x1, 0x7, 0x9
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0xA, 0x2, 0x3, 0x4
    .strn "古空棘鱼 "
    .strn "　　长寿　"
    .strn "在漫长的1亿年间,样子完全没变,        "
    .strn "一直生活在深海的宝可梦。用没有         "
    .strn "牙齿的嘴只吃微生物。              "
    .hword 0x0

;[179]太阳珊瑚 
    .hword 0x1, 0x8, 0x0
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0xA, 0x5, 0x0
    .strn "太阳珊瑚 "
    .strn "　　珊瑚　"
    .strn "聚集在温暖的大海里的太阳珊瑚会         "
    .strn "成为小型宝可梦们的藏身处。           "
    .strn "水温下降后就会向南方移动。           "
    .hword 0x0

;[180]灯笼鱼  
    .hword 0x1, 0x8, 0x1
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0x1, 0x2, 0x0
    .strn "灯笼鱼  "
    .strn "　琵琶鱼　"
    .strn "2根触手中长满了可以产生强电的         "
    .strn "细胞。好像连它自己也会感觉有点         "
    .strn "麻麻的。                    "
    .hword 0x0

;[181]电灯怪  
    .hword 0x1, 0x8, 0x2
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0xA, 0x2, 0x2, 0x5
    .strn "电灯怪  "
    .strn "　　　灯　"
    .strn "如果深夜从船上向漆黑的海里望去,        "
    .strn "在深海游动的电灯怪所发出的亮光有        "
    .strn "时看起来就像星空里的星星一样哦。        "
    .hword 0x0

;[182]爱心鱼  
    .hword 0x1, 0x8, 0x3
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0xA, 0x8, 0x7
    .strn "爱心鱼  "
    .strn "　　相随　"
    .strn "生活在热带的浅海。如果发现情侣就        "
    .strn "会紧跟在后面游泳,因此而得名。         "
    .strn "                        "
    .hword 0x0

;[183]墨海马  
    .hword 0x1, 0x8, 0x4
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0xA, 0x8, 0x0
    .strn "墨海马  "
    .strn "　　　龙　"
    .strn "如果感到危险,就会条件反射地从         "
    .strn "嘴里吐出漆黑的墨汁逃跑。能灵巧地        "
    .strn "摆动背鳍游动。                 "
    .hword 0x0

;[184]海刺龙  
    .hword 0x1, 0x8, 0x5
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0xA, 0x2, 0x5, 0x0
    .strn "海刺龙  "
    .strn "　　　龙　"
    .strn "会通过旋转身体制造漩涡。            "
    .strn "在用强到连渔船都会被卷入的激流让        "
    .strn "猎物变弱后,会将其整个吞掉。          "
    .hword 0x0

;[185]刺龙王  
    .hword 0x1, 0x8, 0x6
    .hword 0xA, 0xA, 0x1, 0x8
    .hword 0x1, 0x5, 0x2, 0x0
    .strn "刺龙王  "
    .strn "　　　龙　"
    .strn "沉睡在没有生物居住的海底。           "
    .strn "据说台风来到时就会醒来,四处徘徊        "
    .strn "寻找猎物。                   "
    .hword 0x0

;[186]宝贝龙  
    .hword 0x1, 0x8, 0x7
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x4, 0x2, 0x1
    .strn "宝贝龙  "
    .strn "坚硬脑袋　"
    .strn "梦想着在天空翱翔,反复练习从悬崖        "
    .strn "上跳下来,在此过程中头部被锻炼得        "
    .strn "如钢铁般坚硬。                 "
    .hword 0x0

;[187]甲壳龙  
    .hword 0x1, 0x8, 0x8
    .hword 0xA, 0xA, 0x1, 0x1
    .hword 0x1, 0x1, 0x0, 0x5
    .strn "甲壳龙  "
    .strn "　　耐力　"
    .strn "在坚硬的壳内部,细胞正在变化,         "
    .strn "并形成崭新的身体。因为壳非常重,        "
    .strn "所以动作迟缓。                 "
    .hword 0x0

;[188]暴飞龙  
    .hword 0x1, 0x8, 0x9
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0x1, 0x0, 0x2, 0x6
    .strn "暴飞龙  "
    .strn "　　　龙　"
    .strn "听说因为一直都强烈渴望着拥有翅膀        "
    .strn "结果导致体内的细胞发生了突变,         "
    .strn "长出了华丽的翅膀。               "
    .hword 0x0

;[189]铁哑铃  
    .hword 0x1, 0x9, 0x0
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x9, 0x5, 0x2
    .strn "铁哑铃  "
    .strn "　　铁球　"
    .strn "让身上放出的磁力和地球的磁力相互        "
    .strn "排斥,从而浮在空中。睡觉时会用         "
    .strn "尾部的爪子勾住悬崖。              "
    .hword 0x0

;[190]金属怪  
    .hword 0x1, 0x9, 0x1
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0x2, 0x0, 0x2, 0x5
    .strn "金属怪  "
    .strn "　　铁爪　"
    .strn "2只铁哑铃组合起来时,2个大脑会        "
    .strn "通过磁力神经连接起来。会向后转动        "
    .strn "手臂高速移动。                 "
    .hword 0x0

;[191]巨金怪  
    .hword 0x1, 0x9, 0x2
    .hword 0xA, 0xA, 0x1, 0x6
    .hword 0x5, 0x5, 0x0, 0x0
    .strn "巨金怪  "
    .strn "　　铁足　"
    .strn "2只金属怪组合起来的样子。一边用        "
    .strn "巨大的身体按住猎物,一边用腹部的        "
    .strn "大嘴来吃。                   "
    .hword 0x0

;[192]雷吉洛克 
    .hword 0x1, 0x9, 0x3
    .hword 0xA, 0xA, 0x1, 0x7
    .hword 0x2, 0x3, 0x0, 0x0
    .strn "雷吉洛克 "
    .strn "　　岩山　"
    .strn "过去曾被人封印的宝可梦。            "
    .strn "听说,如果身体在战斗中损坏,          "
    .strn "就会自己寻找新的岩石来修复。          "
    .hword 0x0

;[193]雷吉艾斯 
    .hword 0x1, 0x9, 0x4
    .hword 0xA, 0xA, 0x1, 0x8
    .hword 0x1, 0x7, 0x5, 0x0
    .strn "雷吉艾斯 "
    .strn "　　冰山　"
    .strn "身体被零下200度的冷气包裹着。        "
    .strn "哪怕只是接近也会被冻住。冰构成的        "
    .strn "身体即使在熔岩中也无法融化。          "
    .hword 0x0

;[194]雷吉斯奇鲁
    .hword 0x1, 0x9, 0x5
    .hword 0xA, 0xA, 0x1, 0x9
    .hword 0x2, 0x0, 0x5, 0x0
    .strn "雷吉斯奇鲁"
    .strn "　　黑金　"
    .strn "拥有比任何金属都坚硬的身体。          "
    .strn "身体内部好像成为了空洞,            "
    .strn "不清楚该宝可梦以什么为食。           "
    .hword 0x0

;[195]拉帝亚斯 
    .hword 0x1, 0x9, 0x6
    .hword 0xA, 0xA, 0x1, 0x4
    .hword 0xA, 0x4, 0x0, 0x0
    .strn "拉帝亚斯 "
    .strn "　　无限　"
    .strn "智商很高,能理解人类的语言。          "
    .strn "会用玻璃般的羽毛包裹身体,           "
    .strn "令光发生折射来改变自己的样子。         "
    .hword 0x0

;[196]拉帝欧斯 
    .hword 0x1, 0x9, 0x7
    .hword 0xA, 0xA, 0x2, 0x0
    .hword 0xA, 0x6, 0x0, 0x0
    .strn "拉帝欧斯 "
    .strn "　　无限　"
    .strn "拥有将所见所思                 "
    .strn "用影像展现给对方的能力。            "
    .strn "能理解人类的语言。               "
    .hword 0x0

;[197]盖欧卡  
    .hword 0x1, 0x9, 0x8
    .hword 0xA, 0xA, 0x4, 0x5
    .hword 0x3, 0x5, 0x2, 0x0
    .strn "盖欧卡  "
    .strn "　　海底　"
    .strn "盖欧卡在神话中被称作以大雨和巨浪        "
    .strn "淹没陆地来扩张海洋的宝可梦。在和        "
    .strn "固拉多殊死战斗之后就陷入了沉睡。        "
    .hword 0x0

;[198]固拉多  
    .hword 0x1, 0x9, 0x9
    .hword 0xA, 0xA, 0x3, 0x5
    .hword 0x9, 0x5, 0x0, 0x0
    .strn "固拉多  "
    .strn "　　大陆　"
    .strn "固拉多在神话中都被描述为创造土地        "
    .strn "扩张大陆的宝可梦。这只宝可梦在和        "
    .strn "盖欧卡殊死战斗后就陷入了沉睡。         "
    .hword 0x0

;[199]烈空坐  
    .hword 0x2, 0x0, 0x0
    .hword 0xA, 0xA, 0x7, 0x0
    .hword 0x2, 0x0, 0x6, 0x5
    .strn "烈空坐  "
    .strn "　　天空　"
    .strn "据说烈空坐在云层之上的臭氧层中         "
    .strn "生活了数亿年。由于它居住在极高的        "
    .strn "高空,它的存在一直都不为人所知。        "
    .hword 0x0

;[200]基拉祈  
    .hword 0x2, 0x0, 0x1
    .hword 0xA, 0xA, 0x0, 0x3
    .hword 0xA, 0xA, 0x1, 0x1
    .strn "基拉祈  "
    .strn "　　祈愿　"
    .strn "传说,它会在醒来时实现写在它头部        "
    .strn "许愿笺上的愿望。如果感知到危险,        "
    .strn "会在睡梦中战斗。                "
    .hword 0x0

;[201]菊草叶  
    .hword 0xA, 0xA, 0xA
    .hword 0xA, 0xA, 0x0, 0x9
    .hword 0xA, 0xA, 0x6, 0x4
    .strn "菊草叶  "
    .strn "　　叶子　"
    .strn "在红宝石台桌特别客串。             "
    .strn "                        "
    .strn "                        "
    .hword 0x0

;[202]火球鼠  
    .hword 0xA, 0xA, 0xA
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0xA, 0x7, 0x9
    .strn "火球鼠  "
    .strn "　　火鼠　"
    .strn "在红宝石台桌特别客串。             "
    .strn "                        "
    .strn "                        "
    .hword 0x0

;[203]小锯鳄  
    .hword 0xA, 0xA, 0xA
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0xA, 0x9, 0x5
    .strn "小锯鳄  "
    .strn "　　大颚　"
    .strn "在红宝石台桌特别客串。             "
    .strn "                        "
    .strn "                        "
    .hword 0x0

;[204]化石翼龙 
    .hword 0xA, 0xA, 0xA
    .hword 0xA, 0xA, 0x1, 0x8
    .hword 0xA, 0x5, 0x9, 0x0
    .strn "化石翼龙 "
    .strn "　　化石　"
    .strn "在红宝石台桌特别客串。             "
    .strn "                        "
    .strn "                        "
    .hword 0x0

/*
.loadtable "./charmap_8x16.txt"
.org TextOfPokedex
;[0]木守宫  
    .hword 0x0, 0x0, 0x1
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0xA, 0x5, 0x0
    .strn "キモリ  "
    .strn "もりトカゲ"
    .strn "あしの うらの ちいさな トゲを ひっかけて  "
    .strn "すいちょくの カベを のぼることができる。   "
    .strn "ふとい しっぽを たたきつけて こうげきする。 "
    .hword 0x0

;[1]森林蜥蜴 
    .hword 0x0, 0x0, 0x2
    .hword 0xA, 0xA, 0x0, 0x9
    .hword 0xA, 0x2, 0x1, 0x6
    .strn "ジュプトル"
    .strn "もりトカゲ"
    .strn "からだから はえた はっぱは もりの なかで  "
    .strn "てきから すがたを かくす ときに べんり。  "
    .strn "みつりんにくらす きのぼりの めいしゅ。    "
    .hword 0x0

;[2]蜥蜴王  
    .hword 0x0, 0x0, 0x3
    .hword 0xA, 0xA, 0x1, 0x7
    .hword 0xA, 0x5, 0x2, 0x2
    .strn "ジュカイン"
    .strn " みつりん"
    .strn "からだに はえた はっぱは するどい きれあじ。"
    .strn "すばやい みのこなしで きの えだを とびまわり"
    .strn "てきの ずじょうや はいごから おそいかかるぞ。"
    .hword 0x0

;[3]火稚鸡  
    .hword 0x0, 0x0, 0x4
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0xA, 0x2, 0x5
    .strn "アチャモ "
    .strn "  ひよこ"
    .strn "トレ-ナ-に くっついて ちょこちょこ あるく。"
    .strn "くちから とばす ほのおは せっし 1000ど。"
    .strn "あいてを くろコゲにする しゃくねつの たまだ。"
    .hword 0x0

;[4]力壮鸡  
    .hword 0x0, 0x0, 0x5
    .hword 0xA, 0xA, 0x0, 0x9
    .hword 0xA, 0x1, 0x9, 0x5
    .strn "ワカシャモ"
    .strn " わかどり"
    .strn "のやまを はしりまわって あしこしを きたえる。"
    .strn "スピ-ドと パワ-を かねそなえた あしは   "
    .strn "1びょうかんに 10ぱつの キックを くりだす。"
    .hword 0x0

;[5]火焰鸡  
    .hword 0x0, 0x0, 0x6
    .hword 0xA, 0xA, 0x1, 0x9
    .hword 0xA, 0x5, 0x2, 0x0
    .strn "バシャ-モ"
    .strn "  もうか"
    .strn "たたかいに なると てくびから しゃくねつの  "
    .strn "ほのおを ふきあげ ゆうかんに いどみかかる。 "
    .strn "あいてが てごわいほど はげしく もえあがる。 "
    .hword 0x0

;[6]水跃鱼  
    .hword 0x0, 0x0, 0x7
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0xA, 0x7, 0x6
    .strn "ミズゴロウ"
    .strn " ぬまうお"
    .strn "すいちゅうでは ほっぺの エラで こきゅうする。"
    .strn "ピンチに なると からだより おおきな いわを "
    .strn "こなごなに くだく パワ-を はっきする。   "
    .hword 0x0

;[7]沼跃鱼  
    .hword 0x0, 0x0, 0x8
    .hword 0xA, 0xA, 0x0, 0x7
    .hword 0xA, 0x2, 0x8, 0x0
    .strn "ヌマクロ-"
    .strn " ぬまうお"
    .strn "すいちゅうを およぐより どろの なかを    "
    .strn "すすむ ほうが だんぜん はやく いどうできる。"
    .strn "あしこしが はったつして 2ほんあしで あるく。"
    .hword 0x0

;[8]巨沼怪  
    .hword 0x0, 0x0, 0x9
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0xA, 0x8, 0x1, 0x9
    .strn "ラグラ-ジ"
    .strn " ぬまうお"
    .strn "ラグラ-ジは なみおとや しおかぜの わずかな "
    .strn "ちがいを ヒレで かんじ あらしを よかんする。"
    .strn "あらしになると いわを つみあげ すを まもる。"
    .hword 0x0

;[9]土狼犬  
    .hword 0x0, 0x1, 0x0
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0x1, 0x3, 0x6
    .strn "ポチエナ "
    .strn " かみつき"
    .strn "うごく ものを みつけると すぐに かみつく。 "
    .strn "えものが ヘトヘトに なるまで おいかけまわすが"
    .strn "はんげきされると しりごみする ことも あるよ。"
    .hword 0x0

;[10]大狼犬  
    .hword 0x0, 0x1, 0x1
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0xA, 0x3, 0x7, 0x0
    .strn "グラエナ "
    .strn " かみつき"
    .strn "どうもうな うなりごえを あげながら しせいを "
    .strn "ひくく している ときは こうげきの まえぶれ。"
    .strn "するどく とがった キバで がぶりと かみつく。"
    .hword 0x0

;[11]蛇纹熊  
    .hword 0x0, 0x1, 0x2
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0x1, 0x7, 0x5
    .strn "ジグザグマ"
    .strn "まめだぬき"
    .strn "いつも あっち こっちへ ジグザグ あるくのは "
    .strn "こうきしんが とても つよくて めに うつる  "
    .strn "いろんな ものに きょうみを もつからだ。   "
    .hword 0x0

;[12]直冲熊  
    .hword 0x0, 0x1, 0x3
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0x3, 0x2, 0x5
    .strn "マッスグマ"
    .strn " とっしん"
    .strn "まっすぐに つっぱしり しょうがいぶつが ある "
    .strn "ときは ちょっかくに おれまがって よける。  "
    .strn "ゆるやかに カ-ブした みちが とても にがて。"
    .hword 0x0

;[13]刺尾虫  
    .hword 0x0, 0x1, 0x4
    .hword 0xA, 0xA, 0x0, 0x3
    .hword 0xA, 0xA, 0x3, 0x6
    .strn "ケムッソ "
    .strn " いもむし"
    .strn "エサにしようと つかまえにきた オオスバメに  "
    .strn "おしりの トゲを むけて ていこうする。    "
    .strn "しみだした どくで あいてを よわらせるぞ。  "
    .hword 0x0

;[14]甲壳茧  
    .hword 0x0, 0x1, 0x5
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x1, 0x0, 0x0
    .strn "カラサリス"
    .strn "  さなぎ"
    .strn "しんかするまで なにも たべずに たえていると "
    .strn "かんがえられていたが どうやら いとに ついた "
    .strn "あまみずで かわきを いやしているらしい。   "
    .hword 0x0

;[15]狩猎凤蝶 
    .hword 0x0, 0x1, 0x6
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0xA, 0x2, 0x8, 0x4
    .strn "アゲハント"
    .strn "ちょうちょ"
    .strn "くるりと まいた はりの ような ながい くちは"
    .strn "かふんを あつめる ときに とても べんり。  "
    .strn "はるかぜに のって かふんを あつめて まわる。"
    .hword 0x0

;[16]盾甲茧  
    .hword 0x0, 0x1, 0x7
    .hword 0xA, 0xA, 0x0, 0x7
    .hword 0xA, 0x1, 0x1, 0x5
    .strn "マユルド "
    .strn "  さなぎ"
    .strn "うごくと つよい からだに しんか できないので"
    .strn "どんなに いためつけられても じっと している。"
    .strn "そのとき うけた いたみは ずっと わすれない。"
    .hword 0x0

;[17]毒粉蛾  
    .hword 0x0, 0x1, 0x8
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0xA, 0x3, 0x1, 0x6
    .strn "ドクケイル"
    .strn "  どくが"
    .strn "はばたくと こまかい こなが まいあがる。   "
    .strn "すいこむと プロレスラ-も ねこむ もうどくだ。"
    .strn "しょっかくの レ-ダ-で エサを さがす。   "
    .hword 0x0

;[18]莲叶童子 
    .hword 0x0, 0x1, 0x9
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0xA, 0x2, 0x6
    .strn "ハスボ- "
    .strn " うきくさ"
    .strn "もともとは ちじょうで せいかつしていたが   "
    .strn "あたまの はっぱが おもくなったので みずに  "
    .strn "うかんで くらすようになったと いわれている。 "
    .hword 0x0

;[19]莲帽小童 
    .hword 0x0, 0x2, 0x0
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0xA, 0x3, 0x2, 0x5
    .strn "ハスブレロ"
    .strn "  ようき"
    .strn "からだじゅう ヌルヌルした ねんえきで おおわれ"
    .strn "その てで さわられると とても きもちわるい。"
    .strn "にんげんの こどもと よく まちがえられる。  "
    .hword 0x0

;[20]乐天河童 
    .hword 0x0, 0x2, 0x1
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0xA, 0x5, 0x5, 0x0
    .strn "ルンパッパ"
    .strn "のうてんき"
    .strn "ようきな リズムを きくと からだの さいぼうが"
    .strn "かっぱつに かつどうを はじめる たいしつ。  "
    .strn "たたかいでも すごい パワ-を はっきするぞ。 "
    .hword 0x0

;[21]橡实果  
    .hword 0x0, 0x2, 0x2
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0xA, 0x4, 0x0
    .strn "タネボ- "
    .strn " どんぐり"
    .strn "あたまの てっぺんを きの えだに くっつけて "
    .strn "ぶらさがり ながら すいぶんを すいとっている。"
    .strn "みずを のむほど からだが ツヤツヤ ひかる。 "
    .hword 0x0

;[22]长鼻叶  
    .hword 0x0, 0x2, 0x3
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0xA, 0x2, 0x8, 0x0
    .strn "コノハナ "
    .strn " いじわる"
    .strn "うっそうと しげった もりに すむ ポケモン。 "
    .strn "たまに もりを でては ひとを おどろかせる。 "
    .strn "ながい はなを つかまれるのは だいきらい。  "
    .hword 0x0

;[23]狡猾天狗 
    .hword 0x0, 0x2, 0x4
    .hword 0xA, 0xA, 0x1, 0x3
    .hword 0xA, 0x5, 0x9, 0x6
    .strn "ダ-テング"
    .strn " よこしま"
    .strn "じゅれい 1000ねんを こえた たいぼくの  "
    .strn "てっぺんに すむと いわれる なぞの ポケモン。"
    .strn "はっぱの うちわで きょうふうを まきおこす。 "
    .hword 0x0

;[24]傲骨燕  
    .hword 0x0, 0x2, 0x5
    .hword 0xA, 0xA, 0x0, 0x3
    .hword 0xA, 0xA, 0x2, 0x3
    .strn "スバメ  "
    .strn " こツバメ"
    .strn "どんな つよい あいてでも ゆうかんに いどむ。"
    .strn "まけても へこたれない こんじょうの もちぬし。"
    .strn "おなかが すくと おおごえで ないて しまう。 "
    .hword 0x0

;[25]大王燕  
    .hword 0x0, 0x2, 0x6
    .hword 0xA, 0xA, 0x0, 0x7
    .hword 0xA, 0x1, 0x9, 0x8
    .strn "オオスバメ"
    .strn "  ツバメ"
    .strn "はるか じょうくうを えんを えがく ように  "
    .strn "とびまわり えものを みつけると きゅうこうか。"
    .strn "あしの ツメで がっしり つかんで にがさない。"
    .hword 0x0

;[26]长翅鸥  
    .hword 0x0, 0x2, 0x7
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0xA, 0x9, 0x5
    .strn "キャモメ "
    .strn " うみねこ"
    .strn "エサや だいじな ものを くちばしに はさみ  "
    .strn "いろんな ばしょに かくす しゅうせいを もつ。"
    .strn "かぜに のって すべる ように そらを とぶ。 "
    .hword 0x0

;[27]大嘴鸥  
    .hword 0x0, 0x2, 0x8
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0xA, 0x2, 0x8, 0x0
    .strn "ペリッパ-"
    .strn " みずどり"
    .strn "ちいさな ポケモンや タマゴを クチバシに   "
    .strn "いれて はこぶ そらの はこびやだ。      "
    .strn "うみべの けわしい がけに すを つくる。   "
    .hword 0x0

;[28]拉鲁拉丝 
    .hword 0x0, 0x2, 0x9
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0xA, 0x6, 0x6
    .strn "ラルトス "
    .strn "  きもち"
    .strn "あたまの ツノで ひとの きもちを かんじとる。"
    .strn "ひとまえには めったに すがたを あらわさないが"
    .strn "まえむきな きもちを キャッチすると ちかよる。"
    .hword 0x0

;[29]奇鲁莉安 
    .hword 0x0, 0x3, 0x0
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0x2, 0x0, 0x2
    .strn "キルリア "
    .strn "かんじょう"
    .strn "トレ-ナ-の あかるい かんじょうに ふれている"
    .strn "キルリアは うつくしく せいちょうすると いう。"
    .strn "はったつした のうで サイコパワ-を あやつる。"
    .hword 0x0

;[30]沙奈朵  
    .hword 0x0, 0x3, 0x1
    .hword 0xA, 0xA, 0x1, 0x6
    .hword 0xA, 0x4, 0x8, 0x4
    .strn "サ-ナイト"
    .strn " ほうよう"
    .strn "みらいを よちする のうりょくで トレ-ナ-の "
    .strn "きけんを さっちしたとき さいだい パワ-の  "
    .strn "サイコエネルギ-を つかうと いわれている。  "
    .hword 0x0

;[31]溜溜糖球 
    .hword 0x0, 0x3, 0x2
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0xA, 0x1, 0x7
    .strn "アメタマ "
    .strn " あめんぼ"
    .strn "きけんを かんじると あたまの さきっぽから  "
    .strn "みずあめのような あまい えきたいを だす。  "
    .strn "これが こうぶつの ポケモンも いるよ。    "
    .hword 0x0

;[32]雨翅蛾  
    .hword 0x0, 0x3, 0x3
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0xA, 0x3, 0x6
    .strn "アメモ-ス"
    .strn "  めだま"
    .strn "おこった ひょうじょうの めだま もようが   "
    .strn "かなしそうに たれさがっている ときは     "
    .strn "ゆうだちの ふりだす ぜんちょうと いわれる。 "
    .hword 0x0

;[33]蘑蘑菇  
    .hword 0x0, 0x3, 0x4
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0xA, 0x4, 0x5
    .strn "キノココ "
    .strn "  きのこ"
    .strn "ふかい もりの しめった じめんに せいそく。 "
    .strn "おちばの したで じっとしていることが おおい。"
    .strn "おちばが つもって できた ふようどを たべる。"
    .hword 0x0

;[34]斗笠菇  
    .hword 0x0, 0x3, 0x5
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0xA, 0x3, 0x9, 0x2
    .strn "キノガッサ"
    .strn "  きのこ"
    .strn "かろやかな フットワ-クで てきに ちかづき  "
    .strn "のびちぢみする うでで パンチを くりだす。  "
    .strn "ボクサ- かおまけの テクニックの もちぬし。 "
    .hword 0x0

;[35]懒人獭  
    .hword 0x0, 0x3, 0x6
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0x2, 0x4, 0x0
    .strn "ナマケロ "
    .strn "なまけもの"
    .strn "しんぞうの こどうは 1ぷんかんに 1かい。  "
    .strn "とにかく じっと ねそべっている ポケモンで  "
    .strn "うごく すがたを みることは ほとんど ない。 "
    .hword 0x0

;[36]过动猿  
    .hword 0x0, 0x3, 0x7
    .hword 0xA, 0xA, 0x1, 0x4
    .hword 0xA, 0x4, 0x6, 0x5
    .strn "ヤルキモノ"
    .strn "あばれザル"
    .strn "じっとしている ことが できない ポケモンだ。 "
    .strn "ねむろうとしても からだの ちが たぎってしまい"
    .strn "もりじゅうを かけまわらないと おさまらない。 "
    .hword 0x0

;[37]请假王  
    .hword 0x0, 0x3, 0x8
    .hword 0xA, 0xA, 0x2, 0x0
    .hword 0x1, 0x3, 0x0, 0x5
    .strn "ケッキング"
    .strn " ものぐさ"
    .strn "そうげんに きざまれた はんけい 1メ-トルの "
    .strn "わっかは ケッキングが ねそべったまま まわりの"
    .strn "くさを たべつくして できた ものだ。     "
    .hword 0x0

;[38]凯西   
    .hword 0x0, 0x3, 0x9
    .hword 0xA, 0xA, 0x0, 0x9
    .hword 0xA, 0x1, 0x9, 0x5
    .strn "ケ-シィ "
    .strn " ねんりき"
    .strn "まいにち 18じかん ねむらないと ねぶそくで "
    .strn "ちょうのうりょくが つかえなくなってしまう。  "
    .strn "おそわれると ねたまま テレポ-トで にげる。 "
    .hword 0x0

;[39]勇基拉  
    .hword 0x0, 0x4, 0x0
    .hword 0xA, 0xA, 0x1, 0x3
    .hword 0xA, 0x5, 0x6, 0x5
    .strn "ユンゲラ-"
    .strn " ねんりき"
    .strn "ぎんの スプ-ンは アルファはを たかめる。  "
    .strn "スプ-ンが ないと いつもの はんぶんしか   "
    .strn "ちょうのうりょくを つかえなくなると いう。  "
    .hword 0x0

;[40]胡地   
    .hword 0x0, 0x4, 0x1
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0xA, 0x4, 0x8, 0x0
    .strn "フ-ディン"
    .strn " ねんりき"
    .strn "むげんに ふえる のうさいぼうが ちのうしすう "
    .strn "5000の ス-パ-ずのうを つくりだした。  "
    .strn "せかいの できごとを すべて きおくしている。 "
    .hword 0x0

;[41]土居忍士 
    .hword 0x0, 0x4, 0x2
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0xA, 0x5, 0x5
    .strn "ツチニン "
    .strn " したづみ"
    .strn "なんねんも まっくらな つちの なかで くらす。"
    .strn "きの ねっこから えいようを きゅうしゅうして "
    .strn "じっと うごかず しんかの ときを まっている。"
    .hword 0x0

;[42]铁面忍者 
    .hword 0x0, 0x4, 0x3
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0x1, 0x2, 0x0
    .strn "テッカニン"
    .strn "  しのび"
    .strn "こうそくで うごきまわり すがたが みえない。 "
    .strn "なきごえしか きこえて こないので ながいあいだ"
    .strn "とうめいな ポケモンと かんがえられていた。  "
    .hword 0x0

;[43]脱壳忍者 
    .hword 0x0, 0x4, 0x4
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0xA, 0x1, 0x2
    .strn "ヌケニン "
    .strn " ぬけがら"
    .strn "かたい からだは ぴくりとも うごかない。   "
    .strn "せなかから からだの くうどうを のぞくと   "
    .strn "たましいを すいとられると しんじられている。 "
    .hword 0x0

;[44]咕妞妞  
    .hword 0x0, 0x4, 0x5
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x1, 0x6, 0x3
    .strn "ゴニョニョ"
    .strn " ささやき"
    .strn "ひとたび おおごえで なきだすと じぶんの   "
    .strn "こえに びっくりして さらに はげしく なく。 "
    .strn "なきやむと つかれて ねむってしまう。     "
    .hword 0x0

;[45]吼爆弹  
    .hword 0x0, 0x4, 0x6
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0xA, 0x4, 0x0, 0x5
    .strn "ドゴ-ム "
    .strn " おおごえ"
    .strn "あしを ふみならしながら おおごえを だす。  "
    .strn "おおごえを だしたあとは しばらくの あいだ  "
    .strn "なにも きこえなくなってしまうのが じゃくてん。"
    .hword 0x0

;[46]爆音怪  
    .hword 0x0, 0x4, 0x7
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0xA, 0x8, 0x4, 0x0
    .strn "バクオング"
    .strn " そうおん"
    .strn "からだの あなから ふえの ような おとを   "
    .strn "だして なかまに きもちを つたえている。   "
    .strn "おおごえは たたかう ときしか ださないのだ。 "
    .hword 0x0

;[47]幕下力士 
    .hword 0x0, 0x4, 0x8
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0xA, 0x8, 0x6, 0x4
    .strn "マクノシタ"
    .strn "こんじょう"
    .strn "ぜったいに あきらめない こんじょうを もつ。 "
    .strn "たくさん たべ よく ねて うんどうする ことで"
    .strn "からだの なかに エネルギ-が じゅうまんする。"
    .hword 0x0

;[48]铁掌力士 
    .hword 0x0, 0x4, 0x9
    .hword 0xA, 0xA, 0x2, 0x3
    .hword 0x2, 0x5, 0x3, 0x8
    .strn "ハリテヤマ"
    .strn " つっぱり"
    .strn "ふとった からだは きんにくの かたまり。   "
    .strn "ぐぐっと ぜんしんに ちからを こめると    "
    .strn "きんにくは いわと おなじ かたさになるぞ。  "
    .hword 0x0

;[49]角金鱼  
    .hword 0x0, 0x5, 0x0
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x1, 0x5, 0x0
    .strn "トサキント"
    .strn " きんぎょ"
    .strn "かわや いけを およぐ ことが だいすきなので "
    .strn "すいそう なんかに いれていたら ぶあつい   "
    .strn "ガラスも ツノの ひとつきで わって にげるぞ。"
    .hword 0x0

;[50]金鱼王  
    .hword 0x0, 0x5, 0x1
    .hword 0xA, 0xA, 0x1, 0x3
    .hword 0xA, 0x3, 0x9, 0x0
    .strn "アズマオウ"
    .strn " きんぎょ"
    .strn "タマゴを まもるため オスと メスは こうたいで"
    .strn "すの まわりを およぎまわり パトロ-ルする。 "
    .strn "タマゴが かえるまで ひとつきいじょう つづく。"
    .hword 0x0

;[51]鲤鱼王  
    .hword 0x0, 0x5, 0x2
    .hword 0xA, 0xA, 0x0, 0x9
    .hword 0xA, 0x1, 0x0, 0x0
    .strn "コイキング"
    .strn "  さかな"
    .strn "はねている だけで まんぞくに たたかえないため"
    .strn "よわいと おもわれているが どんなに よごれた "
    .strn "みずでも くらせる しぶとい ポケモンなのだ。 "
    .hword 0x0

;[52]暴鲤龙  
    .hword 0x0, 0x5, 0x3
    .hword 0xA, 0xA, 0x6, 0x5
    .hword 0x2, 0x3, 0x5, 0x0
    .strn "ギャラドス"
    .strn "きょうあく"
    .strn "いちど あばれはじめると すべてを もやさないと"
    .strn "きょうぼうな ちが おさまらなく なってしまう。"
    .strn "ひとつき あばれつづけた きろくが のこる。  "
    .hword 0x0

;[53]露力丽  
    .hword 0x0, 0x5, 0x4
    .hword 0xA, 0xA, 0x0, 0x2
    .hword 0xA, 0xA, 0x2, 0x0
    .strn "ルリリ  "
    .strn " みずたま"
    .strn "しっぽには せいちょうする ために ひつような "
    .strn "えいようが たっぷり つまっているぞ。     "
    .strn "だんりょくの ある しっぽに のって あそぶ。 "
    .hword 0x0

;[54]玛力露  
    .hword 0x0, 0x5, 0x5
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0xA, 0x8, 0x5
    .strn "マリル  "
    .strn "みずねずみ"
    .strn "ながれの はやい かわで エサを とる ときは "
    .strn "しっぽを かわべりの きの みきに まきつける。"
    .strn "しっぽは だんりょくがあって のびる しくみ。 "
    .hword 0x0

;[55]玛力露丽 
    .hword 0x0, 0x5, 0x6
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0x2, 0x8, 0x5
    .strn "マリルリ "
    .strn "みずうさぎ"
    .strn "くうきの ふうせんを つくる ことが できる。 "
    .strn "ポケモンが おぼれていると くうきだまを だして"
    .strn "こきゅうが できる ように してあげるのだ。  "
    .hword 0x0

;[56]小拳石  
    .hword 0x0, 0x5, 0x7
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0x2, 0x0, 0x0
    .strn "イシツブテ"
    .strn " がんせき"
    .strn "じめんに はんぶん うまり ぐっすり ねむる。 "
    .strn "とざんしゃに ふまれても まったく おきないよ。"
    .strn "あさ エサを さがして さかを ころがりおちる。"
    .hword 0x0

;[57]隆隆石  
    .hword 0x0, 0x5, 0x8
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0x1, 0x0, 0x5, 0x0
    .strn "ゴロ-ン "
    .strn " がんせき"
    .strn "やまの ふもとから さんちょうまで のぼる   "
    .strn "あいだに だいすきな いわを ガリガリ たべる。"
    .strn "ちょうじょうに つくと また ころがりおちる。 "
    .hword 0x0

;[58]隆隆岩  
    .hword 0x0, 0x5, 0x9
    .hword 0xA, 0xA, 0x1, 0x4
    .hword 0x3, 0x0, 0x0, 0x0
    .strn "ゴロ-ニャ"
    .strn " メガトン"
    .strn "やまの しゃめんに ほってある みぞは ころがり"
    .strn "おちてきた ゴロ-ニャが みんかに ぶつからない"
    .strn "ように するための とおりみちに なっているぞ。"
    .hword 0x0

;[59]朝北鼻  
    .hword 0x0, 0x6, 0x0
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0xA, 0x9, 0x7, 0x0
    .strn "ノズパス "
    .strn " コンパス"
    .strn "じしゃくの はなは いつも きたを むいている。"
    .strn "ノズパスどうしは じしゃくが はんぱつしあうため"
    .strn "ちかくで かおを あわせる ことが できない。 "
    .hword 0x0

;[60]向尾喵  
    .hword 0x0, 0x6, 0x1
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x1, 0x1, 0x0
    .strn "エネコ  "
    .strn "  こねこ"
    .strn "うごく ものを みつけると むちゅうに なって "
    .strn "おいかけまわす しゅうせいを もつ ポケモン。 "
    .strn "じぶんの シッポを おいかけて めを まわす。 "
    .hword 0x0

;[61]优雅猫  
    .hword 0x0, 0x6, 0x2
    .hword 0xA, 0xA, 0x1, 0x1
    .hword 0xA, 0x3, 0x2, 0x6
    .strn "エネコロロ"
    .strn " おすまし"
    .strn "マイペ-スで じゆうきままな くらしを このむ。"
    .strn "きのむくまま エサを たべたり ねむったり   "
    .strn "しているので 1にちの リズムが バラバラだ。 "
    .hword 0x0

;[62]超音蝠  
    .hword 0x0, 0x6, 0x3
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0xA, 0x7, 0x5
    .strn "ズバット "
    .strn " こうもり"
    .strn "たいようの ひかりを あびると たいちょうが  "
    .strn "わるくなるので ひるまは どうくつや ふるびた "
    .strn "いえの のきしたに ぶらさがって ねている。  "
    .hword 0x0

;[63]大嘴蝠  
    .hword 0x0, 0x6, 0x4
    .hword 0xA, 0xA, 0x1, 0x6
    .hword 0xA, 0x5, 0x5, 0x0
    .strn "ゴルバット"
    .strn " こうもり"
    .strn "4ほんの キバで かみつき けつえきを のむ。 "
    .strn "つきの でてない まっくらな よるは かっぱつに"
    .strn "とびまわり ひとや ポケモンを おそうぞ。   "
    .hword 0x0

;[64]叉字蝠  
    .hword 0x0, 0x6, 0x5
    .hword 0xA, 0xA, 0x1, 0x8
    .hword 0xA, 0x7, 0x5, 0x0
    .strn "クロバット"
    .strn " こうもり"
    .strn "みみを すまさないと きこえないほど ちいさな "
    .strn "はおとで ねらった えものに しのびよるぞ。  "
    .strn "うしろあしの ハネで えだに つかまり やすむ。"
    .hword 0x0

;[65]玛瑙水母 
    .hword 0x0, 0x6, 0x6
    .hword 0xA, 0xA, 0x0, 0x9
    .hword 0xA, 0x4, 0x5, 0x5
    .strn "メノクラゲ"
    .strn "  くらげ"
    .strn "からだの ほとんどが みずで できているので  "
    .strn "うみから でると からからに ひからびてしまう。"
    .strn "ひからびた ときは うみに もどしてあげよう。 "
    .hword 0x0

;[66]毒刺水母 
    .hword 0x0, 0x6, 0x7
    .hword 0xA, 0xA, 0x1, 0x6
    .hword 0xA, 0x5, 0x5, 0x0
    .strn "ドククラゲ"
    .strn "  くらげ"
    .strn "あたまの あかい たまが ひかるとき はげしい "
    .strn "ちょうおんぱが あたりに はっしゃ される。  "
    .strn "そのとき かいめんが はげしく なみうつという。"
    .hword 0x0

;[67]勾魂眼  
    .hword 0x0, 0x6, 0x8
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0x1, 0x1, 0x0
    .strn "ヤミラミ "
    .strn " くらやみ"
    .strn "するどい ツメで つちを ほり いしを たべる。"
    .strn "いしに ふくまれた せいぶんは けっしょうとなり"
    .strn "からだの ひょうめんに うかびあがってくる。  "
    .hword 0x0

;[68]大嘴娃  
    .hword 0x0, 0x6, 0x9
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x1, 0x1, 0x5
    .strn "クチ-ト "
    .strn " あざむき"
    .strn "はがねの ツノが へんけいした おおきな あご。"
    .strn "おとなしそうな かおに ゆだんを していると  "
    .strn "とつぜん ふりむき バクリと かみつかれるぞ。 "
    .hword 0x0

;[69]可可多拉 
    .hword 0x0, 0x7, 0x0
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0x6, 0x0, 0x0
    .strn "ココドラ "
    .strn "てつヨロイ"
    .strn "こうてつの からだで おもいっきり ぶつかれば "
    .strn "おおきな ダンプカ-も いちげきで バラバラだ。"
    .strn "こわれた ダンプカ-を むしゃむしゃ たべるぞ。"
    .hword 0x0

;[70]可多拉  
    .hword 0x0, 0x7, 0x1
    .hword 0xA, 0xA, 0x0, 0x9
    .hword 0x1, 0x2, 0x0, 0x0
    .strn "コドラ  "
    .strn "てつヨロイ"
    .strn "いしや みずに ふくまれる てつぶんを たべる。"
    .strn "てっこうせきの うもれた やまに すを つくるが"
    .strn "てつを とりにくる にんげんと あらそいになる。"
    .hword 0x0

;[71]波士可多拉
    .hword 0x0, 0x7, 0x2
    .hword 0xA, 0xA, 0x2, 0x1
    .hword 0x3, 0x6, 0x0, 0x0
    .strn "ボスゴドラ"
    .strn "てつヨロイ"
    .strn "どしゃくずれや やまかじで やまが あれると  "
    .strn "せっせと つちを はこび きの なえを うえて "
    .strn "じぶんの なわばりを きれいに そうじする。  "
    .hword 0x0

;[72]腕力   
    .hword 0x0, 0x7, 0x3
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0x1, 0x9, 0x5
    .strn "ワンリキ-"
    .strn " かいりき"
    .strn "どんなに うんどうを しても いたくならない  "
    .strn "とくべつな きんにくを もつ ポケモン。    "
    .strn "おとな 100にんを なげとばす パワ-。   "
    .hword 0x0

;[73]豪力   
    .hword 0x0, 0x7, 0x4
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0xA, 0x7, 0x0, 0x5
    .strn "ゴ-リキ-"
    .strn " かいりき"
    .strn "きたえあげた きんにくは はがねの かたさ。  "
    .strn "すもうとりの からだも ゆび 1ぽんで らくらく"
    .strn "もちあげてしまう かいりきの ポケモンだ。   "
    .hword 0x0

;[74]怪力   
    .hword 0x0, 0x7, 0x5
    .hword 0xA, 0xA, 0x1, 0x6
    .hword 0x1, 0x3, 0x0, 0x0
    .strn "カイリキ-"
    .strn " かいりき"
    .strn "なんでも なげとばす パワ-を もつが こまかい"
    .strn "さぎょうを すると うでが からまってしまう。 "
    .strn "かんがえる よりも さきに からだが うごく。 "
    .hword 0x0

;[75]玛沙那  
    .hword 0x0, 0x7, 0x6
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x1, 0x1, 0x2
    .strn "アサナン "
    .strn " めいそう"
    .strn "めいそうで せいしんエネルギ-を たかめている。"
    .strn "1にちに きのみを 1こだけしか たべない。  "
    .strn "あまり たべない ことも しゅぎょうの ひとつ。"
    .hword 0x0

;[76]恰雷姆  
    .hword 0x0, 0x7, 0x7
    .hword 0xA, 0xA, 0x1, 0x3
    .hword 0xA, 0x3, 0x1, 0x5
    .strn "チャ-レム"
    .strn " めいそう"
    .strn "ヨガの ちからで だい6かんが はったつして  "
    .strn "サイコパワ-を あやつれる ように なった。  "
    .strn "1かげつかん なにも たべずに めいそうする。 "
    .hword 0x0

;[77]落雷兽  
    .hword 0x0, 0x7, 0x8
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x1, 0x5, 0x2
    .strn "ラクライ "
    .strn " いなずま"
    .strn "ながい たいもうに でんきを ためている。   "
    .strn "でんりゅうで あしの きんにくを しげきして  "
    .strn "ばくはつてきな しゅんぱつりょくを うみだす。 "
    .hword 0x0

;[78]雷电兽  
    .hword 0x0, 0x7, 0x9
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0xA, 0x4, 0x0, 0x2
    .strn "ライボルト"
    .strn " ほうでん"
    .strn "たてがみから いつも ほうでんしているため   "
    .strn "ひばなで やまかじを おこしてしまう ことも。 "
    .strn "たたかいに なると かみなりぐもを つくりだす。"
    .hword 0x0

;[79]正电拍拍 
    .hword 0x0, 0x8, 0x0
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0xA, 0x4, 0x2
    .strn "プラスル "
    .strn " おうえん"
    .strn "いつも なかまを おうえんしている ポケモン。 "
    .strn "なかまが がんばると からだを ショ-トさせて "
    .strn "パチパチと ひばなの おとを たてて よろこぶ。"
    .hword 0x0

;[80]负电拍拍 
    .hword 0x0, 0x8, 0x1
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0xA, 0x4, 0x2
    .strn "マイナン "
    .strn " おうえん"
    .strn "じぶんよりも なかまの おうえんが だいじ。  "
    .strn "からだから はっする でんきを ショ-トさせて "
    .strn "はでに ひばなを だしながら おうえんするぞ。 "
    .hword 0x0

;[81]小磁怪  
    .hword 0x0, 0x8, 0x2
    .hword 0xA, 0xA, 0x0, 0x3
    .hword 0xA, 0xA, 0x6, 0x0
    .strn "コイル  "
    .strn " じしゃく"
    .strn "さゆうの ユニットから でんじはを だす ことで"
    .strn "じゅうりょくを さえぎり くうちゅうに うかぶ。"
    .strn "たいないの でんきが なくなると とべなくなる。"
    .hword 0x0

;[82]三合一磁怪
    .hword 0x0, 0x8, 0x3
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0xA, 0x6, 0x0, 0x0
    .strn "レアコイル"
    .strn " じしゃく"
    .strn "きょうりょくな じりょくせんで せいみつきかいを"
    .strn "こわしてしまうため モンスタ-ボ-ルに いれて "
    .strn "おかないと ちゅういされる まちも あるという。"
    .hword 0x0

;[83]霹雳电球 
    .hword 0x0, 0x8, 0x4
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0x1, 0x0, 0x4
    .strn "ビリリダマ"
    .strn "  ボ-ル"
    .strn "モンスタ-ボ-ルを つくっている かいしゃで  "
    .strn "はじめて はっけんされた ことと すがたかたちが"
    .strn "にている ことの かんけいは まだ ナゾである。"
    .hword 0x0

;[84]顽皮雷弹 
    .hword 0x0, 0x8, 0x5
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0xA, 0x6, 0x6, 0x6
    .strn "マルマイン"
    .strn "  ボ-ル"
    .strn "くうきちゅうの でんきエネルギ-を たべる。  "
    .strn "カミナリの おちる ひは でんきを たべすぎた "
    .strn "マルマインが あちらこちらで だいばくはつする。"
    .hword 0x0

;[85]电萤虫  
    .hword 0x0, 0x8, 0x6
    .hword 0xA, 0xA, 0x0, 0x7
    .hword 0xA, 0x1, 0x7, 0x7
    .strn "バルビ-ト"
    .strn "  ほたる"
    .strn "しっぽの あかりを つかって しゅうだんで   "
    .strn "よぞらに きかがくてきな ずけいを えがく。  "
    .strn "イルミ-ゼの だす あまい かおりが だいすき。"
    .hword 0x0

;[86]甜甜萤  
    .hword 0x0, 0x8, 0x7
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x1, 0x7, 0x7
    .strn "イルミ-ゼ"
    .strn "  ほたる"
    .strn "あまい かおりで バルビ-トを ひきよせる。  "
    .strn "たくさん あつまった バルビ-トを ゆうどうして"
    .strn "よぞらに きかがくてきな ずけいを えがくぞ。 "
    .hword 0x0

;[87]走路草  
    .hword 0x0, 0x8, 0x8
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0xA, 0x5, 0x4
    .strn "ナゾノクサ"
    .strn " ざっそう"
    .strn "えいよう たっぷりの つちを さがして うまる。"
    .strn "ひるま つちに うまっている ときには あしが "
    .strn "きの ねっこのような かたちを しているらしい。"
    .hword 0x0

;[88]臭臭花  
    .hword 0x0, 0x8, 0x9
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0xA, 0x8, 0x6
    .strn "クサイハナ"
    .strn " ざっそう"
    .strn "どうやら クサイハナは くちから たらしている "
    .strn "もうれつに くさい ニオイが だいすき らしい。"
    .strn "ニオイを かいで さらに みつを あふれさせる。"
    .hword 0x0

;[89]霸王花  
    .hword 0x0, 0x9, 0x0
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0xA, 0x1, 0x8, 0x6
    .strn "ラフレシア"
    .strn " フラワ-"
    .strn "せかいいち おおきな はなびらで えものを   "
    .strn "おびきよせ どくの かふんを あびせかける。  "
    .strn "うごけなくなった えものを つかまえて たべる。"
    .hword 0x0

;[90]美丽花  
    .hword 0x0, 0x9, 0x1
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0xA, 0x5, 0x8
    .strn "キレイハナ"
    .strn " フラワ-"
    .strn "より くさい クサイハナから しんかした ほうが"
    .strn "きれいな はなを つけた キレイハナに なるよ。"
    .strn "よるに なると はなびらを つぼめて ねむる。 "
    .hword 0x0

;[91]嘟嘟   
    .hword 0x0, 0x9, 0x2
    .hword 0xA, 0xA, 0x1, 0x4
    .hword 0xA, 0x3, 0x9, 0x2
    .strn "ド-ド- "
    .strn "ふたごどり"
    .strn "2つの あたまが どうじに ねむることは ない。"
    .strn "ねている とき てきから おそわれない ように "
    .strn "かわりばんこで みはりを しているからだ。   "
    .hword 0x0

;[92]嘟嘟利  
    .hword 0x0, 0x9, 0x3
    .hword 0xA, 0xA, 0x1, 0x8
    .hword 0xA, 0x8, 0x5, 0x2
    .strn "ド-ドリオ"
    .strn "みつごどり"
    .strn "3つの あたまが べつべつの ほうこうを    "
    .strn "むいている ときは けいかいしている しょうこ。"
    .strn "うかつに ちかよると くちばしで つつかれるぞ。"
    .hword 0x0

;[93]毒蔷薇  
    .hword 0x0, 0x9, 0x4
    .hword 0xA, 0xA, 0x0, 0x3
    .hword 0xA, 0xA, 0x2, 0x0
    .strn "ロゼリア "
    .strn "  いばら"
    .strn "ごく まれに めずらしい いろの はなを    "
    .strn "さかせている ロゼリアが いると いわれる。  "
    .strn "あたまの トゲは もうどくを もっているぞ。  "
    .hword 0x0

;[94]溶食兽  
    .hword 0x0, 0x9, 0x5
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0x1, 0x0, 0x3
    .strn "ゴクリン "
    .strn " いぶくろ"
    .strn "からだの だいぶぶんが いぶくろで できていて "
    .strn "しんぞうや のうみそは とても ちいさい。   "
    .strn "なんでも とかす とくしゅな いえきを もつ。 "
    .hword 0x0

;[95]吞食兽  
    .hword 0x0, 0x9, 0x6
    .hword 0xA, 0xA, 0x1, 0x7
    .hword 0xA, 0x8, 0x0, 0x0
    .strn "マルノ-ム"
    .strn "どくぶくろ"
    .strn "はが 1ぽんも ないので なんでも まるのみ。 "
    .strn "いっぱいに あけた くちは とても おおきく  "
    .strn "じどうしゃの タイヤだって すっぽり はいるぞ。"
    .hword 0x0

;[96]利牙鱼  
    .hword 0x0, 0x9, 0x7
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0x2, 0x0, 0x8
    .strn "キバニア "
    .strn " どうもう"
    .strn "はったつした アゴと するどく とがった キバは"
    .strn "ふなぞこを かみちぎる ほどの はかいりょく。 "
    .strn "キバニアに おそわれ しずんだ ふねは おおい。"
    .hword 0x0

;[97]巨牙鲨  
    .hword 0x0, 0x9, 0x8
    .hword 0xA, 0xA, 0x1, 0x8
    .hword 0xA, 0x8, 0x8, 0x8
    .strn "サメハダ-"
    .strn "きょうぼう"
    .strn "うみのギャングと よばれ おそれられている。  "
    .strn "おれても すぐに はえかわる キバを もち   "
    .strn "おおがたタンカ-も 1ぴきで バラバラに する。"
    .hword 0x0

;[98]吼吼鲸  
    .hword 0x0, 0x9, 0x9
    .hword 0xA, 0xA, 0x2, 0x0
    .hword 0x1, 0x3, 0x0, 0x0
    .strn "ホエルコ "
    .strn "たまくじら"
    .strn "めの うえに ついている はなの あなから   "
    .strn "からだに ためた かいすいを ふきだし     "
    .strn "ひとを おどろかすのが だいすきな ポケモンだ。"
    .hword 0x0

;[99]吼鲸王  
    .hword 0x1, 0x0, 0x0
    .hword 0xA, 0x1, 0x4, 0x5
    .hword 0x3, 0x9, 0x8, 0x0
    .strn "ホエルオ-"
    .strn "うきくじら"
    .strn "みつかった なかでは さいだいの ポケモン。  "
    .strn "おおうなばらを ゆったりと およぎ おおきな  "
    .strn "くちで いっきに たいりょうの エサを たべる。"
    .hword 0x0

;[100]呆火驼  
    .hword 0x1, 0x0, 0x1
    .hword 0xA, 0xA, 0x0, 0x7
    .hword 0xA, 0x2, 0x4, 0x0
    .strn "ドンメル "
    .strn " どんかん"
    .strn "たたかれても きが つかない にぶさ だが   "
    .strn "くうふくは 1びょうでも がまん できない。  "
    .strn "からだの なかでは マグマが にえたぎっている。"
    .hword 0x0

;[101]喷火驼  
    .hword 0x1, 0x0, 0x2
    .hword 0xA, 0xA, 0x1, 0x9
    .hword 0x2, 0x2, 0x0, 0x0
    .strn "バク-ダ "
    .strn "  ふんか"
    .strn "からだの なかに かざんを もつ ポケモンだ。 "
    .strn "からだに たまった せっし 1まんどの マグマを"
    .strn "ときどき せなかの コブから ふきあげている。 "
    .hword 0x0

;[102]熔岩虫  
    .hword 0x1, 0x0, 0x3
    .hword 0xA, 0xA, 0x0, 0x7
    .hword 0xA, 0x3, 0x5, 0x0
    .strn "マグマッグ"
    .strn " ようがん"
    .strn "からだの なかでは しゃくねつの ようがんが  "
    .strn "うずまいているが ひえると かたまって しまい "
    .strn "くずれて からだが ちいさく なっていく。   "
    .hword 0x0

;[103]熔岩蜗牛 
    .hword 0x1, 0x0, 0x4
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0x5, 0x5, 0x0
    .strn "マグカルゴ"
    .strn " ようがん"
    .strn "カラは ひふが ひえて かたまった もの。   "
    .strn "さわった だけで ボロボロと くずれて しまう。"
    .strn "マグマに はいると もとの おおきさに もどる。"
    .hword 0x0

;[104]煤炭龟  
    .hword 0x1, 0x0, 0x5
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0x8, 0x0, 0x4
    .strn "コ-タス "
    .strn " せきたん"
    .strn "やまを ほって せきたんを みつけては せっせと"
    .strn "こうらの くうどうに いれて もやす ポケモン。"
    .strn "おそわれると くろい けむりを だして にげる。"
    .hword 0x0

;[105]臭泥   
    .hword 0x1, 0x0, 0x6
    .hword 0xA, 0xA, 0x0, 0x9
    .hword 0xA, 0x3, 0x0, 0x0
    .strn "ベトベタ-"
    .strn "  ヘドロ"
    .strn "おせんされた かいていの ヘドロから うまれた。"
    .strn "きたない ものが だいすきで からだじゅうから "
    .strn "バイキンだらけの えきたいを たれながしている。"
    .hword 0x0

;[106]臭臭泥  
    .hword 0x1, 0x0, 0x7
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0xA, 0x3, 0x0, 0x0
    .strn "ベトベトン"
    .strn "  ヘドロ"
    .strn "きたない ものが だいこうぶつなので ゴミを  "
    .strn "みちばたに すてる ような ひとが すんでいる "
    .strn "まちには ベトベトンが あつまってくるぞ。   "
    .hword 0x0

;[107]瓦斯弹  
    .hword 0x1, 0x0, 0x8
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0xA, 0x1, 0x0
    .strn "ドガ-ス "
    .strn " どくガス"
    .strn "しげきを あたえると ガスの どくそが つよまり"
    .strn "からだの あちこちから いきおいよく ふきだす。"
    .strn "まんまるに ふくらんだ あと だいばくはつする。"
    .hword 0x0

;[108]双弹瓦斯 
    .hword 0x1, 0x0, 0x9
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0xA, 0xA, 0x9, 0x5
    .strn "マタドガス"
    .strn " どくガス"
    .strn "くさった なまゴミから でる ガスが だいすき。"
    .strn "そうじを しない いえに すみつき かぞくが  "
    .strn "ねしずまった まよなか ゴミばこを あさる。  "
    .hword 0x0

;[109]跳跳猪  
    .hword 0x1, 0x1, 0x0
    .hword 0xA, 0xA, 0x0, 0x7
    .hword 0xA, 0x3, 0x0, 0x6
    .strn "バネブ- "
    .strn " とびはね"
    .strn "シッポで びょんびょん とびはねる ポケモン。 "
    .strn "とびはねる しんどうで しんぞうを うごかして "
    .strn "いるので とびはねる ことは やめられないのだ。"
    .hword 0x0

;[110]噗噗猪  
    .hword 0x1, 0x1, 0x1
    .hword 0xA, 0xA, 0x0, 0x9
    .hword 0xA, 0x7, 0x1, 0x5
    .strn "ブ-ピッグ"
    .strn " あやつり"
    .strn "サイコパワ-の はどうを くろしんじゅで つよめ"
    .strn "じゆうじざいに あいてを あやつる ポケモン。 "
    .strn "ちからを つかうとき はないきが あらくなるぞ。"
    .hword 0x0

;[111]穿山鼠  
    .hword 0x1, 0x1, 0x2
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x1, 0x2, 0x0
    .strn "サンド  "
    .strn "  ねずみ"
    .strn "からからに かわいた ひふは とても かたく  "
    .strn "まるくなると どんな こうげきでも はねかえす。"
    .strn "よなかは さばくの すなに もぐって ねむる。 "
    .hword 0x0

;[112]穿山王  
    .hword 0x1, 0x1, 0x3
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0xA, 0x2, 0x9, 0x5
    .strn "サンドパン"
    .strn "  ねずみ"
    .strn "せなかを まるめると トゲトゲの ボ-ルみたい。"
    .strn "トゲに さされて ひるんだ あいてに とびかかり"
    .strn "するどい ツメで ばりばり ひっかきまくるぞ。 "
    .hword 0x0

;[113]晃晃斑  
    .hword 0x1, 0x1, 0x4
    .hword 0xA, 0xA, 0x1, 0x1
    .hword 0xA, 0xA, 0x5, 0x0
    .strn "パッチ-ル"
    .strn "ぶちパンダ"
    .strn "よのなかに いる パッチ-ルは みんな ちがう "
    .strn "ところに ブチもようが あると いわれている。 "
    .strn "おぼつかない あゆみが おどりのように みえる。"
    .hword 0x0

;[114]盔甲鸟  
    .hword 0x1, 0x1, 0x5
    .hword 0xA, 0xA, 0x1, 0x7
    .hword 0xA, 0x5, 0x0, 0x5
    .strn "エア-ムド"
    .strn "よろいどり"
    .strn "ぜんしんが かたい ヨロイに おおわれている。 "
    .strn "じそく 300キロの スピ-ドで そらを とび "
    .strn "かたなの きれあじを もつ ハネで きりさく。 "
    .hword 0x0

;[115]大颚蚁  
    .hword 0x1, 0x1, 0x6
    .hword 0xA, 0xA, 0x0, 0x7
    .hword 0xA, 0x1, 0x5, 0x0
    .strn "ナックラ-"
    .strn "ありじごく"
    .strn "だっしゅつ ふかのうな あなを さばくに つくり"
    .strn "えものが くるのを ひたすら まちかまえている。"
    .strn "みずが なくても 1しゅうかんは へっちゃら。 "
    .hword 0x0

;[116]超音波幼虫
    .hword 0x1, 0x1, 0x7
    .hword 0xA, 0xA, 0x1, 0x1
    .hword 0xA, 0x1, 0x5, 0x3
    .strn "ビブラ-バ"
    .strn " しんどう"
    .strn "ビブラ-バの ハネは まだ せいちょうとちゅう。"
    .strn "ながい きょりを とぶ よりも しんどうさせて "
    .strn "ちょうおんぱを だす ほうが とくいなのだ。  "
    .hword 0x0

;[117]沙漠蜻蜓 
    .hword 0x1, 0x1, 0x8
    .hword 0xA, 0xA, 0x2, 0x0
    .hword 0xA, 0x8, 0x2, 0x0
    .strn "フライゴン"
    .strn " せいれい"
    .strn "はばたきで おこす すなあらしの なかから   "
    .strn "うたごえの ような はおと だけが きこえるため"
    .strn "フライゴンは さばくの せいれいと いわれた。 "
    .hword 0x0

;[118]刺球仙人掌
    .hword 0x1, 0x1, 0x9
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0x5, 0x1, 0x3
    .strn "サボネア "
    .strn " サボテン"
    .strn "あめの すくない きびしい かんきょう ほど  "
    .strn "きれいで かおりの つよい はなを さかせる。 "
    .strn "トゲの ついた うでを ふりまわして たたかう。"
    .hword 0x0

;[119]梦歌仙人掌
    .hword 0x1, 0x2, 0x0
    .hword 0xA, 0xA, 0x1, 0x3
    .hword 0xA, 0x7, 0x7, 0x4
    .strn "ノクタス "
    .strn "カカシぐさ"
    .strn "まよなか さばくを あるく たびびとの うしろを"
    .strn "ぞろぞろと しゅうだんで くっついて あるく。 "
    .strn "つかれて うごけなく なるのを まっているのだ。"
    .hword 0x0

;[120]青绵鸟  
    .hword 0x1, 0x2, 0x1
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0xA, 0x1, 0x2
    .strn "チルット "
    .strn " わたどり"
    .strn "よごれたものを みると わたの ような つばさで"
    .strn "せっせと ふきとる きれいずきな ポケモンだ。 "
    .strn "つばさが よごれると かわで みずあびを する。"
    .hword 0x0

;[121]七夕青鸟 
    .hword 0x1, 0x2, 0x2
    .hword 0xA, 0xA, 0x1, 0x1
    .hword 0xA, 0x2, 0x0, 0x6
    .strn "チルタリス"
    .strn " ハミング"
    .strn "うつくしい ソプラノで うたう ポケモン。   "
    .strn "わたぐもの ような つばさで じょうしょう   "
    .strn "きりゅうを うけて おおぞらへ まいあがる。  "
    .hword 0x0

;[122]猫鼬斩  
    .hword 0x1, 0x2, 0x3
    .hword 0xA, 0xA, 0x1, 0x3
    .hword 0xA, 0x4, 0x0, 0x3
    .strn "ザング-ス"
    .strn "ネコイタチ"
    .strn "しゅくてき ハブネ-クとの たたかいの きおくが"
    .strn "からだじゅうの さいぼうに きざみこまれている。"
    .strn "びんしょうな みのこなしで こうげきを かわす。"
    .hword 0x0

;[123]饭匙蛇  
    .hword 0x1, 0x2, 0x4
    .hword 0xA, 0xA, 0x2, 0x7
    .hword 0xA, 0x5, 0x2, 0x5
    .strn "ハブネ-ク"
    .strn " キバへび"
    .strn "かたなの ような しっぽは てきを きりさくのと"
    .strn "どうじに しみだした もうどくを あびせるぞ。 "
    .strn "しゅくてき ザング-スと たたかい つづける。 "
    .hword 0x0

;[124]月石   
    .hword 0x1, 0x2, 0x5
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0x1, 0x6, 0x8, 0x0
    .strn "ルナト-ン"
    .strn " いんせき"
    .strn "まんげつの じき かっぱつになる しゅうせい。 "
    .strn "くうちゅうに ういて いどうし あかい ひとみは"
    .strn "みたものの からだを すくませる はくりょく。 "
    .hword 0x0

;[125]太阳岩  
    .hword 0x1, 0x2, 0x6
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0x1, 0x5, 0x4, 0x0
    .strn "ソルロック"
    .strn " いんせき"
    .strn "うちゅうから おちてきたと いわれる しんしゅ。"
    .strn "くうちゅうに うかび おともなく いどうする。 "
    .strn "たたかいに なると つよい ひかりを はなつ。 "
    .hword 0x0

;[126]泥泥鳅  
    .hword 0x1, 0x2, 0x7
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0xA, 0x1, 0x9
    .strn "ドジョッチ"
    .strn " ひげうお"
    .strn "からだが ヌルヌルの まくで おおわれているので"
    .strn "てきに つかまれても ヌルリと にげだせるのだ。"
    .strn "ヌルヌルが かわくと からだが よわってしまう。"
    .hword 0x0

;[127]鲶鱼王  
    .hword 0x1, 0x2, 0x8
    .hword 0xA, 0xA, 0x0, 0x9
    .hword 0xA, 0x2, 0x3, 0x6
    .strn "ナマズン "
    .strn " ひげうお"
    .strn "おおあばれ すると ぬまの しゅうい 5キロの "
    .strn "はんいで じしんの ような ゆれが おこる。  "
    .strn "ほんとうの じしんを よちする ちからも もつ。"
    .hword 0x0

;[128]龙虾小兵 
    .hword 0x1, 0x2, 0x9
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x1, 0x1, 0x5
    .strn "ヘイガニ "
    .strn " ごろつき"
    .strn "するどい ハサミで えものを つかまえる。   "
    .strn "すき きらいが ないので なんでも たべるぞ。 "
    .strn "きたない みずでも へっちゃらな ポケモン。  "
    .hword 0x0

;[129]铁螯龙虾 
    .hword 0x1, 0x3, 0x0
    .hword 0xA, 0xA, 0x1, 0x1
    .hword 0xA, 0x3, 0x2, 0x8
    .strn "シザリガ-"
    .strn "ならずもの"
    .strn "だっぴした ちょくごは こうらが やわらかい。 "
    .strn "こうらが かたくなるまで てきの こうげきを  "
    .strn "さけるため かわぞこの あなに かくれている。 "
    .hword 0x0

;[130]天秤偶  
    .hword 0x1, 0x3, 0x1
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0x2, 0x1, 0x5
    .strn "ヤジロン "
    .strn "  どぐう"
    .strn "なかまを みつけると すぐに あつまって きて "
    .strn "いっせいに なきごえを あげるので うるさい。 "
    .strn "いっぽんあしで きように たったまま ねむる。 "
    .hword 0x0

;[131]念力土偶 
    .hword 0x1, 0x3, 0x2
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0x1, 0x0, 0x8, 0x0
    .strn "ネンド-ル"
    .strn "  どぐう"
    .strn "2まんねんまえに さかえた こだい ぶんめいの "
    .strn "どろにんぎょうから うまれた ナゾの ポケモン。"
    .strn "りょうてから ビ-ムを はっしゃするぞ。    "
    .hword 0x0

;[132]触手百合 
    .hword 0x1, 0x3, 0x3
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0xA, 0x2, 0x3, 0x8
    .strn "リリ-ラ "
    .strn " ウミユリ"
    .strn "やく 1おくねんまえに ぜつめつした ポケモン。"
    .strn "かいていの いわに くっつき はなびらの ような"
    .strn "しょくしゅで よってきた えものを つかまえる。"
    .hword 0x0

;[133]摇篮百合 
    .hword 0x1, 0x3, 0x4
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0xA, 0x6, 0x0, 0x4
    .strn "ユレイドル"
    .strn " いわつぼ"
    .strn "うみの そこで エサを さがして あるきまわる。"
    .strn "きの えだの ような くびを じざいに のばして"
    .strn "8まいの しょくしゅで えものを つかまえる。 "
    .hword 0x0

;[134]太古羽虫 
    .hword 0x1, 0x3, 0x5
    .hword 0xA, 0xA, 0x0, 0x7
    .hword 0xA, 0x1, 0x2, 0x5
    .strn "アノプス "
    .strn "むかしエビ"
    .strn "ポケモンの せんぞの いっしゅと いわれている。"
    .strn "からだの よこに ついた 8まいの はねを   "
    .strn "くねらせて たいこの うみを およいでいた。  "
    .hword 0x0

;[135]太古盔甲 
    .hword 0x1, 0x3, 0x6
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0xA, 0x6, 0x8, 0x2
    .strn "ア-マルド"
    .strn "かっちゅう"
    .strn "おおむかし ぜつめつした ポケモンの いっしゅ。"
    .strn "ちじょうで くらすとき べんりな ように    "
    .strn "2ほんの あしで あるくように なったと いう。"
    .hword 0x0

;[136]宝宝丁  
    .hword 0x1, 0x3, 0x7
    .hword 0xA, 0xA, 0x0, 0x3
    .hword 0xA, 0xA, 0x1, 0x0
    .strn "ププリン "
    .strn " ふうせん"
    .strn "マシュマロ みたいな さわりごこちの からだから"
    .strn "ほんのり あまい においが ただよってくるよ。 "
    .strn "においは てきの きもちを おだやかにする。  "
    .hword 0x0

;[137]胖丁   
    .hword 0x1, 0x3, 0x8
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0xA, 0x5, 0x5
    .strn "プリン  "
    .strn " ふうせん"
    .strn "うたう ときは いちども いきつぎをしない。  "
    .strn "なかなか ねむらない てきを あいてに した  "
    .strn "ときは いきを できない プリンも いのちがけ。"
    .hword 0x0

;[138]胖可丁  
    .hword 0x1, 0x3, 0x9
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0xA, 0x1, 0x2, 0x0
    .strn "プクリン "
    .strn " ふうせん"
    .strn "だんりょくせいに すぐれた からだは おおきく "
    .strn "いきを すいこむと どこまでも ふくれていく。 "
    .strn "ふくらんだ プクリンは ふんわり はねるよ。  "
    .hword 0x0

;[139]丑丑鱼  
    .hword 0x1, 0x4, 0x0
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0xA, 0x7, 0x4
    .strn "ヒンバス "
    .strn "  さかな"
    .strn "からだは ボロボロだが どこでも いきていける "
    .strn "しぶとい せいめいりょくを もつ ポケモン。  "
    .strn "しかし ノロマなので すぐに つかまってしまう。"
    .hword 0x0

;[140]美纳斯  
    .hword 0x1, 0x4, 0x1
    .hword 0xA, 0xA, 0x6, 0x2
    .hword 0x1, 0x6, 0x2, 0x0
    .strn "ミロカロス"
    .strn "いつくしみ"
    .strn "おおきな みずうみの そこに すんでいる。   "
    .strn "からだが あざやかな ピンクいろに かがやくとき"
    .strn "すさんだ こころを いやす はどうを はなつ。 "
    .hword 0x0

;[141]飘浮泡泡 
    .hword 0x1, 0x4, 0x2
    .hword 0xA, 0xA, 0x0, 0x3
    .hword 0xA, 0xA, 0x0, 0x8
    .strn "ポワルン "
    .strn "  てんき"
    .strn "しぜんの ちからを うけて たいよう あまみず "
    .strn "ゆきぐもに すがたを かえる ポケモン。    "
    .strn "きしょうが かわると きしょうも かわるぞ。  "
    .hword 0x0

;[142]海星星  
    .hword 0x1, 0x4, 0x3
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0x3, 0x4, 0x5
    .strn "ヒトデマン"
    .strn " ほしがた"
    .strn "なつの おわりごろ よるに すなはまへ いくと "
    .strn "コアと よばれる きかんを あかく ひからせた "
    .strn "ヒトデマンが ほしの ように みえるよ。    "
    .hword 0x0

;[143]宝石海星 
    .hword 0x1, 0x4, 0x4
    .hword 0xA, 0xA, 0x1, 0x1
    .hword 0xA, 0x8, 0x0, 0x0
    .strn "スタ-ミ-"
    .strn "  なぞの"
    .strn "からだの ちゅうしんに ある コアと よばれる "
    .strn "ぶぶんが なないろに かがやく ことから    "
    .strn "うみのほうせき という べつめいを つけられた。"
    .hword 0x0

;[144]变隐龙  
    .hword 0x1, 0x4, 0x5
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0xA, 0x2, 0x2, 0x0
    .strn "カクレオン"
    .strn "いろへんげ"
    .strn "からだを けしきと おなじ いろに かえて   "
    .strn "えものに きづかれない ように しのびよる。  "
    .strn "ながく のびる ベロで すばやく つかまえる。 "
    .hword 0x0

;[145]怨影娃娃 
    .hword 0x1, 0x4, 0x6
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0xA, 0x2, 0x3
    .strn "カゲボウズ"
    .strn "にんぎょう"
    .strn "ねたみ うらみの かんじょうに ひきよせられる。"
    .strn "だれかを うらむ こころが つよく なると   "
    .strn "カゲボウズが のきしたに ずらりと ならぶぞ。 "
    .hword 0x0

;[146]诅咒娃娃 
    .hword 0x1, 0x4, 0x7
    .hword 0xA, 0xA, 0x1, 0x1
    .hword 0xA, 0x1, 0x2, 0x5
    .strn "ジュペッタ"
    .strn "ぬいぐるみ"
    .strn "じぶんの からだを はりで キズつける とき  "
    .strn "つよい のろいの エネルギ-が はっせいする。 "
    .strn "もとは すてられた かわいそうな ぬいぐるみ。 "
    .hword 0x0

;[147]夜巡灵  
    .hword 0x1, 0x4, 0x8
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0x1, 0x5, 0x0
    .strn "ヨマワル "
    .strn " おむかえ"
    .strn "まよなか やみに まぎれて さまよっている。  "
    .strn "ママに しかられるような わるいこは ヨマワルに"
    .strn "さらわれるという いいつたえが のこっている。 "
    .hword 0x0

;[148]彷徨夜灵 
    .hword 0x1, 0x4, 0x9
    .hword 0xA, 0xA, 0x1, 0x6
    .hword 0xA, 0x3, 0x0, 0x6
    .strn "サマヨ-ル"
    .strn " てまねき"
    .strn "どんな おおきさの ものも すいこんで しまう。"
    .strn "あやしげな ての うごきと ひとつめの ちからで"
    .strn "あいてを さいみん じょうたいにして あやつる。"
    .hword 0x0

;[149]热带龙  
    .hword 0x1, 0x5, 0x0
    .hword 0xA, 0xA, 0x2, 0x0
    .hword 0x1, 0x0, 0x0, 0x0
    .strn "トロピウス"
    .strn " フル-ツ"
    .strn "なんごくの こどもたちは トロピウスの くびに "
    .strn "なった くだものの フサを おやつに たべるよ。"
    .strn "せなかの はっぱを はばたかせて そらを とぶ。"
    .hword 0x0

;[150]风铃铃  
    .hword 0x1, 0x5, 0x1
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0xA, 0x1, 0x0
    .strn "チリ-ン "
    .strn " ふうりん"
    .strn "かぜが つよくなると きの えだや のきしたに "
    .strn "あたまの きゅうばんで ぶらさがり なきだす。 "
    .strn "ながい シッポで きのみを つまんで たべる。 "
    .hword 0x0

;[151]阿勃梭鲁 
    .hword 0x1, 0x5, 0x2
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0xA, 0x4, 0x7, 0x0
    .strn "アブソル "
    .strn " わざわい"
    .strn "しぜんさいがいを キャッチする ちからを もつ。"
    .strn "けわしい さんがくちたいに せいそくし     "
    .strn "めったに やまの ふもとには おりてこない。  "
    .hword 0x0

;[152]六尾   
    .hword 0x1, 0x5, 0x3
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0xA, 0x9, 0x9
    .strn "ロコン  "
    .strn "  きつね"
    .strn "うまれた ときは しろい 1ぽんの しっぽ。  "
    .strn "あいじょうを たっぷり うけると しっぽは   "
    .strn "6ぽんに わかれて みごとな まきげになる。  "
    .hword 0x0

;[153]九尾   
    .hword 0x1, 0x5, 0x4
    .hword 0xA, 0xA, 0x1, 0x1
    .hword 0xA, 0x1, 0x9, 0x9
    .strn "キュウコン"
    .strn "  きつね"
    .strn "まっかな ひとみは あやしい ひかりを はなち "
    .strn "あいての こころを じざいに あやつる。    "
    .strn "1000ねんかん いきると いわれている。   "
    .hword 0x0

;[154]皮丘   
    .hword 0x1, 0x5, 0x5
    .hword 0xA, 0xA, 0x0, 0x3
    .hword 0xA, 0xA, 0x2, 0x0
    .strn "ピチュ- "
    .strn " こねずみ"
    .strn "かみなりぐもが でている ときや くうきの   "
    .strn "かんそうした ひは でんきが たまりやすい。  "
    .strn "パチパチ せいでんきの おとが なっているよ。 "
    .hword 0x0

;[155]皮卡丘  
    .hword 0x1, 0x5, 0x6
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0xA, 0x6, 0x0
    .strn "ピカチュウ"
    .strn "  ねずみ"
    .strn "はじめて みる ものには でんげきを あてる。 "
    .strn "くろこげの きのみが おちていたら それは   "
    .strn "でんげきの つよさを まちがえた しょうこだよ。"
    .hword 0x0

;[156]雷丘   
    .hword 0x1, 0x5, 0x7
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0x3, 0x0, 0x0
    .strn "ライチュウ"
    .strn "  ねずみ"
    .strn "でんきぶくろに でんきが たまりすぎた ときは "
    .strn "しっぽを じめんに つけて ほうでんする。   "
    .strn "す の ちかくには じめんに やけこげが ある。"
    .hword 0x0

;[157]可达鸭  
    .hword 0x1, 0x5, 0x8
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0x1, 0x9, 0x6
    .strn "コダック "
    .strn "  あひる"
    .strn "ふしぎな ちからを はっきしている コダックから"
    .strn "ねむっている ときにだけ でるはずの のうはが "
    .strn "かんそくされて がっかいの わだいに なった。 "
    .hword 0x0

;[158]哥达鸭  
    .hword 0x1, 0x5, 0x9
    .hword 0xA, 0xA, 0x1, 0x7
    .hword 0xA, 0x7, 0x6, 0x6
    .strn "ゴルダック"
    .strn "  あひる"
    .strn "てあしの みずかきと りゅうせんけいの からだが"
    .strn "すいちゅうで おそるべき スピ-ドを うみだす。"
    .strn "きんメダリスト よりも だんぜん はやいぞ。  "
    .hword 0x0

;[159]小果然  
    .hword 0x1, 0x6, 0x0
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x1, 0x4, 0x0
    .strn "ソ-ナノ "
    .strn " ほがらか"
    .strn "いつも ニコニコ えがおの ソ-ナノ。     "
    .strn "おこっているときは しっぽに ちゅうもく。   "
    .strn "じめんを パタパタ たたいているぞ。      "
    .hword 0x0

;[160]果然翁  
    .hword 0x1, 0x6, 0x1
    .hword 0xA, 0xA, 0x1, 0x3
    .hword 0xA, 0x2, 0x8, 0x5
    .strn "ソ-ナンス"
    .strn "  がまん"
    .strn "2ひき いじょう あつまると がまん くらべを "
    .strn "はじめるが くうふくを がまんして しまうので "
    .strn "ソ-ナンス トレ-ナ-は ちゅういが ひつよう。"
    .hword 0x0

;[161]天然雀  
    .hword 0x1, 0x6, 0x2
    .hword 0xA, 0xA, 0x0, 0x2
    .hword 0xA, 0xA, 0x2, 0x0
    .strn "ネイティ "
    .strn "  ことり"
    .strn "はねが まだ そだって いないので とべない。 "
    .strn "めを あわせると じっと みつめるが あいてが "
    .strn "すこしでも うごくと とびはねて にげていく。 "
    .hword 0x0

;[162]天然鸟  
    .hword 0x1, 0x6, 0x3
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0xA, 0x1, 0x5, 0x0
    .strn "ネイティオ"
    .strn " せいれい"
    .strn "いちにちじゅう ネイティオが じっとしているのは"
    .strn "みらいよちで わかった おそろしい できごとに "
    .strn "おびえているからだと しんじられている。    "
    .hword 0x0

;[163]麒麟奇  
    .hword 0x1, 0x6, 0x4
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0xA, 0x4, 0x1, 0x5
    .strn "キリンリキ"
    .strn " くびなが"
    .strn "シッポの あたまにも ちいさな のうが ある。 "
    .strn "においや おとに はんのうして こうげきするので"
    .strn "うしろから ちかよると いきなり かみつかれる。"
    .hword 0x0

;[164]小小象  
    .hword 0x1, 0x6, 0x5
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0x3, 0x3, 0x5
    .strn "ゴマゾウ "
    .strn " ながはな"
    .strn "ながい はなを つかって みずあびを する。  "
    .strn "なかまが あつまってくると みずを かけあう。 "
    .strn "ずぶぬれの からだを みずべで かわかすよ。  "
    .hword 0x0

;[165]顿甲   
    .hword 0x1, 0x6, 0x6
    .hword 0xA, 0xA, 0x1, 0x1
    .hword 0x1, 0x2, 0x0, 0x0
    .strn "ドンファン"
    .strn "  よろい"
    .strn "かたい からだで ぶつかれば いえも こわれる。"
    .strn "その ちからを つかって やまみちを ふさいだ "
    .strn "どしゃくずれを どかす しごとを てつだうよ。 "
    .hword 0x0

;[166]凯罗斯  
    .hword 0x1, 0x6, 0x7
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0xA, 0x5, 0x5, 0x0
    .strn "カイロス "
    .strn " くわがた"
    .strn "じぶんの たいじゅうの 2ばいも ある あいてを"
    .strn "ツノで はさみ かるがる もちあげる かいりき。"
    .strn "さむい ばしょでは からだの うごきが にぶる。"
    .hword 0x0

;[167]赫拉克罗斯
    .hword 0x1, 0x6, 0x8
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0xA, 0x5, 0x4, 0x0
    .strn "ヘラクロス"
    .strn "1ぽんヅノ"
    .strn "いっちょくせんに てきの ふところに もぐりこみ"
    .strn "たくましい ツノで すくいあげ なげとばす。  "
    .strn "たいぼくも ねこそぎ たおす ほどの パワ-だ。"
    .hword 0x0

;[168]独角犀牛 
    .hword 0x1, 0x6, 0x9
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0x1, 0x1, 0x5, 0x0
    .strn "サイホ-ン"
    .strn " とげとげ"
    .strn "ひたすら まっすぐ つきすすみ こわしまくる。 "
    .strn "こうてつの かたまりに ぶつかっても へいきだが"
    .strn "1にち たつと ちょっと いたみを かんじる。 "
    .hword 0x0

;[169]钻角犀兽 
    .hword 0x1, 0x7, 0x0
    .hword 0xA, 0xA, 0x1, 0x9
    .hword 0x1, 0x2, 0x0, 0x0
    .strn "サイドン "
    .strn "  ドリル"
    .strn "ツノは ダイヤモンドの げんせきを くだき   "
    .strn "しっぽの いちげきは ビルを なぎたおす。   "
    .strn "かたい ひふは たいほうでも キズつかない。  "
    .hword 0x0

;[170]雪童子  
    .hword 0x1, 0x7, 0x1
    .hword 0xA, 0xA, 0x0, 0x7
    .hword 0xA, 0x1, 0x6, 0x8
    .strn "ユキワラシ"
    .strn " ゆきかさ"
    .strn "ゆきの おおい とちで くらす ポケモン。   "
    .strn "はるや なつの ゆきの ふらない きせつには  "
    .strn "しょうにゅうどうの おくで しずかに くらす。 "
    .hword 0x0

;[171]冰鬼护  
    .hword 0x1, 0x7, 0x2
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0x2, 0x5, 0x6, 0x5
    .strn "オニゴ-リ"
    .strn " がんめん"
    .strn "いわの からだを こおりの よろいで かためた。"
    .strn "くうきちゅうの すいぶんを こおらせて じゆうな"
    .strn "かたちに かえる のうりょくを もつ ポケモン。"
    .hword 0x0

;[172]海豹球  
    .hword 0x1, 0x7, 0x3
    .hword 0xA, 0xA, 0x0, 0x8
    .hword 0xA, 0x3, 0x9, 0x5
    .strn "タマザラシ"
    .strn " てたたき"
    .strn "あるくより ころがる ほうが だんぜん はやい。"
    .strn "しょくじの じかんは みんなが いっせいに てを"
    .strn "たたいて よろこぶので けっこう うるさいのだ。"
    .hword 0x0

;[173]海魔狮  
    .hword 0x1, 0x7, 0x4
    .hword 0xA, 0xA, 0x1, 0x1
    .hword 0xA, 0x8, 0x7, 0x6
    .strn "トドグラ-"
    .strn "たままわし"
    .strn "はじめて めにした ものは かならず はなで  "
    .strn "クルクル まわしてみる しゅうせいを もつ。  "
    .strn "タマザラシを まわして あそぶ ことが ある。 "
    .hword 0x0

;[174]帝牙海狮 
    .hword 0x1, 0x7, 0x5
    .hword 0xA, 0xA, 0x1, 0x4
    .hword 0x1, 0x5, 0x0, 0x6
    .strn "トドゼルガ"
    .strn "こおりわり"
    .strn "はったつした 2ほんの キバは 10トンも ある"
    .strn "ひょうざんを いちげきで ふんさいする。    "
    .strn "しぼうが ぶあつく ひょうてんかでも へいき。 "
    .hword 0x0

;[175]珍珠贝  
    .hword 0x1, 0x7, 0x6
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0x5, 0x2, 0x5
    .strn "パ-ルル "
    .strn "2まいがい"
    .strn "かたい かいがらに まもられて せいちょうする。"
    .strn "ほんたいが カラに おさまり きらなくなると  "
    .strn "しんかの しゅんかんが ちかづいた しょうこ。 "
    .hword 0x0

;[176]猎斑鱼  
    .hword 0x1, 0x7, 0x7
    .hword 0xA, 0xA, 0x1, 0x7
    .hword 0xA, 0x2, 0x7, 0x0
    .strn "ハンテ-ル"
    .strn " しんかい"
    .strn "さかなの かたちをした シッポで おびきよせ  "
    .strn "おおきな くちで エサを まるのみ する。   "
    .strn "ヘビのように からだを くねらせて およぐ。  "
    .hword 0x0

;[177]樱花鱼  
    .hword 0x1, 0x7, 0x8
    .hword 0xA, 0xA, 0x1, 0x8
    .hword 0xA, 0x2, 0x2, 0x6
    .strn "サクラビス"
    .strn " なんかい"
    .strn "およぐ すがたは ゆうがで とても きれいだが "
    .strn "えものを みつけると ほそい くちを からだに "
    .strn "さしこんで たいえきを ずるずる すするぞ。  "
    .hword 0x0

;[178]古空棘鱼 
    .hword 0x1, 0x7, 0x9
    .hword 0xA, 0xA, 0x1, 0x0
    .hword 0xA, 0x2, 0x3, 0x4
    .strn "ジ-ランス"
    .strn "ちょうじゅ"
    .strn "1おくねんの ながい あいだ まったく すがたが"
    .strn "かわらずに しんかいで くらしていた ポケモン。"
    .strn "はの ない くちで びせいぶつだけを たべる。 "
    .hword 0x0

;[179]太阳珊瑚 
    .hword 0x1, 0x8, 0x0
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0xA, 0x5, 0x0
    .strn "サニ-ゴ "
    .strn "  さんご"
    .strn "あたたかい うみに あつまった サニ-ゴは   "
    .strn "ちいさい ポケモンたちの かくれがに なる。  "
    .strn "すいおんが さがると みなみへ いどうする。  "
    .hword 0x0

;[180]灯笼鱼  
    .hword 0x1, 0x8, 0x1
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0x1, 0x2, 0x0
    .strn "チョンチ-"
    .strn " あんこう"
    .strn "つよい でんきを はっせいさせる さいぼうが  "
    .strn "2ほんの しょくしゅの なかに つまっている。 "
    .strn "じぶんも ちょっと ピリピリ しびれるらしい。 "
    .hword 0x0

;[181]电灯怪  
    .hword 0x1, 0x8, 0x2
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0xA, 0x2, 0x2, 0x5
    .strn "ランタ-ン"
    .strn "  ライト"
    .strn "よなかに ふねから くらい うみを のぞきこむと"
    .strn "しんかいを およぐ ランタ-ンの ひかりが   "
    .strn "ほしぞらの ように みえる ことが あるよ。  "
    .hword 0x0

;[182]爱心鱼  
    .hword 0x1, 0x8, 0x3
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0xA, 0x8, 0x7
    .strn "ラブカス "
    .strn "ランデブ-"
    .strn "ねったいの あさい うみで くらしている。   "
    .strn "カップルを みつけると うしろに くっついて  "
    .strn "およぐ ことから この なまえが つけられた。 "
    .hword 0x0

;[183]墨海马  
    .hword 0x1, 0x8, 0x4
    .hword 0xA, 0xA, 0x0, 0x4
    .hword 0xA, 0xA, 0x8, 0x0
    .strn "タッツ- "
    .strn " ドラゴン"
    .strn "きけんを かんじると はんしゃてきに くちから "
    .strn "まっくろい スミを はきだして にげるぞ。   "
    .strn "せびれを きように うごかして およぐ。    "
    .hword 0x0

;[184]海刺龙  
    .hword 0x1, 0x8, 0x5
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0xA, 0x2, 0x5, 0x0
    .strn "シ-ドラ "
    .strn " ドラゴン"
    .strn "からだを かいてんさせて うずまきを つくる。 "
    .strn "ぎょせんも のみこまれる ほどの げきりゅうで "
    .strn "えものを よわらせてから まるごと のみこむ。 "
    .hword 0x0

;[185]刺龙王  
    .hword 0x1, 0x8, 0x6
    .hword 0xA, 0xA, 0x1, 0x8
    .hword 0x1, 0x5, 0x2, 0x0
    .strn "キングドラ"
    .strn " ドラゴン"
    .strn "いきものの すまない かいていで ねむっている。"
    .strn "たいふうが やってくると めを さまして    "
    .strn "えものを さがしに うろつきまわると いわれる。"
    .hword 0x0

;[186]宝贝龙  
    .hword 0x1, 0x8, 0x7
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x4, 0x2, 0x1
    .strn "タツベイ "
    .strn "いしあたま"
    .strn "おおぞらを とぶことを ゆめみて くりかえし  "
    .strn "だんがいから とびおりている うちに あたまが "
    .strn "きたえられ こうてつの ように かたく なった。"
    .hword 0x0

;[187]甲壳龙  
    .hword 0x1, 0x8, 0x8
    .hword 0xA, 0xA, 0x1, 0x1
    .hword 0x1, 0x1, 0x0, 0x5
    .strn "コモル- "
    .strn " にんたい"
    .strn "かたい カラの ないぶは さいぼうが へんかして"
    .strn "あたらしい からだを つくっている さいちゅう。"
    .strn "カラが とても おもいので うごきは にぶいぞ。"
    .hword 0x0

;[188]暴飞龙  
    .hword 0x1, 0x8, 0x9
    .hword 0xA, 0xA, 0x1, 0x5
    .hword 0x1, 0x0, 0x2, 0x6
    .strn "ボ-マンダ"
    .strn " ドラゴン"
    .strn "つばさが ほしいと つよく おもい つづけてきた"
    .strn "けっか からだの さいぼうが とつぜんへんいを "
    .strn "おこし みごとな つばさが はえてきたと いう。"
    .hword 0x0

;[189]铁哑铃  
    .hword 0x1, 0x9, 0x0
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0x9, 0x5, 0x2
    .strn "ダンバル "
    .strn "てっきゅう"
    .strn "からだから でている じりょくと ちきゅうの  "
    .strn "じりょくを はんぱつさせて ちゅうに うかぶ。 "
    .strn "おしりの ツメを がけに くいこませて ねむる。"
    .hword 0x0

;[190]金属怪  
    .hword 0x1, 0x9, 0x1
    .hword 0xA, 0xA, 0x1, 0x2
    .hword 0x2, 0x0, 0x2, 0x5
    .strn "メタング "
    .strn " てつツメ"
    .strn "2ひきの ダンバルが がったいしたとき 2つの "
    .strn "のうが じりょくの しんけいで むすばれる。  "
    .strn "うでを うしろへ まわし こうそくで いどう。 "
    .hword 0x0

;[191]巨金怪  
    .hword 0x1, 0x9, 0x2
    .hword 0xA, 0xA, 0x1, 0x6
    .hword 0x5, 0x5, 0x0, 0x0
    .strn "メタグロス"
    .strn " てつあし"
    .strn "2ひきの メタングが がったいした すがた。  "
    .strn "きょたいで えものを おさえつけながら     "
    .strn "おなかに ある おおきな くちで たべるのだ。 "
    .hword 0x0

;[192]雷吉洛克 
    .hword 0x1, 0x9, 0x3
    .hword 0xA, 0xA, 0x1, 0x7
    .hword 0x2, 0x3, 0x0, 0x0
    .strn "レジロック"
    .strn " いわやま"
    .strn "むかし ひとに ふういんされた ポケモン。   "
    .strn "たたかいで からだが くずれると じぶんで   "
    .strn "あたらしい いわを さがして なおすと いう。 "
    .hword 0x0

;[193]雷吉艾斯 
    .hword 0x1, 0x9, 0x4
    .hword 0xA, 0xA, 0x1, 0x8
    .hword 0x1, 0x7, 0x5, 0x0
    .strn "レジアイス"
    .strn "ひょうざん"
    .strn "マイナス200どの れいきが からだを つつむ。"
    .strn "ちかづいた だけでも こおりついて しまうぞ。 "
    .strn "マグマでも とけない こおりの からだを もつ。"
    .hword 0x0

;[194]雷吉斯奇鲁
    .hword 0x1, 0x9, 0x5
    .hword 0xA, 0xA, 0x1, 0x9
    .hword 0x2, 0x0, 0x5, 0x0
    .strn "レジスチル"
    .strn " くろがね"
    .strn "どんな きんぞくよりも かたい からだを もつ。"
    .strn "からだの なかは くうどうに なっているらしく "
    .strn "たべている ものも わからない ポケモンだ。  "
    .hword 0x0

;[195]拉帝亚斯 
    .hword 0x1, 0x9, 0x6
    .hword 0xA, 0xA, 0x1, 0x4
    .hword 0xA, 0x4, 0x0, 0x0
    .strn "ラティアス"
    .strn "  むげん"
    .strn "ちのうが たかく ひとの ことばを りかいする。"
    .strn "ガラスの ような うもうで からだを つつみこみ"
    .strn "ひかりを くっせつさせて すがたを かえる。  "
    .hword 0x0

;[196]拉帝欧斯 
    .hword 0x1, 0x9, 0x7
    .hword 0xA, 0xA, 0x2, 0x0
    .hword 0xA, 0x6, 0x0, 0x0
    .strn "ラティオス"
    .strn "  むげん"
    .strn "みた ものや かんがえた イメ-ジを あいてに "
    .strn "えいぞうとして みせる のうりょくを もつ。  "
    .strn "にんげんの ことばを りかいすることが できる。"
    .hword 0x0

;[197]盖欧卡  
    .hword 0x1, 0x9, 0x8
    .hword 0xA, 0xA, 0x4, 0x5
    .hword 0x3, 0x5, 0x2, 0x0
    .strn "カイオ-ガ"
    .strn " かいてい"
    .strn "おおあめと おおなみで だいちを おおい うみを"
    .strn "ひろげた ポケモンと しんわで かたられている。"
    .strn "グラ-ドンと しとうの すえ ねむりに ついた。"
    .hword 0x0

;[198]固拉多  
    .hword 0x1, 0x9, 0x9
    .hword 0xA, 0xA, 0x3, 0x5
    .hword 0x9, 0x5, 0x0, 0x0
    .strn "グラ-ドン"
    .strn " たいりく"
    .strn "だいちを もりあげて たいりくを ひろげた   "
    .strn "ポケモンと しんわで かたり つがれている。  "
    .strn "カイオ-ガと しとうの すえ ねむりに ついた。"
    .hword 0x0

;[199]烈空坐  
    .hword 0x2, 0x0, 0x0
    .hword 0xA, 0xA, 0x7, 0x0
    .hword 0x2, 0x0, 0x6, 0x5
    .strn "レックウザ"
    .strn " てんくう"
    .strn "なんおくねんも いきつづけていると いわれる。 "
    .strn "くもの うえに ひろがる オゾンそうの なかを "
    .strn "とんでいるため だれも はっけん できなかった。"
    .hword 0x0

;[200]基拉祈  
    .hword 0x2, 0x0, 0x1
    .hword 0xA, 0xA, 0x0, 0x3
    .hword 0xA, 0xA, 0x1, 0x1
    .strn "ジラ-チ "
    .strn "ねがいごと"
    .strn "めざめた とき あたまの たんざくに かかれた "
    .strn "ねがいを かなえると いう でんせつを もつ。 "
    .strn "きけんを かんじると ねむったまま たたかう。 "
    .hword 0x0

;[201]菊草叶  
    .hword 0xA, 0xA, 0xA
    .hword 0xA, 0xA, 0x0, 0x9
    .hword 0xA, 0xA, 0x6, 0x4
    .strn "チコリ-タ"
    .strn "  はっぱ"
    .strn "ルビ-だいに とくべつ しゅつえん している。 "
    .strn "                        "
    .strn "                        "
    .hword 0x0

;[202]火球鼠  
    .hword 0xA, 0xA, 0xA
    .hword 0xA, 0xA, 0x0, 0x5
    .hword 0xA, 0xA, 0x7, 0x9
    .strn "ヒノアラシ"
    .strn " ひねずみ"
    .strn "ルビ-だいに とくべつ しゅつえん している。 "
    .strn "                        "
    .strn "                        "
    .hword 0x0

;[203]小锯鳄  
    .hword 0xA, 0xA, 0xA
    .hword 0xA, 0xA, 0x0, 0x6
    .hword 0xA, 0xA, 0x9, 0x5
    .strn "ワニノコ "
    .strn " おおあご"
    .strn "ルビ-だいに とくべつ しゅつえん している。 "
    .strn "                        "
    .strn "                        "
    .hword 0x0

;[204]化石翼龙 
    .hword 0xA, 0xA, 0xA
    .hword 0xA, 0xA, 0x1, 0x8
    .hword 0xA, 0x5, 0x9, 0x0
    .strn "プテラ  "
    .strn "  かせき"
    .strn "ルビ-だいに とくべつ しゅつえん している。 "
    .strn "                        "
    .strn "                        "
    .hword 0x0
*/