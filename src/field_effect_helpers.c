#include "global.h"
#include "gflib.h"
#include "event_object_movement.h"
#include "field_camera.h"
#include "field_effect.h"
#include "field_effect_helpers.h"
#include "field_weather.h"
#include "fieldmap.h"
#include "metatile_behavior.h"
#include "constants/field_effects.h"
#include "constants/event_objects.h"
#include "constants/songs.h"

#define OBJ_EVENT_PAL_TAG_NONE 0x11FF // duplicate of define in event_object_movement.c

static void UpdateObjectReflectionSprite(struct Sprite *sprite);
static void LoadObjectReflectionPalette(struct ObjectEvent * objectEvent, struct Sprite *sprite);
static void LoadObjectHighBridgeReflectionPalette(struct ObjectEvent * objectEvent, u8 paletteNum);
static void LoadObjectRegularReflectionPalette(struct ObjectEvent * objectEvent, u8 paletteNum);
static void UpdateGrassFieldEffectSubpriority(struct Sprite *sprite, u8 z, u8 offset);
static void FadeFootprintsTireTracks_Step0(struct Sprite *sprite);
static void FadeFootprintsTireTracks_Step1(struct Sprite *sprite);
static void UpdateFeetInFlowingWaterFieldEffect(struct Sprite *sprite);
static void UpdateAshFieldEffect_Step0(struct Sprite *sprite);
static void UpdateAshFieldEffect_Step1(struct Sprite *sprite);
static void UpdateAshFieldEffect_Step2(struct Sprite *sprite);
static void SynchroniseSurfAnim(struct ObjectEvent * objectEvent, struct Sprite *sprite);
static void SynchroniseSurfPosition(struct ObjectEvent * objectEvent, struct Sprite *sprite);
static void CreateBobbingEffect(struct ObjectEvent * objectEvent, struct Sprite *linkedSprite, struct Sprite *sprite);
static void SpriteCB_UnderwaterSurfBlob(struct Sprite *sprite);
static u32 ShowDisguiseFieldEffect(u8 fldEff, u8 templateIdx, u8 paletteNum);

void SetUpReflection(struct ObjectEvent * objectEvent, struct Sprite *sprite, bool8 stillReflection)
{
    struct Sprite *reflectionSprite;

    reflectionSprite = &gSprites[CreateCopySpriteAt(sprite, sprite->x, sprite->y, 0x98)];
    reflectionSprite->callback = UpdateObjectReflectionSprite;
    reflectionSprite->oam.priority = 3;
    reflectionSprite->oam.paletteNum = gReflectionEffectPaletteMap[reflectionSprite->oam.paletteNum];
    reflectionSprite->usingSheet = TRUE;
    reflectionSprite->anims = gDummySpriteAnimTable;
    StartSpriteAnim(reflectionSprite, 0);
    reflectionSprite->affineAnims = gDummySpriteAffineAnimTable;
    reflectionSprite->affineAnimBeginning = TRUE;
    reflectionSprite->subspriteMode = SUBSPRITES_OFF;
    reflectionSprite->data[0] = sprite->data[0];
    reflectionSprite->data[1] = objectEvent->localId;
    reflectionSprite->data[7] = stillReflection;
    LoadObjectReflectionPalette(objectEvent, reflectionSprite);

    if (!stillReflection)
        reflectionSprite->oam.affineMode = ST_OAM_AFFINE_NORMAL;
}

static s16 GetReflectionVerticalOffset(struct ObjectEvent * objectEvent)
{
    return GetObjectEventGraphicsInfo(objectEvent->graphicsId)->height - 2;
}

static void LoadObjectReflectionPalette(struct ObjectEvent * objectEvent, struct Sprite *sprite)
{
    u8 bridgeType;
    u16 bridgeReflectionVerticalOffsets[] = { 12, 28, 44 };
    sprite->data[2] = 0;
    if (!GetObjectEventGraphicsInfo(objectEvent->graphicsId)->disableReflectionPaletteLoad && ((bridgeType = MetatileBehavior_GetBridgeType(objectEvent->previousMetatileBehavior)) || (bridgeType = MetatileBehavior_GetBridgeType(objectEvent->currentMetatileBehavior))))
    {
        sprite->data[2] = bridgeReflectionVerticalOffsets[bridgeType - 1];
        LoadObjectHighBridgeReflectionPalette(objectEvent, sprite->oam.paletteNum);
    }
    else
    {
        LoadObjectRegularReflectionPalette(objectEvent, sprite->oam.paletteNum);
    }
}

static void LoadObjectRegularReflectionPalette(struct ObjectEvent * objectEvent, u8 paletteIndex)
{
    const struct ObjectEventGraphicsInfo * graphicsInfo;

    graphicsInfo = GetObjectEventGraphicsInfo(objectEvent->graphicsId);
    if (graphicsInfo->reflectionPaletteTag != OBJ_EVENT_PAL_TAG_NONE)
    {
        if (graphicsInfo->paletteSlot == PALSLOT_PLAYER)
            LoadPlayerObjectReflectionPalette(graphicsInfo->paletteTag, paletteIndex);
        else if (graphicsInfo->paletteSlot == PALSLOT_NPC_SPECIAL)
            LoadSpecialObjectReflectionPalette(graphicsInfo->paletteTag, paletteIndex);
        else
            PatchObjectPalette(GetObjectPaletteTag(paletteIndex), paletteIndex);
        UpdateSpritePaletteWithWeather(paletteIndex);
    }
}

// When walking on a bridge high above water (Route 120), the reflection is a solid dark blue color.
// This is so the sprite blends in with the dark water metatile underneath the bridge.
static void LoadObjectHighBridgeReflectionPalette(struct ObjectEvent * objectEvent, u8 paletteNum)
{
    const struct ObjectEventGraphicsInfo * graphicsInfo;

    graphicsInfo = GetObjectEventGraphicsInfo(objectEvent->graphicsId);
    if (graphicsInfo->reflectionPaletteTag != OBJ_EVENT_PAL_TAG_NONE)
    {
        PatchObjectPalette(graphicsInfo->reflectionPaletteTag, paletteNum);
        UpdateSpritePaletteWithWeather(paletteNum);
    }
}

static void UpdateObjectReflectionSprite(struct Sprite *reflectionSprite)
{
    struct ObjectEvent * objectEvent;
    struct Sprite *mainSprite;

    objectEvent = &gObjectEvents[reflectionSprite->data[0]];
    mainSprite = &gSprites[objectEvent->spriteId];
    if (!objectEvent->active || !objectEvent->hasReflection || objectEvent->localId != reflectionSprite->data[1])
    {
        reflectionSprite->inUse = FALSE;
    }
    else
    {
        reflectionSprite->oam.paletteNum = gReflectionEffectPaletteMap[mainSprite->oam.paletteNum];
        reflectionSprite->oam.shape = mainSprite->oam.shape;
        reflectionSprite->oam.size = mainSprite->oam.size;
        reflectionSprite->oam.matrixNum = mainSprite->oam.matrixNum | ST_OAM_VFLIP;
        reflectionSprite->oam.tileNum = mainSprite->oam.tileNum;
        reflectionSprite->subspriteTables = mainSprite->subspriteTables;
        reflectionSprite->subspriteTableNum = mainSprite->subspriteTableNum;
        reflectionSprite->invisible = mainSprite->invisible;
        reflectionSprite->x = mainSprite->x;
        // reflectionSprite->data[2] holds an additional vertical offset, used by the high bridges on Route 120
        reflectionSprite->y = mainSprite->y + GetReflectionVerticalOffset(objectEvent) + reflectionSprite->data[2];
        reflectionSprite->centerToCornerVecX = mainSprite->centerToCornerVecX;
        reflectionSprite->centerToCornerVecY = mainSprite->centerToCornerVecY;
        reflectionSprite->x2 = mainSprite->x2;
        reflectionSprite->y2 = -mainSprite->y2;
        reflectionSprite->coordOffsetEnabled = mainSprite->coordOffsetEnabled;

/*
        if (objectEvent->hideReflection == TRUE)
            reflectionSprite->invisible = TRUE;
*/

        // Check if the reflection is not still.
        if (reflectionSprite->data[7] == FALSE)
        {
            // Sets the reflection sprite's rot/scale matrix to the appropriate
            // matrix based on whether or not the main sprite is horizontally flipped.
            // If the sprite is facing to the east, then it is flipped, and its matrixNum is 8.
            reflectionSprite->oam.matrixNum = 0;
            if (mainSprite->oam.matrixNum & ST_OAM_HFLIP)
                reflectionSprite->oam.matrixNum = 1;
        }
    }
}

extern const struct SpriteTemplate * const gFieldEffectObjectTemplatePointers[];

u8 CreateWarpArrowSprite(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_ARROW], 0, 0, 0x52);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->oam.priority = 1;
        sprite->coordOffsetEnabled = TRUE;
        sprite->invisible = TRUE;
    }
    return spriteId;
}

void SetSpriteInvisible(u8 spriteId)
{
    gSprites[spriteId].invisible = TRUE;
}

void ShowWarpArrowSprite(u8 spriteId, u8 direction, s16 x, s16 y)
{
    s16 x2;
    s16 y2;
    struct Sprite *sprite;

    sprite = &gSprites[spriteId];
    if (sprite->invisible || sprite->data[0] != x || sprite->data[1] != y)
    {
        SetSpritePosToMapCoords(x, y, &x2, &y2);
        sprite = &gSprites[spriteId];
        sprite->x = x2 + 8;
        sprite->y = y2 + 8;
        sprite->invisible = FALSE;
        sprite->data[0] = x;
        sprite->data[1] = y;
        StartSpriteAnim(sprite, direction - 1);
    }
}

const u8 gShadowEffectTemplateIds[] = {
    [SHADOW_SIZE_S]  = FLDEFFOBJ_SHADOW_S,
    [SHADOW_SIZE_M]  = FLDEFFOBJ_SHADOW_M,
    [SHADOW_SIZE_L]  = FLDEFFOBJ_SHADOW_L,
    [SHADOW_SIZE_XL] = FLDEFFOBJ_SHADOW_XL
};

const u16 gShadowVerticalOffsets[] = {
    [SHADOW_SIZE_S]  =  4,
    [SHADOW_SIZE_M]  =  4,
    [SHADOW_SIZE_L]  =  4,
    [SHADOW_SIZE_XL] = 16
};

u32 FldEff_Shadow(void)
{
    u8 objectEventId;
    const struct ObjectEventGraphicsInfo * graphicsInfo;
    u8 spriteId;

    objectEventId = GetObjectEventIdByLocalIdAndMap(gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    graphicsInfo = GetObjectEventGraphicsInfo(gObjectEvents[objectEventId].graphicsId);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[gShadowEffectTemplateIds[graphicsInfo->shadowSize]], 0, 0, 0x94);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].coordOffsetEnabled = TRUE;
        gSprites[spriteId].data[0] = gFieldEffectArguments[0];
        gSprites[spriteId].data[1] = gFieldEffectArguments[1];
        gSprites[spriteId].data[2] = gFieldEffectArguments[2];
        gSprites[spriteId].data[3] = (graphicsInfo->height >> 1) - gShadowVerticalOffsets[graphicsInfo->shadowSize];
    }
    return 0;
}

void UpdateShadowFieldEffect(struct Sprite *sprite)
{
    u8 objectEventId;
    struct ObjectEvent * objectEvent;
    struct Sprite *linkedSprite;

    if (TryGetObjectEventIdByLocalIdAndMap(sprite->data[0], sprite->data[1], sprite->data[2], &objectEventId))
    {
        FieldEffectStop(sprite, FLDEFF_SHADOW);
    }
    else
    {
        objectEvent = &gObjectEvents[objectEventId];
        linkedSprite = &gSprites[objectEvent->spriteId];
        sprite->oam.priority = linkedSprite->oam.priority;
        sprite->x = linkedSprite->x;
        sprite->y = linkedSprite->y + sprite->data[3];
        if (!objectEvent->active || !objectEvent->hasShadow
         || MetatileBehavior_IsPokeGrass(objectEvent->currentMetatileBehavior)
         || MetatileBehavior_IsSurfable(objectEvent->currentMetatileBehavior)
         || MetatileBehavior_IsSurfable(objectEvent->previousMetatileBehavior)
         || MetatileBehavior_IsReflective(objectEvent->currentMetatileBehavior)
         || MetatileBehavior_IsReflective(objectEvent->previousMetatileBehavior))
        {
            FieldEffectStop(sprite, FLDEFF_SHADOW);
        }
    }
}

u32 FldEff_TallGrass(void)
{
    s16 x;
    s16 y;
    u8 spriteId;
    struct Sprite *sprite;

    x = gFieldEffectArguments[0];
    y = gFieldEffectArguments[1];
    SetSpritePosToOffsetMapCoords(&x, &y, 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_TALL_GRASS], x, y, 0);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[0] = gFieldEffectArguments[2];
        sprite->data[1] = gFieldEffectArguments[0];
        sprite->data[2] = gFieldEffectArguments[1];
        sprite->data[3] = gFieldEffectArguments[4];
        sprite->data[4] = gFieldEffectArguments[5];
        sprite->data[5] = gFieldEffectArguments[6];
        if (gFieldEffectArguments[7])
        {
            SeekSpriteAnim(sprite, 4);
        }
    }
    return 0;
}

void UpdateTallGrassFieldEffect(struct Sprite *sprite)
{
    u8 mapNum;
    u8 mapGroup;
    u8 metatileBehavior;
    u8 localId;
    u8 objectEventId;
    struct ObjectEvent * objectEvent;

    mapNum = sprite->data[5] >> 8;
    mapGroup = sprite->data[5];
    if (gCamera.active && (gSaveBlock1Ptr->location.mapNum != mapNum || gSaveBlock1Ptr->location.mapGroup != mapGroup))
    {
        sprite->data[1] -= gCamera.x;
        sprite->data[2] -= gCamera.y;
        sprite->data[5] = ((u8)gSaveBlock1Ptr->location.mapNum << 8) | (u8)gSaveBlock1Ptr->location.mapGroup;
    }
    localId = sprite->data[3] >> 8;
    mapNum = sprite->data[3];
    mapGroup = sprite->data[4];
    metatileBehavior = MapGridGetMetatileBehaviorAt(sprite->data[1], sprite->data[2]);
    if (TryGetObjectEventIdByLocalIdAndMap(localId, mapNum, mapGroup, &objectEventId) || !MetatileBehavior_IsTallGrass(metatileBehavior) || (sprite->data[7] && sprite->animEnded))
    {
        FieldEffectStop(sprite, FLDEFF_TALL_GRASS);
    }
    else
    {
        objectEvent = &gObjectEvents[objectEventId];
        if ((objectEvent->currentCoords.x != sprite->data[1] || objectEvent->currentCoords.y != sprite->data[2]) && (objectEvent->previousCoords.x != sprite->data[1] || objectEvent->previousCoords.y != sprite->data[2]))
            sprite->data[7] = TRUE;

        // This variable is misused.
        metatileBehavior = 0;
        if (sprite->animCmdIndex == 0)
            metatileBehavior = 4;

        UpdateObjectEventSpriteInvisibility(sprite, FALSE);
        UpdateGrassFieldEffectSubpriority(sprite, sprite->data[0], metatileBehavior);
    }
}

u32 FldEff_JumpTallGrass(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    SetSpritePosToOffsetMapCoords((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 12);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_JUMP_TALL_GRASS], gFieldEffectArguments[0], gFieldEffectArguments[1], 0);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[0] = gFieldEffectArguments[2];
        sprite->data[1] = 12;
    }
    return 0;
}

u8 FindTallGrassFieldEffectSpriteId(u8 localId, u8 mapNum, u8 mapGroup, s16 x, s16 y)
{
    struct Sprite *sprite;
    u8 i;

    for (i = 0; i < MAX_SPRITES; i++)
    {
        if (gSprites[i].inUse)
        {
            sprite = &gSprites[i];
            if (sprite->callback == UpdateTallGrassFieldEffect && (x == sprite->data[1] && y == sprite->data[2]) && (localId == (sprite->data[3] >> 8) && mapNum == (sprite->data[3] & 0xFF) && mapGroup == sprite->data[4]))
                return i;
        }
    }

    return MAX_SPRITES;
}

u32 FldEff_LongGrass(void)
{
    s16 x;
    s16 y;
    u8 spriteId;
    struct Sprite *sprite;

    x = gFieldEffectArguments[0];
    y = gFieldEffectArguments[1];
    SetSpritePosToOffsetMapCoords(&x, &y, 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_LONG_GRASS], x, y, 0);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = ElevationToPriority(gFieldEffectArguments[2]);
        sprite->data[0] = gFieldEffectArguments[2];
        sprite->data[1] = gFieldEffectArguments[0];
        sprite->data[2] = gFieldEffectArguments[1];
        sprite->data[3] = gFieldEffectArguments[4];
        sprite->data[4] = gFieldEffectArguments[5];
        sprite->data[5] = gFieldEffectArguments[6];
        if (gFieldEffectArguments[7])
        {
            SeekSpriteAnim(sprite, 6);
        }
    }
    return 0;
}

void UpdateLongGrassFieldEffect(struct Sprite *sprite)
{
    u8 mapNum;
    u8 mapGroup;
    u8 metatileBehavior;
    u8 localId;
    u8 objectEventId;
    struct ObjectEvent * objectEvent;

    mapNum = sprite->data[5] >> 8;
    mapGroup = sprite->data[5];
    if (gCamera.active && (gSaveBlock1Ptr->location.mapNum != mapNum || gSaveBlock1Ptr->location.mapGroup != mapGroup))
    {
        sprite->data[1] -= gCamera.x;
        sprite->data[2] -= gCamera.y;
        sprite->data[5] = ((u8)gSaveBlock1Ptr->location.mapNum << 8) | (u8)gSaveBlock1Ptr->location.mapGroup;
    }
    localId = sprite->data[3] >> 8;
    mapNum = sprite->data[3];
    mapGroup = sprite->data[4];
    metatileBehavior = MapGridGetMetatileBehaviorAt(sprite->data[1], sprite->data[2]);
    if (TryGetObjectEventIdByLocalIdAndMap(localId, mapNum, mapGroup, &objectEventId) || !MetatileBehavior_IsLongGrass(metatileBehavior) || (sprite->data[7] && sprite->animEnded))
    {
        FieldEffectStop(sprite, FLDEFF_LONG_GRASS);
    }
    else
    {
        objectEvent = &gObjectEvents[objectEventId];
        if ((objectEvent->currentCoords.x != sprite->data[1] || objectEvent->currentCoords.y != sprite->data[2]) && (objectEvent->previousCoords.x != sprite->data[1] || objectEvent->previousCoords.y != sprite->data[2]))
        {
            sprite->data[7] = TRUE;
        }
        UpdateObjectEventSpriteInvisibility(sprite, FALSE);
        UpdateGrassFieldEffectSubpriority(sprite, sprite->data[0], 0);
    }
}

u32 FldEff_JumpLongGrass(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    SetSpritePosToOffsetMapCoords((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_JUMP_LONG_GRASS], gFieldEffectArguments[0], gFieldEffectArguments[1], 0);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[0] = gFieldEffectArguments[2];
        sprite->data[1] = 18;
    }
    return 0;
}

u32 FldEff_ShortGrass(void)
{
    u8 objectEventId;
    struct ObjectEvent * objectEvent;
    u8 spriteId;
    struct Sprite *sprite;

    objectEventId = GetObjectEventIdByLocalIdAndMap(gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    objectEvent = &gObjectEvents[objectEventId];
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_SHORT_GRASS], 0, 0, 0);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &(gSprites[spriteId]);
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gSprites[objectEvent->spriteId].oam.priority;
        sprite->data[0] = gFieldEffectArguments[0];
        sprite->data[1] = gFieldEffectArguments[1];
        sprite->data[2] = gFieldEffectArguments[2];
        sprite->data[3] = gSprites[objectEvent->spriteId].x;
        sprite->data[4] = gSprites[objectEvent->spriteId].y;
    }
    return 0;
}

void UpdateShortGrassFieldEffect(struct Sprite *sprite)
{
    u8 objectEventId;
    s16 x;
    s16 y;
    const struct ObjectEventGraphicsInfo * graphicsInfo;
    struct Sprite *linkedSprite;

    if (TryGetObjectEventIdByLocalIdAndMap(sprite->data[0], sprite->data[1], sprite->data[2], &objectEventId) || !gObjectEvents[objectEventId].inShortGrass)
    {
        FieldEffectStop(sprite, FLDEFF_SHORT_GRASS);
    }
    else
    {
        graphicsInfo = GetObjectEventGraphicsInfo(gObjectEvents[objectEventId].graphicsId);
        linkedSprite = &gSprites[gObjectEvents[objectEventId].spriteId];
        y = linkedSprite->y;
        x = linkedSprite->x;
        if (x != sprite->data[3] || y != sprite->data[4])
        {
            sprite->data[3] = x;
            sprite->data[4] = y;
            if (sprite->animEnded)
            {
                StartSpriteAnim(sprite, 0);
            }
        }
        sprite->x = x;
        sprite->y = y;
        sprite->y2 = (graphicsInfo->height >> 1) - 8;
        sprite->subpriority = linkedSprite->subpriority - 1;
        sprite->oam.priority = linkedSprite->oam.priority;
        UpdateObjectEventSpriteInvisibility(sprite, linkedSprite->invisible);
    }
}

u32 FldEff_SandFootprints(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    SetSpritePosToOffsetMapCoords((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_SAND_FOOTPRINTS], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[7] = FLDEFF_SAND_FOOTPRINTS;
        StartSpriteAnim(sprite, gFieldEffectArguments[4]);
    }
    return 0;
}

u32 FldEff_DeepSandFootprints(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    SetSpritePosToOffsetMapCoords((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_DEEP_SAND_FOOTPRINTS], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[7] = FLDEFF_DEEP_SAND_FOOTPRINTS;
        StartSpriteAnim(sprite, gFieldEffectArguments[4]);
    }
    return spriteId;
}

u32 FldEff_BikeTireTracks(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    SetSpritePosToOffsetMapCoords((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_BIKE_TIRE_TRACKS], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[7] = FLDEFF_BIKE_TIRE_TRACKS;
        StartSpriteAnim(sprite, gFieldEffectArguments[4]);
    }
    return spriteId;
}

void (*const gFadeFootprintsTireTracksFuncs[])(struct Sprite *sprite) = {
    FadeFootprintsTireTracks_Step0,
    FadeFootprintsTireTracks_Step1
};

void UpdateFootprintsTireTracksFieldEffect(struct Sprite *sprite)
{
    gFadeFootprintsTireTracksFuncs[sprite->data[0]](sprite);
}

static void FadeFootprintsTireTracks_Step0(struct Sprite *sprite)
{
    // Wait 40 frames before the flickering starts.
    if (++sprite->data[1] > 40)
        sprite->data[0] = 1;

    UpdateObjectEventSpriteInvisibility(sprite, FALSE);
}

static void FadeFootprintsTireTracks_Step1(struct Sprite *sprite)
{
    sprite->invisible ^= 1;
    sprite->data[1]++;
    UpdateObjectEventSpriteInvisibility(sprite, sprite->invisible);
    if (sprite->data[1] > 56)
    {
        FieldEffectStop(sprite, sprite->data[7]);
    }
}

u32 FldEff_Splash(void)
{
    u8 objectEventId;
    struct ObjectEvent * objectEvent;
    u8 spriteId;
    struct Sprite *sprite;
    const struct ObjectEventGraphicsInfo * graphicsInfo;
    struct Sprite *linkedSprite;

    objectEventId = GetObjectEventIdByLocalIdAndMap(gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    objectEvent = &gObjectEvents[objectEventId];
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_SPLASH], 0, 0, 0);
    if (spriteId != MAX_SPRITES)
    {
        graphicsInfo = GetObjectEventGraphicsInfo(objectEvent->graphicsId);
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        linkedSprite = &gSprites[objectEvent->spriteId];
        sprite->oam.priority = linkedSprite->oam.priority;
        sprite->data[0] = gFieldEffectArguments[0];
        sprite->data[1] = gFieldEffectArguments[1];
        sprite->data[2] = gFieldEffectArguments[2];
        sprite->y2 = (graphicsInfo->height >> 1) - 4;
        PlaySE(SE_PUDDLE);
    }
    return 0;
}

void UpdateSplashFieldEffect(struct Sprite *sprite)
{
    u8 objectEventId;

    if (sprite->animEnded || TryGetObjectEventIdByLocalIdAndMap(sprite->data[0], sprite->data[1], sprite->data[2], &objectEventId))
    {
        FieldEffectStop(sprite, FLDEFF_SPLASH);
    }
    else
    {
        sprite->x = gSprites[gObjectEvents[objectEventId].spriteId].x;
        sprite->y = gSprites[gObjectEvents[objectEventId].spriteId].y;
        UpdateObjectEventSpriteInvisibility(sprite, FALSE);
    }
}

u32 FldEff_JumpSmallSplash(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    SetSpritePosToOffsetMapCoords((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 12);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_JUMP_SMALL_SPLASH], gFieldEffectArguments[0], gFieldEffectArguments[1], 0);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[0] = gFieldEffectArguments[2];
        sprite->data[1] = FLDEFF_JUMP_SMALL_SPLASH;
    }
    return 0;
}

u32 FldEff_JumpBigSplash(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    SetSpritePosToOffsetMapCoords((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_JUMP_BIG_SPLASH], gFieldEffectArguments[0], gFieldEffectArguments[1], 0);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[0] = gFieldEffectArguments[2];
        sprite->data[1] = FLDEFF_JUMP_BIG_SPLASH;
    }
    return 0;
}

u32 FldEff_FeetInFlowingWater(void)
{
    u8 objectEventId;
    struct ObjectEvent * objectEvent;
    u8 spriteId;
    struct Sprite *sprite;
    const struct ObjectEventGraphicsInfo * graphicsInfo;

    objectEventId = GetObjectEventIdByLocalIdAndMap(gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    objectEvent = &gObjectEvents[objectEventId];
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_SPLASH], 0, 0, 0);
    if (spriteId != MAX_SPRITES)
    {
        graphicsInfo = GetObjectEventGraphicsInfo(objectEvent->graphicsId);
        sprite = &gSprites[spriteId];
        sprite->callback = UpdateFeetInFlowingWaterFieldEffect;
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gSprites[objectEvent->spriteId].oam.priority;
        sprite->data[0] = gFieldEffectArguments[0];
        sprite->data[1] = gFieldEffectArguments[1];
        sprite->data[2] = gFieldEffectArguments[2];
        sprite->data[3] = -1;
        sprite->data[4] = -1;
        sprite->y2 = (graphicsInfo->height >> 1) - 4;
        StartSpriteAnim(sprite, 1);
    }
    return 0;
}

static void UpdateFeetInFlowingWaterFieldEffect(struct Sprite *sprite)
{
    u8 objectEventId;
    struct Sprite *linkedSprite;
    struct ObjectEvent * objectEvent;

    if (TryGetObjectEventIdByLocalIdAndMap(sprite->data[0], sprite->data[1], sprite->data[2], &objectEventId) || !gObjectEvents[objectEventId].inShallowFlowingWater)
    {
        FieldEffectStop(sprite, FLDEFF_FEET_IN_FLOWING_WATER);
    }
    else
    {
        objectEvent = &gObjectEvents[objectEventId];
        linkedSprite = &gSprites[objectEvent->spriteId];
        sprite->x = linkedSprite->x;
        sprite->y = linkedSprite->y;
        sprite->subpriority = linkedSprite->subpriority;
        UpdateObjectEventSpriteInvisibility(sprite, FALSE);
        if (objectEvent->currentCoords.x != sprite->data[3] || objectEvent->currentCoords.y != sprite->data[4])
        {
            sprite->data[3] = objectEvent->currentCoords.x;
            sprite->data[4] = objectEvent->currentCoords.y;
            if (!sprite->invisible)
            {
                PlaySE(SE_PUDDLE);
            }
        }
    }
}

u32 FldEff_Ripple(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_RIPPLE], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[0] = FLDEFF_RIPPLE;
    }
    return 0;
}

u32 FldEff_HotSpringsWater(void)
{
    u8 objectEventId;
    struct ObjectEvent * objectEvent;
    u8 spriteId;
    struct Sprite *sprite;

    objectEventId = GetObjectEventIdByLocalIdAndMap(gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    objectEvent = &gObjectEvents[objectEventId];
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_HOT_SPRINGS_WATER], 0, 0, 0);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gSprites[objectEvent->spriteId].oam.priority;
        sprite->data[0] = gFieldEffectArguments[0];
        sprite->data[1] = gFieldEffectArguments[1];
        sprite->data[2] = gFieldEffectArguments[2];
        sprite->data[3] = gSprites[objectEvent->spriteId].x;
        sprite->data[4] = gSprites[objectEvent->spriteId].y;
    }
    return 0;
}

void UpdateHotSpringsWaterFieldEffect(struct Sprite *sprite)
{
    u8 objectEventId;
    const struct ObjectEventGraphicsInfo * graphicsInfo;
    struct Sprite *linkedSprite;

    if (TryGetObjectEventIdByLocalIdAndMap(sprite->data[0], sprite->data[1], sprite->data[2], &objectEventId) || !gObjectEvents[objectEventId].inHotSprings)
    {
        FieldEffectStop(sprite, FLDEFF_HOT_SPRINGS_WATER);
    }
    else
    {
        graphicsInfo = GetObjectEventGraphicsInfo(gObjectEvents[objectEventId].graphicsId);
        linkedSprite = &gSprites[gObjectEvents[objectEventId].spriteId];
        sprite->x = linkedSprite->x;
        sprite->y = (graphicsInfo->height >> 1) + linkedSprite->y - 8;
        sprite->subpriority = linkedSprite->subpriority - 1;
        UpdateObjectEventSpriteInvisibility(sprite, FALSE);
    }
}

u32 FldEff_UnusedGrass(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    SetSpritePosToOffsetMapCoords((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_UNUSED_GRASS], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[0] = FLDEFF_UNUSED_GRASS;
    }
    return 0;
}

u32 FldEff_UnusedGrass2(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    SetSpritePosToOffsetMapCoords((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_UNUSED_GRASS_2], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[0] = FLDEFF_UNUSED_GRASS_2;
    }
    return 0;
}

u32 FldEff_UnusedSand(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    SetSpritePosToOffsetMapCoords((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_UNUSED_SAND], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[0] = FLDEFF_UNUSED_SAND;
    }
    return 0;
}

u32 FldEff_UnusedWaterSurfacing(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    SetSpritePosToOffsetMapCoords((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_WATER_SURFACING], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[0] = FLDEFF_UNUSED_WATER_SURFACING;
    }
    return 0;
}

void StartAshFieldEffect(s16 x, s16 y, u16 metatileId, s16 d)
{
    gFieldEffectArguments[0] = x;
    gFieldEffectArguments[1] = y;
    gFieldEffectArguments[2] = 0x52;
    gFieldEffectArguments[3] = 1;
    gFieldEffectArguments[4] = metatileId;
    gFieldEffectArguments[5] = d;
    FieldEffectStart(FLDEFF_ASH);
}

u32 FldEff_Ash(void)
{
    s16 x;
    s16 y;
    u8 spriteId;
    struct Sprite *sprite;

    x = gFieldEffectArguments[0];
    y = gFieldEffectArguments[1];
    SetSpritePosToOffsetMapCoords(&x, &y, 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_ASH], x, y, gFieldEffectArguments[2]);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[1] = gFieldEffectArguments[0];
        sprite->data[2] = gFieldEffectArguments[1];
        sprite->data[3] = gFieldEffectArguments[4];
        sprite->data[4] = gFieldEffectArguments[5];
    }
    return 0;
}

void (*const gAshFieldEffectFuncs[])(struct Sprite *sprite) = {
    UpdateAshFieldEffect_Step0,
    UpdateAshFieldEffect_Step1,
    UpdateAshFieldEffect_Step2
};

void UpdateAshFieldEffect(struct Sprite *sprite)
{
    gAshFieldEffectFuncs[sprite->data[0]](sprite);
}

static void UpdateAshFieldEffect_Step0(struct Sprite *sprite)
{
    sprite->invisible = TRUE;
    sprite->animPaused = TRUE;
    if (--sprite->data[4] == 0)
        sprite->data[0] = 1;
}

static void UpdateAshFieldEffect_Step1(struct Sprite *sprite)
{
    sprite->invisible = FALSE;
    sprite->animPaused = FALSE;
    MapGridSetMetatileIdAt(sprite->data[1], sprite->data[2], sprite->data[3]);
    CurrentMapDrawMetatileAt(sprite->data[1], sprite->data[2]);
    gObjectEvents[gPlayerAvatar.objectEventId].triggerGroundEffectsOnMove = TRUE;
    sprite->data[0] = 2;
}

static void UpdateAshFieldEffect_Step2(struct Sprite *sprite)
{
    UpdateObjectEventSpriteInvisibility(sprite, FALSE);
    if (sprite->animEnded)
        FieldEffectStop(sprite, FLDEFF_ASH);
}

// Sprite data for surf blob
#define sBitfield       data[0]
#define sPlayerOffset   data[1]
#define sPlayerObjectId data[2]
#define sBobDirection   data[3]
#define sTimer          data[4]

u32 FldEff_SurfBlob(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    SetSpritePosToOffsetMapCoords((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_SURF_BLOB], gFieldEffectArguments[0], gFieldEffectArguments[1], 0x96);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.paletteNum = 0;
        sprite->sPlayerObjectId = gFieldEffectArguments[2];
        sprite->sBobDirection = 0;
        sprite->data[6] = -1;
        sprite->data[7] = -1;
    }
    FieldEffectActiveListRemove(FLDEFF_SURF_BLOB);
    return spriteId;
}

void SetSurfBlob_BobState(u8 spriteId, u8 bobState)
{
    gSprites[spriteId].sBitfield = (gSprites[spriteId].sBitfield & ~0xF) | (bobState & 0xF);
}

void SetSurfBlob_DontSyncAnim(u8 spriteId, bool8 value)
{
    gSprites[spriteId].sBitfield = (gSprites[spriteId].sBitfield & ~0xF0) | ((value & 0xF) << 4);
}

void SetSurfBlob_PlayerOffset(u8 spriteId, bool8 hasOffset, s16 offset)
{
    gSprites[spriteId].sBitfield = (gSprites[spriteId].sBitfield & ~0xF00) | ((hasOffset & 0xF) << 8);
    gSprites[spriteId].sPlayerOffset = offset;
}

static u8 GetSurfBlob_BobState(struct Sprite *sprite)
{
    return sprite->sBitfield & 0xF;
}

static bool8 GetSurfBlob_DontSyncAnim(struct Sprite *sprite)
{
    return (sprite->sBitfield & 0xF0) >> 4;
}

static bool8 GetSurfBlob_HasPlayerOffset(struct Sprite *sprite)
{
    return (sprite->sBitfield & 0xF00) >> 8;
}

void UpdateSurfBlobFieldEffect(struct Sprite *sprite)
{
    struct ObjectEvent *playerObject;
    struct Sprite *playerSprite;

    playerObject = &gObjectEvents[sprite->sPlayerObjectId];
    playerSprite = &gSprites[playerObject->spriteId];
    SynchroniseSurfAnim(playerObject, sprite);
    SynchroniseSurfPosition(playerObject, sprite);
    CreateBobbingEffect(playerObject, playerSprite, sprite);
    sprite->oam.priority = playerSprite->oam.priority;
}

static void SynchroniseSurfAnim(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    u8 surfBlobDirectionAnims[] = {
        [DIR_NONE] = 0,
        [DIR_SOUTH] = 0,
        [DIR_NORTH] = 1,
        [DIR_WEST] = 2,
        [DIR_EAST] = 3
    };

    if (GetSurfBlob_DontSyncAnim(sprite) == FALSE)
        StartSpriteAnimIfDifferent(sprite, surfBlobDirectionAnims[objectEvent->movementDirection]);
}

void SynchroniseSurfPosition(struct ObjectEvent *playerObject, struct Sprite *surfBlobSprite)
{
    u8 i;
    s16 x = playerObject->currentCoords.x;
    s16 y = playerObject->currentCoords.y;
    s32 yOffset = surfBlobSprite->y2;

    if (yOffset == 0 && (x != surfBlobSprite->data[6] || y != surfBlobSprite->data[7]))
    {
        surfBlobSprite->data[5] = yOffset;
        surfBlobSprite->data[6] = x;
        surfBlobSprite->data[7] = y;
        for (i = DIR_SOUTH; i <= DIR_EAST; i++, x = surfBlobSprite->data[6], y = surfBlobSprite->data[7])
        {
            MoveCoords(i, &x, &y);
            if (MapGridGetElevationAt(x, y) == 3)
            {
                surfBlobSprite->data[5]++;
                break;
            }
        }
    }
}

static void CreateBobbingEffect(struct ObjectEvent *objectEvent, struct Sprite *playerSprite, struct Sprite *surfBlobSprite)
{
    u16 intervals[] = {7, 15};
    u8 bobState = GetSurfBlob_BobState(surfBlobSprite);
    if (bobState != BOB_NONE)
    {
        // the surf blob sprite never bobs since sBobDirection will always be 0

        if (((u16)(++surfBlobSprite->sTimer) & intervals[surfBlobSprite->data[5]]) == 0)
            surfBlobSprite->y2 += surfBlobSprite->sBobDirection;

        if ((surfBlobSprite->sTimer & 0x1F) == 0)
            surfBlobSprite->sBobDirection = -surfBlobSprite->sBobDirection;

        if (bobState != BOB_MON_ONLY)
        {
            if (GetSurfBlob_HasPlayerOffset(surfBlobSprite) == FALSE)
                playerSprite->y2 = surfBlobSprite->y2;
            else
                playerSprite->y2 = surfBlobSprite->sPlayerOffset + surfBlobSprite->y2;

            if (surfBlobSprite->animCmdIndex != 0)
                playerSprite->y2++;

            surfBlobSprite->x = playerSprite->x;
            surfBlobSprite->y = playerSprite->y + 8;
        }
    }
}

#undef sBitfield
#undef sPlayerOffset
#undef sPlayerObjectId
#undef sBobDirection
#undef sTimer

u8 StartUnderwaterSurfBlobBobbing(u8 oldSpriteId)
{
    u8 spriteId;
    struct Sprite *sprite;

    spriteId = CreateSpriteAtEnd(&gDummySpriteTemplate, 0, 0, -1);
    sprite = &gSprites[spriteId];
    sprite->callback = SpriteCB_UnderwaterSurfBlob;
    sprite->invisible = TRUE;
    sprite->data[0] = oldSpriteId;
    sprite->data[1] = 1;
    return spriteId;
}

static void SpriteCB_UnderwaterSurfBlob(struct Sprite *sprite)
{
    struct Sprite *oldSprite;

    oldSprite = &gSprites[sprite->data[0]];
    if (((sprite->data[2]++) & 0x03) == 0)
    {
        oldSprite->y2 += sprite->data[1];
    }
    if ((sprite->data[2] & 0x0F) == 0)
    {
        sprite->data[1] = -sprite->data[1];
    }
}

u32 FldEff_Dust(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    SetSpritePosToOffsetMapCoords((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 12);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_GROUND_IMPACT_DUST], gFieldEffectArguments[0], gFieldEffectArguments[1], 0);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->data[0] = gFieldEffectArguments[2];
        sprite->data[1] = 10;
    }
    return 0;
}

u32 FldEff_SandPile(void)
{
    u8 objectEventId;
    struct ObjectEvent * objectEvent;
    u8 spriteId;
    struct Sprite *sprite;
    const struct ObjectEventGraphicsInfo * graphicsInfo;

    objectEventId = GetObjectEventIdByLocalIdAndMap(gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    objectEvent = &gObjectEvents[objectEventId];
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_SAND_PILE], 0, 0, 0);
    if (spriteId != MAX_SPRITES)
    {
        graphicsInfo = GetObjectEventGraphicsInfo(objectEvent->graphicsId);
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gSprites[objectEvent->spriteId].oam.priority;
        sprite->data[0] = gFieldEffectArguments[0];
        sprite->data[1] = gFieldEffectArguments[1];
        sprite->data[2] = gFieldEffectArguments[2];
        sprite->data[3] = gSprites[objectEvent->spriteId].x;
        sprite->data[4] = gSprites[objectEvent->spriteId].y;
        sprite->y2 = (graphicsInfo->height >> 1) - 2;
        SeekSpriteAnim(sprite, 2);
    }
    return 0;
}

void UpdateSandPileFieldEffect(struct Sprite *sprite)
{
    u8 objectEventId;
    s16 x;
    s16 y;

    if (TryGetObjectEventIdByLocalIdAndMap(sprite->data[0], sprite->data[1], sprite->data[2], &objectEventId) || !gObjectEvents[objectEventId].inSandPile)
    {
        FieldEffectStop(sprite, FLDEFF_SAND_PILE);
    }
    else
    {
        y = gSprites[gObjectEvents[objectEventId].spriteId].y;
        x = gSprites[gObjectEvents[objectEventId].spriteId].x;
        if (x != sprite->data[3] || y != sprite->data[4])
        {
            sprite->data[3] = x;
            sprite->data[4] = y;
            if (sprite->animEnded)
            {
                StartSpriteAnim(sprite, 0);
            }
        }
        sprite->x = x;
        sprite->y = y;
        sprite->subpriority = gSprites[gObjectEvents[objectEventId].spriteId].subpriority;
        UpdateObjectEventSpriteInvisibility(sprite, FALSE);
    }
}

u32 FldEff_Bubbles(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    SetSpritePosToOffsetMapCoords((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 0);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_BUBBLES], gFieldEffectArguments[0], gFieldEffectArguments[1], 0x52);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = 1;
    }
    return 0;
}

void UpdateBubblesFieldEffect(struct Sprite *sprite)
{
    sprite->data[0] += 0x80;
    sprite->data[0] &= 0x100;
    sprite->y -= sprite->data[0] >> 8;
    UpdateObjectEventSpriteInvisibility(sprite, FALSE);
    if (sprite->invisible || sprite->animEnded)
    {
        FieldEffectStop(sprite, FLDEFF_BUBBLES);
    }
}

u32 FldEff_BerryTreeGrowthSparkle(void)
{
    /*u8 spriteId;
    struct Sprite *sprite;

    SetSpritePosToOffsetMapCoords((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 4);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_SPARKLE], gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2]);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->oam.priority = gFieldEffectArguments[3];
        sprite->oam.paletteNum = 5;
        sprite->data[0] = FLDEFF_BERRY_TREE_GROWTH_SPARKLE;
    }*/
    return 0;
}

u32 ShowTreeDisguiseFieldEffect(void)
{
    return ShowDisguiseFieldEffect(FLDEFF_TREE_DISGUISE, FLDEFFOBJ_TREE_DISGUISE, 4);
}

u32 ShowMountainDisguiseFieldEffect(void)
{
    return ShowDisguiseFieldEffect(FLDEFF_MOUNTAIN_DISGUISE, FLDEFFOBJ_MOUNTAIN_DISGUISE, 3);
}

u32 ShowSandDisguiseFieldEffect(void)
{
    return ShowDisguiseFieldEffect(FLDEFF_SAND_DISGUISE, FLDEFFOBJ_SAND_DISGUISE, 2);
}

static u32 ShowDisguiseFieldEffect(u8 fldEff, u8 templateIdx, u8 paletteNum)
{
    u8 spriteId;
    struct Sprite *sprite;

    if (TryGetObjectEventIdByLocalIdAndMap(gFieldEffectArguments[0], gFieldEffectArguments[1], gFieldEffectArguments[2], &spriteId))
    {
        FieldEffectActiveListRemove(fldEff);
        return MAX_SPRITES;
    }
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[templateIdx], 0, 0, 0);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->coordOffsetEnabled++;
        sprite->oam.paletteNum = paletteNum;
        sprite->data[1] = fldEff;
        sprite->data[2] = gFieldEffectArguments[0];
        sprite->data[3] = gFieldEffectArguments[1];
        sprite->data[4] = gFieldEffectArguments[2];
    }
    return spriteId;
}

void UpdateDisguiseFieldEffect(struct Sprite *sprite)
{
    u8 objectEventId;
    const struct ObjectEventGraphicsInfo * graphicsInfo;
    struct Sprite *linkedSprite;

    if (TryGetObjectEventIdByLocalIdAndMap(sprite->data[2], sprite->data[3], sprite->data[4], &objectEventId))
    {
        FieldEffectStop(sprite, sprite->data[1]);
    }

    graphicsInfo = GetObjectEventGraphicsInfo(gObjectEvents[objectEventId].graphicsId);
    linkedSprite = &gSprites[gObjectEvents[objectEventId].spriteId];
    sprite->invisible = linkedSprite->invisible;
    sprite->x = linkedSprite->x;
    sprite->y = (graphicsInfo->height >> 1) + linkedSprite->y - 16;
    sprite->subpriority = linkedSprite->subpriority - 1;
    if (sprite->data[0] == 1)
    {
        sprite->data[0]++;
        StartSpriteAnim(sprite, 1);
    }
    if (sprite->data[0] == 2 && sprite->animEnded)
    {
        sprite->data[7] = 1;
    }
    if (sprite->data[0] == 3)
    {
        FieldEffectStop(sprite, sprite->data[1]);
    }
}

void StartRevealDisguise(struct ObjectEvent * objectEvent)
{
    if (objectEvent->directionSequenceIndex == 1)
    {
        gSprites[objectEvent->fieldEffectSpriteId].data[0]++;
    }
}

bool8 UpdateRevealDisguise(struct ObjectEvent * objectEvent)
{
    struct Sprite *sprite;

    if (objectEvent->directionSequenceIndex == 2)
    {
        return TRUE;
    }
    if (objectEvent->directionSequenceIndex == 0)
    {
        return TRUE;
    }
    sprite = &gSprites[objectEvent->fieldEffectSpriteId];
    if (sprite->data[7])
    {
        objectEvent->directionSequenceIndex = 2;
        sprite->data[0]++;
        return TRUE;
    }
    return FALSE;
}

u32 FldEff_Sparkle(void)
{
    u8 spriteId;

    gFieldEffectArguments[0] += 7;
    gFieldEffectArguments[1] += 7;
    SetSpritePosToOffsetMapCoords((s16 *)&gFieldEffectArguments[0], (s16 *)&gFieldEffectArguments[1], 8, 8);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[FLDEFFOBJ_SMALL_SPARKLE], gFieldEffectArguments[0], gFieldEffectArguments[1], 0x52);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].oam.priority = gFieldEffectArguments[2];
        gSprites[spriteId].coordOffsetEnabled = TRUE;
    }
    return 0;
}

void UpdateSparkleFieldEffect(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        if (sprite->animEnded)
        {
            sprite->invisible = TRUE;
            sprite->data[0]++;
        }

        if (sprite->data[0] == 0)
            return;
    }

    if (++sprite->data[1] > 34)
        FieldEffectStop(sprite, FLDEFF_SPARKLE);
}

void UpdateJumpImpactEffect(struct Sprite *sprite)
{
    if (sprite->animEnded)
    {
        FieldEffectStop(sprite, sprite->data[1]);
    }
    else
    {
        UpdateObjectEventSpriteInvisibility(sprite, FALSE);
        SetObjectSubpriorityByElevation(sprite->data[0], sprite, 0);
    }
}

void WaitFieldEffectSpriteAnim(struct Sprite *sprite)
{
    if (sprite->animEnded)
        FieldEffectStop(sprite, sprite->data[0]);
    else
        UpdateObjectEventSpriteInvisibility(sprite, FALSE);
}

static void UpdateGrassFieldEffectSubpriority(struct Sprite *sprite, u8 z, u8 offset)
{
    u8 i;
    s16 var, xhi, lyhi, yhi, ylo;
    const struct ObjectEventGraphicsInfo * graphicsInfo; // Unused Variable
    struct Sprite *linkedSprite;

    SetObjectSubpriorityByElevation(z, sprite, offset);
    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        struct ObjectEvent * objectEvent = &gObjectEvents[i];
        if (objectEvent->active)
        {
            graphicsInfo = GetObjectEventGraphicsInfo(objectEvent->graphicsId);
            linkedSprite = &gSprites[objectEvent->spriteId];
            xhi = sprite->x + sprite->centerToCornerVecX;
            var = sprite->x - sprite->centerToCornerVecX;
            if (xhi < linkedSprite->x && var > linkedSprite->x)
            {
                lyhi = linkedSprite->y + linkedSprite->centerToCornerVecY;
                var = linkedSprite->y;
                ylo = sprite->y - sprite->centerToCornerVecY;
                yhi = ylo + linkedSprite->centerToCornerVecY;
                if ((lyhi < yhi || lyhi < ylo) && var > yhi && sprite->subpriority <= linkedSprite->subpriority)
                {
                    sprite->subpriority = linkedSprite->subpriority + 2;
                    break;
                }
            }
        }
    }
}
