#include "global.h"
#include "event_object_80688E4.h"
#include "event_object_movement.h"
#include "field_effect.h"
#include "field_ground_effect.h"

// This is part of evobjmv.c (see assert statement in DoObjectUnionRoomWarpYDisplacement).

static void DoObjectUnionRoomWarpYDisplacement(struct Sprite * sprite);

bool8 FreezeObjectEvent(struct ObjectEvent * objectEvent)
{
    if (objectEvent->mapobj_bit_6 || objectEvent->mapobj_bit_8)
        return TRUE;
    objectEvent->mapobj_bit_8 = TRUE;
    objectEvent->mapobj_bit_23 = gSprites[objectEvent->spriteId].animPaused;
    objectEvent->mapobj_bit_24 = gSprites[objectEvent->spriteId].affineAnimPaused;
    gSprites[objectEvent->spriteId].animPaused = TRUE;
    gSprites[objectEvent->spriteId].affineAnimPaused = TRUE;
    return FALSE;
}

void FreezeObjectEvents(void)
{
    u8 i;
    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        if (gObjectEvents[i].active && i != gPlayerAvatar.objectEventId)
            FreezeObjectEvent(&gObjectEvents[i]);
    }
}

void FreezeObjectEventsExceptOne(u8 noFreeze)
{
    u8 i;
    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        if (i != noFreeze && gObjectEvents[i].active && i != gPlayerAvatar.objectEventId)
            FreezeObjectEvent(&gObjectEvents[i]);
    }
}

void UnfreezeObjectEvent(struct ObjectEvent * objectEvent)
{
    if (objectEvent->active && objectEvent->mapobj_bit_8)
    {
        objectEvent->mapobj_bit_8 = FALSE;
        gSprites[objectEvent->spriteId].animPaused = objectEvent->mapobj_bit_23;
        gSprites[objectEvent->spriteId].affineAnimPaused = objectEvent->mapobj_bit_24;
    }
}

void UnfreezeObjectEvents(void)
{
    u8 i;
    for (i = 0; i < OBJECT_EVENTS_COUNT; i++)
    {
        if (gObjectEvents[i].active)
            UnfreezeObjectEvent(&gObjectEvents[i]);
    }
}

#define tObjectEventId data[0]
#define tZCoord        data[1]
#define tInvisible     data[2]

#define tDirection data[3]
#define tSpeed     data[4]
#define tStepNo    data[5]

static void little_step(struct Sprite * sprite, u8 direction)
{
    sprite->pos1.x += gUnknown_83A64C8[direction].x;
    sprite->pos1.y += gUnknown_83A64C8[direction].y;
}

static void double_little_steps(struct Sprite * sprite, u8 direction)
{
    sprite->pos1.x += 2 * gUnknown_83A64C8[direction].x;
    sprite->pos1.y += 2 * gUnknown_83A64C8[direction].y;
}

static void triple_little_steps(struct Sprite * sprite, u8 direction)
{
    sprite->pos1.x += 2 * gUnknown_83A64C8[direction].x + gUnknown_83A64C8[direction].x;
    sprite->pos1.y += 2 * gUnknown_83A64C8[direction].y + gUnknown_83A64C8[direction].y;
}

static void quad_little_steps(struct Sprite * sprite, u8 direction)
{
    sprite->pos1.x += 4 * gUnknown_83A64C8[direction].x;
    sprite->pos1.y += 4 * gUnknown_83A64C8[direction].y;
}

static void oct_little_steps(struct Sprite * sprite, u8 direction)
{
    sprite->pos1.x += 8 * gUnknown_83A64C8[direction].x;
    sprite->pos1.y += 8 * gUnknown_83A64C8[direction].y;
}

void oamt_npc_ministep_reset(struct Sprite * sprite, u8 direction, u8 speed)
{
    sprite->tDirection = direction;
    sprite->tSpeed = speed;
    sprite->tStepNo = 0;
}

typedef void (*SpriteStepFunc)(struct Sprite *sprite, u8 direction);

static const SpriteStepFunc sSpeed0[] = {
    little_step,
    little_step,
    little_step,
    little_step,
    little_step,
    little_step,
    little_step,
    little_step,
    little_step,
    little_step,
    little_step,
    little_step,
    little_step,
    little_step,
    little_step,
    little_step
};

static const SpriteStepFunc sSpeed1[] = {
    double_little_steps,
    double_little_steps,
    double_little_steps,
    double_little_steps,
    double_little_steps,
    double_little_steps,
    double_little_steps,
    double_little_steps
};

static const SpriteStepFunc sSpeed2[] = {
    double_little_steps,
    triple_little_steps,
    triple_little_steps,
    double_little_steps,
    triple_little_steps,
    triple_little_steps
};

static const SpriteStepFunc sSpeed3[] = {
    quad_little_steps,
    quad_little_steps,
    quad_little_steps,
    quad_little_steps
};

static const SpriteStepFunc sSpeed4[] = {
    oct_little_steps,
    oct_little_steps
};

static const SpriteStepFunc *const sSpriteStepFuncsBySpeed[] = {
    sSpeed0,
    sSpeed1,
    sSpeed2,
    sSpeed3,
    sSpeed4
};

static const s16 sSpriteStepCountsBySpeed[] = {
    NELEMS(sSpeed0),
    NELEMS(sSpeed1),
    NELEMS(sSpeed2),
    NELEMS(sSpeed3),
    NELEMS(sSpeed4)
};

bool8 obj_npc_ministep(struct Sprite *sprite)
{
    if (sprite->tStepNo >= sSpriteStepCountsBySpeed[sprite->tSpeed])
        return FALSE;

    sSpriteStepFuncsBySpeed[sprite->tSpeed][sprite->tStepNo](sprite, sprite->tDirection);

    sprite->tStepNo++;

    if (sprite->tStepNo < sSpriteStepCountsBySpeed[sprite->tSpeed])
        return FALSE;

    return TRUE;
}

#undef tStepNo
#undef tSpeed
#undef tDirection

#define tDirection data[3]
#define tDelay     data[4]
#define tStepNo    data[5]

void sub_8068BBC(struct Sprite *sprite, u8 direction)
{
    sprite->tDirection = direction;
    sprite->tDelay = 0;
    sprite->tStepNo = 0;
}

bool8 sub_8068BCC(struct Sprite *sprite)
{
    if (!(sprite->tDelay & 1))
    {
        little_step(sprite, sprite->tDirection);
        sprite->tStepNo++;
    }

    sprite->tDelay++;

    if (sprite->tStepNo > 15)
        return TRUE;
    else
        return FALSE;
}

void sub_8068C08(struct Sprite *sprite, u8 direction)
{
    sprite->tDirection = direction;
    sprite->tDelay = 0;
    sprite->tStepNo = 0;
}

bool8 sub_8068C18(struct Sprite *sprite)
{
    if (++sprite->tDelay < 3)
    {
        little_step(sprite, sprite->tDirection);
        sprite->tStepNo++;
    }
    else
        sprite->tDelay = 0;

    if (sprite->tStepNo > 15)
        return TRUE;
    else
        return FALSE;
}

void sub_8068C58(struct Sprite *sprite, u8 direction)
{
    sprite->tDirection = direction;
    sprite->tDelay = 0;
    sprite->tStepNo = 0;
}

bool8 sub_8068C68(struct Sprite *sprite)
{
    if (++sprite->tDelay > 9)
    {
        sprite->tDelay = 0;
        little_step(sprite, sprite->tDirection);
        sprite->tStepNo++;
    }

    if (sprite->tStepNo > 15)
        return TRUE;
    else
        return FALSE;
}

void sub_8068CA4(struct Sprite *sprite, u8 direction)
{
    sprite->tDirection = direction;
    sprite->tDelay = 0;
    sprite->tStepNo = 0;
}

bool8 sub_8068CB4(struct Sprite *sprite)
{
    if ((++sprite->tDelay) & 1)
    {
        little_step(sprite, sprite->tDirection);
        sprite->tStepNo++;
    }
    else
    {
        double_little_steps(sprite, sprite->tDirection);
        sprite->tStepNo += 2;
    }

    if (sprite->tStepNo > 15)
        return TRUE;
    else
        return FALSE;
}

#undef tStepNo
#undef tDelay
#undef tDirection

#define tDirection  data[3]
#define tJumpSpeed  data[4]
#define tJumpHeight data[5]
#define tStepNo     data[6]

static const s8 sJumpHeight12[] = {
    -4,  -6,  -8, -10, -11, -12, -12, -12, -11, -10,  -9,  -8,  -6,  -4,   0,   0
};

static const s8 sJumpHeight6[] = {
    0,  -2,  -3,  -4,  -5,  -6,  -6,  -6,  -5,  -5,  -4,  -3,  -2,   0,   0,   0
};

static const s8 sJumpHeight10[] = {
    -2,  -4,  -6,  -8,  -9, -10, -10, -10,  -9,  -8,  -6,  -5,  -3,  -2,   0,   0
};

static const s8 *const sYDisplacementPtrs[] = {
    sJumpHeight12,
    sJumpHeight6,
    sJumpHeight10
};

static s16 GetJumpYDisplacement(s16 stepno, u8 jumpno)
{
    return sYDisplacementPtrs[jumpno][stepno];
}

void sub_8068D1C(struct Sprite *sprite, u8 direction, u8 speed, u8 height)
{
    sprite->tDirection = direction;
    sprite->tJumpSpeed = speed;
    sprite->tJumpHeight = height;
    sprite->tStepNo = 0;
}

u8 sub_8068D3C(struct Sprite *sprite)
{
    s16 duration[3] = {0x10, 0x10, 0x20};
    u8 shifts[3] = {0, 0, 1};
    u8 jumpPhase = 0;

    if (sprite->tJumpSpeed != 0)
        little_step(sprite, sprite->tDirection);

    sprite->pos2.y = GetJumpYDisplacement(sprite->tStepNo >> shifts[sprite->tJumpSpeed], sprite->tJumpHeight);

    sprite->tStepNo++;

    if (sprite->tStepNo == (duration[sprite->tJumpSpeed] >> 1))
        jumpPhase = 1;

    if (sprite->tStepNo >= duration[sprite->tJumpSpeed])
    {
        sprite->pos2.y = 0;
        jumpPhase = -1;
    }

    return jumpPhase;
}

u8 sub_8068DC4(struct Sprite *sprite)
{
    s16 duration[3] = {0x20, 0x20, 0x40};
    u8 shifts[3] = {1, 1, 2};
    u8 jumpPhase = 0;

    if (sprite->tJumpSpeed != 0 && !(sprite->tStepNo & 1))
        little_step(sprite, sprite->tDirection);

    sprite->pos2.y = GetJumpYDisplacement(sprite->tStepNo >> shifts[sprite->tJumpSpeed], sprite->tJumpHeight);

    sprite->tStepNo++;

    if (sprite->tStepNo == (duration[sprite->tJumpSpeed] >> 1))
        jumpPhase = 1;

    if (sprite->tStepNo >= duration[sprite->tJumpSpeed])
    {
        sprite->pos2.y = 0;
        jumpPhase = -1;
    }

    return jumpPhase;
}

#undef tStepNo
#undef tJumpHeight
#undef tJumpSpeed
#undef tDirection

#define tDelay data[3]

void SetObjectEventStepTimer(struct Sprite *sprite, s16 delay)
{
    sprite->tDelay = delay;
}

bool8 RunObjectEventStepTimer(struct Sprite *sprite)
{
    sprite->tDelay--;

    if (sprite->tDelay == 0)
        return TRUE;
    else
        return FALSE;
}

#undef tDelay

void obj_anim_image_set_and_seek(struct Sprite *sprite, u8 animNum, u8 animCmdIndex)
{
    sprite->animNum = animNum;
    sprite->animPaused = FALSE;
    SeekSpriteAnim(sprite, animCmdIndex);
}

bool8 SpriteAnimEnded(struct Sprite *sprite)
{
    if (sprite->animEnded)
        return TRUE;
    else
        return FALSE;
}

void UpdateObjectEventSpriteVisibility(struct Sprite *sprite, bool8 invisible)
{
    u16 x, y;
    s16 x2, y2;

    sprite->invisible = invisible;

    if (sprite->coordOffsetEnabled)
    {
        x = sprite->pos1.x + sprite->pos2.x + sprite->centerToCornerVecX + gSpriteCoordOffsetX;
        y = sprite->pos1.y + sprite->pos2.y + sprite->centerToCornerVecY + gSpriteCoordOffsetY;
    }
    else
    {
        x = sprite->pos1.x + sprite->pos2.x + sprite->centerToCornerVecX;
        y = sprite->pos1.y + sprite->pos2.y + sprite->centerToCornerVecY;
    }

    x2 = x - (sprite->centerToCornerVecX >> 1);
    y2 = y - (sprite->centerToCornerVecY >> 1);

    if ((s16)x > 255 || x2 < -16)
        sprite->invisible = TRUE;
    if ((s16)y > 175 || y2 < -16)
        sprite->invisible = TRUE;
}

void UpdateObjectEventSpriteSubpriorityAndVisibility(struct Sprite *sprite)
{
    DoObjectUnionRoomWarpYDisplacement(sprite);
    SetObjectSubpriorityByZCoord(sprite->tZCoord, sprite, 1);
    UpdateObjectEventSpriteVisibility(sprite, sprite->tInvisible);
}

void sub_8068FD0(void)
{
    s32 i;
    for (i = 0; i < MAX_SPRITES; i++)
    {
        struct Sprite *sprite = &gSprites[i];
        if (sprite->inUse && sprite->callback == UpdateObjectEventSpriteSubpriorityAndVisibility)
        {
            DestroySprite(sprite);
        }
    }
}

#define tUnionRoomWarpAnimNo    data[3]
#define tUnionRoomWarpAnimState data[4]

static int GetObjectEventSpriteId(u8 objectEventId)
{
    int i;
    for (i = 0; i < MAX_SPRITES; i++)
    {
        struct Sprite *sprite = &gSprites[i];
        if (sprite->inUse && sprite->callback == UpdateObjectEventSpriteSubpriorityAndVisibility && (u8)sprite->tObjectEventId == objectEventId)
        {
            return i;
        }
    }
    return MAX_SPRITES;
}

void TurnObjectEvent(u8 objectEventId, u8 direction)
{
    u8 animNum;
    u8 spriteId = GetObjectEventSpriteId(objectEventId);
    if (spriteId != MAX_SPRITES)
    {
        struct Sprite *sprite = &gSprites[spriteId];
        StartSpriteAnim(sprite, ObjectEventDirectionToImageAnimId(direction));
    }
}

void RfuUnionObjectSetFacingDirection(u8 objectEventId, u8 direction)
{
    u8 animNum;
    int spriteId = GetObjectEventSpriteId(objectEventId);
    u16 baseBlock;
    if (spriteId != MAX_SPRITES)
    {
        struct Sprite *sprite = &gSprites[spriteId];
        const struct ObjectEventGraphicsInfo * info = GetObjectEventGraphicsInfo(direction);
        baseBlock = sprite->oam.tileNum;
        sprite->oam = *info->oam;
        sprite->oam.tileNum = baseBlock;
        sprite->oam.paletteNum = info->paletteSlot;
        sprite->images = info->images;
        if (info->subspriteTables == NULL)
        {
            sprite->subspriteTables = NULL;
            sprite->subspriteTableNum = 0;
            sprite->subspriteMode = SUBSPRITES_OFF;
        }
        else
        {
            SetSubspriteTables(sprite, info->subspriteTables);
            sprite->subspriteMode = SUBSPRITES_IGNORE_PRIORITY;
        }
        StartSpriteAnim(sprite, 0);
    }
}

void RfuUnionObjectToggleInvisibility(u8 objectEventId, bool32 arg1)
{
    u8 spriteId = GetObjectEventSpriteId(objectEventId);
    if (spriteId != MAX_SPRITES)
    {
        if (arg1)
            gSprites[spriteId].tInvisible = TRUE;
        else
            gSprites[spriteId].tInvisible = FALSE;
    }
}

bool32 RfuUnionObjectIsInvisible(u8 objectEventId)
{
    u8 spriteId = GetObjectEventSpriteId(objectEventId);
    if (spriteId == MAX_SPRITES)
        return FALSE;
    return gSprites[spriteId].tInvisible == TRUE;
}

void RfuUnionObjectStartWarp(u8 objectEventId, u8 direction)
{
    u8 spriteId = GetObjectEventSpriteId(objectEventId);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].tUnionRoomWarpAnimNo = direction;
        gSprites[spriteId].tUnionRoomWarpAnimState = 0;
    }
}

static void DoObjectUnionRoomWarpYDisplacementUpwards(struct Sprite * sprite)
{
    switch (sprite->tUnionRoomWarpAnimState)
    {
    case 0:
        sprite->pos2.y = 0;
        sprite->tUnionRoomWarpAnimState++;
        // fallthrough
    case 1:
        if ((sprite->pos2.y -= 8) == -160)
        {
            sprite->pos2.y = 0;
            sprite->tInvisible = 1;
            sprite->tUnionRoomWarpAnimNo = 0;
            sprite->tUnionRoomWarpAnimState = 0;
        }
        break;
    }
}

static void DoObjectUnionRoomWarpYDisplacementDownwards(struct Sprite * sprite)
{
    switch (sprite->tUnionRoomWarpAnimState)
    {
    case 0:
        sprite->pos2.y = -160;
        sprite->tUnionRoomWarpAnimState++;
        // fallthrough
    case 1:
        if ((sprite->pos2.y += 8) == 0)
        {
            sprite->tUnionRoomWarpAnimNo = 0;
            sprite->tUnionRoomWarpAnimState = 0;
        }
        break;
    }
}

static void DoObjectUnionRoomWarpYDisplacement(struct Sprite * sprite)
{
    switch (sprite->tUnionRoomWarpAnimNo)
    {
    case 0:
        break;
    case 1:
        DoObjectUnionRoomWarpYDisplacementDownwards(sprite);
        break;
    case 2:
        DoObjectUnionRoomWarpYDisplacementUpwards(sprite);
        break;
    default:
        sprite->tUnionRoomWarpAnimNo = 0;
        AGB_ASSERT_EX(0, ABSPATH("evobjmv.c"), 13331);
    }
}

bool32 RfuUnionObjectIsWarping(u8 objectEventId)
{
    u8 spriteId = GetObjectEventSpriteId(objectEventId);
    if (spriteId == MAX_SPRITES)
        return FALSE;
    if (gSprites[spriteId].tUnionRoomWarpAnimNo)
        return TRUE;
    else
        return FALSE;
}

#undef tUnionRoomWarpAnimState
#undef tUnionRoomWarpAnimNo
#undef tInvisible
#undef tZCoord
#undef tObjectEventId

u32 oe_exec_and_other_stuff(u8 fieldEffectId, struct ObjectEvent * objectEvent)
{
    ObjectEventGetLocalIdAndMap(objectEvent, (u8 *)&gFieldEffectArguments[0], (u8 *)&gFieldEffectArguments[1], (u8 *)&gFieldEffectArguments[2]);
    return FieldEffectStart(fieldEffectId);
}

void DoShadowFieldEffect(struct ObjectEvent *objectEvent)
{
    if (!objectEvent->hasShadow)
    {
        objectEvent->hasShadow = TRUE;
        oe_exec_and_other_stuff(FLDEFF_SHADOW, objectEvent);
    }
}

void DoRippleFieldEffect(struct ObjectEvent *objectEvent, struct Sprite *sprite)
{
    const struct ObjectEventGraphicsInfo *graphicsInfo = GetObjectEventGraphicsInfo(objectEvent->graphicsId);
    gFieldEffectArguments[0] = sprite->pos1.x;
    gFieldEffectArguments[1] = sprite->pos1.y + (graphicsInfo->height >> 1) - 2;
    gFieldEffectArguments[2] = 151;
    gFieldEffectArguments[3] = 3;
    FieldEffectStart(FLDEFF_RIPPLE);
}
