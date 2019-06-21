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
void sub_8099144(struct Sprite * sprite);
void sub_80991B4(struct Sprite * sprite);
void sub_80992E0(struct Sprite * sprite);
void sub_8099394(struct Sprite * sprite);

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
