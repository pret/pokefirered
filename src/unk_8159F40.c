#include "global.h"
#include "battle.h"
#include "event_data.h"
#include "quest_log.h"

struct UnkStruct_84792D0
{
    u8 field_0;
    u8 field_1;
    u16 field_2;
    u16 field_4[4];
    u8 field_C;
    u8 field_D;
};

extern const struct UnkStruct_84792D0 *const gUnknown_84792D0[];

void sub_8159F40(void)
{
    s32 i, j;
    struct Pokemon *mon;
    s32 myIdx = 0;
    s32 opIdx = 0;
    const struct UnkStruct_84792D0 * data;

    gBattleTypeFlags = BATTLE_TYPE_DOME;
    ZeroPlayerPartyMons();
    ZeroEnemyPartyMons();
    data = gUnknown_84792D0[gSpecialVar_0x8004];

    i = 0;
    do
    {
        if (data[i].field_0 == 0)
        {
            mon = &gPlayerParty[myIdx];
            myIdx++;
        }
        else
        {
            mon = &gEnemyParty[opIdx];
            opIdx++;
        }
        CreateMonWithGenderNatureLetter(mon, data[i].field_2, data[i].field_1, 0, data[i].field_D, data[i].field_C, 0);
        for (j = 0; j < 4; j++)
        {
            SetMonMoveSlot(mon, data[i].field_4[j], j);
        }
        i++;
    } while (data[i].field_0 != 0xFF);
}

void sub_815A008(struct QuestLog * questLog)
{
    u32 i;

    for (i = 0; i < MAP_OBJECTS_COUNT; i++)
    {
        questLog->unk_008[i].active = gMapObjects[i].active;
        questLog->unk_008[i].mapobj_bit_3 = gMapObjects[i].mapobj_bit_3;
        questLog->unk_008[i].mapobj_bit_4 = gMapObjects[i].mapobj_bit_4;
        questLog->unk_008[i].mapobj_bit_5 = gMapObjects[i].mapobj_bit_5;
        questLog->unk_008[i].mapobj_bit_8 = gMapObjects[i].mapobj_bit_8;
        questLog->unk_008[i].mapobj_bit_9 = gMapObjects[i].mapobj_bit_9;
        questLog->unk_008[i].mapobj_bit_10 = gMapObjects[i].mapobj_bit_10;
        questLog->unk_008[i].mapobj_bit_11 = gMapObjects[i].mapobj_bit_11;
        questLog->unk_008[i].mapobj_bit_12 = gMapObjects[i].mapobj_bit_12;
        questLog->unk_008[i].mapobj_bit_13 = gMapObjects[i].mapobj_bit_13;
        questLog->unk_008[i].mapobj_bit_14 = gMapObjects[i].mapobj_bit_14;
        questLog->unk_008[i].mapobj_bit_15 = gMapObjects[i].mapobj_bit_15;
        questLog->unk_008[i].mapobj_bit_16 = gMapObjects[i].mapobj_bit_16;
        questLog->unk_008[i].mapobj_bit_23 = gMapObjects[i].mapobj_bit_23;
        questLog->unk_008[i].mapobj_bit_24 = gMapObjects[i].mapobj_bit_24;
        questLog->unk_008[i].mapobj_bit_25 = gMapObjects[i].mapobj_bit_25;
        questLog->unk_008[i].mapobj_bit_26 = gMapObjects[i].mapobj_bit_26;
        questLog->unk_008[i].mapobj_unk_18 = gMapObjects[i].mapobj_unk_18;
        questLog->unk_008[i].mapobj_unk_0B_0 = gMapObjects[i].mapobj_unk_0B_0;
        questLog->unk_008[i].elevation = gMapObjects[i].elevation;
        questLog->unk_008[i].graphicsId = gMapObjects[i].graphicsId;
        questLog->unk_008[i].animPattern = gMapObjects[i].animPattern;
        questLog->unk_008[i].trainerType = gMapObjects[i].trainerType;
        questLog->unk_008[i].localId = gMapObjects[i].localId;
        questLog->unk_008[i].mapNum = gMapObjects[i].mapNum;
        questLog->unk_008[i].mapGroup = gMapObjects[i].mapGroup;
        questLog->unk_008[i].x = gMapObjects[i].coords2.x;
        questLog->unk_008[i].y = gMapObjects[i].coords2.y;
        questLog->unk_008[i].trainerRange_berryTreeId = gMapObjects[i].trainerRange_berryTreeId;
        questLog->unk_008[i].mapobj_unk_1F = gMapObjects[i].mapobj_unk_1F;
        questLog->unk_008[i].mapobj_unk_21 = gMapObjects[i].mapobj_unk_21;
        questLog->unk_008[i].animId = gMapObjects[i].animId;
    }
}
