#include "global.h"
#include "event_data.h"
#include "quest_log.h"
#include "fieldmap.h"
#include "field_player_avatar.h"
#include "metatile_behavior.h"
#include "link.h"
#include "link_rfu.h"

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
        questLog->unk_008[i].mapobj_unk_18 = gMapObjects[i].facingDirection;
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
        gMapObjects[i].facingDirection = questLogMapObjects[i].mapobj_unk_18;
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
                gMapObjects[i].range.as_nybbles.x = templates[j].movementRangeX;
                gMapObjects[i].range.as_nybbles.y = templates[j].movementRangeY;
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

void sub_815A540(void)
{
    if (gUnknown_203ADFA == 2)
    {
        s16 x, y;

        PlayerGetDestCoords(&x, &y);
        if (!MetatileBehavior_IsSurfable(MapGridGetMetatileBehaviorAt(x, y)) && TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
        {
            struct MapObject * mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
            SetPlayerAvatarTransitionFlags(0x01);
            DestroySprite(&gSprites[mapObject->mapobj_unk_1A]);
        }
    }
}
