#include "global.h"
#include "event_data.h"
#include "item_menu.h"
#include "quest_log.h"

static bool8 IsFlagOrVarStoredInQuestLog(u16 idx, u8 a1);

EWRAM_DATA u16 gSpecialVar_0x8000 = 0;
EWRAM_DATA u16 gSpecialVar_0x8001 = 0;
EWRAM_DATA u16 gSpecialVar_0x8002 = 0;
EWRAM_DATA u16 gSpecialVar_0x8003 = 0;
EWRAM_DATA u16 gSpecialVar_0x8004 = 0;
EWRAM_DATA u16 gSpecialVar_0x8005 = 0;
EWRAM_DATA u16 gSpecialVar_0x8006 = 0;
EWRAM_DATA u16 gSpecialVar_0x8007 = 0;
EWRAM_DATA u16 gSpecialVar_0x8008 = 0;
EWRAM_DATA u16 gSpecialVar_0x8009 = 0;
EWRAM_DATA u16 gSpecialVar_0x800A = 0;
EWRAM_DATA u16 gSpecialVar_0x800B = 0;
EWRAM_DATA u16 gSpecialVar_Result = 0;
EWRAM_DATA u16 gSpecialVar_LastTalked = 0;
EWRAM_DATA u16 gSpecialVar_Facing = 0;
EWRAM_DATA u16 gSpecialVar_MonBoxId = 0;
EWRAM_DATA u16 gSpecialVar_MonBoxPos = 0;
EWRAM_DATA u16 gSpecialVar_TextColor = 0;
EWRAM_DATA u16 gSpecialVar_PrevTextColor = 0;
EWRAM_DATA u16 gUnknown_20370DE = 0;
EWRAM_DATA u8 gUnknown_20370E0[SPECIAL_FLAGS_COUNT] = {};

u16 gUnknown_300507C;

extern u16 *const gSpecialVars[];

void InitEventData(void)
{
    memset(gSaveBlock1Ptr->flags, 0, FLAGS_COUNT);
    memset(gSaveBlock1Ptr->vars, 0, VARS_COUNT * 2);
    memset(gUnknown_20370E0, 0, SPECIAL_FLAGS_COUNT);
}

void sub_806E110(void)
{
    memset(gSaveBlock1Ptr->flags, 0, 4);
    memset(gSaveBlock1Ptr->vars, 0, 16 * 2);
    FlagClear(FLAG_SYS_WHITE_FLUTE_ACTIVE);
    FlagClear(FLAG_SYS_BLACK_FLUTE_ACTIVE);
    FlagClear(FLAG_SYS_STRENGTH_ACTIVE);
    FlagClear(FLAG_SYS_SPECIAL_WILD_BATTLE);
    FlagClear(FLAG_SYS_INFORMED_OF_LOCAL_WIRELESS_PLAYER);
}

void sub_806E168(void)
{
    u16 *ptr = GetVarPointer(VAR_0x403C);
    gSaveBlock2Ptr->pokedex.nationalMagic = 0;
    *ptr = 0;
    FlagClear(FLAG_0x838);
}

void sub_806E190(void)
{
    u16 *ptr = GetVarPointer(VAR_0x403C);
    gSaveBlock2Ptr->pokedex.nationalMagic = 0xDA;
    *ptr = 0x0302;
    FlagSet(FLAG_0x838);
}

bool32 sub_806E1C0(void)
{
    if (gSaveBlock2Ptr->pokedex.nationalMagic != 0xDA)
        return FALSE;
    if (VarGet(VAR_0x403C) != 0x0302)
        return FALSE;
    if (!FlagGet(FLAG_0x838))
        return FALSE;
    return TRUE;
}

void sub_806E204(void)
{
    u16 *ptr = GetVarPointer(VAR_0x404E);
    gSaveBlock2Ptr->pokedex.unknown2 = 0;
    *ptr = 0;
    FlagClear(FLAG_SYS_NATIONAL_DEX);
}

void EnableNationalPokedex(void)
{
    u16 *ptr = GetVarPointer(VAR_0x404E);
    gSaveBlock2Ptr->pokedex.unknown2 = 0xB9;
    *ptr = 0x6258;
    FlagSet(FLAG_SYS_NATIONAL_DEX);
}

bool32 IsNationalPokedexEnabled(void)
{
    if (gSaveBlock2Ptr->pokedex.unknown2 != 0xB9)
        return FALSE;
    if (VarGet(VAR_0x404E) != 0x6258)
        return FALSE;
    if (!FlagGet(FLAG_SYS_NATIONAL_DEX))
        return FALSE;
    return TRUE;
}

void DisableMysteryGift(void)
{
    FlagClear(FLAG_SYS_MYSTERY_GIFT_ENABLED);
}

void EnableMysteryGift(void)
{
    FlagSet(FLAG_SYS_MYSTERY_GIFT_ENABLED);
}

bool32 IsMysteryGiftEnabled(void)
{
    return FlagGet(FLAG_SYS_MYSTERY_GIFT_ENABLED);
}

void sub_806E2D0(void)
{
    FlagClear(FLAG_MYSTERY_EVENT_DONE);
    FlagClear(FLAG_0x3D9);
    FlagClear(FLAG_0x3DA);
    FlagClear(FLAG_0x3DB);
    FlagClear(FLAG_0x3DC);
    FlagClear(FLAG_0x3DD);
    FlagClear(FLAG_0x3DE);
    FlagClear(FLAG_0x3DF);
    FlagClear(FLAG_0x3E0);
    FlagClear(FLAG_0x3E1);
    FlagClear(FLAG_0x3E2);
    FlagClear(FLAG_0x3E3);
    FlagClear(FLAG_0x3E4);
    FlagClear(FLAG_0x3E5);
    FlagClear(FLAG_0x3E6);
    FlagClear(FLAG_0x3E7);
}

void sub_806E370(void)
{
    VarSet(VAR_EVENT_PICHU_SLOT, 0);
    VarSet(VAR_0x40B6, 0);
    VarSet(VAR_0x40B7, 0);
    VarSet(VAR_0x40B8, 0);
    VarSet(VAR_0x40B9, 0);
    VarSet(VAR_0x40BA, 0);
    VarSet(VAR_0x40BB, 0);
    VarSet(VAR_0x40BC, 0);
    VarSet(VAR_ALTERING_CAVE_WILD_SET, 0);
}

void DisableResetRTC(void)
{
    VarSet(VAR_0x4032, 0);
    FlagClear(FLAG_0x837);
}

void EnableResetRTC(void)
{
    VarSet(VAR_0x4032, 0x0920);
    FlagSet(FLAG_0x837);
}

bool32 CanResetRTC(void)
{
    if (!FlagGet(FLAG_0x837))
        return FALSE;
    if (VarGet(VAR_0x4032) != 0x0920)
        return FALSE;
    return TRUE;
}

u16 *GetVarPointer(u16 idx)
{
    u16 *ptr;
    if (idx < VARS_START)
        return NULL;
    if (idx < SPECIAL_VARS_START)
    {
        switch (gUnknown_3005E88)
        {
        case 0:
        default:
            break;
        case 1:
            ptr = sub_8112D40(0, idx);
            if (ptr != NULL)
                gSaveBlock1Ptr->vars[idx - VARS_START] = *ptr;
            break;
        case 2:
            if (IsFlagOrVarStoredInQuestLog(idx - VARS_START, 1) == TRUE)
            {
                gUnknown_300507C = idx - VARS_START;
                sub_8112DB0(0, idx, gSaveBlock1Ptr->vars[idx - VARS_START]);
            }
            break;
        }
        return &gSaveBlock1Ptr->vars[idx - VARS_START];
    }
    return gSpecialVars[idx - SPECIAL_VARS_START];
}

static bool8 IsFlagOrVarStoredInQuestLog(u16 idx, u8 a1)
{
    if (a1 == 0)
    {
        if (idx < STORY_FLAGS_START)
            return FALSE;
        if (idx >= SYS_FLAGS && idx < PERMA_SYS_FLAGS_START)
            return FALSE;
    }
    else
    {
        if (idx < VAR_0x4030 - VARS_START)
            return FALSE;
        if (idx >= VAR_MAP_SCENE_PALLET_TOWN_OAK - VARS_START && idx < VAR_PORTHOLE - VARS_START)
            return FALSE;
    }
    return TRUE;
}

u16 VarGet(u16 idx)
{
    u16 *ptr = GetVarPointer(idx);
    if (ptr == NULL)
        return idx;
    return *ptr;
}

bool8 VarSet(u16 idx, u16 val)
{
    u16 *ptr = GetVarPointer(idx);
    if (ptr == NULL)
        return FALSE;
    *ptr = val;
    return TRUE;
}

u8 VarGetFieldObjectGraphicsId(u8 idx)
{
    return VarGet(0x4010 + idx);
}

u8 *GetFlagAddr(u16 idx)
{
    u8 *ptr;
    if (idx == 0)
        return NULL;
    if (idx < SPECIAL_FLAGS_START)
    {
        switch (gUnknown_3005E88)
        {
        case 0:
        default:
            break;
        case 1:
            ptr = sub_8112D40(1, idx);
            if (ptr != NULL)
                gSaveBlock1Ptr->flags[idx >> 3] = *ptr;
            break;
        case 2:
            if (IsFlagOrVarStoredInQuestLog(idx, 0) == TRUE)
            {
                gUnknown_300507C = idx;
                sub_8112DB0(1, idx, gSaveBlock1Ptr->flags[idx / 8]);
            }
            break;
        }
        return &gSaveBlock1Ptr->flags[idx / 8];
    }
    return &gUnknown_20370E0[(idx - SPECIAL_FLAGS_START) / 8];
}

bool8 FlagSet(u16 idx)
{
    u8 *ptr = GetFlagAddr(idx);
    if (ptr != NULL)
        *ptr |= 1 << (idx & 7);
    return FALSE;
}

bool8 FlagClear(u16 idx)
{
    u8 *ptr = GetFlagAddr(idx);
    if (ptr != NULL)
        *ptr &= ~(1 << (idx & 7));
    return FALSE;
}

bool8 FlagGet(u16 idx)
{
    u8 *ptr = GetFlagAddr(idx);
    if (ptr == NULL)
        return FALSE;
    if (!(*ptr & 1 << (idx & 7)))
        return FALSE;
    return TRUE;
}

void ResetSpecialVars(void)
{
    gSpecialVar_0x8000 = 0;
    gSpecialVar_0x8001 = 0;
    gSpecialVar_0x8002 = 0;
    gSpecialVar_0x8003 = 0;
    gSpecialVar_0x8004 = 0;
    gSpecialVar_0x8005 = 0;
    gSpecialVar_0x8006 = 0;
    gSpecialVar_0x8007 = 0;
    gSpecialVar_0x8008 = 0;
    gSpecialVar_0x8009 = 0;
    gSpecialVar_0x800A = 0;
    gSpecialVar_0x800B = 0;
    gSpecialVar_Facing = 0;
    gSpecialVar_Result = 0;
    gSpecialVar_ItemId = 0;
    gSpecialVar_LastTalked = 0;
    gSpecialVar_MonBoxId = 0;
    gSpecialVar_MonBoxPos = 0;
    gSpecialVar_TextColor = 0;
    gSpecialVar_PrevTextColor = 0;
    gUnknown_20370DE = 0;
}
