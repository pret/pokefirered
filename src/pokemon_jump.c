#include "global.h"
#include "gflib.h"
#include "battle_anim.h"
#include "decompress.h"
#include "link.h"
#include "link_rfu.h"
#include "task.h"
#include "constants/songs.h"

static void sub_8147654(u8 taskId);
static void sub_81477C0(u8 taskId);
static void sub_814784C(u8 taskId);
static void sub_81479D4(u8 taskId);
static void sub_8147A34(u8 taskId);

static const u16 gUnknown_846AFE8[] = INCBIN_U16("graphics/misc/unk_846B008.gbapal");
static const u32 gUnknown_846B008[] = INCBIN_U32("graphics/misc/unk_846B008.4bpp.lz");

static const struct CompressedSpriteSheet gUnknown_846B42C[] = {
    {gUnknown_846B008, 0x0C00, 0x2000},
    {}
};

static const struct SpritePalette gUnknown_846B43C[] = {
    {gUnknown_846AFE8, 0x2000},
    {}
};

static const union AnimCmd gUnknown_846B44C[] = {
    ANIMCMD_FRAME(0x00, 0),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_846B454[] = {
    ANIMCMD_FRAME(0x10, 0),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_846B45C[] = {
    ANIMCMD_FRAME(0x20, 0),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_846B464[] = {
    ANIMCMD_FRAME(0x40, 0),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_846B46C[] = {
    ANIMCMD_FRAME(0x30, 0),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_846B474[] = {
    ANIMCMD_FRAME(0x50, 0),
    ANIMCMD_END
};

static const union AnimCmd *const gUnknown_846B47C[] = {
    gUnknown_846B44C,
    gUnknown_846B454,
    gUnknown_846B45C,
    gUnknown_846B464,
    gUnknown_846B46C,
    gUnknown_846B474
};

static const struct SpriteTemplate gUnknown_846B494[] = {
    {
        .tileTag = 0x2000,
        .paletteTag = 0x2000,
        .oam = &gOamData_AffineOff_ObjNormal_32x32,
        .anims = gUnknown_846B47C,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy
    },
};

static const TaskFunc gUnknown_846B4AC[][4] = {
    { sub_81477C0, sub_814784C, sub_81479D4, sub_8147A34 }
};

// Unused, but looks like it was intended to be a hook
UNUSED u8 sub_81475C0(u8 data1, u8 priority)
{
    u8 taskId;
    struct Task * task;

    taskId = CreateTask(sub_8147654, priority);
    task = &gTasks[taskId];
    task->data[0] = 1;
    task->data[1] = data1;
    gUnknown_846B4AC[data1][0](taskId);
    return taskId;
}

// Unused, but looks like it was intended to be a hook
UNUSED bool32 sub_814760C(void)
{
    u8 taskId;

    taskId = FindTaskIdByFunc(sub_8147654);
    if (taskId == 0xFF)
        return FALSE;
    gTasks[taskId].data[0] = 2;
    return TRUE;
}

// Unused, but looks like it was intended to be a hook
UNUSED bool32 sub_8147640(void)
{
    return FuncIsActiveTask(sub_8147654);
}

static void sub_8147654(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (data[0])
    {
    case 2:
        gUnknown_846B4AC[data[1]][2](taskId);
        data[0] = 3;
        break;
    case 3:
        gUnknown_846B4AC[data[1]][3](taskId);
        break;
    case 4:
        gUnknown_846B4AC[data[1]][1](taskId);
        DestroyTask(taskId);
        break;
    }
}

static void sub_81476E0(u8 taskId, s16 *data)
{
    u8 i;
    struct Sprite *sprite;

    LoadCompressedSpriteSheet(&gUnknown_846B42C[data[3]]);
    LoadSpritePalette(&gUnknown_846B43C[data[4]]);
    for (i = 0; i < data[8]; i++)
        data[13 + i] = CreateSprite(&gUnknown_846B494[data[2]], data[9], data[10], data[7]);
    for (i = 0; i < data[8]; i++)
    {
        sprite = &gSprites[data[13 + i]];
        sprite->oam.priority = data[6];
        sprite->invisible = TRUE;
        sprite->data[1] = data[5];
        sprite->data[3] = taskId;
        sprite->data[4] = i;
        sprite->data[5] = data[13];
    }
}

static void sub_81477C0(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    data[2] = 0;
    data[3] = 0;
    data[4] = 0;
    data[5] = 60;
    data[6] = 0;
    data[7] = 0;
    data[8] = 3;
    data[9] = 120;
    data[10] = 88;
    sub_81476E0(taskId, data);

    StartSpriteAnim(&gSprites[data[14]], 4);
    gSprites[data[14]].pos2.x = -32;

    StartSpriteAnim(&gSprites[data[15]], 5);
    gSprites[data[15]].pos2.x = 32;
}

static void sub_814784C(u8 taskId)
{
    u8 i = 0;
    s16 *data = gTasks[taskId].data;

    for (i = 0; i < data[8]; i++)
        DestroySprite(&gSprites[data[13 + i]]);
    FreeSpriteTilesByTag(gUnknown_846B42C[data[3]].tag);
    FreeSpritePaletteByTag(gUnknown_846B43C[data[4]].tag);
}

static void sub_81478BC(struct Sprite *sprite)
{
    s16 *data = gTasks[sprite->data[3]].data;

    if (data[11] % data[5] != 0)
        return;
    if (data[11] == data[10])
        return;

    data[10] = data[11];
    switch (sprite->data[2])
    {
    case 0:
        sprite->invisible = FALSE;
    case 1:
    case 2:
        PlaySE(SE_KON);
        StartSpriteAnim(sprite, sprite->data[2]);
        break;
    case 3:
        PlaySE(SE_PIN);
        StartSpriteAnim(sprite, sprite->data[2]);
        gSprites[data[14]].invisible = FALSE;
        gSprites[data[15]].invisible = FALSE;
        break;
    case 4:
        sprite->invisible = TRUE;
        gSprites[data[14]].invisible = TRUE;
        gSprites[data[15]].invisible = TRUE;
        data[0] = 4;
        return;
    }
    sprite->data[2]++;
}

static void sub_81479D4(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    PlaySE(SE_KON);
    gSprites[data[13]].callback = sub_81478BC;
    gSprites[data[13]].invisible = FALSE;
    gTasks[taskId].data[0] = 3;
}

static void sub_8147A34(u8 taskId)
{
    u16 packet[6];
    s16 *data = gTasks[taskId].data;

    if (gReceivedRemoteLinkPlayers)
    {
        if (gRecvCmds[0][1] == 0x7FFF)
            data[11] = gRecvCmds[0][2];
        if (GetMultiplayerId() == 0)
        {
            data[12]++;
            memset(packet, 0, sizeof(packet));
            packet[0] = 0x7FFF;
            packet[1] = data[12];
            RfuPrepareSend0x2f00(packet);
        }
    }
    else
    {
        data[11]++;
    }
}
