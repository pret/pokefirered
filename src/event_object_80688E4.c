#include "global.h"
#include "event_object_80688E4.h"
#include "event_object_movement.h"
#include "field_effect.h"
#include "field_ground_effect.h"

void sub_8069248(struct Sprite * sprite);

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

void little_step(struct Sprite * sprite, u8 direction)
{
    sprite->pos1.x += gUnknown_83A64C8[direction].x;
    sprite->pos1.y += gUnknown_83A64C8[direction].y;
}

void double_little_steps(struct Sprite * sprite, u8 direction)
{
    sprite->pos1.x += 2 * gUnknown_83A64C8[direction].x;
    sprite->pos1.y += 2 * gUnknown_83A64C8[direction].y;
}

void triple_little_steps(struct Sprite * sprite, u8 direction)
{
    sprite->pos1.x += 2 * gUnknown_83A64C8[direction].x + gUnknown_83A64C8[direction].x;
    sprite->pos1.y += 2 * gUnknown_83A64C8[direction].y + gUnknown_83A64C8[direction].y;
}

void quad_little_steps(struct Sprite * sprite, u8 direction)
{
    sprite->pos1.x += 4 * gUnknown_83A64C8[direction].x;
    sprite->pos1.y += 4 * gUnknown_83A64C8[direction].y;
}

void oct_little_steps(struct Sprite * sprite, u8 direction)
{
    sprite->pos1.x += 8 * gUnknown_83A64C8[direction].x;
    sprite->pos1.y += 8 * gUnknown_83A64C8[direction].y;
}

void oamt_npc_ministep_reset(struct Sprite * sprite, u8 direction, u8 speed)
{
    sprite->data[3] = direction;
    sprite->data[4] = speed;
    sprite->data[5] = 0;
}


typedef void (*SpriteStepFunc)(struct Sprite *sprite, u8 direction);

static const SpriteStepFunc gUnknown_83A710C[] = {
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

static const SpriteStepFunc gUnknown_83A714C[] = {
    double_little_steps,
    double_little_steps,
    double_little_steps,
    double_little_steps,
    double_little_steps,
    double_little_steps,
    double_little_steps,
    double_little_steps
};

static const SpriteStepFunc gUnknown_83A716C[] = {
    double_little_steps,
    triple_little_steps,
    triple_little_steps,
    double_little_steps,
    triple_little_steps,
    triple_little_steps
};

static const SpriteStepFunc gUnknown_83A7184[] = {
    quad_little_steps,
    quad_little_steps,
    quad_little_steps,
    quad_little_steps
};

static const SpriteStepFunc gUnknown_83A7194[] = {
    oct_little_steps,
    oct_little_steps
};

static const SpriteStepFunc *const gUnknown_83A719C[] = {
    gUnknown_83A710C,
    gUnknown_83A714C,
    gUnknown_83A716C,
    gUnknown_83A7184,
    gUnknown_83A7194
};

static const s16 gUnknown_83A71B0[] = {
    16, 8, 6, 4, 2
};

bool8 obj_npc_ministep(struct Sprite *sprite)
{
    if (sprite->data[5] >= gUnknown_83A71B0[sprite->data[4]])
        return FALSE;

    gUnknown_83A719C[sprite->data[4]][sprite->data[5]](sprite, sprite->data[3]);

    sprite->data[5]++;

    if (sprite->data[5] < gUnknown_83A71B0[sprite->data[4]])
        return FALSE;

    return TRUE;
}

void sub_8068BBC(struct Sprite *sprite, u8 direction)
{
    sprite->data[3] = direction;
    sprite->data[4] = 0;
    sprite->data[5] = 0;
}

bool8 sub_8068BCC(struct Sprite *sprite)
{
    if (!(sprite->data[4] & 1))
    {
        little_step(sprite, sprite->data[3]);
        sprite->data[5]++;
    }

    sprite->data[4]++;

    if (sprite->data[5] > 15)
        return TRUE;
    else
        return FALSE;
}

void sub_8068C08(struct Sprite *sprite, u8 direction)
{
    sprite->data[3] = direction;
    sprite->data[4] = 0;
    sprite->data[5] = 0;
}

bool8 sub_8068C18(struct Sprite *sprite)
{
    if (++sprite->data[4] < 3)
    {
        little_step(sprite, sprite->data[3]);
        sprite->data[5]++;
    }
    else
        sprite->data[4] = 0;

    if (sprite->data[5] > 15)
        return TRUE;
    else
        return FALSE;
}

void sub_8068C58(struct Sprite *sprite, u8 direction)
{
    sprite->data[3] = direction;
    sprite->data[4] = 0;
    sprite->data[5] = 0;
}

bool8 sub_8068C68(struct Sprite *sprite)
{
    if (++sprite->data[4] > 9)
    {
        sprite->data[4] = 0;
        little_step(sprite, sprite->data[3]);
        sprite->data[5]++;
    }

    if (sprite->data[5] > 15)
        return TRUE;
    else
        return FALSE;
}

void sub_8068CA4(struct Sprite *sprite, u8 direction)
{
    sprite->data[3] = direction;
    sprite->data[4] = 0;
    sprite->data[5] = 0;
}

bool8 sub_8068CB4(struct Sprite *sprite)
{
    if ((++sprite->data[4]) & 1)
    {
        little_step(sprite, sprite->data[3]);
        sprite->data[5]++;
    }
    else
    {
        double_little_steps(sprite, sprite->data[3]);
        sprite->data[5] += 2;
    }

    if (sprite->data[5] > 15)
        return TRUE;
    else
        return FALSE;
}

static const s8 gUnknown_83A71BA[] = {
    -4,  -6,  -8, -10, -11, -12, -12, -12, -11, -10,  -9,  -8,  -6,  -4,   0,   0
};

static const s8 gUnknown_83A71CA[] = {
    0,  -2,  -3,  -4,  -5,  -6,  -6,  -6,  -5,  -5,  -4,  -3,  -2,   0,   0,   0
};

static const s8 gUnknown_83A71DA[] = {
    -2,  -4,  -6,  -8,  -9, -10, -10, -10,  -9,  -8,  -6,  -5,  -3,  -2,   0,   0
};

static const s8 *const gUnknown_83A71EC[] = {
    gUnknown_83A71BA,
    gUnknown_83A71CA,
    gUnknown_83A71DA
};

s16 sub_8068D00(s16 a1, u8 a2)
{
    return gUnknown_83A71EC[a2][a1];
}

void sub_8068D1C(struct Sprite *sprite, u8 a2, u8 a3, u8 a4)
{
    sprite->data[3] = a2;
    sprite->data[4] = a3;
    sprite->data[5] = a4;
    sprite->data[6] = 0;
}

u8 sub_8068D3C(struct Sprite *sprite)
{
    s16 v5[3] = {0x10, 0x10, 0x20};
    u8 v6[3] = {0, 0, 1};
    u8 v2 = 0;

    if (sprite->data[4])
        little_step(sprite, sprite->data[3]);

    sprite->pos2.y = sub_8068D00(sprite->data[6] >> v6[sprite->data[4]], sprite->data[5]);

    sprite->data[6]++;

    if (sprite->data[6] == (v5[sprite->data[4]] >> 1))
        v2 = 1;

    if (sprite->data[6] >= v5[sprite->data[4]])
    {
        sprite->pos2.y = 0;
        v2 = -1;
    }

    return v2;
}

u8 sub_8068DC4(struct Sprite *sprite)
{
    s16 v5[3] = {0x20, 0x20, 0x40};
    u8 v6[3] = {1, 1, 2};
    u8 v2 = 0;

    if (sprite->data[4] && !(sprite->data[6] & 1))
        little_step(sprite, sprite->data[3]);

    sprite->pos2.y = sub_8068D00(sprite->data[6] >> v6[sprite->data[4]], sprite->data[5]);

    sprite->data[6]++;

    if (sprite->data[6] == (v5[sprite->data[4]] >> 1))
        v2 = 1;

    if (sprite->data[6] >= v5[sprite->data[4]])
    {
        sprite->pos2.y = 0;
        v2 = -1;
    }

    return v2;
}

void SetObjectEventStepTimer(struct Sprite *sprite, s16 delay)
{
    sprite->data[3] = delay;
}

bool8 RunObjectEventStepTimer(struct Sprite *sprite)
{
    sprite->data[3]--;

    if (sprite->data[3] == 0)
        return TRUE;
    else
        return FALSE;
}

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

void UpdateEventObjectSpriteVisibility(struct Sprite *sprite, bool8 invisible)
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

void UpdateEventObjectSpriteSubpriorityAndVisibility(struct Sprite *sprite)
{
    sub_8069248(sprite);
    SetObjectSubpriorityByZCoord(sprite->data[1], sprite, 1);
    UpdateEventObjectSpriteVisibility(sprite, sprite->data[2]);
}

void sub_8068FD0(void)
{
    s32 i;
    for (i = 0; i < MAX_SPRITES; i++)
    {
        struct Sprite *sprite = &gSprites[i];
        if (sprite->inUse && sprite->callback == UpdateEventObjectSpriteSubpriorityAndVisibility)
        {
            DestroySprite(sprite);
        }
    }
}

s32 sub_806900C(u8 objectEventId)
{
    s32 i;
    for (i = 0; i < MAX_SPRITES; i++)
    {
        struct Sprite *sprite = &gSprites[i];
        if (sprite->inUse && sprite->callback == UpdateEventObjectSpriteSubpriorityAndVisibility && (u8)sprite->data[0] == objectEventId)
        {
            return i;
        }
    }
    return MAX_SPRITES;
}

void TurnEventObject(u8 objectEventId, u8 direction)
{
    u8 animNum;
    u8 spriteId = sub_806900C(objectEventId);
    if (spriteId != MAX_SPRITES)
    {
        struct Sprite *sprite = &gSprites[spriteId];
        StartSpriteAnim(sprite, ObjectEventDirectionToImageAnimId(direction));
    }
}

void sub_8069094(u8 objectEventId, u8 direction)
{
    u8 animNum;
    s32 spriteId = sub_806900C(objectEventId);
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
            sprite->subspriteMode = 0;
        }
        else
        {
            SetSubspriteTables(sprite, info->subspriteTables);
            sprite->subspriteMode = 2;
        }
        StartSpriteAnim(sprite, 0);
    }
}

void sub_8069124(u8 objectEventId, bool32 arg1)
{
    u8 spriteId = sub_806900C(objectEventId);
    if (spriteId != MAX_SPRITES)
    {
        if (arg1)
            gSprites[spriteId].data[2] = TRUE;
        else
            gSprites[spriteId].data[2] = FALSE;
    }
}

bool32 sub_806916C(u8 objectEventId)
{
    u8 spriteId = sub_806900C(objectEventId);
    if (spriteId == MAX_SPRITES)
        return FALSE;
    return gSprites[spriteId].data[2] == TRUE;
}

void sub_80691A4(u8 objectEventId, u8 direction)
{
    u8 spriteId = sub_806900C(objectEventId);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].data[3] = direction;
        gSprites[spriteId].data[4] = 0;
    }
}

void sub_80691D4(struct Sprite * sprite)
{
    switch (sprite->data[4])
    {
    case 0:
        sprite->pos2.y = 0;
        sprite->data[4]++;
        // fallthrough
    case 1:
        if ((sprite->pos2.y -= 8) == -160)
        {
            sprite->pos2.y = 0;
            sprite->data[2] = 1;
            sprite->data[3] = 0;
            sprite->data[4] = 0;
        }
    }
}

void sub_8069210(struct Sprite * sprite)
{
    switch (sprite->data[4])
    {
    case 0:
        sprite->pos2.y = -160;
        sprite->data[4]++;
        // fallthrough
    case 1:
        if ((sprite->pos2.y += 8) == 0)
        {
            sprite->data[3] = 0;
            sprite->data[4] = 0;
        }
    }
}

void sub_8069248(struct Sprite * sprite)
{
    switch (sprite->data[3])
    {
    case 0:
        break;
    case 1:
        sub_8069210(sprite);
        break;
    case 2:
        sub_80691D4(sprite);
        break;
    default:
        sprite->data[3] = 0;
        AGB_ASSERT_EX(0, ABSPATH("evobjmv.c"), 13331);
    }
}

bool32 sub_8069294(u8 objectEventId)
{
    u8 spriteId = sub_806900C(objectEventId);
    if (spriteId == MAX_SPRITES)
        return FALSE;
    if (gSprites[spriteId].data[3])
        return TRUE;
    else
        return FALSE;
}

u32 oe_exec_and_other_stuff(u8 fieldEffectId, struct ObjectEvent * objectEvent)
{
    ObjectEventGetLocalIdAndMap(objectEvent, (u8 *)&gFieldEffectArguments[0], (u8 *)&gFieldEffectArguments[1], (u8 *)&gFieldEffectArguments[2]);
    return FieldEffectStart(fieldEffectId);
}

void DoShadowFieldEffect(struct ObjectEvent *objectEvent)
{
    if (!objectEvent->hasShadow)
    {
        objectEvent->hasShadow = 1;
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
