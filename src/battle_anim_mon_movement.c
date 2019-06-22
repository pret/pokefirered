#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "task.h"
#include "trig.h"

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
