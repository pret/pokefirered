#include "global.h"
#include "decompress.h"
#include "sound.h"
#include "task.h"
#include "trig.h"
#include "constants/songs.h"

void sub_815F1AC(u8 taskId);
bool32 sub_815F2AC(u8 spriteId);
void sub_815F3E0(u8 spriteId1, u8 spriteId2, u8 spriteId3);
bool32 sub_815F444(u8 spriteId);
void sub_815F470(struct Sprite * sprite);
void sub_815F564(u16 tilesTag, u16 palTag);
u8 sub_815F5BC(u16 tilesTag, u16 palTag, s16 x, s16 y, u8 subpriority);
void sub_815F610(u16 tilesTag, u16 palTag, s16 x, s16 y, u8 subpriority, s16 * spriteId2_p, s16 * spriteId3_p);

void sub_815F138(u16 tilesTag, u16 palTag, s16 x, s16 y, u8 subpriority)
{
    u8 taskId = CreateTask(sub_815F1AC, 80);
    gTasks[taskId].data[2] = tilesTag;
    gTasks[taskId].data[3] = palTag;
    gTasks[taskId].data[4] = x;
    gTasks[taskId].data[5] = y;
    gTasks[taskId].data[6] = subpriority;
}

bool8 sub_815F198(void)
{
    return FuncIsActiveTask(sub_815F1AC);
}

void sub_815F1AC(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        sub_815F564(data[2], data[3]);
        data[7] = sub_815F5BC(data[2], data[3], data[4], data[5], data[6]);
        sub_815F610(data[2], data[3], data[4], data[5], data[6], &data[8], &data[9]);
        data[0]++;
        break;
    case 1:
        if (!sub_815F2AC(data[7]))
        {
            sub_815F3E0(data[7], data[8], data[9]);
            FreeSpriteOamMatrix(&gSprites[data[7]]);
            DestroySprite(&gSprites[data[7]]);
            data[0]++;
        }
        break;
    case 2:
        if (!sub_815F444(data[8]))
        {
            DestroySprite(&gSprites[data[8]]);
            DestroySprite(&gSprites[data[9]]);
            FreeSpriteTilesByTag(data[2]);
            FreeSpritePaletteByTag(data[3]);
            DestroyTask(taskId);
        }
        break;
    }
}

bool32 sub_815F2AC(u8 spriteId)
{
    struct Sprite * sprite = &gSprites[spriteId];

    switch (sprite->data[0])
    {
    case 0:
        sub_8007FFC(sprite, 0x800, 0x1A);
        sprite->data[0]++;
        // fallthrough
    case 1:
        if (sprite->data[2] == 0)
            PlaySE(SE_KON2);
        if (++sprite->data[2] >= 20)
        {
            sprite->data[2] = 0;
            StartSpriteAffineAnim(sprite, 1);
            sprite->data[0]++;
        }
        break;
    case 2:
        if (sprite->affineAnimEnded)
            sprite->data[0]++;
        break;
    case 3:
        if (++sprite->data[2] >= 4)
        {
            sprite->data[2] = 0;
            sprite->data[0]++;
            StartSpriteAffineAnim(sprite, 2);
        }
        break;
    case 4:
        sprite->pos1.y -= 4;
        if (++sprite->data[2] >= 8)
        {
            if (sprite->data[4] < 2)
            {
                StartSpriteAnim(sprite, sprite->data[4] + 1);
                sprite->data[2] = 0;
                sprite->data[0]++;
            }
            else
            {
                sprite->data[0] = 7;
                return FALSE;
            }
        }
        break;
    case 5:
        sprite->pos1.y += 4;
        if (++sprite->data[2] >= 8)
        {
            sprite->data[2] = 0;
            StartSpriteAffineAnim(sprite, 3);
            sprite->data[0]++;
        }
        break;
    case 6:
        if (sprite->affineAnimEnded)
        {
            sprite->data[4]++;
            sprite->data[0] = 1;
        }
        break;
    case 7:
        return FALSE;
    }
    return TRUE;
}

void sub_815F3E0(u8 spriteId1, u8 spriteId2, u8 spriteId3)
{
    gSprites[spriteId2].pos2.y = -40;
    gSprites[spriteId3].pos2.y = -40;
    gSprites[spriteId2].invisible = FALSE;
    gSprites[spriteId3].invisible = FALSE;
    gSprites[spriteId2].callback = sub_815F470;
    gSprites[spriteId3].callback = sub_815F470;
}

bool32 sub_815F444(u8 spriteId)
{
    return gSprites[spriteId].callback == sub_815F470;
}

void sub_815F470(struct Sprite * sprite)
{
    s16 * data = sprite->data;
    s32 y;

    switch (sprite->data[0])
    {
    case 0:
        data[4] = 64;
        data[5] = sprite->pos2.y << 4;
        data[0]++;
        //fallthrough
    case 1:
        data[5] += data[4];
        data[4]++;
        sprite->pos2.y = data[5] >> 4;
        if (sprite->pos2.y >= 0)
        {
            PlaySE(SE_KON2);
            sprite->pos2.y = 0;
            data[0]++;
        }
        break;
    case 2:
        data[1] += 12;
        if (data[1] >= 128)
        {
            PlaySE(SE_KON2);
            data[1] = 0;
            data[0]++;
        }
        y = gSineTable[data[1]];
        sprite->pos2.y = -(y >> 4);
        break;
    case 3:
        data[1] += 16;
        if (data[1] >= 128)
        {
            PlaySE(SE_KON2);
            data[1] = 0;
            data[0]++;
        }
        sprite->pos2.y = -(gSineTable[data[1]] >> 5);
        break;
    case 4:
        if (++data[1] > 40)
            sprite->callback = SpriteCallbackDummy;
        break;
    }
}

const u16 gUnknown_847A328[] = INCBIN_U16("data/graphics/unk_847a348.gbapal");
const u16 gUnknown_847A348[] = INCBIN_U16("data/graphics/unk_847a348.4bpp.lz");

void sub_815F564(u16 tilesTag, u16 palTag)
{
    struct CompressedSpriteSheet spriteSheet = {(const void *)gUnknown_847A348, 0xE00};
    struct SpritePalette spritePalette = {gUnknown_847A328};
    spriteSheet.tag = tilesTag;
    spritePalette.tag = palTag;
    LoadCompressedSpriteSheet(&spriteSheet);
    LoadSpritePalette(&spritePalette);
}

const struct OamData gOamData_847A7AC = {
    .affineMode = ST_OAM_AFFINE_DOUBLE,
    .shape = ST_OAM_SQUARE,
    .size = 2
};

const struct OamData gOamData_847A7B4 = {
    .affineMode = ST_OAM_AFFINE_OFF,
    .shape = ST_OAM_H_RECTANGLE,
    .size = 3
};

const union AnimCmd gUnknown_847A7BC[] = {
    ANIMCMD_FRAME( 0, 1),
	ANIMCMD_END
};

const union AnimCmd gUnknown_847A7C4[] = {
    ANIMCMD_FRAME(16, 1),
	ANIMCMD_END
};

const union AnimCmd gUnknown_847A7CC[] = {
    ANIMCMD_FRAME(32, 1),
	ANIMCMD_END
};

const union AnimCmd *const gUnknown_847A7D4[] = {
    gUnknown_847A7BC,
    gUnknown_847A7C4,
    gUnknown_847A7CC
};

const union AnimCmd gUnknown_847A7E0[] = {
    ANIMCMD_FRAME(48, 1),
    ANIMCMD_END
};

const union AnimCmd gUnknown_847A7E8[] = {
    ANIMCMD_FRAME(80, 1),
    ANIMCMD_END
};

const union AnimCmd *const gUnknown_847A7F0[] = {
    gUnknown_847A7E0,
    gUnknown_847A7E8
};

const union AffineAnimCmd gUnknown_847A7F8[] = {
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
	AFFINEANIMCMD_END
};

const union AffineAnimCmd gUnknown_847A808[] = {
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
	AFFINEANIMCMD_FRAME( 0x10, -0x10, 0, 8),
	AFFINEANIMCMD_END
};

const union AffineAnimCmd gUnknown_847A820[] = {
    AFFINEANIMCMD_FRAME(-0x12,  0x12, 0, 8),
	AFFINEANIMCMD_END
};

const union AffineAnimCmd gUnknown_847A830[] = {
    AFFINEANIMCMD_FRAME(  0x6,  -0x6, 0, 8),
	AFFINEANIMCMD_FRAME( -0x4,   0x4, 0, 8),
	AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
	AFFINEANIMCMD_END
};

const union AffineAnimCmd *const gUnknown_847A850[] = {
    gUnknown_847A7F8,
    gUnknown_847A808,
    gUnknown_847A820,
    gUnknown_847A830
};

u8 sub_815F5BC(u16 tilesTag, u16 palTag, s16 x, s16 y, u8 subpriority)
{
    struct SpriteTemplate spriteTemplate = {
        .oam = &gOamData_847A7AC,
        .anims = gUnknown_847A7D4,
        .affineAnims = gUnknown_847A850,
        .callback = SpriteCallbackDummy
    };
    spriteTemplate.tileTag = tilesTag;
    spriteTemplate.paletteTag = palTag;
    return CreateSprite(&spriteTemplate, x, y, subpriority);
}

void sub_815F610(u16 tilesTag, u16 palTag, s16 x, s16 y, u8 subpriority, s16 * spriteId2_p, s16 * spriteId3_p)
{
    struct SpriteTemplate spriteTemplate = {
        .oam = &gOamData_847A7B4,
        .anims = gUnknown_847A7F0,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy
    };
    spriteTemplate.tileTag = tilesTag;
    spriteTemplate.paletteTag = palTag;
    *spriteId2_p = CreateSprite(&spriteTemplate, x - 32, y, subpriority);
    *spriteId3_p = CreateSprite(&spriteTemplate, x + 32, y, subpriority);
    gSprites[*spriteId2_p].invisible = TRUE;
    gSprites[*spriteId3_p].invisible = TRUE;
    StartSpriteAnim(&gSprites[*spriteId3_p], 1);
}
