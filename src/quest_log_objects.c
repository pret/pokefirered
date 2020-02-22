#include "global.h"
#include "quest_log.h"
#include "fieldmap.h"
#include "field_player_avatar.h"
#include "metatile_behavior.h"

void SetQuestLogObjectEventsData(struct QuestLog * questLog)
{
    u32 i;

    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        questLog->unk_008[i].active = gObjectEvents[i].active;
        questLog->unk_008[i].triggerGroundEffectsOnStop = gObjectEvents[i].triggerGroundEffectsOnStop;
        questLog->unk_008[i].disableCoveringGroundEffects = gObjectEvents[i].disableCoveringGroundEffects;
        questLog->unk_008[i].landingJump = gObjectEvents[i].landingJump;
        questLog->unk_008[i].frozen = gObjectEvents[i].frozen;
        questLog->unk_008[i].facingDirectionLocked = gObjectEvents[i].facingDirectionLocked;
        questLog->unk_008[i].disableAnim = gObjectEvents[i].disableAnim;
        questLog->unk_008[i].enableAnim = gObjectEvents[i].enableAnim;
        questLog->unk_008[i].inanimate = gObjectEvents[i].inanimate;
        questLog->unk_008[i].invisible = gObjectEvents[i].invisible;
        questLog->unk_008[i].offScreen = gObjectEvents[i].offScreen;
        questLog->unk_008[i].trackedByCamera = gObjectEvents[i].trackedByCamera;
        questLog->unk_008[i].isPlayer = gObjectEvents[i].isPlayer;
        questLog->unk_008[i].spriteAnimPausedBackup = gObjectEvents[i].spriteAnimPausedBackup;
        questLog->unk_008[i].spriteAffineAnimPausedBackup = gObjectEvents[i].spriteAffineAnimPausedBackup;
        questLog->unk_008[i].disableJumpLandingGroundEffect = gObjectEvents[i].disableJumpLandingGroundEffect;
        questLog->unk_008[i].fixedPriority = gObjectEvents[i].fixedPriority;
        questLog->unk_008[i].mapobj_unk_18 = gObjectEvents[i].facingDirection;
        questLog->unk_008[i].mapobj_unk_0B_0 = gObjectEvents[i].mapobj_unk_0B_0;
        questLog->unk_008[i].elevation = gObjectEvents[i].elevation;
        questLog->unk_008[i].graphicsId = gObjectEvents[i].graphicsId;
        questLog->unk_008[i].animPattern = gObjectEvents[i].animPattern;
        questLog->unk_008[i].trainerType = gObjectEvents[i].trainerType;
        questLog->unk_008[i].localId = gObjectEvents[i].localId;
        questLog->unk_008[i].mapNum = gObjectEvents[i].mapNum;
        questLog->unk_008[i].mapGroup = gObjectEvents[i].mapGroup;
        questLog->unk_008[i].x = gObjectEvents[i].currentCoords.x;
        questLog->unk_008[i].y = gObjectEvents[i].currentCoords.y;
        questLog->unk_008[i].trainerRange_berryTreeId = gObjectEvents[i].trainerRange_berryTreeId;
        questLog->unk_008[i].mapobj_unk_1F = gObjectEvents[i].mapobj_unk_1F;
        questLog->unk_008[i].mapobj_unk_21 = gObjectEvents[i].mapobj_unk_21;
        questLog->unk_008[i].animId = gObjectEvents[i].animId;
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
        gObjectEvents[i].triggerGroundEffectsOnStop = questLogObjectEvents[i].triggerGroundEffectsOnStop;
        gObjectEvents[i].disableCoveringGroundEffects = questLogObjectEvents[i].disableCoveringGroundEffects;
        gObjectEvents[i].landingJump = questLogObjectEvents[i].landingJump;
        gObjectEvents[i].frozen = questLogObjectEvents[i].frozen;
        gObjectEvents[i].facingDirectionLocked = questLogObjectEvents[i].facingDirectionLocked;
        gObjectEvents[i].disableAnim = questLogObjectEvents[i].disableAnim;
        gObjectEvents[i].enableAnim = questLogObjectEvents[i].enableAnim;
        gObjectEvents[i].inanimate = questLogObjectEvents[i].inanimate;
        gObjectEvents[i].invisible = questLogObjectEvents[i].invisible;
        gObjectEvents[i].offScreen = questLogObjectEvents[i].offScreen;
        gObjectEvents[i].trackedByCamera = questLogObjectEvents[i].trackedByCamera;
        gObjectEvents[i].isPlayer = questLogObjectEvents[i].isPlayer;
        gObjectEvents[i].spriteAnimPausedBackup = questLogObjectEvents[i].spriteAnimPausedBackup;
        gObjectEvents[i].spriteAffineAnimPausedBackup = questLogObjectEvents[i].spriteAffineAnimPausedBackup;
        gObjectEvents[i].disableJumpLandingGroundEffect = questLogObjectEvents[i].disableJumpLandingGroundEffect;
        gObjectEvents[i].fixedPriority = questLogObjectEvents[i].fixedPriority;
        gObjectEvents[i].facingDirection = questLogObjectEvents[i].mapobj_unk_18;
        gObjectEvents[i].mapobj_unk_0B_0 = questLogObjectEvents[i].mapobj_unk_0B_0;
        gObjectEvents[i].elevation = questLogObjectEvents[i].elevation;
        gObjectEvents[i].graphicsId = questLogObjectEvents[i].graphicsId;
        gObjectEvents[i].animPattern = questLogObjectEvents[i].animPattern;
        gObjectEvents[i].trainerType = questLogObjectEvents[i].trainerType;
        gObjectEvents[i].localId = questLogObjectEvents[i].localId;
        gObjectEvents[i].mapNum = questLogObjectEvents[i].mapNum;
        gObjectEvents[i].mapGroup = questLogObjectEvents[i].mapGroup;
        gObjectEvents[i].currentCoords.x = questLogObjectEvents[i].x;
        gObjectEvents[i].currentCoords.y = questLogObjectEvents[i].y;
        gObjectEvents[i].trainerRange_berryTreeId = questLogObjectEvents[i].trainerRange_berryTreeId;
        gObjectEvents[i].mapobj_unk_1F = questLogObjectEvents[i].mapobj_unk_1F;
        gObjectEvents[i].mapobj_unk_21 = questLogObjectEvents[i].mapobj_unk_21;
        gObjectEvents[i].animId = questLogObjectEvents[i].animId;

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

        gObjectEvents[i].mapobj_unk_1E = MapGridGetMetatileBehaviorAt(gObjectEvents[i].currentCoords.x, gObjectEvents[i].currentCoords.y);
        if (gObjectEvents[i].mapobj_unk_1F == MapGridGetMetatileBehaviorAt((s16)(gObjectEvents[i].currentCoords.x), (s16)(gObjectEvents[i].currentCoords.y)))
        {
            gObjectEvents[i].previousCoords.x = gObjectEvents[i].currentCoords.x;
            gObjectEvents[i].previousCoords.y = gObjectEvents[i].currentCoords.y;
        }
        else if (gObjectEvents[i].mapobj_unk_1F == MapGridGetMetatileBehaviorAt((s16)(gObjectEvents[i].currentCoords.x - 1), (s16)(gObjectEvents[i].currentCoords.y)))
        {
            gObjectEvents[i].previousCoords.x = gObjectEvents[i].currentCoords.x - 1;
            gObjectEvents[i].previousCoords.y = gObjectEvents[i].currentCoords.y;
        }
        else if (gObjectEvents[i].mapobj_unk_1F == MapGridGetMetatileBehaviorAt((s16)(gObjectEvents[i].currentCoords.x + 1), (s16)(gObjectEvents[i].currentCoords.y)))
        {
            gObjectEvents[i].previousCoords.x = gObjectEvents[i].currentCoords.x + 1;
            gObjectEvents[i].previousCoords.y = gObjectEvents[i].currentCoords.y;
        }
        else if (gObjectEvents[i].mapobj_unk_1F == MapGridGetMetatileBehaviorAt((s16)(gObjectEvents[i].currentCoords.x), (s16)(gObjectEvents[i].currentCoords.y - 1)))
        {
            gObjectEvents[i].previousCoords.x = gObjectEvents[i].currentCoords.x;
            gObjectEvents[i].previousCoords.y = gObjectEvents[i].currentCoords.y - 1;
        }
        else if (gObjectEvents[i].mapobj_unk_1F == MapGridGetMetatileBehaviorAt((s16)(gObjectEvents[i].currentCoords.x), (s16)(gObjectEvents[i].currentCoords.y + 1)))
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
            DestroySprite(&gSprites[objectEvent->mapobj_unk_1A]);
        }
    }
}
