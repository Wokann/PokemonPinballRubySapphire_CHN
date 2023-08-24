int ConvertFont2Charmap_12x12(int Currenttext)
{
    int left = 0;
    int right = FONT_COUNT - 1;
    int mid;
    int searchtext;
    while(left <= right)
    {
        mid = (left + right) / 2;
        searchtext = Font2Charmap_12x12[mid].font;
        if(searchtext > Currenttext)
            right = mid - 1;
        else if(searchtext < Currenttext)
            left = mid + 1;
        else
        {
            Currenttext = Font2Charmap_12x12[mid].charmap;
            break;
        }
    }
    return Currenttext;
}