#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "task.h"
#include "trig.h"

#define abs(x) ((x) < 0 ? -(x) : (x))

void sub_8098A6C(u8 taskId);
void sub_8098C08(u8 taskId);
void sub_8098D54(u8 taskId);
void sub_8098EF0(u8 taskId);
void sub_8099004(u8 taskId);
void sub_80990AC(struct Sprite * sprite);
void sub_8099120(struct Sprite * sprite);
void sub_8099144(struct Sprite * sprite);
void sub_8099190(struct Sprite * sprite);
void sub_80991B4(struct Sprite * sprite);
void sub_8099270(struct Sprite * sprite);
void sub_80992E0(struct Sprite * sprite);
void sub_8099394(struct Sprite * sprite);
void sub_809946C(struct Sprite * sprite);
void sub_8099530(u8 taskId);
void sub_8099594(u8 taskId);
void sub_80996B8(u8 taskId);
void sub_8099788(u8 taskId);
void sub_8099908(u8 taskId);
void sub_8099B54(u8 taskId);
void sub_8099CB8(u8 taskId);

const struct SpriteTemplate gUnknown_83D4E4C[] = {
    {
        0, 0, &gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80990AC
    }, {
        0, 0, &gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8099144
    }, {
        0, 0, &gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80991B4
    }, {
        0, 0, &gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_80992E0
    }, {
        0, 0, &gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8099394
    }
};

void sub_80989F8(u8 taskId)
{
    u8 spriteId = GetAnimBankSpriteId(gBattleAnimArgs[0]);

    if (spriteId == 0xFF)
        DestroyAnimVisualTask(taskId);
    else
    {
        gSprites[spriteId].pos2.x = gBattleAnimArgs[1];
        gSprites[spriteId].pos2.y = gBattleAnimArgs[2];
        gTasks[taskId].data[0] = spriteId;
        gTasks[taskId].data[1] = gBattleAnimArgs[3];
        gTasks[taskId].data[2] = gBattleAnimArgs[4];
        gTasks[taskId].data[3] = gBattleAnimArgs[4];
        gTasks[taskId].data[4] = gBattleAnimArgs[1];
        gTasks[taskId].data[5] = gBattleAnimArgs[2];
        gTasks[taskId].func = sub_8098A6C;
        gTasks[taskId].func(taskId);
    }
}

void sub_8098A6C(u8 taskId)
{
    if (gTasks[taskId].data[3] == 0)
    {
        if (gSprites[gTasks[taskId].data[0]].pos2.x == 0)
            gSprites[gTasks[taskId].data[0]].pos2.x = gTasks[taskId].data[4];
        else
            gSprites[gTasks[taskId].data[0]].pos2.x = 0;
        if (gSprites[gTasks[taskId].data[0]].pos2.y == 0)
            gSprites[gTasks[taskId].data[0]].pos2.y = gTasks[taskId].data[5];
        else
            gSprites[gTasks[taskId].data[0]].pos2.y = 0;
        gTasks[taskId].data[3] = gTasks[taskId].data[2];
        if (--gTasks[taskId].data[1] == 0)
        {
            gSprites[gTasks[taskId].data[0]].pos2.x = 0;
            gSprites[gTasks[taskId].data[0]].pos2.y = 0;
            DestroyAnimVisualTask(taskId);
        }
    }
    else
        gTasks[taskId].data[3]--;
}

void sub_8098B1C(u8 taskId)
{
    bool8 abort = FALSE;
    u8 spriteId;
    u8 battlerId;

    if (gBattleAnimArgs[0] < MAX_BATTLERS_COUNT)
    {
        spriteId = GetAnimBankSpriteId(gBattleAnimArgs[0]);
        if (spriteId == 0xFF)
            abort = TRUE;
    }
    else if (gBattleAnimArgs[0] != 8)
    {
        switch (gBattleAnimArgs[0])
        {
        case 4:
            battlerId = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
            break;
        case 5:
            battlerId = GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT);
            break;
        case 6:
            battlerId = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
            break;
        default:
            battlerId = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);
            break;
        }
        if (!sub_8072DF0(battlerId))
            abort = TRUE;
        spriteId = gBattlerSpriteIds[battlerId];
    }
    else
        spriteId = gBattlerSpriteIds[gBattleAnimAttacker];
    if (abort)
        DestroyAnimVisualTask(taskId);
    else
    {
        gSprites[spriteId].pos2.x = gBattleAnimArgs[1];
        gSprites[spriteId].pos2.y = gBattleAnimArgs[2];
        gTasks[taskId].data[0] = spriteId;
        gTasks[taskId].data[1] = gBattleAnimArgs[3];
        gTasks[taskId].data[2] = gBattleAnimArgs[4];
        gTasks[taskId].data[3] = gBattleAnimArgs[4];
        gTasks[taskId].data[4] = gBattleAnimArgs[1];
        gTasks[taskId].data[5] = gBattleAnimArgs[2];
        gTasks[taskId].func = sub_8098C08;
        gTasks[taskId].func(taskId);
    }
}

void sub_8098C08(u8 taskId)
{
    if (gTasks[taskId].data[3] == 0)
    {
        if (gSprites[gTasks[taskId].data[0]].pos2.x == gTasks[taskId].data[4])
            gSprites[gTasks[taskId].data[0]].pos2.x = -gTasks[taskId].data[4];
        else
            gSprites[gTasks[taskId].data[0]].pos2.x = gTasks[taskId].data[4];
        if (gSprites[gTasks[taskId].data[0]].pos2.y == gTasks[taskId].data[5])
            gSprites[gTasks[taskId].data[0]].pos2.y = -gTasks[taskId].data[5];
        else
            gSprites[gTasks[taskId].data[0]].pos2.y = gTasks[taskId].data[5];
        gTasks[taskId].data[3] = gTasks[taskId].data[2];
        if (--gTasks[taskId].data[1] == 0)
        {
            gSprites[gTasks[taskId].data[0]].pos2.x = 0;
            gSprites[gTasks[taskId].data[0]].pos2.y = 0;
            DestroyAnimVisualTask(taskId);
        }
    }
    else
        gTasks[taskId].data[3]--;
}

void sub_8098CD0(u8 taskId)
{
    u8 spriteId = GetAnimBankSpriteId(gBattleAnimArgs[0]);

    if (spriteId == 0xFF)
        DestroyAnimVisualTask(taskId);
    else
    {
        gSprites[spriteId].pos2.x += gBattleAnimArgs[1];
        gSprites[spriteId].pos2.y += gBattleAnimArgs[2];
        gTasks[taskId].data[0] = spriteId;
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].data[2] = gBattleAnimArgs[3];
        gTasks[taskId].data[3] = 0;
        gTasks[taskId].data[4] = gBattleAnimArgs[4];
        gTasks[taskId].data[5] = gBattleAnimArgs[1] * 2;
        gTasks[taskId].data[6] = gBattleAnimArgs[2] * 2;
        gTasks[taskId].func = sub_8098D54;
        gTasks[taskId].func(taskId);
    }
}

void sub_8098D54(u8 taskId)
{
    if (gTasks[taskId].data[3] == 0)
    {
        if (gTasks[taskId].data[1] & 1)
        {
            gSprites[gTasks[taskId].data[0]].pos2.x += gTasks[taskId].data[5];
            gSprites[gTasks[taskId].data[0]].pos2.y += gTasks[taskId].data[6];
        }
        else
        {
            gSprites[gTasks[taskId].data[0]].pos2.x -= gTasks[taskId].data[5];
            gSprites[gTasks[taskId].data[0]].pos2.y -= gTasks[taskId].data[6];
        }
        gTasks[taskId].data[3] = gTasks[taskId].data[4];
        if (++gTasks[taskId].data[1] >= gTasks[taskId].data[2])
        {
            if (gTasks[taskId].data[1] & 1)
            {
                gSprites[gTasks[taskId].data[0]].pos2.x += gTasks[taskId].data[5] / 2;
                gSprites[gTasks[taskId].data[0]].pos2.y += gTasks[taskId].data[6] / 2;
            }
            else
            {
                gSprites[gTasks[taskId].data[0]].pos2.x -= gTasks[taskId].data[5] / 2;
                gSprites[gTasks[taskId].data[0]].pos2.y -= gTasks[taskId].data[6] / 2;
            }
            DestroyAnimVisualTask(taskId);
        }
    }
    else
        gTasks[taskId].data[3]--;
}

void sub_8098E90(u8 taskId)
{
    u8 spriteId = GetAnimBankSpriteId(gBattleAnimArgs[0]);

    gSprites[spriteId].pos2.x = gBattleAnimArgs[1];
    gTasks[taskId].data[0] = spriteId;
    gTasks[taskId].data[1] = gBattleAnimArgs[1];
    gTasks[taskId].data[2] = gBattleAnimArgs[2];
    gTasks[taskId].data[3] = gBattleAnimArgs[3];
    gTasks[taskId].data[4] = gBattleAnimArgs[4];
    gTasks[taskId].func = sub_8098EF0;
    gTasks[taskId].func(taskId);
}

void sub_8098EF0(u8 taskId)
{
    u8 spriteId = gTasks[taskId].data[0];
    s16 data1 = gTasks[taskId].data[1];
    if (gTasks[taskId].data[2] == gTasks[taskId].data[8]++)
    {
        gTasks[taskId].data[8] = 0;
        if (gSprites[spriteId].pos2.x == data1)
            data1 = -data1;
        gSprites[spriteId].pos2.x += data1;
    }
    gTasks[taskId].data[1] = data1;
    gTasks[taskId].data[9] += gTasks[taskId].data[3];
    gSprites[spriteId].pos2.y = gTasks[taskId].data[9] >> 8;
    if (--gTasks[taskId].data[4] == 0)
        DestroyAnimVisualTask(taskId);
}

void sub_8098F84(u8 taskId)
{
    u8 r6 = 1;
    u8 i;
    u8 spriteId = GetAnimBankSpriteId(gBattleAnimArgs[0]);
    if (gBattleAnimArgs[4] > 5)
        gBattleAnimArgs[4] = 5;
    for (i = 0; i < gBattleAnimArgs[4]; i++)
        r6 *= 2;
    gTasks[taskId].data[0] = spriteId;
    gTasks[taskId].data[1] = gBattleAnimArgs[1];
    gTasks[taskId].data[2] = gBattleAnimArgs[2];
    gTasks[taskId].data[3] = gBattleAnimArgs[3];
    gTasks[taskId].data[4] = r6;
    gTasks[taskId].func = sub_8099004;
    gTasks[taskId].func(taskId);
}

void sub_8099004(u8 taskId)
{
    u8 spriteId = gTasks[taskId].data[0];
    gSprites[spriteId].pos2.x = Sin(gTasks[taskId].data[5], gTasks[taskId].data[1]);
    gSprites[spriteId].pos2.y = -Cos(gTasks[taskId].data[5], gTasks[taskId].data[2]);
    gSprites[spriteId].pos2.y += gTasks[taskId].data[2];
    gTasks[taskId].data[5] += gTasks[taskId].data[4];
    gTasks[taskId].data[5] &= 0xFF;
    if (gTasks[taskId].data[5] == 0)
        gTasks[taskId].data[3]--;
    if (gTasks[taskId].data[3] == 0)
    {
        gSprites[spriteId].pos2.x = 0;
        gSprites[spriteId].pos2.y = 0;
        DestroyAnimVisualTask(taskId);
    }
}

void sub_809907C(u8 taskId)
{
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
    sub_8098F84(taskId);
}

void sub_80990AC(struct Sprite * sprite)
{
    sprite->invisible = TRUE;
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        sprite->data[1] = -gBattleAnimArgs[1];
    else
        sprite->data[1] =  gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[2] = 0;
    sprite->data[3] = gBattlerSpriteIds[gBattleAnimAttacker];
    sprite->data[4] = gBattleAnimArgs[0];
    StoreSpriteCallbackInData6(sprite, sub_8099120);
    sprite->callback = sub_8074DC4;
}

void sub_8099120(struct Sprite * sprite)
{
    sprite->data[0] = sprite->data[4];
    sprite->data[1] = -sprite->data[1];
    sprite->callback = sub_8074DC4;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
}

void sub_8099144(struct Sprite * sprite)
{
    u8 spriteId;
    sprite->invisible = TRUE;
    spriteId = GetAnimBankSpriteId(gBattleAnimArgs[2]);
    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[1] = 0;
    sprite->data[2] = gBattleAnimArgs[1];
    sprite->data[3] = spriteId;
    sprite->data[4] = gBattleAnimArgs[0];
    StoreSpriteCallbackInData6(sprite, sub_8099190);
    sprite->callback = sub_8074DC4;
}

void sub_8099190(struct Sprite * sprite)
{
    sprite->data[0] = sprite->data[4];
    sprite->data[2] = -sprite->data[2];
    sprite->callback = sub_8074DC4;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
}

void sub_80991B4(struct Sprite * sprite)
{
    u8 spriteId;
    if (gBattleAnimArgs[0] == 0)
        spriteId = gBattlerSpriteIds[gBattleAnimAttacker];
    else
        spriteId = gBattlerSpriteIds[gBattleAnimTarget];
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gSprites[spriteId].pos1.x + gSprites[spriteId].pos2.x;
    sprite->data[2] = gSprites[spriteId].pos1.x;
    sprite->data[3] = gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y;
    sprite->data[4] = gSprites[spriteId].pos1.y;
    sub_80754B8(sprite);
    sprite->data[3] = 0;
    sprite->data[4] = 0;
    sprite->data[5] = gSprites[spriteId].pos2.x;
    sprite->data[6] = gSprites[spriteId].pos2.y;
    sprite->invisible = TRUE;
    if (gBattleAnimArgs[1] == 1)
        sprite->data[2] = 0;
    else if (gBattleAnimArgs[1] == 2)
        sprite->data[1] = 0;
    sprite->data[7] = gBattleAnimArgs[1];
    sprite->data[7] |= spriteId << 8;
    sprite->callback = sub_8099270;
}

void sub_8099270(struct Sprite * sprite)
{
    u8 data7 = sprite->data[7];
    struct Sprite *otherSprite = &gSprites[sprite->data[7] >> 8];
    if (sprite->data[0] == 0)
    {
        if (data7 == 1 || data7 == 0)
            otherSprite->pos2.x = 0;
        if (data7 == 2 || data7 == 0)
            otherSprite->pos2.y = 0;
        DestroyAnimSprite(sprite);
    }
    else
    {
        sprite->data[0]--;
        sprite->data[3] += sprite->data[1];
        sprite->data[4] += sprite->data[2];
        otherSprite->pos2.x = (sprite->data[3] >> 8) + sprite->data[5];
        otherSprite->pos2.y = (sprite->data[4] >> 8) + sprite->data[6];
    }
}

void sub_80992E0(struct Sprite * sprite)
{
    u8 battlerId;
    u8 spriteId;
    if (gBattleAnimArgs[0] == 0)
        battlerId = gBattleAnimAttacker;
    else
        battlerId = gBattleAnimTarget;
    spriteId = gBattlerSpriteIds[battlerId];
    if (GetBattlerSide(battlerId) != B_SIDE_PLAYER)
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        if (gBattleAnimArgs[3] == 1)
            gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = gSprites[spriteId].pos1.x;
    sprite->data[2] = gSprites[spriteId].pos1.x + gBattleAnimArgs[1];
    sprite->data[3] = gSprites[spriteId].pos1.y;
    sprite->data[4] = gSprites[spriteId].pos1.y + gBattleAnimArgs[2];
    sub_80754B8(sprite);
    sprite->data[3] = 0;
    sprite->data[4] = 0;
    sprite->data[5] = spriteId;
    sprite->invisible = TRUE;
    StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
    sprite->callback = sub_8074E14;
}

void sub_8099394(struct Sprite * sprite)
{
    u8 battlerId;
    u8 spriteId;
    sprite->invisible = TRUE;
    if (gBattleAnimArgs[0] == 0)
        battlerId = gBattleAnimAttacker;
    else
        battlerId = gBattleAnimTarget;
    spriteId = gBattlerSpriteIds[battlerId];
    if (GetBattlerSide(battlerId) != B_SIDE_PLAYER)
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        if (gBattleAnimArgs[3] == 1)
            gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = gSprites[spriteId].pos1.x + gSprites[spriteId].pos2.x;
    sprite->data[2] = sprite->data[1] + gBattleAnimArgs[1];
    sprite->data[3] = gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y;
    sprite->data[4] = sprite->data[3] + gBattleAnimArgs[2];
    sub_80754B8(sprite);
    sprite->data[3] = gSprites[spriteId].pos2.x << 8;
    sprite->data[4] = gSprites[spriteId].pos2.y << 8;
    sprite->data[5] = spriteId;
    sprite->data[6] = gBattleAnimArgs[5];
    if (gBattleAnimArgs[5] == 0)
        StoreSpriteCallbackInData6(sprite, DestroyAnimSprite);
    else
        StoreSpriteCallbackInData6(sprite, sub_809946C);
    sprite->callback = sub_8074E14;
}

void sub_809946C(struct Sprite * sprite)
{
    gSprites[sprite->data[5]].pos2.x = 0;
    gSprites[sprite->data[5]].pos2.y = 0;
    DestroyAnimSprite(sprite);
}

void sub_809949C(u8 taskId)
{
    u16 r7 = 0x8000 / gBattleAnimArgs[3];
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[5] = -gBattleAnimArgs[5];
    }
    gTasks[taskId].data[0] = GetAnimBankSpriteId(gBattleAnimArgs[0]);
    gTasks[taskId].data[1] = gBattleAnimArgs[1] * 256 / gBattleAnimArgs[3];
    gTasks[taskId].data[2] = gBattleAnimArgs[2];
    gTasks[taskId].data[3] = gBattleAnimArgs[3];
    gTasks[taskId].data[4] = gBattleAnimArgs[4];
    gTasks[taskId].data[5] = gBattleAnimArgs[5] * 256 / gBattleAnimArgs[6];
    gTasks[taskId].data[6] = gBattleAnimArgs[6];
    gTasks[taskId].data[7] = r7;
    gTasks[taskId].func = sub_8099530;
}

void sub_8099530(u8 taskId)
{
    u8 spriteId = gTasks[taskId].data[0];
    gTasks[taskId].data[11] += gTasks[taskId].data[1];
    gSprites[spriteId].pos2.x = gTasks[taskId].data[11] >> 8;
    gSprites[spriteId].pos2.y = Sin((u8)(gTasks[taskId].data[10] >> 8), gTasks[taskId].data[2]);
    gTasks[taskId].data[10] += gTasks[taskId].data[7];
    if (--gTasks[taskId].data[3] == 0)
        gTasks[taskId].func = sub_8099594;
}

void sub_8099594(u8 taskId)
{
    u8 spriteId;

    if (gTasks[taskId].data[4] > 0)
        gTasks[taskId].data[4]--;
    else
    {
        spriteId = gTasks[taskId].data[0];
        gTasks[taskId].data[12] += gTasks[taskId].data[5];
        gSprites[spriteId].pos2.x = (gTasks[taskId].data[12] >> 8) + (gTasks[taskId].data[11] >> 8);
        if (--gTasks[taskId].data[6] == 0)
            DestroyAnimVisualTask(taskId);
    }
}

void sub_80995FC(u8 taskId)
{
    u8 spriteId;

    switch (gBattleAnimArgs[0])
    {
    case 0:
    case 1:
        spriteId = GetAnimBankSpriteId(gBattleAnimArgs[0]);
        break;
    case 2:
        if (!sub_8072DF0(gBattleAnimAttacker ^ BIT_FLANK))
        {
            DestroyAnimVisualTask(taskId);
            return;
        }
        spriteId = gBattlerSpriteIds[gBattleAnimAttacker ^ BIT_FLANK];
        break;
    case 3:
        if (!sub_8072DF0(gBattleAnimTarget ^ BIT_FLANK))
        {
            DestroyAnimVisualTask(taskId);
            return;
        }
        spriteId = gBattlerSpriteIds[gBattleAnimTarget ^ BIT_FLANK];
        break;
    default:
        DestroyAnimVisualTask(taskId);
        return;
    }
    gTasks[taskId].data[0] = spriteId;
    if (GetBattlerSide(gBattleAnimTarget) != B_SIDE_PLAYER)
        gTasks[taskId].data[1] = gBattleAnimArgs[1];
    else
        gTasks[taskId].data[1] = -gBattleAnimArgs[1];
    gTasks[taskId].func = sub_80996B8;
}

void sub_80996B8(u8 taskId)
{
    u8 spriteId = gTasks[taskId].data[0];
    gSprites[spriteId].pos2.x += gTasks[taskId].data[1];
    if (gSprites[spriteId].pos2.x + gSprites[spriteId].pos1.x < -0x20 || gSprites[spriteId].pos2.x + gSprites[spriteId].pos1.x > 0x110)
        DestroyAnimVisualTask(taskId);
}

void sub_8099704(u8 taskId)
{
    u8 spriteId;
    if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
    spriteId = GetAnimBankSpriteId(gBattleAnimArgs[4]);
    gTasks[taskId].data[0] = gBattleAnimArgs[0];
    gTasks[taskId].data[1] = gBattleAnimArgs[1];
    gTasks[taskId].data[2] = gBattleAnimArgs[2];
    gTasks[taskId].data[3] = gBattleAnimArgs[3];
    gTasks[taskId].data[4] = spriteId;
    if (gBattleAnimArgs[4] == 0)
        gTasks[taskId].data[5] = gBattleAnimAttacker;
    else
        gTasks[taskId].data[5] = gBattleAnimTarget;
    gTasks[taskId].data[12] = 1;
    gTasks[taskId].func = sub_8099788;
}

void sub_8099788(u8 taskId)
{
    u8 spriteId;
    u32 r8;
    s16 r5;
    u16 tmp;

    spriteId = gTasks[taskId].data[4];
    tmp = gTasks[taskId].data[10] + gTasks[taskId].data[2];
    gTasks[taskId].data[10] = tmp;
    r8 = tmp >> 8;
    r5 = Sin(r8, gTasks[taskId].data[1]);
    if (gTasks[taskId].data[0] == 0)
    {
        gSprites[spriteId].pos2.x = r5;
    }
    else if (GetBattlerSide(gTasks[taskId].data[5]) == B_SIDE_PLAYER)
    {
        gSprites[spriteId].pos2.y = abs(r5);
    }
    else
        gSprites[spriteId].pos2.y = -abs(r5);
    if ((r8 > 0x7F && gTasks[taskId].data[11] == 0 && gTasks[taskId].data[12] == 1) || (r8 < 0x7F && gTasks[taskId].data[11] == 1 && gTasks[taskId].data[12] == 0))
    {
        gTasks[taskId].data[11] ^= 1;
        gTasks[taskId].data[12] ^= 1;
        if (--gTasks[taskId].data[3] == 0)
        {
            gSprites[spriteId].pos2.x = 0;
            gSprites[spriteId].pos2.y = 0;
            DestroyAnimVisualTask(taskId);
        }
    }
}

void sub_80998B0(u8 taskId)
{
    u8 spriteId = GetAnimBankSpriteId(gBattleAnimArgs[3]);
    sub_80758E0(spriteId, gBattleAnimArgs[4]);
    gTasks[taskId].data[0] = gBattleAnimArgs[0];
    gTasks[taskId].data[1] = gBattleAnimArgs[1];
    gTasks[taskId].data[2] = gBattleAnimArgs[2];
    gTasks[taskId].data[3] = gBattleAnimArgs[2];
    gTasks[taskId].data[4] = spriteId;
    gTasks[taskId].data[10] = 0x100;
    gTasks[taskId].data[11] = 0x100;
    gTasks[taskId].func = sub_8099908;
}

void sub_8099908(u8 taskId)
{
    u8 spriteId;
    gTasks[taskId].data[10] += gTasks[taskId].data[0];
    gTasks[taskId].data[11] += gTasks[taskId].data[1];
    spriteId = gTasks[taskId].data[4];
    obj_id_set_rotscale(spriteId, gTasks[taskId].data[10], gTasks[taskId].data[11], 0);
    if (--gTasks[taskId].data[2] == 0)
    {
        if (gTasks[taskId].data[3] > 0)
        {
            gTasks[taskId].data[0] = -gTasks[taskId].data[0];
            gTasks[taskId].data[1] = -gTasks[taskId].data[1];
            gTasks[taskId].data[2] = gTasks[taskId].data[3];
            gTasks[taskId].data[3] = 0;
        }
        else
        {
            sub_8075980(spriteId);
            DestroyAnimVisualTask(taskId);
        }
    }
}

void sub_8099980(u8 taskId)
{
    u8 spriteId = GetAnimBankSpriteId(gBattleAnimArgs[2]);
    sub_80758E0(spriteId, 0);
    gTasks[taskId].data[1] = 0;
    gTasks[taskId].data[2] = gBattleAnimArgs[0];
    if (gBattleAnimArgs[3] != 1)
        gTasks[taskId].data[3] = 0;
    else
        gTasks[taskId].data[3] = gBattleAnimArgs[0] * gBattleAnimArgs[1];
    gTasks[taskId].data[4] = gBattleAnimArgs[1];
    gTasks[taskId].data[5] = spriteId;
    gTasks[taskId].data[6] = gBattleAnimArgs[3];
    if (sub_8073788())
        gTasks[taskId].data[7] = 1;
    else
    {
        if (gBattleAnimArgs[2] == 0)
            gTasks[taskId].data[7] = GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER ? 1 : 0;
        else
            gTasks[taskId].data[7] = GetBattlerSide(gBattleAnimTarget) == B_SIDE_PLAYER ? 1 : 0;
    }
    if (gTasks[taskId].data[7] && !sub_8073788())
    {
        s16 tmp;
        tmp = gTasks[taskId].data[3];
        gTasks[taskId].data[3] = -tmp;
        tmp = gTasks[taskId].data[4];
        gTasks[taskId].data[4] = -tmp;
    }
    gTasks[taskId].func = sub_8099B54;
}

void sub_8099A78(u8 taskId)
{
    u8 spriteId = GetAnimBankSpriteId(gBattleAnimArgs[2]);
    sub_80758E0(spriteId, 0);
    gTasks[taskId].data[1] = 0;
    gTasks[taskId].data[2] = gBattleAnimArgs[0];
    if (gBattleAnimArgs[2] == 0)
    {
        if (GetBattlerSide(gBattleAnimAttacker) != B_SIDE_PLAYER)
            gBattleAnimArgs[1] = -gBattleAnimArgs[1];
    }
    else
    {
        if (GetBattlerSide(gBattleAnimTarget) != B_SIDE_PLAYER)
            gBattleAnimArgs[1] = -gBattleAnimArgs[1];
    }
    if (gBattleAnimArgs[3] != 1)
        gTasks[taskId].data[3] = 0;
    else
        gTasks[taskId].data[3] = gBattleAnimArgs[0] * gBattleAnimArgs[1];
    gTasks[taskId].data[4] = gBattleAnimArgs[1];
    gTasks[taskId].data[5] = spriteId;
    gTasks[taskId].data[6] = gBattleAnimArgs[3];
    gTasks[taskId].data[7] = 1;
    if (gTasks[taskId].data[7] )
    {
        s16 tmp;
        tmp = gTasks[taskId].data[3];
        gTasks[taskId].data[3] = -tmp;
        tmp = gTasks[taskId].data[4];
        gTasks[taskId].data[4] = -tmp;
    }
    gTasks[taskId].func = sub_8099B54;
}

void sub_8099B54(u8 taskId)
{
    s16 tmp;
    gTasks[taskId].data[3] += gTasks[taskId].data[4];
    obj_id_set_rotscale(gTasks[taskId].data[5], 0x100, 0x100, gTasks[taskId].data[3]);
    if (gTasks[taskId].data[7])
        sub_80759DC(gTasks[taskId].data[5]);
    if (++gTasks[taskId].data[1] >= gTasks[taskId].data[2])
    {
        switch (gTasks[taskId].data[6])
        {
        case 1:
            sub_8075980(gTasks[taskId].data[5]);
            // fallthrough
        case 0:
        default:
            DestroyAnimVisualTask(taskId);
            break;
        case 2:
            gTasks[taskId].data[1] = 0;
            tmp = gTasks[taskId].data[4];
            gTasks[taskId].data[4] = -tmp;
            gTasks[taskId].data[6] = 1;
            break;
        }
    }
}

void sub_8099BD4(u8 taskId)
{
    if (gBattleAnimArgs[0] == 0)
    {
        gTasks[taskId].data[15] = gUnknown_2037EEC / 12;
        if (gTasks[taskId].data[15] < 1)
            gTasks[taskId].data[15] = 1;
        if (gTasks[taskId].data[15] > 16)
            gTasks[taskId].data[15] = 16;
    }
    else
    {
        gTasks[taskId].data[15] = gUnknown_2037EE8 / 12;
        if (gTasks[taskId].data[15] < 1)
            gTasks[taskId].data[15] = 1;
        if (gTasks[taskId].data[15] > 16)
            gTasks[taskId].data[15] = 16;
    }
    gTasks[taskId].data[14] = gTasks[taskId].data[15] / 2;
    gTasks[taskId].data[13] = gTasks[taskId].data[14] + (gTasks[taskId].data[15] & 1);
    gTasks[taskId].data[12] = 0;
    gTasks[taskId].data[10] = gBattleAnimArgs[3];
    gTasks[taskId].data[11] = gBattleAnimArgs[4];
    gTasks[taskId].data[7] = GetAnimBankSpriteId(1);
    gTasks[taskId].data[8] = gSprites[gTasks[taskId].data[7]].pos2.x;
    gTasks[taskId].data[9] = gSprites[gTasks[taskId].data[7]].pos2.y;
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = gBattleAnimArgs[1];
    gTasks[taskId].data[2] = gBattleAnimArgs[2];
    gTasks[taskId].func = sub_8099CB8;
}

void sub_8099CB8(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    if (++task->data[0] > task->data[1])
    {
        task->data[0] = 0;
        task->data[12] = (task->data[12] + 1) & 1;
        if (task->data[10])
        {
            if (task->data[12])
            {
                gSprites[task->data[7]].pos2.x = task->data[8] + task->data[13];
            }
            else
            {
                gSprites[task->data[7]].pos2.x = task->data[8] - task->data[14];
            }
        }
        if (task->data[11])
        {
            if (task->data[12])
            {
                gSprites[task->data[7]].pos2.y = task->data[15];
            }
            else
            {
                gSprites[task->data[7]].pos2.y = 0;
            }
        }
        if (!--task->data[2])
        {
            gSprites[task->data[7]].pos2.x = 0;
            gSprites[task->data[7]].pos2.y = 0;
            DestroyAnimVisualTask(taskId);
            return;
        }
    }
}
