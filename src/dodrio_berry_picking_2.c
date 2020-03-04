#include "global.h"
#include "gflib.h"
#include "dodrio_berry_picking.h"
#include "link.h"
#include "strings.h"
#include "task.h"
#include "text_window.h"
#include "text_window_graphics.h"
#include "constants/songs.h"

// Temporary stopgap to export duplicate data 
// included from data/dodrio_berry_picking.h
asm(".global sDodrioBerryStatusGfx\n"
    "\t.global sDodrioBerrySpritesGfx\n"
    "\t.global sDodrioBerryPlatformGfx\n"
    "\t.global sDodrioBerryBgTilemap1\n"
    "\t.global sDodrioBerryBgTilemap2Left\n"
    "\t.global sDodrioBerryBgTilemap2Right\n"
    "\t.global sUnknown_8475674\n"
    "\t.global sUnknown_8475684\n"
    "\t.global sUnknown_847568C\n"
    "\t.global sUnknown_84756A4\n"
    "\t.global sUnknown_847569C\n"
    "\t.global sUnknown_847565C\n"
    "\t.global sDodrioBerryBgPal1\n"
    "\t.global sDodrioBerryBgGfx1\n"
    "\t.global sDodrioBerryBgGfx2");

struct DodrioStruct_2022CF4
{
    u8 filler_00[0xc];
    u8 unkC[10];
    s16 unk16[10];
    u16 unk2A[10];
    u16 unk3E;
}; // size = 0x40

EWRAM_DATA u16 *gUnknown_203F3E4[5] = {NULL};
EWRAM_DATA u16 *gUnknown_203F3F8[2] = {NULL};
EWRAM_DATA u16 *gUnknown_203F400[11] = {NULL};
EWRAM_DATA u16 *gUnknown_203F42C[4] = {NULL};
EWRAM_DATA struct DodrioStruct_2022CF4 *gUnknown_203F43C = NULL;
EWRAM_DATA struct DodrioSubstruct_0160 *gUnknown_203F440 = NULL;

void sub_8153B9C(struct Sprite * sprite);
u32 sub_8153C30(struct Sprite * sprite);
u32 sub_8153CA0(struct Sprite * sprite);
void sub_8153D48(bool8 a0, u8 a1);
void nullsub_97(struct Sprite *sprite);
void sub_8154324(bool8 a0);
void sub_81543E8(struct Sprite *sprite);
s16 sub_8154608(u8 a0, u8 a1);
void sub_8154A08(u8 taskId);
void sub_8154A2C(void);
void sub_8154B34(void);
void sub_8154F80(void);
void sub_81556E0(void);
void sub_8155A78(void);
void sub_8155B4C(void);
void sub_8155C2C(void);
void sub_8155C80(void);
void unused_0(void);
void nullsub_98(void);
void sub_8155E24(MainCallback cb);
MainCallback sub_8155E54(void);
void sub_8155EA0(void);
bool32 sub_8155FE0(void);

#include "data/dodrio_berry_picking.h"

const struct OamData sOamData_8478C98 =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(64x64),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x64),
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0
};

const struct OamData sOamData_8478CA0 =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(16x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x16),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0
};

const struct OamData sOamData_8478CA8 =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(16x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x16),
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0
};

const struct OamData sOamData_8478CB0 =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(64x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x32),
    .tileNum = 0,
    .priority = 3,
    .paletteNum = 0,
    .affineParam = 0
};

const union AnimCmd sSpriteAnim_8478CB8[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478CC0[] =
{
    ANIMCMD_FRAME(64, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478CC8[] =
{
    ANIMCMD_FRAME(128, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478CD0[] =
{
    ANIMCMD_FRAME(192, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478CD8[] =
{
    ANIMCMD_FRAME(256, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd *const sSpriteAnimTable_8478CE0[] =
{
    sSpriteAnim_8478CB8,
    sSpriteAnim_8478CC0,
    sSpriteAnim_8478CC8,
    sSpriteAnim_8478CD0,
    sSpriteAnim_8478CD8
};

const union AnimCmd sSpriteAnim_8478CF4[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478CFC[] =
{
    ANIMCMD_FRAME(4, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478D04[] =
{
    ANIMCMD_FRAME(8, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd *const sSpriteAnimTable_8478D0C[] =
{
    sSpriteAnim_8478CF4,
    sSpriteAnim_8478CFC,
    sSpriteAnim_8478D04
};

const union AnimCmd sSpriteAnim_8478D18[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478D20[] =
{
    ANIMCMD_FRAME(4, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478D28[] =
{
    ANIMCMD_FRAME(8, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478D30[] =
{
    ANIMCMD_FRAME(12, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478D38[] =
{
    ANIMCMD_FRAME(16, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478D40[] =
{
    ANIMCMD_FRAME(20, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478D48[] =
{
    ANIMCMD_FRAME(24, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478D50[] =
{
    ANIMCMD_FRAME(28, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd sSpriteAnim_8478D58[] =
{
    ANIMCMD_FRAME(32, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd *const sSpriteAnimTable_8478D60[] =
{
    sSpriteAnim_8478D18,
    sSpriteAnim_8478D20,
    sSpriteAnim_8478D28,
    sSpriteAnim_8478D30,
    sSpriteAnim_8478D38,
    sSpriteAnim_8478D40,
    sSpriteAnim_8478D48,
    sSpriteAnim_8478D50,
    sSpriteAnim_8478D58
};

const union AnimCmd sSpriteAnim_8478D84[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd *const sSpriteAnimTable_8478D8C[] =
{
    sSpriteAnim_8478D84
};

// Code

void sub_8153A9C(void)
{
    void *ptr = AllocZeroed(0x3000);
    struct SpritePalette pal1 = {sDodrioBerryPkmnPal, 0};
    struct SpritePalette pal2 = {sDodrioBerryShinyPal, 1};

    LZ77UnCompWram(sDodrioBerryPkmnGfx, ptr);
    // This check should be one line up.
    if (ptr != NULL)
    {
        struct SpriteSheet sheet = {ptr, 0x3000, 0};
        LoadSpriteSheet(&sheet);
        Free(ptr);
    }
    LoadSpritePalette(&pal1);
    LoadSpritePalette(&pal2);
}

void sub_8153AFC(struct DodrioSubstruct_318C *arg0, u8 arg1, u8 id, u8 arg3)
{
    struct SpriteTemplate sprTemplate =
    {
        .tileTag = 0,
        .paletteTag = arg0->isShiny,
        .oam = &sOamData_8478C98,
        .anims = sSpriteAnimTable_8478CE0,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = sub_8153B9C,
    };

    gUnknown_203F3E4[id] = AllocZeroed(4);
    *gUnknown_203F3E4[id] = CreateSprite(&sprTemplate, sub_8154608(arg1, arg3), 136, 3);
    sub_8153D48(TRUE, id);
}

void sub_8153B9C(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        break;
    case 1:
        sub_8153C30(sprite);
        break;
    case 2:
        sub_8153CA0(sprite);
        break;
    }
}

void sub_8153BC0(u8 unused)
{
    struct Sprite *sprite = &gSprites[*gUnknown_203F3E4[GetMultiplayerId()]];
    sprite->data[0] = 1;
    sprite->data[1] = 0;
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
}

void sub_8153BF8(u8 unused)
{
    struct Sprite *sprite = &gSprites[*gUnknown_203F3E4[GetMultiplayerId()]];
    sprite->data[0] = 2;
    sprite->data[1] = 0;
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
}

u32 sub_8153C30(struct Sprite *sprite)
{
    s8 var;
    u8 mod = (++sprite->data[1] / 2) % 4;

    if (sprite->data[1] >= 3)
    {
        switch (mod)
        {
        default:
            var = 1;
            break;
        case 1:
        case 2:
            var = -1;
            break;
        }

        sprite->pos1.x += var;
        if (++sprite->data[1] >= 40)
        {
            sprite->data[0] = 0;
            sprite->pos1.x = sub_8154608(0, sub_81533B4());
        }
    }

    return 0;
}

u32 sub_8153CA0(struct Sprite *sprite)
{
    u8 mod = (++sprite->data[1] / 13) % 4;

    if (sprite->data[1] % 13 == 0 && mod != 0)
        PlaySE(SE_W204);
    if (sprite->data[1] >= 104)
    {
        sprite->data[0] = 0;
        mod = 0;
    }
    sub_8153DA8(GetMultiplayerId(), mod);
    return 0;
}

void sub_8153D08(u8 count)
{
    u8 i;
    for (i = 0; i < count; i++)
    {
        struct Sprite *sprite = &gSprites[*gUnknown_203F3E4[i]];
        if (sprite != NULL)
            DestroySpriteAndFreeResources(sprite);
        // Memory should be freed here but is not.
    }
}

void sub_8153D48(bool8 invisible, u8 id)
{
    gSprites[*gUnknown_203F3E4[id]].invisible = invisible;
}

void sub_8153D80(bool8 invisible, u8 count)
{
    u8 i;
    for (i = 0; i < count; i++)
        sub_8153D48(invisible, i);
}

void sub_8153DA8(u8 id, u8 frameNum)
{
    StartSpriteAnim(&gSprites[*gUnknown_203F3E4[id]], frameNum);
}

void nullsub_97(struct Sprite * sprite)
{

}

void sub_8153DD8(void)
{
    u8 i;
    for (i = 0; i < 10; i++)
    {
        struct Sprite *sprite = &gSprites[gUnknown_203F43C->unk2A[i]];
        sprite->pos1.x = (i * 16) + 48;
        sprite->pos1.y = -8 - (i * 8);
        gUnknown_203F43C->unkC[i] = 0;
    }
}

void sub_8153E28(void)
{
    u8 i;
    void *ptr = AllocZeroed(0x180);
    struct SpritePalette spPal = {sDodrioBerryStatusPal, 2};

    LZ77UnCompWram(sDodrioBerryStatusGfx, ptr);
    // This check should be one line up.
    if (ptr != NULL)
    {
        struct SpriteSheet spSheet = {ptr, 0x180, 1};
        struct SpriteTemplate spTemplate =
        {
            .tileTag = 1,
            .paletteTag = 2,
            .oam = &sOamData_8478CA0,
            .anims = sSpriteAnimTable_8478D0C,
            .images = NULL,
            .affineAnims = gDummySpriteAffineAnimTable,
            .callback = nullsub_97,
        };

        gUnknown_203F43C = AllocZeroed(sizeof(*gUnknown_203F43C));
        LoadSpriteSheet(&spSheet);
        LoadSpritePalette(&spPal);
        for (i = 0; i < 10; i++)
            gUnknown_203F43C->unk2A[i] = CreateSprite(&spTemplate, (i * 16) + 48, -8 - (i * 8), 0);
    }

    Free(ptr);
}

void sub_8153ED8(void)
{
    u8 i;
    for (i = 0; i < 10; i++)
    {
        struct Sprite *sprite = &gSprites[gUnknown_203F43C->unk2A[i]];
        if (sprite != NULL)
            DestroySpriteAndFreeResources(sprite);
    }
    FREE_AND_SET_NULL(gUnknown_203F43C);
}

bool32 sub_8153F1C(void)
{
    u8 i;
    bool32 r3 = FALSE;
    for (i = 0; i < 10; i++)
    {
        struct Sprite *sprite = &gSprites[gUnknown_203F43C->unk2A[i]];
        gUnknown_203F43C->unk16[i] = 2;
        if (gUnknown_203F43C->unkC[i] != 0 && sprite->pos1.y == 8)
            continue;
        r3 = TRUE;
        if (sprite->pos1.y == 8)
        {
            if (gUnknown_203F43C->unkC[i] != 0)
                continue;
            gUnknown_203F43C->unkC[i] = 1;
            gUnknown_203F43C->unk16[i] = -16;
            PlaySE(SE_TK_KASYA);
        }
        sprite->pos1.y += gUnknown_203F43C->unk16[i];
    }

    if (r3)
        return FALSE;
    else
        return TRUE;
}

void sub_8153FC8(u8 arg0)
{
    u8 i;

    if (arg0 > 10)
    {
        for (i = 0; i < 10; i++)
            StartSpriteAnim(&gSprites[gUnknown_203F43C->unk2A[i]], 1);
    }
    else
    {
        for (i = 0; i < 10 - arg0; i++)
        {
            if (arg0 > 6)
            {
                gUnknown_203F43C->unk3E += arg0 - 6;
                if (gUnknown_203F43C->unk3E > 30)
                    gUnknown_203F43C->unk3E = 0;
                else if (gUnknown_203F43C->unk3E > 10)
                    StartSpriteAnim(&gSprites[gUnknown_203F43C->unk2A[i]], 2);
                else
                    StartSpriteAnim(&gSprites[gUnknown_203F43C->unk2A[i]], 0);
            }
            else
            {
                StartSpriteAnim(&gSprites[gUnknown_203F43C->unk2A[i]], 0);
            }
        }
        for (; i < 10; i++)
            StartSpriteAnim(&gSprites[gUnknown_203F43C->unk2A[i]], 1);
    }
}

void sub_81540DC(bool8 invisible)
{
    u8 i;
    for (i = 0; i < 10; i++)
        gSprites[gUnknown_203F43C->unk2A[i]].invisible = invisible;
}

// Unknown unused data, feel free to remove.
const u8 sUnused2[] = {
    SE_W204,
    SE_TOY_C,
    SE_TOY_D,
    SE_TOY_E,
    SE_TOY_F,
    SE_TOY_G,
    SE_TOY_A,
    SE_TOY_B,
    SE_TOY_C1,
    SE_CARD3
};

void sub_8154128(void)
{
    void *ptr = AllocZeroed(0x480);
    struct SpritePalette sprPal = {sDodrioBerrySpritesPal, 3};

    LZ77UnCompWram(sDodrioBerrySpritesGfx, ptr);
    if (ptr != NULL)
    {
        struct SpriteSheet sprSheet = {ptr, 0x480, 2};
        LoadSpriteSheet(&sprSheet);
    }

    LoadSpritePalette(&sprPal);
    Free(ptr);
}

const s16 sUnknown_8478DD4[] = {88, 128, 168, 208};

void sub_815417C(void)
{
    u8 i;
    s16 x;

    struct SpriteTemplate sprTemplate1 =
    {
        .tileTag = 2,
        .paletteTag = 3,
        .oam = &sOamData_8478CA8,
        .anims = sSpriteAnimTable_8478D60,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    };
    struct SpriteTemplate sprTemplate2 =
    {
        .tileTag = 2,
        .paletteTag = 3,
        .oam = &sOamData_8478CA0,
        .anims = sSpriteAnimTable_8478D60,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    };

    for (i = 0; i < 11; i++)
    {
        gUnknown_203F400[i] = AllocZeroed(4);
        x = i * 16;
        *gUnknown_203F400[i] = CreateSprite(&sprTemplate1, x + (i * 8), 8, 1);
        sub_81542EC(i, TRUE);
    }
    for (i = 0; i < 4; i++)
    {
        gUnknown_203F42C[i] = AllocZeroed(4);
        if (i == 3)
            *gUnknown_203F42C[i] = CreateSprite(&sprTemplate2, sUnknown_8478DD4[i], 57, 0);
        else
            *gUnknown_203F42C[i] = CreateSprite(&sprTemplate2, sUnknown_8478DD4[i], 60, 0);
        StartSpriteAnim(&gSprites[*gUnknown_203F42C[i]], i);
    }

    sub_8154324(TRUE);
}

void sub_8154274(void)
{
    struct Sprite *sprite;
    u8 i;

    for (i = 0; i < 11; i++)
    {
        sprite = &gSprites[*gUnknown_203F400[i]];
        if (sprite != NULL)
            DestroySprite(sprite);
        FREE_AND_SET_NULL(gUnknown_203F400[i]);
    }
    for (i = 0; i < 4; i++)
    {
        sprite = &gSprites[*gUnknown_203F42C[i]];
        if (sprite != NULL)
            DestroySprite(sprite);
        FREE_AND_SET_NULL(gUnknown_203F42C[i]);
    }
}

void sub_81542EC(u8 id, bool8 invisible)
{
    gSprites[*gUnknown_203F400[id]].invisible = invisible;
}

void sub_8154324(bool8 invisible)
{
    u8 i;
    for (i = 0; i < 4; i++)
        gSprites[*gUnknown_203F42C[i]].invisible = invisible;
}

void sub_8154370(u8 id, u8 y)
{
    gSprites[*gUnknown_203F400[id]].pos1.y = y * 8;
}

void sub_8154398(u16 id, u8 frameNum)
{
    StartSpriteAnim(&gSprites[*gUnknown_203F400[id]], frameNum);
}

// Unused
void sub_81543C4(u8 spriteId)
{
    gSprites[spriteId].pos1.x = 20 * spriteId + 50;
    gSprites[spriteId].pos1.y = 50;
}

// Gamefreak made a mistake there and goes out of bounds for the data array as it holds 8 elements
// in turn overwriting sprite's subpriority and subsprites fields.
#if defined(NONMATCHING)
#define sKeepPosX data[1]
#else
#define sKeepPosX data[10]
#endif // NONMATCHING

void sub_81543E8(struct Sprite *sprite)
{
    u8 i;
    static const u8 array[] = {30, 20};

    if (sprite->sKeepPosX != TRUE)
    {
        for (i = 0; i < 2; i++)
        {
            if (++gUnknown_203F3F8[i][1] > array[i])
            {
                sprite->pos1.x--;
                gUnknown_203F3F8[i][1] = 0;
            }
        }
    }
}

const s16 gUnknown_8478E0E[][2] = {{230, 55}, {30, 74}};

void sub_8154438(void)
{
    u8 i;
    void *ptr = AllocZeroed(0x400);
    struct SpritePalette sprPal = {sDodrioBerryPlatformPal, 6};

    LZ77UnCompWram(sDodrioBerryPlatformGfx, ptr);
    if (ptr != NULL)
    {
        struct SpriteSheet sprSheet = {ptr, 0x400, 5};
        struct SpriteTemplate sprTemplate =
        {
            .tileTag = 5,
            .paletteTag = 6,
            .oam = &sOamData_8478CB0,
            .anims = sSpriteAnimTable_8478D8C,
            .images = NULL,
            .affineAnims = gDummySpriteAffineAnimTable,
            .callback = sub_81543E8,
        };

        LoadSpriteSheet(&sprSheet);
        LoadSpritePalette(&sprPal);
        for (i = 0; i < 2; i++)
        {
            gUnknown_203F3F8[i] = AllocZeroed(4);
            *gUnknown_203F3F8[i] = CreateSprite(&sprTemplate, gUnknown_8478E0E[i][0], gUnknown_8478E0E[i][1], 4);
        }
    }

    Free(ptr);
}

void sub_81544F0(void)
{
    u8 i;
    for (i = 0; i < 2; i++)
    {
        struct Sprite *sprite = &gSprites[*gUnknown_203F3F8[i]];
        sprite->sKeepPosX = TRUE;
        sprite->pos1.x = gUnknown_8478E0E[i][0];
        sprite->pos1.y = gUnknown_8478E0E[i][1];
    }
}

void sub_8154540(void)
{
    u8 i;
    for (i = 0; i < 2; i++)
    {
        struct Sprite *sprite = &gSprites[*gUnknown_203F3F8[i]];
        sprite->sKeepPosX = FALSE;
    }
}

void sub_8154578(void)
{
    u8 i;
    for (i = 0; i < 2; i++)
    {
        struct Sprite *sprite = &gSprites[*gUnknown_203F3F8[i]];
        if (sprite)
            DestroySprite(sprite);
        FREE_AND_SET_NULL(gUnknown_203F3F8[i]);
    }
}

void sub_81545BC(bool8 invisible)
{
    u8 i;
    for (i = 0; i < 2; i++)
        gSprites[*gUnknown_203F3F8[i]].invisible = invisible;
}

#undef sKeepPosX

s16 sub_8154608(u8 arg0, u8 arg1)
{
    s16 x = 0;
    switch (arg1)
    {
    case 1:
        x = 15;
        break;
    case 2:
        switch (arg0)
        {
        case 0: x = 12; break;
        case 1: x = 18; break;
        }
        break;
    case 3:
        switch (arg0)
        {
        case 0: x = 15; break;
        case 1: x = 21; break;
        case 2: x =  9; break;
        }
        break;
    case 4:
        switch (arg0)
        {
        case 0: x = 12; break;
        case 1: x = 18; break;
        case 2: x = 24; break;
        case 3: x =  6; break;
        }
        break;
    case 5:
        switch (arg0)
        {
        case 0: x = 15; break;
        case 1: x = 21; break;
        case 2: x = 27; break;
        case 3: x =  3; break;
        case 4: x =  9; break;
        }
        break;
    }

    return x * 8;
}

void sub_81546C0(void)
{
    u8 i;
    for (i = 0; i < 11; i++)
    {
        sub_81542EC(i, TRUE);
        sub_8154370(i, 1);
    }
    sub_81540DC(FALSE);
}

void sub_81546EC(u8 frameId)
{
    LoadBgTiles(0, GetUserFrameGraphicsInfo(frameId)->tiles, 0x120, 1);
    LoadPalette(GetUserFrameGraphicsInfo(frameId)->palette, 0xA0, 0x20);
}

void sub_8154720(void)
{
    TextWindow_SetStdFrame0_WithPal(0, 0xA, 0xB0);
}

void sub_8154730(void)
{
    gUnknown_203F440->finished = FALSE;
    gUnknown_203F440->state = 0;
    gUnknown_203F440->unk3018 = 0;
    gUnknown_203F440->unk3020 = 0;
    gUnknown_203F440->unk3024 = 0;
}

void sub_8154768(const struct WindowTemplate *winTempl)
{
    u8 pal = 0xA;

    FillBgTilemapBufferRect(0, 1, winTempl->tilemapLeft - 1,                winTempl->tilemapTop - 1,                   1, 1, pal);
    FillBgTilemapBufferRect(0, 2, winTempl->tilemapLeft,                    winTempl->tilemapTop - 1,                   winTempl->width, 1, pal);
    FillBgTilemapBufferRect(0, 3, winTempl->tilemapLeft + winTempl->width,  winTempl->tilemapTop - 1,                   1, 1, pal);
    FillBgTilemapBufferRect(0, 4, winTempl->tilemapLeft - 1,                winTempl->tilemapTop, 1,                    winTempl->height, pal);
    FillBgTilemapBufferRect(0, 6, winTempl->tilemapLeft + winTempl->width,  winTempl->tilemapTop, 1,                    winTempl->height, pal);
    FillBgTilemapBufferRect(0, 7, winTempl->tilemapLeft - 1,                winTempl->tilemapTop + winTempl->height,    1, 1, pal);
    FillBgTilemapBufferRect(0, 8, winTempl->tilemapLeft,                    winTempl->tilemapTop + winTempl->height,    winTempl->width, 1, pal);
    FillBgTilemapBufferRect(0, 9, winTempl->tilemapLeft + winTempl->width,  winTempl->tilemapTop + winTempl->height,    1, 1, pal);
}

void sub_8154868(const struct WindowTemplate *winTempl)
{
    u8 pal = 0xB;

    FillBgTilemapBufferRect(0, 10, winTempl->tilemapLeft - 1,                winTempl->tilemapTop - 1,                   1, 1, pal);
    FillBgTilemapBufferRect(0, 11, winTempl->tilemapLeft,                    winTempl->tilemapTop - 1,                   winTempl->width, 1, pal);
    FillBgTilemapBufferRect(0, 12, winTempl->tilemapLeft + winTempl->width,  winTempl->tilemapTop - 1,                   1, 1, pal);
    FillBgTilemapBufferRect(0, 13, winTempl->tilemapLeft - 1,                winTempl->tilemapTop, 1,                    winTempl->height, pal);
    FillBgTilemapBufferRect(0, 15, winTempl->tilemapLeft + winTempl->width,  winTempl->tilemapTop, 1,                    winTempl->height, pal);
    FillBgTilemapBufferRect(0, 16, winTempl->tilemapLeft - 1,                winTempl->tilemapTop + winTempl->height,    1, 1, pal);
    FillBgTilemapBufferRect(0, 17, winTempl->tilemapLeft,                    winTempl->tilemapTop + winTempl->height,    winTempl->width, 1, pal);
    FillBgTilemapBufferRect(0, 18, winTempl->tilemapLeft + winTempl->width,  winTempl->tilemapTop + winTempl->height,    1, 1, pal);
}

void sub_8154968(struct DodrioSubstruct_0160 *ptr)
{
    gUnknown_203F440 = ptr;
    gUnknown_203F440->finished = FALSE;
    gUnknown_203F440->state = 0;
    gUnknown_203F440->unk3018 = 0;
    gUnknown_203F440->unk3020 = 0;
    gUnknown_203F440->unk3024 = 0;
    gUnknown_203F440->unk3004 = CreateTask(sub_8154A08, 3);
    sub_8155E24(sub_8154A2C);
}

void sub_81549C8(void)
{
    FreeAllWindowBuffers();
}

struct WinCoords
{
    u8 left;
    u8 top;
};

const u8 sUnknown_8478E38[][3] =
{
    {
        TEXT_COLOR_WHITE,
        TEXT_COLOR_DARK_GREY,
        TEXT_COLOR_LIGHT_GREY
    }, {
        TEXT_COLOR_WHITE,
        TEXT_COLOR_RED,
        TEXT_COLOR_LIGHT_RED
    }, {
        TEXT_COLOR_WHITE,
        TEXT_COLOR_BLUE,
        TEXT_COLOR_LIGHT_BLUE
    }, {
        TEXT_COLOR_WHITE,
        TEXT_COLOR_GREEN,
        TEXT_COLOR_LIGHT_GREEN
    }
};

const struct WinCoords sUnknown_8478E44[] = {{12, 6}};
const struct WinCoords sUnknown_8478E48[] = {{9, 10}, {15, 6}};
const struct WinCoords sUnknown_8478E50[] = {{12, 6}, {18, 10}, {6, 10}};
const struct WinCoords sUnknown_8478E5C[] = {{9, 10}, {15, 6}, {21, 10}, {3, 6}};
const struct WinCoords sUnknown_8478E6C[] = {{12, 6}, {18, 10}, {23, 6}, {1, 6}, {6, 10}};

const struct WinCoords *const sUnknown_8478E80[] =
{
    sUnknown_8478E44,
    sUnknown_8478E48,
    sUnknown_8478E50,
    sUnknown_8478E5C,
    sUnknown_8478E6C,
};

const u8 *const sUnknown_8478E94[] =
{
    gText_1Colon,
    gText_2Colon,
    gText_3Colon,
    gText_4Colon,
    gText_5Colon,
};

const u16 sUnknown_8478EA8[] = {92, 132, 172, 212};
const u16 sUnknown_8478EB0[] = {30, 45, 60, 75, 90};
const u16 sUnknown_8478EBA[] = {12, 28, 44, 60, 76};

struct
{
    u8 id;
    void (*func)(void);
} const gUnknown_8478EC4[] =
{
    {0, sub_8154A2C},
    {1, sub_8154B34},
    {2, sub_8154F80},
    {3, sub_81556E0},
    {4, sub_8155A78},
    {5, sub_8155B4C},
    {6, sub_8155C2C},
    {7, sub_8155C80},
    {8, unused_0},
    {9, nullsub_98},
};

void sub_81549D4(u8 arg0)
{
    u8 i;
    for (i = 0; i < 10; i++)
    {
        if (gUnknown_8478EC4[i].id == arg0)
            sub_8155E24(gUnknown_8478EC4[i].func);
    }
}

void sub_8154A08(u8 taskId)
{
    if (!gUnknown_203F440->finished)
        sub_8155E54()();
}

void sub_8154A2C(void)
{
    switch (gUnknown_203F440->state)
    {
    case 0:
        sub_8155EA0();
        gUnknown_203F440->state++;
        break;
    case 1:
        if (sub_8155FE0() == TRUE)
            gUnknown_203F440->state++;
        break;
    case 2:
        CopyToBgTilemapBuffer(3, sDodrioBerryBgTilemap1, 0, 0);
        CopyToBgTilemapBuffer(1, sDodrioBerryBgTilemap2Left, 0, 0);
        CopyToBgTilemapBuffer(2, sDodrioBerryBgTilemap2Right, 0, 0);
        CopyBgTilemapBufferToVram(3);
        CopyBgTilemapBufferToVram(1);
        CopyBgTilemapBufferToVram(2);
        gUnknown_203F440->state++;
        break;
    case 3:
        ShowBg(0);
        ShowBg(3);
        ShowBg(1);
        ShowBg(2);
        gUnknown_203F440->state++;
        break;
    case 4:
        sub_81546EC(gSaveBlock2Ptr->optionsWindowFrameType);
        sub_8154720();
        gUnknown_203F440->state++;
        break;
    default:
        gUnknown_203F440->finished = TRUE;
        break;
    }
}

// This is declared inside pokeemerald's sub_80296A8
const u8 gUnknown_8478F14[5] = {0, 1, 2, 3, 4};
