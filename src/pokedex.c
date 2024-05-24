#include "global.h"
#include "pokedex.h"
#include "pokedex_screen.h"

u16 GetPokedexHeightWeight(u16 dexNum, u8 data)
{
    switch (data)
    {
    case 0:  // height
        return gSpeciesInfo[dexNum].height;
    case 1:  // weight
        return gSpeciesInfo[dexNum].weight;
    default:
        return 1;
    }
}

s8 GetSetPokedexFlag(u16 nationalDexNo, u8 caseID)
{
    return DexScreen_GetSetPokedexFlag(nationalDexNo, caseID, 0);
}

u16 GetNationalPokedexCount(u8 caseID)
{
    u16 count = 0;
    u16 i;

    for (i = 0; i < NATIONAL_DEX_COUNT; i++)
    {
        switch (caseID)
        {
        case FLAG_GET_SEEN:
            if (GetSetPokedexFlag(i + 1, FLAG_GET_SEEN))
                count++;
            break;
        case FLAG_GET_CAUGHT:
            if (GetSetPokedexFlag(i + 1, FLAG_GET_CAUGHT))
                count++;
            break;
        }
    }
    return count;
}

u16 GetKantoPokedexCount(u8 caseID)
{
    u16 count = 0;
    u16 i;
    u16 nationalNum;

    for (i = 1; i < KANTO_DEX_END; i++)
    {
        nationalNum = KantoToNationalOrder(i);
        switch (caseID)
        {
        case FLAG_GET_SEEN:
            if (GetSetPokedexFlag(nationalNum, FLAG_GET_SEEN))
                count++;
            break;
        case FLAG_GET_CAUGHT:
            if (GetSetPokedexFlag(nationalNum, FLAG_GET_CAUGHT))
                count++;
            break;
        }
    }
    return count;
}

bool16 HasAllHoennMons(void)
{
    u16 i;

    // -2 excludes Jirachi and Deoxys
    for (i = 0; i < HOENN_DEX_COUNT - 2; i++)
    {
        if (!GetSetPokedexFlag(HoennToNationalOrder(i + 1), FLAG_GET_CAUGHT))
            return FALSE;
    }
    return TRUE;
}

bool16 HasAllKantoMons(void)
{
    u16 i;

    // -1 excludes Mew
    for (i = KANTO_DEX_START; i < KANTO_DEX_END; i++)
    {
        if (!GetSetPokedexFlag(KantoToNationalOrder(i), FLAG_GET_CAUGHT))
            return FALSE;
    }
    return TRUE;
}

bool16 HasAllMons(void)
{
    u16 i;

    // -1 excludes Mew
    for (i = 0; i < SPECIES_MEW - 1; i++)
    {
        if (!GetSetPokedexFlag(i + 1, FLAG_GET_CAUGHT))
            return FALSE;
    }

    // -3 excludes Lugia, Ho-Oh, and Celebi
    for (i = SPECIES_MEW; i < JOHTO_DEX_COUNT - 3; i++)
    {
        if (!GetSetPokedexFlag(i + 1, FLAG_GET_CAUGHT))
            return FALSE;
    }

    // -2 excludes Jirachi and Deoxys
    for (i = JOHTO_DEX_COUNT; i < NATIONAL_DEX_COUNT - 2; i++)
    {
        if (!GetSetPokedexFlag(i + 1, FLAG_GET_CAUGHT))
            return FALSE;
    }
    return TRUE;
}
