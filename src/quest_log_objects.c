#include "global.h"
#include "event_data.h"
#include "quest_log.h"
#include "fieldmap.h"
#include "field_player_avatar.h"
#include "metatile_behavior.h"
#include "link.h"
#include "link_rfu.h"

void SetQuestLogObjectEventsData(struct QuestLog * questLog)
{
    u32 i;

    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        questLog->unk_008[i].active = gObjectEvents[i].active;
        questLog->unk_008[i].mapobj_bit_3 = gObjectEvents[i].triggerGroundEffectsOnStop;
        questLog->unk_008[i].mapobj_bit_4 = gObjectEvents[i].disableCoveringGroundEffects;
        questLog->unk_008[i].mapobj_bit_5 = gObjectEvents[i].landingJump;
        questLog->unk_008[i].mapobj_bit_8 = gObjectEvents[i].frozen;
        questLog->unk_008[i].mapobj_bit_9 = gObjectEvents[i].facingDirectionLocked;
        questLog->unk_008[i].mapobj_bit_10 = gObjectEvents[i].disableAnim;
        questLog->unk_008[i].mapobj_bit_11 = gObjectEvents[i].enableAnim;
        questLog->unk_008[i].mapobj_bit_12 = gObjectEvents[i].inanimate;
        questLog->unk_008[i].mapobj_bit_13 = gObjectEvents[i].invisible;
        questLog->unk_008[i].mapobj_bit_14 = gObjectEvents[i].offScreen;
        questLog->unk_008[i].mapobj_bit_15 = gObjectEvents[i].trackedByCamera;
        questLog->unk_008[i].mapobj_bit_16 = gObjectEvents[i].isPlayer;
        questLog->unk_008[i].mapobj_bit_23 = gObjectEvents[i].spriteAnimPausedBackup;
        questLog->unk_008[i].mapobj_bit_24 = gObjectEvents[i].spriteAffineAnimPausedBackup;
        questLog->unk_008[i].mapobj_bit_25 = gObjectEvents[i].disableJumpLandingGroundEffect;
        questLog->unk_008[i].mapobj_bit_26 = gObjectEvents[i].fixedPriority;
        questLog->unk_008[i].mapobj_unk_18 = gObjectEvents[i].facingDirection;
        questLog->unk_008[i].mapobj_unk_0B_0 = gObjectEvents[i].currentElevation;
        questLog->unk_008[i].elevation = gObjectEvents[i].previousElevation;
        questLog->unk_008[i].graphicsId = gObjectEvents[i].graphicsId;
        questLog->unk_008[i].animPattern = gObjectEvents[i].movementType;
        questLog->unk_008[i].trainerType = gObjectEvents[i].trainerType;
        questLog->unk_008[i].localId = gObjectEvents[i].localId;
        questLog->unk_008[i].mapNum = gObjectEvents[i].mapNum;
        questLog->unk_008[i].mapGroup = gObjectEvents[i].mapGroup;
        questLog->unk_008[i].x = gObjectEvents[i].currentCoords.x;
        questLog->unk_008[i].y = gObjectEvents[i].currentCoords.y;
        questLog->unk_008[i].trainerRange_berryTreeId = gObjectEvents[i].trainerRange_berryTreeId;
        questLog->unk_008[i].mapobj_unk_1F = gObjectEvents[i].previousMetatileBehavior;
        questLog->unk_008[i].mapobj_unk_21 = gObjectEvents[i].directionSequenceIndex;
        questLog->unk_008[i].animId = gObjectEvents[i].playerCopyableMovement;
    }
}

void sub_815A1F8(const struct QuestLog * questLog, const struct ObjectEventTemplate * templates)
{
    u32 i, j;
    const struct QuestLogObjectEvent * questLogObjectEvents = questLog->unk_008;

    CpuFill16(0, gObjectEvents, sizeof(gObjectEvents));

    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        gObjectEvents[i].active = questLogObjectEvents[i].active;
        gObjectEvents[i].triggerGroundEffectsOnStop = questLogObjectEvents[i].mapobj_bit_3;
        gObjectEvents[i].disableCoveringGroundEffects = questLogObjectEvents[i].mapobj_bit_4;
        gObjectEvents[i].landingJump = questLogObjectEvents[i].mapobj_bit_5;
        gObjectEvents[i].frozen = questLogObjectEvents[i].mapobj_bit_8;
        gObjectEvents[i].facingDirectionLocked = questLogObjectEvents[i].mapobj_bit_9;
        gObjectEvents[i].disableAnim = questLogObjectEvents[i].mapobj_bit_10;
        gObjectEvents[i].enableAnim = questLogObjectEvents[i].mapobj_bit_11;
        gObjectEvents[i].inanimate = questLogObjectEvents[i].mapobj_bit_12;
        gObjectEvents[i].invisible = questLogObjectEvents[i].mapobj_bit_13;
        gObjectEvents[i].offScreen = questLogObjectEvents[i].mapobj_bit_14;
        gObjectEvents[i].trackedByCamera = questLogObjectEvents[i].mapobj_bit_15;
        gObjectEvents[i].isPlayer = questLogObjectEvents[i].mapobj_bit_16;
        gObjectEvents[i].spriteAnimPausedBackup = questLogObjectEvents[i].mapobj_bit_23;
        gObjectEvents[i].spriteAffineAnimPausedBackup = questLogObjectEvents[i].mapobj_bit_24;
        gObjectEvents[i].disableJumpLandingGroundEffect = questLogObjectEvents[i].mapobj_bit_25;
        gObjectEvents[i].fixedPriority = questLogObjectEvents[i].mapobj_bit_26;
        gObjectEvents[i].facingDirection = questLogObjectEvents[i].mapobj_unk_18;
        gObjectEvents[i].currentElevation = questLogObjectEvents[i].mapobj_unk_0B_0;
        gObjectEvents[i].previousElevation = questLogObjectEvents[i].elevation;
        gObjectEvents[i].graphicsId = questLogObjectEvents[i].graphicsId;
        gObjectEvents[i].movementType = questLogObjectEvents[i].animPattern;
        gObjectEvents[i].trainerType = questLogObjectEvents[i].trainerType;
        gObjectEvents[i].localId = questLogObjectEvents[i].localId;
        gObjectEvents[i].mapNum = questLogObjectEvents[i].mapNum;
        gObjectEvents[i].mapGroup = questLogObjectEvents[i].mapGroup;
        gObjectEvents[i].currentCoords.x = questLogObjectEvents[i].x;
        gObjectEvents[i].currentCoords.y = questLogObjectEvents[i].y;
        gObjectEvents[i].trainerRange_berryTreeId = questLogObjectEvents[i].trainerRange_berryTreeId;
        gObjectEvents[i].previousMetatileBehavior = questLogObjectEvents[i].mapobj_unk_1F;
        gObjectEvents[i].directionSequenceIndex = questLogObjectEvents[i].mapobj_unk_21;
        gObjectEvents[i].playerCopyableMovement = questLogObjectEvents[i].animId;

        for (j = 0; j < 0x40; j++)
        {
            if (gObjectEvents[i].localId == templates[j].localId)
            {
                gObjectEvents[i].initialCoords.x = templates[j].x + 7;
                gObjectEvents[i].initialCoords.y = templates[j].y + 7;
                gObjectEvents[i].range.as_nybbles.x = templates[j].movementRangeX;
                gObjectEvents[i].range.as_nybbles.y = templates[j].movementRangeY;
            }
        }

        gObjectEvents[i].currentMetatileBehavior = MapGridGetMetatileBehaviorAt(gObjectEvents[i].currentCoords.x, gObjectEvents[i].currentCoords.y);
        if (gObjectEvents[i].previousMetatileBehavior == MapGridGetMetatileBehaviorAt((s16)(gObjectEvents[i].currentCoords.x), (s16)(gObjectEvents[i].currentCoords.y)))
        {
            gObjectEvents[i].previousCoords.x = gObjectEvents[i].currentCoords.x;
            gObjectEvents[i].previousCoords.y = gObjectEvents[i].currentCoords.y;
        }
        else if (gObjectEvents[i].previousMetatileBehavior == MapGridGetMetatileBehaviorAt((s16)(gObjectEvents[i].currentCoords.x - 1), (s16)(gObjectEvents[i].currentCoords.y)))
        {
            gObjectEvents[i].previousCoords.x = gObjectEvents[i].currentCoords.x - 1;
            gObjectEvents[i].previousCoords.y = gObjectEvents[i].currentCoords.y;
        }
        else if (gObjectEvents[i].previousMetatileBehavior == MapGridGetMetatileBehaviorAt((s16)(gObjectEvents[i].currentCoords.x + 1), (s16)(gObjectEvents[i].currentCoords.y)))
        {
            gObjectEvents[i].previousCoords.x = gObjectEvents[i].currentCoords.x + 1;
            gObjectEvents[i].previousCoords.y = gObjectEvents[i].currentCoords.y;
        }
        else if (gObjectEvents[i].previousMetatileBehavior == MapGridGetMetatileBehaviorAt((s16)(gObjectEvents[i].currentCoords.x), (s16)(gObjectEvents[i].currentCoords.y - 1)))
        {
            gObjectEvents[i].previousCoords.x = gObjectEvents[i].currentCoords.x;
            gObjectEvents[i].previousCoords.y = gObjectEvents[i].currentCoords.y - 1;
        }
        else if (gObjectEvents[i].previousMetatileBehavior == MapGridGetMetatileBehaviorAt((s16)(gObjectEvents[i].currentCoords.x), (s16)(gObjectEvents[i].currentCoords.y + 1)))
        {
            gObjectEvents[i].previousCoords.x = gObjectEvents[i].currentCoords.x;
            gObjectEvents[i].previousCoords.y = gObjectEvents[i].currentCoords.y + 1;
        }
    }

    CpuCopy16(gObjectEvents, gSaveBlock1Ptr->objectEvents, sizeof(gObjectEvents));
}

void sub_815A540(void)
{
    if (gQuestLogState == 2)
    {
        s16 x, y;

        PlayerGetDestCoords(&x, &y);
        if (!MetatileBehavior_IsSurfable(MapGridGetMetatileBehaviorAt(x, y)) && TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
        {
            struct ObjectEvent * objectEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
            SetPlayerAvatarTransitionFlags(0x01);
            DestroySprite(&gSprites[objectEvent->fieldEffectSpriteId]);
        }
    }
}
