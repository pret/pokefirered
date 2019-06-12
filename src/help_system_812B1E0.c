#include "global.h"
#include "event_data.h"
#include "field_player_avatar.h"
#include "help_system.h"
#include "link.h"
#include "overworld.h"
#include "quest_log.h"
#include "save.h"
#include "save_location.h"
#include "constants/maps.h"

EWRAM_DATA u16 gUnknown_203B0EC = 0;
EWRAM_DATA u8 gUnknown_203B0EE = 0;

u8 gUnknown_3005E9C[4];
u16 gUnknown_3005EA0;

bool32 sub_812B27C(const u16 * mapIdxs);
void sub_812B4B8(void);
void sub_812B520(struct HelpSystemStruct_203F190 * a0, struct ListMenuItem * a1);
void sub_812B614(struct HelpSystemStruct_203F190 * a0, struct ListMenuItem * a1);
bool8 sub_812B754(void);
bool8 sub_812B780(u8);
void sub_812BF9C(struct HelpSystemStruct_203F190 * a0, struct ListMenuItem * a1);
void sub_812BF74(const u8 *);

// event_scripts.h
extern const u8 gUnknown_81B2E6F[];

// strings.h
extern const u8 gUnknown_841DFAC[];
extern const u8 gUnknown_841DFC9[];

// this file
extern const u8 *const gUnknown_845B080[];
extern const u8 *const gUnknown_845B0B0[];
extern const u8 *const gUnknown_845B218[];
extern const u8 *const gUnknown_845B3A0[];
extern const u8 *const gUnknown_845B500[];
extern const u8 *const gUnknown_845B540[];
extern const u8 gUnknown_845B9BE[];
extern const u8 *const gUnknown_845B9E0[];
extern const u8 gUnknown_845C4B0[];
extern const u8 gUnknown_845C4B6[][6];
extern const u16 gUnknown_845C594[]; // marts
extern const u16 gUnknown_845C5BC[]; // gyms
extern const u8 gUnknown_845C5CE[][3];

void sub_812B1E0(u8 a0)
{
    gUnknown_203B0EC = a0;
}

void HelpSystem_SetSomeVariable2(u8 a0)
{
    switch (gUnknown_203B0EC)
    {
    case 23:
    case 24:
    case 25:
    case 26:
        if (a0 == 9 || a0 == 5 || a0 == 6 || a0 == 7 || a0 == 8)
            break;
        // fallthrough
    default:
        gUnknown_203B0EC = a0;
        break;
    }
}

void sub_812B220(void)
{
    gUnknown_203B0EC = gSpecialVar_0x8004;
}

void sub_812B234(void)
{
    gUnknown_3005EA0 = gUnknown_203B0EC;
}

void sub_812B248(void)
{
    gUnknown_203B0EC = gUnknown_3005EA0;
}

bool32 sub_812B25C(void)
{
    return sub_812B27C(gUnknown_845C594);
}

bool32 sub_812B26C(void)
{
    return sub_812B27C(gUnknown_845C5BC);
}

bool32 sub_812B27C(const u16 * mapIdxs)
{
    u16 mapIdx = (gSaveBlock1Ptr->location.mapGroup << 8) + gSaveBlock1Ptr->location.mapNum;
    s32 i;

    for (i = 0; mapIdxs[i] != MAP_UNDEFINED; i++)
    {
        if (mapIdxs[i] == mapIdx)
            return TRUE;
    }

    return FALSE;
}

bool8 sub_812B2C4(void)
{
    u8 i, j;

    for (i = 0; i < 16; i++)
    {
        for (j = 0; j < gUnknown_845C5CE[i][2]; j++)
        {
            if (
                   gUnknown_845C5CE[i][0] == gSaveBlock1Ptr->location.mapGroup
                && gUnknown_845C5CE[i][1] + j == gSaveBlock1Ptr->location.mapNum
                && (i != 15 || FlagGet(FLAG_0x849) == TRUE)
            )
                return TRUE;
        }
    }

    return FALSE;
}

void sub_812B35C(void)
{
    sub_812B4B8();
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
        HelpSystem_SetSomeVariable2(0x16);
    else if (sub_812B2C4())
        HelpSystem_SetSomeVariable2(0x15);
    else if (is_light_level_8_or_9(gMapHeader.mapType))
    {
        if ((gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(PALLET_TOWN_PLAYERS_HOUSE_1F) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(PALLET_TOWN_PLAYERS_HOUSE_1F)) || (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(PALLET_TOWN_PLAYERS_HOUSE_2F) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(PALLET_TOWN_PLAYERS_HOUSE_2F)))
            HelpSystem_SetSomeVariable2(0x0E);
        else if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(PALLET_TOWN_PROFESSOR_OAKS_LAB) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(PALLET_TOWN_PROFESSOR_OAKS_LAB))
            HelpSystem_SetSomeVariable2(0x0F);
        else if (IsCurMapPokeCenter() == TRUE)
            HelpSystem_SetSomeVariable2(0x10);
        else if (sub_812B25C() == TRUE)
            HelpSystem_SetSomeVariable2(0x11);
        else if (sub_812B26C() == TRUE)
            HelpSystem_SetSomeVariable2(0x12);
        else
            HelpSystem_SetSomeVariable2(0x13);
    }
    else
        HelpSystem_SetSomeVariable2(0x14);
}

bool8 sub_812B40C(void)
{
    if (gUnknown_203B0EE == 1)
        return FALSE;

    if (gSaveFileStatus != SAVE_STATUS_EMPTY && gSaveFileStatus != SAVE_STATUS_INVALID && FlagGet(FLAG_0x83C))
        return FALSE;

    FlagSet(FLAG_0x83C);
    gUnknown_203B0EE = 1;
    return TRUE;
}

bool8 sub_812B45C(void)
{
    if (gReceivedRemoteLinkPlayers == 1)
        return FALSE;
    return TRUE;
}

void sub_812B478(void)
{
    gUnknown_3005ECC = 0;
}

void sub_812B484(void)
{
    if (gUnknown_203ADFA != 2 && gUnknown_203ADFA != 3)
    {
        gUnknown_3005ECC = 1;
        sub_812B4B8();
    }
}

void sub_812B4AC(void)
{
    gUnknown_203F175 = 1;
}

void sub_812B4B8(void)
{
    gUnknown_203F175 = 0;
}

void sub_812B4C4(struct HelpSystemStruct_203F190 * a0, struct ListMenuItem * a1)
{
    a0->sub.field_00 = a1;
    a0->sub.field_04 = 1;
    a0->sub.field_06 = 1;
    a0->sub.field_08 = 1;
    a0->sub.field_09 = 4;
}

void sub_812B4D8(struct HelpSystemStruct_203F190 * a0, struct ListMenuItem * a1)
{
    sub_812B4C4(a0, a1);
    sub_812B520(a0, a1);
    sub_812BF74(gUnknown_841DFAC);
    sub_813C64C(a0, 0, gUnknown_3005E9C[2]);
    sub_812BF9C(a0, a1);
    sub_813BDA4(1);
    sub_813BD5C(1);
}

void sub_812B520(struct HelpSystemStruct_203F190 * a0, struct ListMenuItem * a1)
{
    u8 i;
    u8 r4 = 0;
    for (i = 0; i < 6; i++)
    {
        if (gUnknown_845C4B6[gUnknown_203B0EC][gUnknown_845C4B0[i]] == 1)
        {
            a1[r4].label = gUnknown_845B080[gUnknown_845C4B0[i]];
            a1[r4].index = gUnknown_845C4B0[i];
            r4++;
        }
    }
    a1[r4 - 1].index = -2;
    a0->sub.field_04 = r4;
    a0->sub.field_06 = r4;
    a0->sub.field_08 = 0;
}

void sub_812B5A8(struct HelpSystemStruct_203F190 * a0, struct ListMenuItem * a1)
{
    sub_813BDE8(0);
    sub_813BFC0(0);
    sub_813BE78(1);
    sub_812B4C4(a0, a1);
    sub_812B614(a0, a1);
    sub_812BF74(gUnknown_841DFC9);
    sub_813C64C(a0, a0->field_0C, a0->field_0D);
    sub_813C4CC(gUnknown_845B080[gUnknown_3005E9C[1]], 0, 0);
    sub_813BDA4(1);
    sub_813BD5C(1);
}

void sub_812B614(struct HelpSystemStruct_203F190 * a0, struct ListMenuItem * a1)
{
    u8 r6 = 0;
    const u8 * r3 = gUnknown_845B9E0[gUnknown_203B0EC * 5 + gUnknown_3005E9C[1]];
    u8 i;
    for (i = 0; r3[i] != 0xFF; i++)
    {
        if (sub_812B780(r3[i]) == TRUE)
        {
            if (gUnknown_3005E9C[1] == 0)
                a1[r6].label = gUnknown_845B0B0[r3[i]];
            else if (gUnknown_3005E9C[1] == 1)
                a1[r6].label = gUnknown_845B218[r3[i]];
            else if (gUnknown_3005E9C[1] == 2)
                a1[r6].label = gUnknown_845B3A0[r3[i]];
            else if (gUnknown_3005E9C[1] == 3)
                a1[r6].label = gUnknown_845B500[r3[i]];
            else
                a1[r6].label = gUnknown_845B540[r3[i]];
            a1[r6].index = r3[i];
            r6++;
        }
    }
    if (sub_812B754() == TRUE)
    {
        for (i = 0, r3 = gUnknown_845B9BE; r3[i] != 0xFF; i++)
        {
            a1[r6].label = gUnknown_845B3A0[r3[i]];
            a1[r6].index = r3[i];
            r6++;
        }
    }
    a1[r6].label = gUnknown_81B2E6F;
    a1[r6].index = -2;
    r6++;
    a0->sub.field_04 = r6;
    a0->sub.field_06 = 7;
    a0->sub.field_08 = 0;
    a0->sub.field_09 = 21;
}

bool8 sub_812B754(void)
{
    if (FlagGet(FLAG_0x4B0) == TRUE && gUnknown_3005E9C[1] == 2)
        return TRUE;
    return FALSE;
}
