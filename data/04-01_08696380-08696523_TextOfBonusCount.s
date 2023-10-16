;该部分文本为ascii单字节编码
;每条文本包含3个句子
;每个句子有20字节空间
;汉字扩容需对函数进行修改，才可读取0x80-0xFF范围内字模

.loadtable "./charmap_8x8.txt"
.org TextOfBonusCountChinese
;[0]
    .strn "捕获宝可梦_______________"
    .strn "奖励得分________________"
    .strn "分项得分________________"

;[1]
    .strn "进化宝可梦_______________"
    .strn "奖励得分________________"
    .strn "分项得分________________"

;[2]
    .strn "场景切换________________"
    .strn "奖励得分________________"
    .strn "分项得分________________"

;[3]
    .strn "游玩老虎机_______________"
    .strn "奖励得分________________"
    .strn "分项得分________________"

;[4]
    .strn "皮卡救球________________"
    .strn "奖励得分________________"
    .strn "分项得分________________"

;[5]
    .strn "分项得分________________"
    .strn "分项得分________________"
    .strn "分项得分________________"

;[6]
    .strn "分项得分________________"
    .strn "乘积倍率________________"
    .strn "总和得分________________"

/*
;Ascii编码
.loadtable "./charmap_8x8.txt"
.org TextOfBonusCount
;[0]
    .strn "GET_POKEMON_________"
    .strn "BONUS_______________"
    .strn "SUBTOTAL____________"

;[1]
    .strn "EVOLUTIONS__________"
    .strn "BONUS_______________"
    .strn "SUBTOTAL____________"

;[2]
    .strn "MOVE_SUCCESS________"
    .strn "BONUS_______________"
    .strn "SUBTOTAL____________"

;[3]
    .strn "SLOT_PLAYED_________"
    .strn "BONUS_______________"
    .strn "SUBTOTAL____________"

;[4]
    .strn "PIKA_SAVER__________"
    .strn "BONUS_______________"
    .strn "SUBTOTAL____________"

;[5]
    .strn "SUBTOTAL____________"
    .strn "SUBTOTAL____________"
    .strn "SUBTOTAL____________"

;[6]
    .strn "SUBTOTAL____________"
    .strn "MULTIPLIER__________"
    .strn "TOTAL_______________"
*/