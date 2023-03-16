#include "global.h"
#include "gflib.h"
#include "decompress.h"
#include "task.h"
#include "trig.h"
#include "constants/songs.h"

static void Task_MinigameCountdown(u8 taskId);
static bool32 RunMinigameCountdownDigitsAnim(u8 spriteId);
static void StartStartGraphic(u8 spriteId1, u8 spriteId2, u8 spriteId3);
static bool32 IsStartGraphicAnimRunning(u8 spriteId);
static void SpriteCB_Start(struct Sprite *sprite);
static void Load321StartGfx(u16 tilesTag, u16 palTag);
static u8 CreateNumberSprite(u16 tilesTag, u16 palTag, s16 x, s16 y, u8 subpriority);
static void CreateStartSprite(u16 tilesTag, u16 palTag, s16 x, s16 y, u8 subpriority, s16 * spriteId2_p, s16 * spriteId3_p);

#define tState       data[0]
#define tTilesTag    data[2]
#define tPalTag      data[3]
#define tX           data[4]
#define tY           data[5]
#define tSubpriority data[6]
#define tSpriteId1   data[7]
#define tSpriteId2   data[8]
#define tSpriteId3   data[9]

void StartMinigameCountdown(u16 tilesTag, u16 palTag, s16 x, s16 y, u8 subpriority)
{
    u8 taskId = CreateTask(Task_MinigameCountdown, 80);
    gTasks[taskId].tTilesTag = tilesTag;
    gTasks[taskId].tPalTag = palTag;
    gTasks[taskId].tX = x;
    gTasks[taskId].tY = y;
    gTasks[taskId].tSubpriority = subpriority;
}

bool32 IsMinigameCountdownRunning(void)
{
    return FuncIsActiveTask(Task_MinigameCountdown);
}

static void Task_MinigameCountdown(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (tState)
    {
    case 0:
        Load321StartGfx(tTilesTag, tPalTag);
        tSpriteId1 = CreateNumberSprite(tTilesTag, tPalTag, tX, tY, tSubpriority);
        CreateStartSprite(tTilesTag, tPalTag, tX, tY, tSubpriority, &tSpriteId2, &tSpriteId3);
        tState++;
        break;
    case 1:
        if (!RunMinigameCountdownDigitsAnim(tSpriteId1))
        {
            StartStartGraphic(tSpriteId1, tSpriteId2, tSpriteId3);
            FreeSpriteOamMatrix(&gSprites[tSpriteId1]);
            DestroySprite(&gSprites[tSpriteId1]);
            tState++;
        }
        break;
    case 2:
        if (!IsStartGraphicAnimRunning(tSpriteId2))
        {
            DestroySprite(&gSprites[tSpriteId2]);
            DestroySprite(&gSprites[tSpriteId3]);
            FreeSpriteTilesByTag(tTilesTag);
            FreeSpritePaletteByTag(tPalTag);
            DestroyTask(taskId);
        }
        break;
    }
}

static bool32 RunMinigameCountdownDigitsAnim(u8 spriteId)
{
    struct Sprite *sprite = &gSprites[spriteId];

    switch (sprite->data[0])
    {
    case 0:
        SetSpriteMatrixAnchor(sprite, NO_ANCHOR, 26);
        sprite->data[0]++;
        // fallthrough
    case 1:
        if (sprite->data[2] == 0)
            PlaySE(SE_BALL_BOUNCE_2);
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
        sprite->y -= 4;
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
        sprite->y += 4;
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

static void StartStartGraphic(u8 spriteId1, u8 spriteId2, u8 spriteId3)
{
    gSprites[spriteId2].y2 = -40;
    gSprites[spriteId3].y2 = -40;
    gSprites[spriteId2].invisible = FALSE;
    gSprites[spriteId3].invisible = FALSE;
    gSprites[spriteId2].callback = SpriteCB_Start;
    gSprites[spriteId3].callback = SpriteCB_Start;
}

static bool32 IsStartGraphicAnimRunning(u8 spriteId)
{
    return gSprites[spriteId].callback == SpriteCB_Start;
}

static void SpriteCB_Start(struct Sprite *sprite)
{
    s16 * data = sprite->data;
    s32 y;

    switch (sprite->data[0])
    {
    case 0:
        data[4] = 64;
        data[5] = sprite->y2 << 4;
        data[0]++;
        //fallthrough
    case 1:
        data[5] += data[4];
        data[4]++;
        sprite->y2 = data[5] >> 4;
        if (sprite->y2 >= 0)
        {
            PlaySE(SE_BALL_BOUNCE_2);
            sprite->y2 = 0;
            data[0]++;
        }
        break;
    case 2:
        data[1] += 12;
        if (data[1] >= 128)
        {
            PlaySE(SE_BALL_BOUNCE_2);
            data[1] = 0;
            data[0]++;
        }
        y = gSineTable[data[1]];
        sprite->y2 = -(y >> 4);
        break;
    case 3:
        data[1] += 16;
        if (data[1] >= 128)
        {
            PlaySE(SE_BALL_BOUNCE_2);
            data[1] = 0;
            data[0]++;
        }
        sprite->y2 = -(gSineTable[data[1]] >> 5);
        break;
    case 4:
        if (++data[1] > 40)
            sprite->callback = SpriteCallbackDummy;
        break;
    }
}

static const u16 sSpritePal_321Start[] = INCBIN_U16("graphics/misc/minigame_countdown.gbapal");
static const u16 sSpriteSheet_321Start[] = INCBIN_U16("graphics/misc/minigame_countdown.4bpp.lz");

static void Load321StartGfx(u16 tilesTag, u16 palTag)
{
    struct CompressedSpriteSheet spriteSheet = {(const void *)sSpriteSheet_321Start, 0xE00};
    struct SpritePalette spritePalette = {sSpritePal_321Start};
    spriteSheet.tag = tilesTag;
    spritePalette.tag = palTag;
    LoadCompressedSpriteSheet(&spriteSheet);
    LoadSpritePalette(&spritePalette);
}

static const struct OamData sOamData_Numbers = {
    .affineMode = ST_OAM_AFFINE_DOUBLE,
    .shape = SPRITE_SHAPE(32x32),
    .size = SPRITE_SIZE(32x32)
};

static const struct OamData sOamData_Start = {
    .affineMode = ST_OAM_AFFINE_OFF,
    .shape = SPRITE_SHAPE(64x32),
    .size = SPRITE_SIZE(64x32)
};

static const union AnimCmd sAnim_Numbers_Three[] = {
    ANIMCMD_FRAME( 0, 1),
	ANIMCMD_END
};

static const union AnimCmd sAnim_Numbers_Two[] = {
    ANIMCMD_FRAME(16, 1),
	ANIMCMD_END
};

static const union AnimCmd sAnim_Numbers_One[] = {
    ANIMCMD_FRAME(32, 1),
	ANIMCMD_END
};

static const union AnimCmd *const sAnimTable_Numbers[] = {
    sAnim_Numbers_Three,
    sAnim_Numbers_Two,
    sAnim_Numbers_One
};

static const union AnimCmd sAnim_StartLeft[] = {
    ANIMCMD_FRAME(48, 1),
    ANIMCMD_END
};

static const union AnimCmd sAnim_StartRight[] = {
    ANIMCMD_FRAME(80, 1),
    ANIMCMD_END
};

static const union AnimCmd *const sAnimTable_Start[] = {
    sAnim_StartLeft,
    sAnim_StartRight
};

static const union AffineAnimCmd sAffineAnim_Numbers_0[] = {
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
	AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_Numbers_1[] = {
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
	AFFINEANIMCMD_FRAME( 0x10, -0x10, 0, 8),
	AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_Numbers_2[] = {
    AFFINEANIMCMD_FRAME(-0x12,  0x12, 0, 8),
	AFFINEANIMCMD_END
};

static const union AffineAnimCmd sAffineAnim_Numbers_3[] = {
    AFFINEANIMCMD_FRAME(  0x6,  -0x6, 0, 8),
	AFFINEANIMCMD_FRAME( -0x4,   0x4, 0, 8),
	AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
	AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const sAffineAnimTable_Numbers[] = {
    sAffineAnim_Numbers_0,
    sAffineAnim_Numbers_1,
    sAffineAnim_Numbers_2,
    sAffineAnim_Numbers_3
};

static u8 CreateNumberSprite(u16 tilesTag, u16 palTag, s16 x, s16 y, u8 subpriority)
{
    struct SpriteTemplate spriteTemplate = {
        .oam = &sOamData_Numbers,
        .anims = sAnimTable_Numbers,
        .affineAnims = sAffineAnimTable_Numbers,
        .callback = SpriteCallbackDummy
    };
    spriteTemplate.tileTag = tilesTag;
    spriteTemplate.paletteTag = palTag;
    return CreateSprite(&spriteTemplate, x, y, subpriority);
}

static void CreateStartSprite(u16 tilesTag, u16 palTag, s16 x, s16 y, u8 subpriority, s16 * spriteId2_p, s16 * spriteId3_p)
{
    struct SpriteTemplate spriteTemplate = {
        .oam = &sOamData_Start,
        .anims = sAnimTable_Start,
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
