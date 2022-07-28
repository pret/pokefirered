#include "global.h"
#include "gflib.h"
#include "dodrio_berry_picking.h"
#include "dynamic_placeholder_text_util.h"
#include "item.h"
#include "link.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "save.h"
#include "strings.h"
#include "task.h"
#include "text_window.h"
#include "text_window_graphics.h"
#include "constants/songs.h"

struct DodrioStruct_2022CF4
{
    u8 filler_00[0xc];
    u8 unkC[10];
    s16 unk16[10];
    u16 unk2A[10];
    u16 unk3E;
}; // size = 0x40

static EWRAM_DATA u16 *gUnknown_203F3E4[5] = {NULL};
static EWRAM_DATA u16 *gUnknown_203F3F8[2] = {NULL};
static EWRAM_DATA u16 *gUnknown_203F400[11] = {NULL};
static EWRAM_DATA u16 *gUnknown_203F42C[4] = {NULL};
static EWRAM_DATA struct DodrioStruct_2022CF4 * gUnknown_203F43C = NULL;
static EWRAM_DATA struct DodrioSubstruct_0160 * gUnknown_203F440 = NULL;

static void sub_8153B9C(struct Sprite * sprite);
static u32 sub_8153C30(struct Sprite * sprite);
static u32 sub_8153CA0(struct Sprite * sprite);
static void sub_8153D48(bool8 a0, u8 a1);
static void nullsub_97(struct Sprite * sprite);
static void sub_8154324(bool8 a0);
static void sub_81543E8(struct Sprite * sprite);
static s16 sub_8154608(u8 a0, u8 a1);
static void sub_8154A08(u8 taskId);
static void sub_8154A2C(void);
static void sub_8154B34(void);
static void sub_8154F80(void);
static void sub_81556E0(void);
static void sub_8155A78(void);
static void sub_8155B4C(void);
static void sub_8155C2C(void);
static void sub_8155C80(void);
static void unused_0(void);
static void nullsub_98(void);
static void sub_8155E24(MainCallback cb);
MainCallback sub_8155E54(void);
static void sub_8155EA0(void);
static bool32 sub_8155FE0(void);

// Assets in this header are duplicated
#include "data/dodrio_berry_picking.h"

static const struct OamData sOamData_8478C98 =
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

static const struct OamData sOamData_8478CA0 =
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

static const struct OamData sOamData_8478CA8 =
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

static const struct OamData sOamData_8478CB0 =
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

static const union AnimCmd sSpriteAnim_8478CB8[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sSpriteAnim_8478CC0[] =
{
    ANIMCMD_FRAME(64, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sSpriteAnim_8478CC8[] =
{
    ANIMCMD_FRAME(128, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sSpriteAnim_8478CD0[] =
{
    ANIMCMD_FRAME(192, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sSpriteAnim_8478CD8[] =
{
    ANIMCMD_FRAME(256, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const sSpriteAnimTable_8478CE0[] =
{
    sSpriteAnim_8478CB8,
    sSpriteAnim_8478CC0,
    sSpriteAnim_8478CC8,
    sSpriteAnim_8478CD0,
    sSpriteAnim_8478CD8
};

static const union AnimCmd sSpriteAnim_8478CF4[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sSpriteAnim_8478CFC[] =
{
    ANIMCMD_FRAME(4, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sSpriteAnim_8478D04[] =
{
    ANIMCMD_FRAME(8, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const sSpriteAnimTable_8478D0C[] =
{
    sSpriteAnim_8478CF4,
    sSpriteAnim_8478CFC,
    sSpriteAnim_8478D04
};

static const union AnimCmd sSpriteAnim_8478D18[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sSpriteAnim_8478D20[] =
{
    ANIMCMD_FRAME(4, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sSpriteAnim_8478D28[] =
{
    ANIMCMD_FRAME(8, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sSpriteAnim_8478D30[] =
{
    ANIMCMD_FRAME(12, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sSpriteAnim_8478D38[] =
{
    ANIMCMD_FRAME(16, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sSpriteAnim_8478D40[] =
{
    ANIMCMD_FRAME(20, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sSpriteAnim_8478D48[] =
{
    ANIMCMD_FRAME(24, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sSpriteAnim_8478D50[] =
{
    ANIMCMD_FRAME(28, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sSpriteAnim_8478D58[] =
{
    ANIMCMD_FRAME(32, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const sSpriteAnimTable_8478D60[] =
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

static const union AnimCmd sSpriteAnim_8478D84[] =
{
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const sSpriteAnimTable_8478D8C[] =
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

void sub_8153AFC(struct DodrioSubstruct_318C * arg0, u8 arg1, u8 id, u8 arg3)
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

static void sub_8153B9C(struct Sprite * sprite)
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
    struct Sprite * sprite = &gSprites[*gUnknown_203F3E4[GetMultiplayerId()]];
    sprite->data[0] = 1;
    sprite->data[1] = 0;
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
}

void sub_8153BF8(u8 unused)
{
    struct Sprite * sprite = &gSprites[*gUnknown_203F3E4[GetMultiplayerId()]];
    sprite->data[0] = 2;
    sprite->data[1] = 0;
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
}

static u32 sub_8153C30(struct Sprite * sprite)
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

        sprite->x += var;
        if (++sprite->data[1] >= 40)
        {
            sprite->data[0] = 0;
            sprite->x = sub_8154608(0, sub_81533B4());
        }
    }

    return 0;
}

static u32 sub_8153CA0(struct Sprite * sprite)
{
    u8 mod = (++sprite->data[1] / 13) % 4;

    if (sprite->data[1] % 13 == 0 && mod != 0)
        PlaySE(SE_M_CHARM);
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
        struct Sprite * sprite = &gSprites[*gUnknown_203F3E4[i]];
        if (sprite != NULL)
            DestroySpriteAndFreeResources(sprite);
        // Memory should be freed here but is not.
    }
}

static void sub_8153D48(bool8 invisible, u8 id)
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

static void nullsub_97(struct Sprite * sprite)
{

}

void sub_8153DD8(void)
{
    u8 i;
    for (i = 0; i < 10; i++)
    {
        struct Sprite * sprite = &gSprites[gUnknown_203F43C->unk2A[i]];
        sprite->x = (i * 16) + 48;
        sprite->y = -8 - (i * 8);
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
        struct Sprite * sprite = &gSprites[gUnknown_203F43C->unk2A[i]];
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
        struct Sprite * sprite = &gSprites[gUnknown_203F43C->unk2A[i]];
        gUnknown_203F43C->unk16[i] = 2;
        if (gUnknown_203F43C->unkC[i] != 0 && sprite->y == 8)
            continue;
        r3 = TRUE;
        if (sprite->y == 8)
        {
            if (gUnknown_203F43C->unkC[i] != 0)
                continue;
            gUnknown_203F43C->unkC[i] = 1;
            gUnknown_203F43C->unk16[i] = -16;
            PlaySE(SE_CLICK);
        }
        sprite->y += gUnknown_203F43C->unk16[i];
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
static const u8 sUnused2[] = {
    SE_M_CHARM,
    SE_NOTE_C,
    SE_NOTE_D,
    SE_NOTE_E,
    SE_NOTE_F,
    SE_NOTE_G,
    SE_NOTE_A,
    SE_NOTE_B,
    SE_NOTE_C_HIGH,
    SE_CARD_OPEN
};

void sub_8154128(void)
{
    void *ptr = AllocZeroed(0x480);
    struct SpritePalette sprPal = {sDodrioBerrySpritesPal, 3};

    LZ77UnCompWram(sDodrioBerrySpritesGfx, ptr);
    if (ptr != NULL) // This should be one line up
    {
        struct SpriteSheet sprSheet = {ptr, 0x480, 2};
        LoadSpriteSheet(&sprSheet);
    }

    LoadSpritePalette(&sprPal);
    Free(ptr);
}

static const s16 sUnknown_8478DD4[] = {88, 128, 168, 208};

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
    struct Sprite * sprite;
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

static void sub_8154324(bool8 invisible)
{
    u8 i;
    for (i = 0; i < 4; i++)
        gSprites[*gUnknown_203F42C[i]].invisible = invisible;
}

void sub_8154370(u8 id, u8 y)
{
    gSprites[*gUnknown_203F400[id]].y = y * 8;
}

void sub_8154398(u16 id, u8 frameNum)
{
    StartSpriteAnim(&gSprites[*gUnknown_203F400[id]], frameNum);
}

// Unused
static void sub_81543C4(u8 spriteId)
{
    gSprites[spriteId].x = 20 * spriteId + 50;
    gSprites[spriteId].y = 50;
}

// Gamefreak made a mistake there and goes out of bounds for the data array as it holds 8 elements
// in turn overwriting sprite's subpriority and subsprites fields.
#if defined(BUGFIX)
#define sKeepPosX data[1]
#else
#define sKeepPosX data[10]
#endif // BUGFIX

static void sub_81543E8(struct Sprite * sprite)
{
    u8 i;
    static const u8 array[] = {30, 20};

    if (sprite->sKeepPosX != TRUE)
    {
        for (i = 0; i < 2; i++)
        {
            if (++gUnknown_203F3F8[i][1] > array[i])
            {
                sprite->x--;
                gUnknown_203F3F8[i][1] = 0;
            }
        }
    }
}

static const s16 gUnknown_8478E0E[][2] = {{230, 55}, {30, 74}};

void sub_8154438(void)
{
    u8 i;
    void *ptr = AllocZeroed(0x400);
    struct SpritePalette sprPal = {sDodrioBerryPlatformPal, 6};

    LZ77UnCompWram(sDodrioBerryPlatformGfx, ptr);
    if (ptr != NULL) // This should be one line up
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
        struct Sprite * sprite = &gSprites[*gUnknown_203F3F8[i]];
        sprite->sKeepPosX = TRUE;
        sprite->x = gUnknown_8478E0E[i][0];
        sprite->y = gUnknown_8478E0E[i][1];
    }
}

void sub_8154540(void)
{
    u8 i;
    for (i = 0; i < 2; i++)
    {
        struct Sprite * sprite = &gSprites[*gUnknown_203F3F8[i]];
        sprite->sKeepPosX = FALSE;
    }
}

void sub_8154578(void)
{
    u8 i;
    for (i = 0; i < 2; i++)
    {
        struct Sprite * sprite = &gSprites[*gUnknown_203F3F8[i]];
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

static s16 sub_8154608(u8 arg0, u8 arg1)
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

static void sub_81546EC(u8 frameId)
{
    LoadBgTiles(0, GetUserFrameGraphicsInfo(frameId)->tiles, 0x120, 1);
    LoadPalette(GetUserFrameGraphicsInfo(frameId)->palette, 0xA0, 0x20);
}

static void sub_8154720(void)
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

static void sub_8154768(const struct WindowTemplate * winTempl)
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

static void sub_8154868(const struct WindowTemplate * winTempl)
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

void sub_8154968(struct DodrioSubstruct_0160 * ptr)
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

static void sub_81549C8(void)
{
    FreeAllWindowBuffers();
}

struct WinCoords
{
    u8 left;
    u8 top;
};

static const u8 sTextColorTable[][3] =
{
    {
        TEXT_COLOR_WHITE,
        TEXT_COLOR_DARK_GRAY,
        TEXT_COLOR_LIGHT_GRAY
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

static const struct WinCoords sUnknown_8478E44[] = {{12, 6}};
static const struct WinCoords sUnknown_8478E48[] = {{9, 10}, {15, 6}};
static const struct WinCoords sUnknown_8478E50[] = {{12, 6}, {18, 10}, {6, 10}};
static const struct WinCoords sUnknown_8478E5C[] = {{9, 10}, {15, 6}, {21, 10}, {3, 6}};
static const struct WinCoords sUnknown_8478E6C[] = {{12, 6}, {18, 10}, {23, 6}, {1, 6}, {6, 10}};

static const struct WinCoords * const sUnknown_8478E80[] =
{
    sUnknown_8478E44,
    sUnknown_8478E48,
    sUnknown_8478E50,
    sUnknown_8478E5C,
    sUnknown_8478E6C,
};

static const u8 *const sUnknown_8478E94[] =
{
    gText_1Colon,
    gText_2Colon,
    gText_3Colon,
    gText_4Colon,
    gText_5Colon,
};

static const u16 sUnknown_8478EA8[] = {92, 132, 172, 212};
static const u16 sUnknown_8478EB0[] = {30, 45, 60, 75, 90};
static const u16 sUnknown_8478EBA[] = {12, 28, 44, 60, 76};

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

static void sub_8154A08(u8 taskId)
{
    if (!gUnknown_203F440->finished)
        sub_8155E54()();
}

static void sub_8154A2C(void)
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

static void sub_8154B34(void)
{
    u8 i, playersCount, id, colorsId, *name;
    u32 left;
    struct WindowTemplate window;
    const struct WinCoords * ptr;

    switch (gUnknown_203F440->state)
    {
    case 0:
        playersCount = sub_81533B4();
        ptr = sUnknown_8478E80[playersCount - 1];
        window.bg = 0;
        window.width = 7;
        window.height = 2;
        window.paletteNum = 0xD;
        window.baseBlock = 0x13;
        for (i = 0; i < playersCount; ptr++, i++)
        {
            colorsId = 0;
            id = sub_81537AC(i);
            left = (56 - GetStringWidth(0, sub_81533C4(id), -1)) / 2u;
            window.tilemapLeft = ptr->left;
            window.tilemapTop = ptr->top;
            gUnknown_203F440->unk3008[i] = AddWindow(&window);
            ClearWindowTilemap(gUnknown_203F440->unk3008[i]);
            FillWindowPixelBuffer(gUnknown_203F440->unk3008[i], PIXEL_FILL(1));
            if (id == GetMultiplayerId())
                colorsId = 2;
            name = sub_81533C4(id);
            AddTextPrinterParameterized3(gUnknown_203F440->unk3008[i], 0, left, 1, sTextColorTable[colorsId], -1, name);
            CopyWindowToVram(gUnknown_203F440->unk3008[i], COPYWIN_GFX);
            window.baseBlock += 0xE;
            sub_8154868(&window);
        }
        gUnknown_203F440->state++;
        break;
    case 1:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            playersCount = sub_81533B4();
            for (i = 0; i < playersCount; i++)
                PutWindowTilemap(gUnknown_203F440->unk3008[i]);
            CopyBgTilemapBufferToVram(0);
            gUnknown_203F440->state++;
        }
        break;
    default:
        if (++gUnknown_203F440->state > 180)
        {
            playersCount = sub_81533B4();
            for (i = 0; i < playersCount; i++)
            {
                ClearWindowTilemap(gUnknown_203F440->unk3008[i]);
                RemoveWindow(gUnknown_203F440->unk3008[i]);
            }
            FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
            CopyBgTilemapBufferToVram(0);
            gUnknown_203F440->finished = TRUE;
        }
        break;
    }
}

static void sub_8154D9C(u8 playersCount_)
{
    u8 i, r8 = 0, r6 = 0;
    u8 playersCount = playersCount_; // Pointless variable, I know, but it's needed to match.
    u8 *name;
    u32 x, numWidth;
    u8 numString[32];
    u8 array[5] = {0, 1, 2, 3, 4};
    struct DodrioSubstruct_3308 temp, structArray[5];

    for (i = 0; i < playersCount; i++)
    {
        array[i] = i;
        sub_81536A0(&temp, i);
        structArray[i] = temp;
    }

    if (sub_81534AC() != 0)
    {
        do
        {
            for (i = 0; i < playersCount; i++)
            {
                if (structArray[i].unk0 == r8)
                {
                    array[r6] = i;
                    r6++;
                }
            }
            r8 = r6;
        } while (r6 < playersCount);
    }

    for (i = 0; i < playersCount; i++)
    {
        if (structArray[i].unk4 == 0)
            structArray[i].unk0 = playersCount - 1;
    }

    x = 216 - GetStringWidth(0, gText_SpacePoints, 0);
    for (i = 0; i < playersCount; i++)
    {
        u8 colorsId = 0;
        u8 id = array[i];
        u32 points = structArray[id].unk4;

        AddTextPrinterParameterized(gUnknown_203F440->unk3008[1], 0, sUnknown_8478E94[structArray[id].unk0], 8, sUnknown_8478EBA[i], -1, NULL);
        if (id == GetMultiplayerId())
            colorsId = 2;
        name = sub_81533C4(id);
        AddTextPrinterParameterized3(gUnknown_203F440->unk3008[1], 0, 28, sUnknown_8478EBA[i], sTextColorTable[colorsId], -1, name);
        ConvertIntToDecimalStringN(numString, points, STR_CONV_MODE_RIGHT_ALIGN, 7);
        numWidth = GetStringWidth(0, numString, -1);
        AddTextPrinterParameterized(gUnknown_203F440->unk3008[1], 0, numString, x - 35, sUnknown_8478EBA[i], -1, NULL);
        AddTextPrinterParameterized(gUnknown_203F440->unk3008[1], 0, gText_SpacePoints, x, sUnknown_8478EBA[i], -1, NULL);
    }
}

static void sub_8154F80(void)
{
    u8 i, j, itemGiveRet, playersCount = sub_81533B4();
    u8 *name;
    u32 strWidth, x;
    u8 sp0C[100];
    u8 sp70[20];

    switch (gUnknown_203F440->state)
    {
    case 0:
        sub_81535B0();
        gUnknown_203F440->unk301C = 0;
        gUnknown_203F440->state++;
        break;
    case 1:
        gUnknown_203F440->unk3008[0] = AddWindow(&sUnknown_8475674[0]);
        gUnknown_203F440->unk3008[1] = AddWindow(&sUnknown_8475674[1]);
        ClearWindowTilemap(gUnknown_203F440->unk3008[0]);
        ClearWindowTilemap(gUnknown_203F440->unk3008[1]);
        sub_8154868(&sUnknown_8475674[0]);
        sub_8154868(&sUnknown_8475674[1]);
        gUnknown_203F440->state++;
        break;
    case 2:
        FillWindowPixelBuffer(gUnknown_203F440->unk3008[0], PIXEL_FILL(1));
        FillWindowPixelBuffer(gUnknown_203F440->unk3008[1], PIXEL_FILL(1));
        strWidth = GetStringWidth(0, gText_BerryPickingResults, -1);
        x = (224 - strWidth) / 2;
        AddTextPrinterParameterized(gUnknown_203F440->unk3008[0], 0, gText_BerryPickingResults, x, 2, -1, NULL);
        AddTextPrinterParameterized(gUnknown_203F440->unk3008[1], 0, gText_10P30P50P50P, 68, 16, -1, NULL);
        for (i = 0; i < playersCount; i++)
        {
            u8 colorsId = 0;
            if (i == GetMultiplayerId())
                colorsId = 2;

            name = sub_81533C4(i);
            AddTextPrinterParameterized3(gUnknown_203F440->unk3008[1], 0, 2, sUnknown_8478EB0[i], sTextColorTable[colorsId], -1, name);
            for (j = 0; j < 4; j++)
            {
                u32 width;
                u16 result1 = Min(sub_8153404(i, j), 9999);
                u16 result2 = Min(sub_81534F0(j), 9999);

                ConvertIntToDecimalStringN(sp0C, result1, STR_CONV_MODE_LEFT_ALIGN, 4);
                width = GetStringWidth(0, sp0C, -1);
                if (result2 == result1 && result2 != 0)
                    AddTextPrinterParameterized3(gUnknown_203F440->unk3008[1], 0, sUnknown_8478EA8[j] - width, sUnknown_8478EB0[i], sTextColorTable[1], -1, sp0C);
                else
                    AddTextPrinterParameterized(gUnknown_203F440->unk3008[1], 0, sp0C, sUnknown_8478EA8[j] - width, sUnknown_8478EB0[i], -1, NULL);
            }
        }
        CopyWindowToVram(gUnknown_203F440->unk3008[0], COPYWIN_GFX);
        CopyWindowToVram(gUnknown_203F440->unk3008[1], COPYWIN_GFX);
        gUnknown_203F440->state++;
        break;
    case 3:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            PutWindowTilemap(gUnknown_203F440->unk3008[0]);
            PutWindowTilemap(gUnknown_203F440->unk3008[1]);
        }
        CopyBgTilemapBufferToVram(0);
        sub_8154324(FALSE);
        gUnknown_203F440->state++;
        break;
    case 4:
        if (++gUnknown_203F440->unk301C >= 30 && JOY_NEW(A_BUTTON))
        {
            gUnknown_203F440->unk301C = 0;
            PlaySE(SE_SELECT);
            sub_8154324(TRUE);
            gUnknown_203F440->state++;
        }
        break;
    case 5:
        FillWindowPixelBuffer(gUnknown_203F440->unk3008[0], PIXEL_FILL(1));
        FillWindowPixelBuffer(gUnknown_203F440->unk3008[1], PIXEL_FILL(1));
        strWidth = GetStringWidth(0, gText_AnnouncingRankings, -1);
        x = (224 - strWidth) / 2;
        AddTextPrinterParameterized(gUnknown_203F440->unk3008[0], 0, gText_AnnouncingRankings, x, 2, -1, NULL);
        gUnknown_203F440->state++;
        break;
    case 6:
        sub_8154D9C(playersCount);
        CopyWindowToVram(gUnknown_203F440->unk3008[0], COPYWIN_GFX);
        CopyWindowToVram(gUnknown_203F440->unk3008[1], COPYWIN_GFX);
        gUnknown_203F440->state++;
        break;
    case 7:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            PutWindowTilemap(gUnknown_203F440->unk3008[0]);
            PutWindowTilemap(gUnknown_203F440->unk3008[1]);
        }
        CopyBgTilemapBufferToVram(0);
        gUnknown_203F440->state++;
        break;
    case 8:
        if (++gUnknown_203F440->unk301C >= 30 && JOY_NEW(A_BUTTON))
        {
            gUnknown_203F440->unk301C = 0;
            PlaySE(SE_SELECT);
            if (sub_81534AC() < 3000)
            {
                gUnknown_203F440->state = 127;
            }
            else
            {
                StopMapMusic();
                gUnknown_203F440->state++;
            }

            FillBgTilemapBufferRect_Palette0(0, 0, 0, 5, 30, 15);
            RemoveWindow(gUnknown_203F440->unk3008[1]);
            gUnknown_203F440->unk3008[1] = AddWindow(&sUnknown_8475684);
            ClearWindowTilemap(gUnknown_203F440->unk3008[1]);
            sub_8154868(&sUnknown_8475684);
        }
        break;
    case 9:
        PlayNewMapMusic(MUS_LEVEL_UP);
        FillWindowPixelBuffer(gUnknown_203F440->unk3008[0], PIXEL_FILL(1));
        FillWindowPixelBuffer(gUnknown_203F440->unk3008[1], PIXEL_FILL(1));
        strWidth = GetStringWidth(0, gText_AnnouncingPrizes, -1);
        x = (224 - strWidth) / 2;
        AddTextPrinterParameterized(gUnknown_203F440->unk3008[0], 0, gText_AnnouncingPrizes, x, 2, -1, NULL);
        DynamicPlaceholderTextUtil_Reset();
        CopyItemName(sub_8153390(), sp70);
        DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, sp70);
        DynamicPlaceholderTextUtil_ExpandPlaceholders(sp0C, gText_FirstPlacePrize);
        AddTextPrinterParameterized(gUnknown_203F440->unk3008[1], 0, sp0C, 8, 2, -1, NULL);
        itemGiveRet = sub_815372C();
        if (itemGiveRet != 0 && itemGiveRet != 3)
        {
            DynamicPlaceholderTextUtil_Reset();
            CopyItemName(sub_8153390(), sp70);
            DynamicPlaceholderTextUtil_SetPlaceholderPtr(0, sp70);
            if (itemGiveRet == 2)
                DynamicPlaceholderTextUtil_ExpandPlaceholders(sp0C, gText_CantHoldAnyMore);
            else if (itemGiveRet == 1)
                DynamicPlaceholderTextUtil_ExpandPlaceholders(sp0C, gText_FilledStorageSpace);
            AddTextPrinterParameterized(gUnknown_203F440->unk3008[1], 0, sp0C, 8, 40, -1, NULL);
        }
        CopyWindowToVram(gUnknown_203F440->unk3008[0], COPYWIN_GFX);
        CopyWindowToVram(gUnknown_203F440->unk3008[1], COPYWIN_GFX);
        gUnknown_203F440->state++;
        break;
    case 10:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            PutWindowTilemap(gUnknown_203F440->unk3008[0]);
            PutWindowTilemap(gUnknown_203F440->unk3008[1]);
        }
        CopyBgTilemapBufferToVram(0);
        FadeOutAndFadeInNewMapMusic(MUS_VICTORY_WILD, 20, 10);
        gUnknown_203F440->state++;
        break;
    case 11:
        if (++gUnknown_203F440->unk301C >= 30 && JOY_NEW(A_BUTTON))
        {
            gUnknown_203F440->unk301C = 0;
            PlaySE(SE_SELECT);
            gUnknown_203F440->state++;
        }
        break;
    default:
        ClearWindowTilemap(gUnknown_203F440->unk3008[0]);
        ClearWindowTilemap(gUnknown_203F440->unk3008[1]);
        RemoveWindow(gUnknown_203F440->unk3008[0]);
        RemoveWindow(gUnknown_203F440->unk3008[1]);
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
        CopyBgTilemapBufferToVram(0);
        gUnknown_203F440->finished = TRUE;
        break;
    }
}

static void sub_81556E0(void)
{
    u8 y;

    switch (gUnknown_203F440->state)
    {
    case 0:
        gUnknown_203F440->unk3008[0] = AddWindow(&sUnknown_847568C[0]);
        gUnknown_203F440->unk3008[1] = AddWindow(&sUnknown_847568C[1]);
        ClearWindowTilemap(gUnknown_203F440->unk3008[0]);
        ClearWindowTilemap(gUnknown_203F440->unk3008[1]);
        sub_8154868(&sUnknown_847568C[0]);
        sub_8154768(&sUnknown_847568C[1]);
        gUnknown_203F440->state++;
        gUnknown_203F440->unk3020 = 0;
        gUnknown_203F440->unk3024 = 0;
        break;
    case 1:
        FillWindowPixelBuffer(gUnknown_203F440->unk3008[0], PIXEL_FILL(1));
        FillWindowPixelBuffer(gUnknown_203F440->unk3008[1], PIXEL_FILL(1));
        AddTextPrinterParameterized(gUnknown_203F440->unk3008[0], 2, gText_WantToPlayAgain, 0, 6, -1, NULL);
        AddTextPrinterParameterized(gUnknown_203F440->unk3008[1], 2, gText_Yes, 8, 2, -1, NULL);
        AddTextPrinterParameterized(gUnknown_203F440->unk3008[1], 2, gText_No, 8, 16, -1, NULL);
        AddTextPrinterParameterized(gUnknown_203F440->unk3008[1], 2, gText_SelectorArrow2, 0, 2, -1, NULL);
        CopyWindowToVram(gUnknown_203F440->unk3008[0], COPYWIN_GFX);
        CopyWindowToVram(gUnknown_203F440->unk3008[1], COPYWIN_GFX);
        gUnknown_203F440->state++;
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            PutWindowTilemap(gUnknown_203F440->unk3008[0]);
            PutWindowTilemap(gUnknown_203F440->unk3008[1]);
        }
        CopyBgTilemapBufferToVram(0);
        gUnknown_203F440->state++;
        break;
    case 3:
        y = gUnknown_203F440->unk3020;
        if (y == 0)
            y = 1;
        FillWindowPixelBuffer(gUnknown_203F440->unk3008[1], PIXEL_FILL(1));
        AddTextPrinterParameterized(gUnknown_203F440->unk3008[1], 2, gText_Yes, 8, 2, -1, NULL);
        AddTextPrinterParameterized(gUnknown_203F440->unk3008[1], 2, gText_No, 8, 16, -1, NULL);
        AddTextPrinterParameterized(gUnknown_203F440->unk3008[1], 2, gText_SelectorArrow2, 0, y == 1 ? 2 : 16, -1, NULL);
        CopyWindowToVram(gUnknown_203F440->unk3008[1], COPYWIN_BOTH);
        // Increment state only if A or B button have been pressed.
        if (JOY_NEW(A_BUTTON))
        {
            PlaySE(SE_SELECT);
            if (gUnknown_203F440->unk3020 == 0)
                gUnknown_203F440->unk3020 = 1;
            gUnknown_203F440->state++;
        }
        else if (JOY_NEW(DPAD_UP | DPAD_DOWN))
        {
            PlaySE(SE_SELECT);
            switch (gUnknown_203F440->unk3020)
            {
            case 0:
                gUnknown_203F440->unk3020 = 2;
                break;
            case 1:
                gUnknown_203F440->unk3020 = 2;
                break;
            case 2:
                gUnknown_203F440->unk3020 = 1;
                break;
            }
        }
        else if (JOY_NEW(B_BUTTON))
        {
            PlaySE(SE_SELECT);
            gUnknown_203F440->unk3020 = 2;
            gUnknown_203F440->state++;
        }
        break;
    default:
        gUnknown_203F440->unk3024 = gUnknown_203F440->unk3020;
        ClearWindowTilemap(gUnknown_203F440->unk3008[0]);
        ClearWindowTilemap(gUnknown_203F440->unk3008[1]);
        RemoveWindow(gUnknown_203F440->unk3008[0]);
        RemoveWindow(gUnknown_203F440->unk3008[1]);
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
        CopyBgTilemapBufferToVram(0);
        gUnknown_203F440->finished = TRUE;
        break;
    }
}

static void sub_8155A78(void)
{
    switch (gUnknown_203F440->state)
    {
    case 0:
        DrawDialogueFrame(0, FALSE);
        AddTextPrinterParameterized2(0, 2, gText_SavingDontTurnOffThePower2, 0, NULL, TEXT_COLOR_DARK_GRAY, TEXT_COLOR_WHITE, TEXT_COLOR_LIGHT_GRAY);
        gUnknown_203F440->state++;
        break;
    case 1:
        CopyWindowToVram(0, COPYWIN_BOTH);
        gUnknown_203F440->state++;
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
        {
            CreateTask(Task_LinkSave, 0);
            gUnknown_203F440->state++;
        }
        break;
    case 3:
        if (!FuncIsActiveTask(Task_LinkSave))
            gUnknown_203F440->state++;
        break;
    default:
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
        CopyBgTilemapBufferToVram(0);
        gUnknown_203F440->finished = TRUE;
        break;
    }
}

static void sub_8155B4C(void)
{
    switch (gUnknown_203F440->state)
    {
    case 0:
        gUnknown_203F440->unk3008[0] = AddWindow(&sUnknown_84756A4);
        ClearWindowTilemap(gUnknown_203F440->unk3008[0]);
        sub_8154868(&sUnknown_84756A4);
        gUnknown_203F440->state++;
        break;
    case 1:
        FillWindowPixelBuffer(gUnknown_203F440->unk3008[0], PIXEL_FILL(1));
        AddTextPrinterParameterized(gUnknown_203F440->unk3008[0], 2, gText_CommunicationStandby3, 0, 6, -1, NULL);
        CopyWindowToVram(gUnknown_203F440->unk3008[0], COPYWIN_GFX);
        gUnknown_203F440->state++;
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
            PutWindowTilemap(gUnknown_203F440->unk3008[0]);
        CopyBgTilemapBufferToVram(0);
        gUnknown_203F440->state++;
        break;
    default:
        gUnknown_203F440->finished = TRUE;
        break;
    }
}

static void sub_8155C2C(void)
{
    ClearWindowTilemap(gUnknown_203F440->unk3008[0]);
    RemoveWindow(gUnknown_203F440->unk3008[0]);
    FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
    CopyBgTilemapBufferToVram(0);
    gUnknown_203F440->finished = TRUE;
}

static void sub_8155C80(void)
{
    switch (gUnknown_203F440->state)
    {
    case 0:
        gUnknown_203F440->unk3008[0] = AddWindow(&sUnknown_847569C);
        ClearWindowTilemap(gUnknown_203F440->unk3008[0]);
        sub_8154868(&sUnknown_847569C);
        gUnknown_203F440->state++;
        gUnknown_203F440->unk301C = 0;
        gUnknown_203F440->unk3020 = 0;
        gUnknown_203F440->unk3024 = 0;
        break;
    case 1:
        FillWindowPixelBuffer(gUnknown_203F440->unk3008[0], PIXEL_FILL(1));
        AddTextPrinterParameterized(gUnknown_203F440->unk3008[0], 2, gText_SomeoneDroppedOut, 0, 6, TEXT_SKIP_DRAW, NULL);
        CopyWindowToVram(gUnknown_203F440->unk3008[0], COPYWIN_GFX);
        gUnknown_203F440->state++;
        break;
    case 2:
        if (!IsDma3ManagerBusyWithBgCopy())
            PutWindowTilemap(gUnknown_203F440->unk3008[0]);
        CopyBgTilemapBufferToVram(0);
        gUnknown_203F440->state++;
        break;
    case 3:
        if (++gUnknown_203F440->unk301C >= 120)
            gUnknown_203F440->state++;
        break;
    default:
        gUnknown_203F440->unk3024 = 5;
        ClearWindowTilemap(gUnknown_203F440->unk3008[0]);
        RemoveWindow(gUnknown_203F440->unk3008[0]);
        FillBgTilemapBufferRect_Palette0(0, 0, 0, 0, 30, 20);
        CopyBgTilemapBufferToVram(0);
        gUnknown_203F440->finished = TRUE;
        break;
    }
}

static void unused_0(void)
{
    DestroyTask(gUnknown_203F440->unk3004);
    gUnknown_203F440->finished = TRUE;
}

static void nullsub_98(void)
{

}

static void sub_8155E24(void (*func)(void))
{
    gUnknown_203F440->state = 0;
    gUnknown_203F440->finished = FALSE;
    gUnknown_203F440->unk3028 = func;
}

void (*sub_8155E54(void))(void)
{
    return gUnknown_203F440->unk3028;
}

bool32 sub_8155E68(void)
{
    if (gUnknown_203F440->finished == TRUE)
        return FALSE;
    else
        return TRUE;
}

u8 sub_8155E8C(void)
{
    return gUnknown_203F440->unk3024;
}

static void sub_8155EA0(void)
{
    DmaClearLarge16(3, (void *)VRAM, VRAM_SIZE, 0x1000);
    DmaClear32(3,(void *)OAM, OAM_SIZE);
    DmaClear16(3, (void *)PLTT, PLTT_SIZE);
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, sUnknown_847565C, NELEMS(sUnknown_847565C));
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
    InitStandardTextBoxWindows();
    InitTextBoxGfxAndPrinters();
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_OBJ_ON | DISPCNT_OBJ_1D_MAP);
    SetBgTilemapBuffer(3, gUnknown_203F440->tilemapBuffers[0]);
    SetBgTilemapBuffer(1, gUnknown_203F440->tilemapBuffers[1]);
    SetBgTilemapBuffer(2, gUnknown_203F440->tilemapBuffers[2]);
}

static bool32 sub_8155FE0(void)
{
    switch (gUnknown_203F440->unk3018)
    {
    case 0:
        LoadPalette(sDodrioBerryBgPal1, 0, sizeof(sDodrioBerryBgPal1));
        break;
    case 1:
        ResetTempTileDataBuffers();
        break;
    case 2:
        DecompressAndCopyTileDataToVram(3, sDodrioBerryBgGfx1, 0, 0, 0);
        break;
    case 3:
        DecompressAndCopyTileDataToVram(1, sDodrioBerryBgGfx2, 0, 0, 0);
        break;
    case 4:
        if (FreeTempTileDataBuffersIfPossible() == TRUE)
            return FALSE;
        break;
    case 5:
        LoadPalette(stdpal_get(3), 0xD0, 0x20);
        break;
    default:
        gUnknown_203F440->unk3018 = 0;
        return TRUE;
    }

    gUnknown_203F440->unk3018++;
    return FALSE;
}
