#include "global.h"
#include "battle.h"
#include "event_data.h"
#include "quest_log.h"
#include "fieldmap.h"
#include "field_player_avatar.h"
#include "metatile_behavior.h"
#include "link.h"
#include "link_rfu.h"

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

#ifdef NONMATCHING
void sub_815A1F8(const struct QuestLog * questLog, const struct MapObjectTemplate * templates)
{
    u32 i, j;
    const struct QuestLogMapObject * questLogMapObjects = questLog->unk_008;

    CpuFill16(0, gMapObjects, sizeof(gMapObjects));

    for (i = 0; i < MAP_OBJECTS_COUNT; i++)
    {
        gMapObjects[i].active = questLogMapObjects[i].active;
        gMapObjects[i].mapobj_bit_3 = questLogMapObjects[i].mapobj_bit_3;
        gMapObjects[i].mapobj_bit_4 = questLogMapObjects[i].mapobj_bit_4;
        gMapObjects[i].mapobj_bit_5 = questLogMapObjects[i].mapobj_bit_5;
        gMapObjects[i].mapobj_bit_8 = questLogMapObjects[i].mapobj_bit_8;
        gMapObjects[i].mapobj_bit_9 = questLogMapObjects[i].mapobj_bit_9;
        gMapObjects[i].mapobj_bit_10 = questLogMapObjects[i].mapobj_bit_10;
        gMapObjects[i].mapobj_bit_11 = questLogMapObjects[i].mapobj_bit_11;
        gMapObjects[i].mapobj_bit_12 = questLogMapObjects[i].mapobj_bit_12;
        gMapObjects[i].mapobj_bit_13 = questLogMapObjects[i].mapobj_bit_13;
        gMapObjects[i].mapobj_bit_14 = questLogMapObjects[i].mapobj_bit_14;
        gMapObjects[i].mapobj_bit_15 = questLogMapObjects[i].mapobj_bit_15;
        gMapObjects[i].mapobj_bit_16 = questLogMapObjects[i].mapobj_bit_16;
        gMapObjects[i].mapobj_bit_23 = questLogMapObjects[i].mapobj_bit_23;
        gMapObjects[i].mapobj_bit_24 = questLogMapObjects[i].mapobj_bit_24;
        gMapObjects[i].mapobj_bit_25 = questLogMapObjects[i].mapobj_bit_25;
        gMapObjects[i].mapobj_bit_26 = questLogMapObjects[i].mapobj_bit_26;
        gMapObjects[i].mapobj_unk_18 = questLogMapObjects[i].mapobj_unk_18;
        gMapObjects[i].mapobj_unk_0B_0 = questLogMapObjects[i].mapobj_unk_0B_0;
        gMapObjects[i].elevation = questLogMapObjects[i].elevation;
        gMapObjects[i].graphicsId = questLogMapObjects[i].graphicsId;
        gMapObjects[i].animPattern = questLogMapObjects[i].animPattern;
        gMapObjects[i].trainerType = questLogMapObjects[i].trainerType;
        gMapObjects[i].localId = questLogMapObjects[i].localId;
        gMapObjects[i].mapNum = questLogMapObjects[i].mapNum;
        gMapObjects[i].mapGroup = questLogMapObjects[i].mapGroup;
        gMapObjects[i].coords2.x = questLogMapObjects[i].x;
        gMapObjects[i].coords2.y = questLogMapObjects[i].y;
        gMapObjects[i].trainerRange_berryTreeId = questLogMapObjects[i].trainerRange_berryTreeId;
        gMapObjects[i].mapobj_unk_1F = questLogMapObjects[i].mapobj_unk_1F;
        gMapObjects[i].mapobj_unk_21 = questLogMapObjects[i].mapobj_unk_21;
        gMapObjects[i].animId = questLogMapObjects[i].animId;

        for (j = 0; j < 0x40; j++)
        {
            if (gMapObjects[i].localId == templates[j].localId)
            {
                gMapObjects[i].coords1.x = templates[j].x + 7;
                gMapObjects[i].coords1.y = templates[j].y + 7;
                gMapObjects[i].range.as_nybbles.x = templates[j].range.as_nybbles.x;
                gMapObjects[i].range.as_nybbles.y = templates[j].range.as_nybbles.y;
            }
        }

        gMapObjects[i].mapobj_unk_1E = MapGridGetMetatileBehaviorAt(gMapObjects[i].coords2.x, gMapObjects[i].coords2.y);
        if (gMapObjects[i].mapobj_unk_1F == MapGridGetMetatileBehaviorAt((s16)(gMapObjects[i].coords2.x), (s16)(gMapObjects[i].coords2.y)))
        {
            gMapObjects[i].coords3.x = gMapObjects[i].coords2.x;
            gMapObjects[i].coords3.y = gMapObjects[i].coords2.y;
        }
        else if (gMapObjects[i].mapobj_unk_1F == MapGridGetMetatileBehaviorAt((s16)(gMapObjects[i].coords2.x - 1), (s16)(gMapObjects[i].coords2.y)))
        {
            gMapObjects[i].coords3.x = gMapObjects[i].coords2.x - 1;
            gMapObjects[i].coords3.y = gMapObjects[i].coords2.y;
        }
        else if (gMapObjects[i].mapobj_unk_1F == MapGridGetMetatileBehaviorAt((s16)(gMapObjects[i].coords2.x + 1), (s16)(gMapObjects[i].coords2.y)))
        {
            gMapObjects[i].coords3.x = gMapObjects[i].coords2.x + 1;
            gMapObjects[i].coords3.y = gMapObjects[i].coords2.y;
        }
        else if (gMapObjects[i].mapobj_unk_1F == MapGridGetMetatileBehaviorAt((s16)(gMapObjects[i].coords2.x), (s16)(gMapObjects[i].coords2.y - 1)))
        {
            gMapObjects[i].coords3.x = gMapObjects[i].coords2.x;
            gMapObjects[i].coords3.y = gMapObjects[i].coords2.y - 1;
        }
        else if (gMapObjects[i].mapobj_unk_1F == MapGridGetMetatileBehaviorAt((s16)(gMapObjects[i].coords2.x), (s16)(gMapObjects[i].coords2.y + 1)))
        {
            gMapObjects[i].coords3.x = gMapObjects[i].coords2.x;
            gMapObjects[i].coords3.y = gMapObjects[i].coords2.y + 1;
        }
    }

    CpuCopy16(gMapObjects, gSaveBlock1Ptr->mapObjects, sizeof(gMapObjects));
}
#else
NAKED
void sub_815A1F8(const struct QuestLog * questLog, const struct MapObjectTemplate * templates)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tsub sp, 0x10\n"
                "\tstr r1, [sp, 0x4]\n"
                "\tadds r0, 0x8\n"
                "\tstr r0, [sp, 0x8]\n"
                "\tmov r1, sp\n"
                "\tmovs r0, 0\n"
                "\tstrh r0, [r1]\n"
                "\tldr r4, _0815A480 @ =gMapObjects\n"
                "\tldr r2, _0815A484 @ =0x01000120\n"
                "\tmov r0, sp\n"
                "\tadds r1, r4, 0\n"
                "\tbl CpuSet\n"
                "\tmovs r0, 0\n"
                "\tmov r12, r0\n"
                "\tmovs r1, 0x1\n"
                "\tmov r10, r1\n"
                "_0815A224:\n"
                "\tmov r2, r12\n"
                "\tlsls r7, r2, 3\n"
                "\tadds r5, r7, r2\n"
                "\tlsls r5, 2\n"
                "\tldr r0, _0815A480 @ =gMapObjects\n"
                "\tadds r5, r0\n"
                "\tlsls r6, r2, 2\n"
                "\tadd r6, r12\n"
                "\tlsls r6, 2\n"
                "\tldr r1, [sp, 0x8]\n"
                "\tadds r6, r1\n"
                "\tldrb r0, [r6]\n"
                "\tlsls r0, 31\n"
                "\tlsrs r0, 31\n"
                "\tmov r2, r10\n"
                "\tands r0, r2\n"
                "\tldrb r2, [r5]\n"
                "\tmovs r1, 0x2\n"
                "\tnegs r1, r1\n"
                "\tands r1, r2\n"
                "\torrs r1, r0\n"
                "\tstrb r1, [r5]\n"
                "\tldrb r0, [r6]\n"
                "\tlsls r0, 30\n"
                "\tlsrs r0, 31\n"
                "\tmov r2, r10\n"
                "\tands r0, r2\n"
                "\tlsls r0, 3\n"
                "\tmovs r2, 0x9\n"
                "\tnegs r2, r2\n"
                "\tands r2, r1\n"
                "\torrs r2, r0\n"
                "\tstrb r2, [r5]\n"
                "\tldrb r0, [r6]\n"
                "\tlsls r0, 29\n"
                "\tlsrs r0, 31\n"
                "\tmov r1, r10\n"
                "\tands r0, r1\n"
                "\tlsls r0, 4\n"
                "\tmovs r1, 0x11\n"
                "\tnegs r1, r1\n"
                "\tands r1, r2\n"
                "\torrs r1, r0\n"
                "\tstrb r1, [r5]\n"
                "\tldrb r0, [r6]\n"
                "\tlsls r0, 28\n"
                "\tlsrs r0, 31\n"
                "\tmov r2, r10\n"
                "\tands r0, r2\n"
                "\tlsls r0, 5\n"
                "\tmovs r4, 0x21\n"
                "\tnegs r4, r4\n"
                "\tands r1, r4\n"
                "\torrs r1, r0\n"
                "\tstrb r1, [r5]\n"
                "\tldrb r0, [r6]\n"
                "\tlsls r0, 27\n"
                "\tlsrs r0, 31\n"
                "\tands r0, r2\n"
                "\tldrb r1, [r5, 0x1]\n"
                "\tmovs r2, 0x2\n"
                "\tnegs r2, r2\n"
                "\tands r2, r1\n"
                "\torrs r2, r0\n"
                "\tstrb r2, [r5, 0x1]\n"
                "\tldrb r0, [r6]\n"
                "\tlsls r0, 26\n"
                "\tlsrs r0, 31\n"
                "\tmov r1, r10\n"
                "\tands r0, r1\n"
                "\tlsls r0, 1\n"
                "\tmovs r1, 0x3\n"
                "\tnegs r1, r1\n"
                "\tmov r8, r1\n"
                "\tmov r3, r8\n"
                "\tands r3, r2\n"
                "\torrs r3, r0\n"
                "\tstrb r3, [r5, 0x1]\n"
                "\tldrb r0, [r6]\n"
                "\tlsls r0, 25\n"
                "\tlsrs r0, 31\n"
                "\tmov r2, r10\n"
                "\tands r0, r2\n"
                "\tlsls r0, 2\n"
                "\tsubs r1, 0x2\n"
                "\tmov r9, r1\n"
                "\tands r1, r3\n"
                "\torrs r1, r0\n"
                "\tstrb r1, [r5, 0x1]\n"
                "\tldrb r0, [r6]\n"
                "\tlsrs r0, 7\n"
                "\tands r0, r2\n"
                "\tlsls r0, 3\n"
                "\tmovs r2, 0x9\n"
                "\tnegs r2, r2\n"
                "\tands r2, r1\n"
                "\torrs r2, r0\n"
                "\tstrb r2, [r5, 0x1]\n"
                "\tldrb r0, [r6, 0x1]\n"
                "\tlsls r0, 31\n"
                "\tlsrs r0, 31\n"
                "\tmov r1, r10\n"
                "\tands r0, r1\n"
                "\tlsls r0, 4\n"
                "\tmovs r1, 0x11\n"
                "\tnegs r1, r1\n"
                "\tands r1, r2\n"
                "\torrs r1, r0\n"
                "\tstrb r1, [r5, 0x1]\n"
                "\tldrb r0, [r6, 0x1]\n"
                "\tlsls r0, 30\n"
                "\tlsrs r0, 31\n"
                "\tmov r2, r10\n"
                "\tands r0, r2\n"
                "\tlsls r0, 5\n"
                "\tands r4, r1\n"
                "\torrs r4, r0\n"
                "\tstrb r4, [r5, 0x1]\n"
                "\tldrb r0, [r6, 0x1]\n"
                "\tlsls r0, 29\n"
                "\tlsrs r0, 31\n"
                "\tands r0, r2\n"
                "\tlsls r0, 6\n"
                "\tmovs r2, 0x41\n"
                "\tnegs r2, r2\n"
                "\tadds r1, r2, 0\n"
                "\tands r4, r1\n"
                "\torrs r4, r0\n"
                "\tstrb r4, [r5, 0x1]\n"
                "\tldrb r0, [r6, 0x1]\n"
                "\tlsls r0, 28\n"
                "\tlsrs r0, 31\n"
                "\tlsls r0, 7\n"
                "\tmovs r3, 0x7F\n"
                "\tands r4, r3\n"
                "\torrs r4, r0\n"
                "\tstrb r4, [r5, 0x1]\n"
                "\tldrb r0, [r6, 0x1]\n"
                "\tlsls r0, 27\n"
                "\tlsrs r0, 31\n"
                "\tmov r1, r10\n"
                "\tands r0, r1\n"
                "\tldrb r2, [r5, 0x2]\n"
                "\tmovs r1, 0x2\n"
                "\tnegs r1, r1\n"
                "\tands r1, r2\n"
                "\torrs r1, r0\n"
                "\tstrb r1, [r5, 0x2]\n"
                "\tldrb r0, [r6, 0x1]\n"
                "\tlsls r0, 26\n"
                "\tlsrs r0, 31\n"
                "\tlsls r0, 7\n"
                "\tands r1, r3\n"
                "\torrs r1, r0\n"
                "\tstrb r1, [r5, 0x2]\n"
                "\tldrb r0, [r6, 0x1]\n"
                "\tlsls r0, 25\n"
                "\tlsrs r0, 31\n"
                "\tmov r2, r10\n"
                "\tands r0, r2\n"
                "\tldrb r2, [r5, 0x3]\n"
                "\tmovs r1, 0x2\n"
                "\tnegs r1, r1\n"
                "\tands r1, r2\n"
                "\torrs r1, r0\n"
                "\tstrb r1, [r5, 0x3]\n"
                "\tldrb r0, [r6, 0x1]\n"
                "\tlsrs r0, 7\n"
                "\tmov r2, r10\n"
                "\tands r0, r2\n"
                "\tlsls r0, 1\n"
                "\tmov r2, r8\n"
                "\tands r2, r1\n"
                "\torrs r2, r0\n"
                "\tmov r8, r2\n"
                "\tstrb r2, [r5, 0x3]\n"
                "\tldrb r0, [r6, 0x2]\n"
                "\tlsls r0, 31\n"
                "\tlsrs r0, 31\n"
                "\tmov r1, r10\n"
                "\tands r0, r1\n"
                "\tlsls r0, 2\n"
                "\tmov r1, r9\n"
                "\tands r2, r1\n"
                "\torrs r2, r0\n"
                "\tstrb r2, [r5, 0x3]\n"
                "\tldrb r1, [r6, 0x2]\n"
                "\tlsls r1, 27\n"
                "\tlsrs r1, 28\n"
                "\tldrb r2, [r5, 0x18]\n"
                "\tmovs r4, 0x10\n"
                "\tnegs r4, r4\n"
                "\tadds r0, r4, 0\n"
                "\tands r0, r2\n"
                "\torrs r0, r1\n"
                "\tstrb r0, [r5, 0x18]\n"
                "\tldrb r1, [r6, 0x3]\n"
                "\tlsls r1, 28\n"
                "\tmovs r3, 0xF\n"
                "\tlsrs r1, 28\n"
                "\tldrb r2, [r5, 0xB]\n"
                "\tadds r0, r4, 0\n"
                "\tands r0, r2\n"
                "\torrs r0, r1\n"
                "\tstrb r0, [r5, 0xB]\n"
                "\tldrb r1, [r6, 0x3]\n"
                "\tlsrs r1, 4\n"
                "\tlsls r1, 4\n"
                "\tands r0, r3\n"
                "\torrs r0, r1\n"
                "\tstrb r0, [r5, 0xB]\n"
                "\tldrb r0, [r6, 0x4]\n"
                "\tstrb r0, [r5, 0x5]\n"
                "\tldrb r0, [r6, 0x5]\n"
                "\tstrb r0, [r5, 0x6]\n"
                "\tldrb r0, [r6, 0x6]\n"
                "\tstrb r0, [r5, 0x7]\n"
                "\tldrb r0, [r6, 0x7]\n"
                "\tstrb r0, [r5, 0x8]\n"
                "\tldrb r0, [r6, 0x8]\n"
                "\tstrb r0, [r5, 0x9]\n"
                "\tldrb r0, [r6, 0x9]\n"
                "\tstrb r0, [r5, 0xA]\n"
                "\tldrh r0, [r6, 0xA]\n"
                "\tstrh r0, [r5, 0x10]\n"
                "\tldrh r0, [r6, 0xC]\n"
                "\tstrh r0, [r5, 0x12]\n"
                "\tldrb r0, [r6, 0xE]\n"
                "\tstrb r0, [r5, 0x1D]\n"
                "\tldrb r0, [r6, 0xF]\n"
                "\tstrb r0, [r5, 0x1F]\n"
                "\tldrb r0, [r6, 0x10]\n"
                "\tadds r1, r5, 0\n"
                "\tadds r1, 0x21\n"
                "\tstrb r0, [r1]\n"
                "\tldrb r0, [r6, 0x11]\n"
                "\tadds r1, 0x1\n"
                "\tstrb r0, [r1]\n"
                "\tmovs r6, 0\n"
                "\tmov r8, r7\n"
                "\tmov r2, r12\n"
                "\tadds r2, 0x1\n"
                "\tstr r2, [sp, 0xC]\n"
                "\tldrb r7, [r5, 0x8]\n"
                "\tldr r3, [sp, 0x4]\n"
                "\tmovs r0, 0xF\n"
                "\tmov r9, r0\n"
                "_0815A412:\n"
                "\tldrb r1, [r3]\n"
                "\tcmp r7, r1\n"
                "\tbne _0815A444\n"
                "\tldrh r0, [r3, 0x4]\n"
                "\tadds r0, 0x7\n"
                "\tstrh r0, [r5, 0xC]\n"
                "\tldrh r0, [r3, 0x6]\n"
                "\tadds r0, 0x7\n"
                "\tstrh r0, [r5, 0xE]\n"
                "\tldrb r1, [r3, 0xA]\n"
                "\tlsls r1, 28\n"
                "\tlsrs r1, 28\n"
                "\tmov r2, r9\n"
                "\tands r1, r2\n"
                "\tldrb r0, [r5, 0x19]\n"
                "\tands r0, r4\n"
                "\torrs r0, r1\n"
                "\tstrb r0, [r5, 0x19]\n"
                "\tldrb r1, [r3, 0xA]\n"
                "\tlsrs r1, 4\n"
                "\tlsls r1, 4\n"
                "\tmovs r2, 0xF\n"
                "\tands r0, r2\n"
                "\torrs r0, r1\n"
                "\tstrb r0, [r5, 0x19]\n"
                "_0815A444:\n"
                "\tadds r3, 0x18\n"
                "\tadds r6, 0x1\n"
                "\tcmp r6, 0x3F\n"
                "\tbls _0815A412\n"
                "\tmov r0, r8\n"
                "\tadd r0, r12\n"
                "\tlsls r0, 2\n"
                "\tldr r1, _0815A480 @ =gMapObjects\n"
                "\tadds r6, r0, r1\n"
                "\tmovs r2, 0x10\n"
                "\tldrsh r0, [r6, r2]\n"
                "\tmovs r2, 0x12\n"
                "\tldrsh r1, [r6, r2]\n"
                "\tbl MapGridGetMetatileBehaviorAt\n"
                "\tstrb r0, [r6, 0x1E]\n"
                "\tldrb r4, [r6, 0x1F]\n"
                "\tmovs r1, 0x10\n"
                "\tldrsh r0, [r6, r1]\n"
                "\tmovs r2, 0x12\n"
                "\tldrsh r1, [r6, r2]\n"
                "\tbl MapGridGetMetatileBehaviorAt\n"
                "\tcmp r4, r0\n"
                "\tbne _0815A488\n"
                "\tldrh r0, [r6, 0x10]\n"
                "\tstrh r0, [r6, 0x14]\n"
                "\tldrh r0, [r6, 0x12]\n"
                "\tb _0815A506\n"
                "\t.align 2, 0\n"
                "_0815A480: .4byte gMapObjects\n"
                "_0815A484: .4byte 0x01000120\n"
                "_0815A488:\n"
                "\tldrb r4, [r6, 0x1F]\n"
                "\tldrh r0, [r6, 0x10]\n"
                "\tsubs r0, 0x1\n"
                "\tlsls r0, 16\n"
                "\tasrs r0, 16\n"
                "\tmovs r2, 0x12\n"
                "\tldrsh r1, [r6, r2]\n"
                "\tbl MapGridGetMetatileBehaviorAt\n"
                "\tcmp r4, r0\n"
                "\tbne _0815A4A8\n"
                "\tldrh r0, [r6, 0x10]\n"
                "\tsubs r0, 0x1\n"
                "\tstrh r0, [r6, 0x14]\n"
                "\tldrh r0, [r6, 0x12]\n"
                "\tb _0815A506\n"
                "_0815A4A8:\n"
                "\tldrb r4, [r6, 0x1F]\n"
                "\tldrh r0, [r6, 0x10]\n"
                "\tadds r0, 0x1\n"
                "\tlsls r0, 16\n"
                "\tasrs r0, 16\n"
                "\tmovs r2, 0x12\n"
                "\tldrsh r1, [r6, r2]\n"
                "\tbl MapGridGetMetatileBehaviorAt\n"
                "\tcmp r4, r0\n"
                "\tbne _0815A4C8\n"
                "\tldrh r0, [r6, 0x10]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r6, 0x14]\n"
                "\tldrh r0, [r6, 0x12]\n"
                "\tb _0815A506\n"
                "_0815A4C8:\n"
                "\tldrb r4, [r6, 0x1F]\n"
                "\tmovs r1, 0x10\n"
                "\tldrsh r0, [r6, r1]\n"
                "\tldrh r1, [r6, 0x12]\n"
                "\tsubs r1, 0x1\n"
                "\tlsls r1, 16\n"
                "\tasrs r1, 16\n"
                "\tbl MapGridGetMetatileBehaviorAt\n"
                "\tcmp r4, r0\n"
                "\tbne _0815A4E8\n"
                "\tldrh r0, [r6, 0x10]\n"
                "\tstrh r0, [r6, 0x14]\n"
                "\tldrh r0, [r6, 0x12]\n"
                "\tsubs r0, 0x1\n"
                "\tb _0815A506\n"
                "_0815A4E8:\n"
                "\tldrb r4, [r6, 0x1F]\n"
                "\tmovs r2, 0x10\n"
                "\tldrsh r0, [r6, r2]\n"
                "\tldrh r1, [r6, 0x12]\n"
                "\tadds r1, 0x1\n"
                "\tlsls r1, 16\n"
                "\tasrs r1, 16\n"
                "\tbl MapGridGetMetatileBehaviorAt\n"
                "\tcmp r4, r0\n"
                "\tbne _0815A508\n"
                "\tldrh r0, [r6, 0x10]\n"
                "\tstrh r0, [r6, 0x14]\n"
                "\tldrh r0, [r6, 0x12]\n"
                "\tadds r0, 0x1\n"
                "_0815A506:\n"
                "\tstrh r0, [r6, 0x16]\n"
                "_0815A508:\n"
                "\tldr r0, [sp, 0xC]\n"
                "\tmov r12, r0\n"
                "\tcmp r0, 0xF\n"
                "\tbhi _0815A512\n"
                "\tb _0815A224\n"
                "_0815A512:\n"
                "\tldr r0, _0815A538 @ =gMapObjects\n"
                "\tldr r1, _0815A53C @ =gSaveBlock1Ptr\n"
                "\tldr r1, [r1]\n"
                "\tmovs r2, 0xD4\n"
                "\tlsls r2, 3\n"
                "\tadds r1, r2\n"
                "\tmovs r2, 0x90\n"
                "\tlsls r2, 1\n"
                "\tbl CpuSet\n"
                "\tadd sp, 0x10\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_0815A538: .4byte gMapObjects\n"
                "_0815A53C: .4byte gSaveBlock1Ptr");
}
#endif // NONMATCHING

void sub_815A540(void)
{
    if (gUnknown_203ADFA == 2)
    {
        s16 x, y;

        PlayerGetDestCoords(&x, &y);
        if (!MetatileBehavior_IsSurfable(MapGridGetMetatileBehaviorAt(x, y)) && TestPlayerAvatarFlags(0x08))
        {
            struct MapObject *mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
            SetPlayerAvatarTransitionFlags(0x01);
            DestroySprite(&gSprites[mapObject->mapobj_unk_1A]);
        }
    }
}
