void FixTextGfx(int Currenttext,int stringwidth)//0x086D0000
{
    int width;
    int *TempStoreBase;
    int *RamTempStore;
    int *FixStoreBase;

    int startblock = stringwidth / 8;
    int startpiexl = stringwidth % 8;// = stringwidth - startblock * 8;

    TempStoreBase = (int*)0x02038000;
    RamTempStore = (int*)0x0203A000;
    FixStoreBase = RamTempStore + 0x8 * startblock;

    if(Currenttext >= 0x4E00)
    {  
      width = 16;  //汉字16
      Currenttext = ConvertFont2Charmap(Currenttext);
    }
    else
      width = 8;   //日文8
    Load2Ram((0x086AA000 + Currenttext), (int)TempStoreBase, (width/8), 2);

    if(startpiexl == 0)
      Load2Ram((int)TempStoreBase, (int)FixStoreBase, (width/8), 2);
    else if(startpiexl == 4)
    {
        int i = 0;
        int *FixStoreTop1, *FixStoreTop2, *FixStoreBottom1, *FixStoreBottom2;
        int *TempStoreTop1, *TempStoreTop2, *TempStoreBottom1, *TempStoreBottom2;

        FixStoreTop1 = FixStoreBase;
        FixStoreTop2 = FixStoreBase + 0x20;
        FixStoreBottom1 = FixStoreBase + 0x400;
        FixStoreBottom2 = FixStoreBase + 0x420;
        TempStoreTop1 = TempStoreBase;
        TempStoreTop2 = TempStoreBase + 0x20;
        TempStoreBottom1 = TempStoreBase + 0x400;
        TempStoreBottom2 = TempStoreBase + 0x420;
        
        for(i = 0; i < 8; i++)
        {
            *FixStoreTop1 |= *TempStoreTop1 << 16;
            *FixStoreBottom1 |= *TempStoreBottom1 << 16;
            *FixStoreTop2 = *TempStoreTop1 >> 16;
            *FixStoreBottom2 = *TempStoreBottom1 >> 16;
            if(width == 16)
            {
                *FixStoreTop2  |= *TempStoreTop2 << 16;
                *FixStoreBottom2 |= *TempStoreBottom2 << 16;
            }
            FixStoreTop1 += 1;
            FixStoreTop2 += 1;
            FixStoreBottom1 += 1;
            FixStoreBottom2 += 1;
            TempStoreTop1 += 1;
            TempStoreTop2 += 1;
            TempStoreBottom1 += 1;
            TempStoreBottom2 += 1;
        }
    }
}