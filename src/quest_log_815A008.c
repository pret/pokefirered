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

    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        questLog->unk_008[i].active = gObjectEvents[i].active;
        questLog->unk_008[i].mapobj_bit_3 = gObjectEvents[i].mapobj_bit_3;
        questLog->unk_008[i].mapobj_bit_4 = gObjectEvents[i].mapobj_bit_4;
        questLog->unk_008[i].mapobj_bit_5 = gObjectEvents[i].mapobj_bit_5;
        questLog->unk_008[i].mapobj_bit_8 = gObjectEvents[i].mapobj_bit_8;
        questLog->unk_008[i].mapobj_bit_9 = gObjectEvents[i].mapobj_bit_9;
        questLog->unk_008[i].mapobj_bit_10 = gObjectEvents[i].mapobj_bit_10;
        questLog->unk_008[i].mapobj_bit_11 = gObjectEvents[i].mapobj_bit_11;
        questLog->unk_008[i].mapobj_bit_12 = gObjectEvents[i].mapobj_bit_12;
        questLog->unk_008[i].mapobj_bit_13 = gObjectEvents[i].mapobj_bit_13;
        questLog->unk_008[i].mapobj_bit_14 = gObjectEvents[i].mapobj_bit_14;
        questLog->unk_008[i].mapobj_bit_15 = gObjectEvents[i].mapobj_bit_15;
        questLog->unk_008[i].mapobj_bit_16 = gObjectEvents[i].mapobj_bit_16;
        questLog->unk_008[i].mapobj_bit_23 = gObjectEvents[i].mapobj_bit_23;
        questLog->unk_008[i].mapobj_bit_24 = gObjectEvents[i].mapobj_bit_24;
        questLog->unk_008[i].mapobj_bit_25 = gObjectEvents[i].mapobj_bit_25;
        questLog->unk_008[i].mapobj_bit_26 = gObjectEvents[i].mapobj_bit_26;
        questLog->unk_008[i].mapobj_unk_18 = gObjectEvents[i].facingDirection;
        questLog->unk_008[i].mapobj_unk_0B_0 = gObjectEvents[i].mapobj_unk_0B_0;
        questLog->unk_008[i].elevation = gObjectEvents[i].elevation;
        questLog->unk_008[i].graphicsId = gObjectEvents[i].graphicsId;
        questLog->unk_008[i].animPattern = gObjectEvents[i].animPattern;
        questLog->unk_008[i].trainerType = gObjectEvents[i].trainerType;
        questLog->unk_008[i].localId = gObjectEvents[i].localId;
        questLog->unk_008[i].mapNum = gObjectEvents[i].mapNum;
        questLog->unk_008[i].mapGroup = gObjectEvents[i].mapGroup;
        questLog->unk_008[i].x = gObjectEvents[i].coords2.x;
        questLog->unk_008[i].y = gObjectEvents[i].coords2.y;
        questLog->unk_008[i].trainerRange_berryTreeId = gObjectEvents[i].trainerRange_berryTreeId;
        questLog->unk_008[i].mapobj_unk_1F = gObjectEvents[i].mapobj_unk_1F;
        questLog->unk_008[i].mapobj_unk_21 = gObjectEvents[i].mapobj_unk_21;
        questLog->unk_008[i].animId = gObjectEvents[i].animId;
    }
}

void sub_815A1F8(const struct QuestLog * questLog, const struct ObjectEventTemplate * templates)
{
    u32 i, j;
    const struct QuestLogMapObject * questLogObjectEvents = questLog->unk_008;

    CpuFill16(0, gObjectEvents, sizeof(gObjectEvents));

    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        gObjectEvents[i].active = questLogObjectEvents[i].active;
        gObjectEvents[i].mapobj_bit_3 = questLogObjectEvents[i].mapobj_bit_3;
        gObjectEvents[i].mapobj_bit_4 = questLogObjectEvents[i].mapobj_bit_4;
        gObjectEvents[i].mapobj_bit_5 = questLogObjectEvents[i].mapobj_bit_5;
        gObjectEvents[i].mapobj_bit_8 = questLogObjectEvents[i].mapobj_bit_8;
        gObjectEvents[i].mapobj_bit_9 = questLogObjectEvents[i].mapobj_bit_9;
        gObjectEvents[i].mapobj_bit_10 = questLogObjectEvents[i].mapobj_bit_10;
        gObjectEvents[i].mapobj_bit_11 = questLogObjectEvents[i].mapobj_bit_11;
        gObjectEvents[i].mapobj_bit_12 = questLogObjectEvents[i].mapobj_bit_12;
        gObjectEvents[i].mapobj_bit_13 = questLogObjectEvents[i].mapobj_bit_13;
        gObjectEvents[i].mapobj_bit_14 = questLogObjectEvents[i].mapobj_bit_14;
        gObjectEvents[i].mapobj_bit_15 = questLogObjectEvents[i].mapobj_bit_15;
        gObjectEvents[i].mapobj_bit_16 = questLogObjectEvents[i].mapobj_bit_16;
        gObjectEvents[i].mapobj_bit_23 = questLogObjectEvents[i].mapobj_bit_23;
        gObjectEvents[i].mapobj_bit_24 = questLogObjectEvents[i].mapobj_bit_24;
        gObjectEvents[i].mapobj_bit_25 = questLogObjectEvents[i].mapobj_bit_25;
        gObjectEvents[i].mapobj_bit_26 = questLogObjectEvents[i].mapobj_bit_26;
        gObjectEvents[i].facingDirection = questLogObjectEvents[i].mapobj_unk_18;
        gObjectEvents[i].mapobj_unk_0B_0 = questLogObjectEvents[i].mapobj_unk_0B_0;
        gObjectEvents[i].elevation = questLogObjectEvents[i].elevation;
        gObjectEvents[i].graphicsId = questLogObjectEvents[i].graphicsId;
        gObjectEvents[i].animPattern = questLogObjectEvents[i].animPattern;
        gObjectEvents[i].trainerType = questLogObjectEvents[i].trainerType;
        gObjectEvents[i].localId = questLogObjectEvents[i].localId;
        gObjectEvents[i].mapNum = questLogObjectEvents[i].mapNum;
        gObjectEvents[i].mapGroup = questLogObjectEvents[i].mapGroup;
        gObjectEvents[i].coords2.x = questLogObjectEvents[i].x;
        gObjectEvents[i].coords2.y = questLogObjectEvents[i].y;
        gObjectEvents[i].trainerRange_berryTreeId = questLogObjectEvents[i].trainerRange_berryTreeId;
        gObjectEvents[i].mapobj_unk_1F = questLogObjectEvents[i].mapobj_unk_1F;
        gObjectEvents[i].mapobj_unk_21 = questLogObjectEvents[i].mapobj_unk_21;
        gObjectEvents[i].animId = questLogObjectEvents[i].animId;

        for (j = 0; j < 0x40; j++)
        {
            if (gObjectEvents[i].localId == templates[j].localId)
            {
                gObjectEvents[i].coords1.x = templates[j].x + 7;
                gObjectEvents[i].coords1.y = templates[j].y + 7;
                gObjectEvents[i].range.as_nybbles.x = templates[j].movementRangeX;
                gObjectEvents[i].range.as_nybbles.y = templates[j].movementRangeY;
            }
        }

        gObjectEvents[i].mapobj_unk_1E = MapGridGetMetatileBehaviorAt(gObjectEvents[i].coords2.x, gObjectEvents[i].coords2.y);
        if (gObjectEvents[i].mapobj_unk_1F == MapGridGetMetatileBehaviorAt((s16)(gObjectEvents[i].coords2.x), (s16)(gObjectEvents[i].coords2.y)))
        {
            gObjectEvents[i].coords3.x = gObjectEvents[i].coords2.x;
            gObjectEvents[i].coords3.y = gObjectEvents[i].coords2.y;
        }
        else if (gObjectEvents[i].mapobj_unk_1F == MapGridGetMetatileBehaviorAt((s16)(gObjectEvents[i].coords2.x - 1), (s16)(gObjectEvents[i].coords2.y)))
        {
            gObjectEvents[i].coords3.x = gObjectEvents[i].coords2.x - 1;
            gObjectEvents[i].coords3.y = gObjectEvents[i].coords2.y;
        }
        else if (gObjectEvents[i].mapobj_unk_1F == MapGridGetMetatileBehaviorAt((s16)(gObjectEvents[i].coords2.x + 1), (s16)(gObjectEvents[i].coords2.y)))
        {
            gObjectEvents[i].coords3.x = gObjectEvents[i].coords2.x + 1;
            gObjectEvents[i].coords3.y = gObjectEvents[i].coords2.y;
        }
        else if (gObjectEvents[i].mapobj_unk_1F == MapGridGetMetatileBehaviorAt((s16)(gObjectEvents[i].coords2.x), (s16)(gObjectEvents[i].coords2.y - 1)))
        {
            gObjectEvents[i].coords3.x = gObjectEvents[i].coords2.x;
            gObjectEvents[i].coords3.y = gObjectEvents[i].coords2.y - 1;
        }
        else if (gObjectEvents[i].mapobj_unk_1F == MapGridGetMetatileBehaviorAt((s16)(gObjectEvents[i].coords2.x), (s16)(gObjectEvents[i].coords2.y + 1)))
        {
            gObjectEvents[i].coords3.x = gObjectEvents[i].coords2.x;
            gObjectEvents[i].coords3.y = gObjectEvents[i].coords2.y + 1;
        }
    }

    CpuCopy16(gObjectEvents, gSaveBlock1Ptr->mapObjects, sizeof(gObjectEvents));
}

void sub_815A540(void)
{
    if (gUnknown_203ADFA == 2)
    {
        s16 x, y;

        PlayerGetDestCoords(&x, &y);
        if (!MetatileBehavior_IsSurfable(MapGridGetMetatileBehaviorAt(x, y)) && TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
        {
            struct ObjectEvent * mapObject = &gObjectEvents[gPlayerAvatar.mapObjectId];
            SetPlayerAvatarTransitionFlags(0x01);
            DestroySprite(&gSprites[mapObject->mapobj_unk_1A]);
        }
    }
}
