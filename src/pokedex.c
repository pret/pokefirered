#include "global.h"
#include "pokedex.h"
#include "pokedex_screen.h"

s8 GetSetPokedexFlag(u16 nationalDexNo, u8 caseID)
{
    return DexScreen_GetSetPokedexFlag(nationalDexNo, caseID, 0);
}

u16 GetNationalPokedexCount(u8 caseID)
{
    u16 count = 0;
    u16 i;

    for (i = NATIONAL_DEX_START; i < NATIONAL_DEX_END; i++)
    {
        switch (caseID)
        {
        case FLAG_GET_SEEN:
            if (GetSetPokedexFlag(i, FLAG_GET_SEEN))
                count++;
            break;
        case FLAG_GET_CAUGHT:
            if (GetSetPokedexFlag(i, FLAG_GET_CAUGHT))
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

    for (i = KANTO_DEX_START; i < KANTO_DEX_END; i++)
    {
        nationalNum = KantoToNationalDexNum(i);
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
    u16 i, species;

    for (i = HOENN_DEX_START; i < HOENN_DEX_END; i++)
    {
        species = HoennNumToSpecies(i);
        if (!gSpeciesInfo[species].isMythical && !GetSetPokedexFlag(HoennToNationalDexNum(i), FLAG_GET_CAUGHT))
            return FALSE;

    }
    return TRUE;
}

bool16 HasAllKantoMons(void)
{
    u16 i, species;

    for (i = KANTO_DEX_START; i < KANTO_DEX_END; i++)
    {
        species = KantoNumToSpecies(i);
        if (!gSpeciesInfo[species].isMythical && !GetSetPokedexFlag(KantoToNationalDexNum(i), FLAG_GET_CAUGHT))
            return FALSE;
    }
    return TRUE;
}

bool16 HasAllMons(void)
{
    u16 i, species;

    for (i = NATIONAL_DEX_START; i < NATIONAL_DEX_END; i++)
    {
        species = NationalDexNumToSpecies(i);
        if (!gSpeciesInfo[species].isMythical && !GetSetPokedexFlag(i, FLAG_GET_CAUGHT))
            return FALSE;
    }
    return TRUE;
}
