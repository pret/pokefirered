#include "global.h"
#include "gflib.h"
#include "event_data.h"
#include "graphics.h"
#include "new_menu_helpers.h"
#include "pokemon_icon.h"
#include "pokemon_storage_system_internal.h"
#include "strings.h"
#include "task.h"
#include "trig.h"

static void sub_8090324(struct Sprite * sprite);
static void SetBoxSpeciesAndPersonalities(u8 boxId);
static void sub_8090A74(struct Sprite * sprite, u16 idx);
static void sub_8090AE0(struct Sprite * sprite);
static void DestroyBoxMonIcon(struct Sprite * sprite);
static void sub_80911B0(struct Sprite * sprite);
static void sub_8091420(u8 taskId);
static s8 sub_80916F4(u8 boxId);
static void LoadWallpaperGfx(u8 wallpaperId, s8 direction);
static bool32 WaitForWallpaperGfxLoad(void);
static void sub_8091984(void *buffer, const void *buffer2, s8 direction, u8 baseBlock);
static void sub_8091A24(void *buffer);
static void sub_8091A94(u8 wallpaperId);
static void sub_8091C48(u8 wallpaperId, s8 direction);
static void sub_8091E84(struct Sprite * sprite);
static void sub_8091EB8(struct Sprite * sprite);
static s16 sub_8091F60(const u8 *boxName);
static void sub_8091E34(void);
static void sub_8091EF0(void);
static void sub_8091F80(void);
static void sub_809200C(s8 direction);
static void sub_80920AC(void);
static void sub_8092164(struct Sprite * sprite);

static const struct OamData gUnknown_83CEC08;

static const struct SpriteTemplate gUnknown_83CEBF0 = {
    .tileTag = TAG_TILE_12,
    .paletteTag = TAG_PAL_DAC0,
    .oam = &gUnknown_83CEC08,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData gUnknown_83CEC08 = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(32x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x32),
    .tileNum = 0x000,
    .priority = 0,
    .paletteNum = 0
};

static const union AffineAnimCmd gUnknown_83CEC10[] = {
    AFFINEANIMCMD_FRAME(-2, -2, 0, 120),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd gUnknown_83CEC20[] = {
    AFFINEANIMCMD_FRAME(16, 16, 0,  0),
    AFFINEANIMCMD_FRAME(16, 16, 0, 15),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const gUnknown_83CEC38[] = {
    gUnknown_83CEC10,
    gUnknown_83CEC20
};

static const u16 gUnknown_83CEC40[] = INCBIN_U16("graphics/interface/pss_unk_83CEC40.gbapal");
static const u32 gUnknown_83CEC80[] = INCBIN_U32("graphics/interface/pss_unk_83CEC80.4bpp.lz");
static const u32 gUnknown_83CF050[] = INCBIN_U32("graphics/interface/pss_unk_83CF050.bin.lz");
static const u16 gUnknown_83CF12C[] = INCBIN_U16("graphics/interface/pss_unk_83CF12C.gbapal");
static const u32 gUnknown_83CF16C[] = INCBIN_U32("graphics/interface/pss_unk_83CF16C.4bpp.lz");
static const u32 gUnknown_83CF374[] = INCBIN_U32("graphics/interface/pss_unk_83CF374.bin.lz");
static const u16 gUnknown_83CF424[] = INCBIN_U16("graphics/interface/pss_unk_83CF424.gbapal");
static const u32 gUnknown_83CF464[] = INCBIN_U32("graphics/interface/pss_unk_83CF464.4bpp.lz");
static const u32 gUnknown_83CF750[] = INCBIN_U32("graphics/interface/pss_unk_83CF750.bin.lz");
static const u16 gUnknown_83CF834[] = INCBIN_U16("graphics/interface/pss_unk_83CF834.gbapal");
static const u32 gUnknown_83CF874[] = INCBIN_U32("graphics/interface/pss_unk_83CF874.4bpp.lz");
static const u32 gUnknown_83CFA94[] = INCBIN_U32("graphics/interface/pss_unk_83CFA94.bin.lz");
static const u16 gUnknown_83CFB60[] = INCBIN_U16("graphics/interface/pss_unk_83CFB60.gbapal");
static const u32 gUnknown_83CFBA0[] = INCBIN_U32("graphics/interface/pss_unk_83CFBA0.4bpp.lz");
static const u32 gUnknown_83CFEF0[] = INCBIN_U32("graphics/interface/pss_unk_83CFEF0.bin.lz");
static const u16 gUnknown_83CFFC8[] = INCBIN_U16("graphics/interface/pss_unk_83CFFC8.gbapal");
static const u32 gUnknown_83D0008[] = INCBIN_U32("graphics/interface/pss_unk_83D0008.4bpp.lz");
static const u8 sSpace_83D0338[4] = {};
static const u32 gUnknown_83D033C[] = INCBIN_U32("graphics/interface/pss_unk_83D033C.bin.lz");
static const u16 gUnknown_83D0414[] = INCBIN_U16("graphics/interface/pss_unk_83D0414.gbapal");
static const u32 gUnknown_83D0454[] = INCBIN_U32("graphics/interface/pss_unk_83D0454.4bpp.lz");
static const u32 gUnknown_83D070C[] = INCBIN_U32("graphics/interface/pss_unk_83D070C.bin.lz");
static const u16 gUnknown_83D07D8[] = INCBIN_U16("graphics/interface/pss_unk_83D07D8.gbapal");
static const u32 gUnknown_83D0818[] = INCBIN_U32("graphics/interface/pss_unk_83D0818.4bpp.lz");
static const u32 gUnknown_83D0B5C[] = INCBIN_U32("graphics/interface/pss_unk_83D0B5C.bin.lz");
static const u16 gUnknown_83D0C38[] = INCBIN_U16("graphics/interface/pss_unk_83D0C38.gbapal");
static const u32 gUnknown_83D0C78[] = INCBIN_U32("graphics/interface/pss_unk_83D0C78.4bpp.lz");
static const u32 gUnknown_83D0FFC[] = INCBIN_U32("graphics/interface/pss_unk_83D0FFC.bin.lz");
static const u16 gUnknown_83D10E4[] = INCBIN_U16("graphics/interface/pss_unk_83D10E4.gbapal");
static const u32 gUnknown_83D1124[] = INCBIN_U32("graphics/interface/pss_unk_83D1124.4bpp.lz");
static const u32 gUnknown_83D13D8[] = INCBIN_U32("graphics/interface/pss_unk_83D13D8.bin.lz");
static const u16 gUnknown_83D14B4[] = INCBIN_U16("graphics/interface/pss_unk_83D14B4.gbapal");
static const u32 gUnknown_83D14F4[] = INCBIN_U32("graphics/interface/pss_unk_83D14F4.4bpp.lz");
static const u32 gUnknown_83D1788[] = INCBIN_U32("graphics/interface/pss_unk_83D1788.bin.lz");
static const u16 gUnknown_83D1874[] = INCBIN_U16("graphics/interface/pss_unk_83D1874.gbapal");
static const u32 gUnknown_83D18B4[] = INCBIN_U32("graphics/interface/pss_unk_83D18B4.4bpp.lz");
static const u32 gUnknown_83D1B4C[] = INCBIN_U32("graphics/interface/pss_unk_83D1B4C.bin.lz");
static const u16 gUnknown_83D1C2C[] = INCBIN_U16("graphics/interface/pss_unk_83D1C2C.gbapal");
static const u8 sSpace_83D1C6C[32] = {};
static const u32 gUnknown_83D1C8C[] = INCBIN_U32("graphics/interface/pss_unk_83D1C8C.4bpp.lz");
static const u32 gUnknown_83D1EC4[] = INCBIN_U32("graphics/interface/pss_unk_83D1EC4.bin.lz");
static const u16 gUnknown_83D1F94[] = INCBIN_U16("graphics/interface/pss_unk_83D1F94.gbapal");
static const u32 gUnknown_83D1FD4[] = INCBIN_U32("graphics/interface/pss_unk_83D1FD4.4bpp.lz");
static const u32 gUnknown_83D22B8[] = INCBIN_U32("graphics/interface/pss_unk_83D22B8.bin.lz");
static const u16 gUnknown_83D239C[] = INCBIN_U16("graphics/interface/pss_unk_83D239C.gbapal");
static const u32 gUnknown_83D23DC[] = INCBIN_U32("graphics/interface/pss_unk_83D23DC.4bpp.lz");
static const u32 gUnknown_83D256C[] = INCBIN_U32("graphics/interface/pss_unk_83D256C.bin.lz");
static const u16 gUnknown_83D2614[] = INCBIN_U16("graphics/interface/pss_unk_83D2614.gbapal");
static const u32 gUnknown_83D2654[] = INCBIN_U32("graphics/interface/pss_unk_83D2654.4bpp.lz");
static const u32 gUnknown_83D277C[] = INCBIN_U32("graphics/interface/pss_unk_83D277C.bin.lz");
static const u16 gUnknown_83D2820[] = INCBIN_U16("graphics/interface/pss_unk_83D2820.bin");

static const u16 gUnknown_83D29D0[][2] = {
    {RGB( 7,  7,  7), RGB(31, 31, 31)},
    {RGB( 7,  7,  7), RGB(31, 31, 31)},
    {RGB( 7,  7,  7), RGB(31, 31, 31)},
    {RGB( 7,  7,  7), RGB(31, 31, 31)},
    {RGB( 7,  7,  7), RGB(31, 31, 31)},
    {RGB( 7,  7,  7), RGB(31, 31, 31)},
    {RGB( 7,  7,  7), RGB(31, 31, 31)},
    {RGB( 7,  7,  7), RGB(31, 31, 31)},
    {RGB( 7,  7,  7), RGB(31, 31, 31)},
    {RGB( 7,  7,  7), RGB(31, 31, 31)},
    {RGB( 7,  7,  7), RGB(31, 31, 31)},
    {RGB( 7,  7,  7), RGB(31, 31, 31)},
    {RGB( 7,  7,  7), RGB(31, 31, 31)},
    {RGB( 7,  7,  7), RGB(31, 31, 31)},
    {RGB( 7,  7,  7), RGB(31, 31, 31)},
    {RGB( 7,  7,  7), RGB(31, 31, 31)}
};

static const struct WallpaperTable sWallpaperTable[] = {
    {gUnknown_83CEC80, gUnknown_83CF050, gUnknown_83CEC40},
    {gUnknown_83CF16C, gUnknown_83CF374, gUnknown_83CF12C},
    {gUnknown_83CF464, gUnknown_83CF750, gUnknown_83CF424},
    {gUnknown_83CF874, gUnknown_83CFA94, gUnknown_83CF834},
    {gUnknown_83CFBA0, gUnknown_83CFEF0, gUnknown_83CFB60},
    {gUnknown_83D0008, gUnknown_83D033C, gUnknown_83CFFC8},
    {gUnknown_83D0454, gUnknown_83D070C, gUnknown_83D0414},
    {gUnknown_83D0818, gUnknown_83D0B5C, gUnknown_83D07D8},
    {gUnknown_83D0C78, gUnknown_83D0FFC, gUnknown_83D0C38},
    {gUnknown_83D1124, gUnknown_83D13D8, gUnknown_83D10E4},
    {gUnknown_83D14F4, gUnknown_83D1788, gUnknown_83D14B4},
    {gUnknown_83D18B4, gUnknown_83D1B4C, gUnknown_83D1874},
    {gUnknown_83D1C8C, gUnknown_83D1EC4, gUnknown_83D1C2C},
    {gUnknown_83D1FD4, gUnknown_83D22B8, gUnknown_83D1F94},
    {gUnknown_83D23DC, gUnknown_83D256C, gUnknown_83D239C},
    {gUnknown_83D2654, gUnknown_83D277C, gUnknown_83D2614},
};

static const u16 gUnknown_83D2AD0[] = INCBIN_U16("graphics/interface/pss_unk_83D2AD0.4bpp");
static const u8 sUnref_83D2B50[] = {0xba, 0x23};

static const struct SpriteSheet gUnknown_83D2B54 = {
    gUnknown_83D2AD0, 0x0080, TAG_TILE_6
};

static const struct OamData gUnknown_83D2B5C = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(32x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x16),
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0
};

static const union AnimCmd gUnknown_83D2B64[] = {
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_83D2B6C[] = {
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_END
};

static const union AnimCmd *const gUnknown_83D2B74[] = {
    gUnknown_83D2B64,
    gUnknown_83D2B6C
};

static const struct SpriteTemplate gUnknown_83D2B7C = {
    .tileTag = TAG_TILE_3,
    .paletteTag = TAG_PAL_DAC9,
    .oam = &gUnknown_83D2B5C,
    .anims = gUnknown_83D2B74,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

static const struct OamData gUnknown_83D2B94 = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(8x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(8x16),
    .tileNum = 0x000,
    .priority = 2,
    .paletteNum = 0
};

static const union AnimCmd gUnknown_83D2B9C[] = {
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

static const union AnimCmd gUnknown_83D2BA4[] = {
    ANIMCMD_FRAME(2, 5),
    ANIMCMD_END
};

static const union AnimCmd *const gUnknown_83D2BAC[] = {
    gUnknown_83D2B9C,
    gUnknown_83D2BA4
};

static const struct SpriteTemplate gUnknown_83D2BB4 = {
    .tileTag = TAG_TILE_6,
    .paletteTag = TAG_PAL_WAVEFORM,
    .oam = &gUnknown_83D2B94,
    .anims = gUnknown_83D2BAC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_8092164
};

void InitMonIconFields(void)
{
    u16 i;

    LoadMonIconPalettes();
    for (i = 0; i < MAX_MON_ICONS; i++)
        sStorage->numIconsPerSpecies[i] = 0;
    for (i = 0; i < MAX_MON_ICONS; i++)
        sStorage->iconSpeciesList[i] = 0;
    for (i = 0; i < PARTY_SIZE; i++)
        sStorage->partySprites[i] = NULL;
    for (i = 0; i < IN_BOX_COUNT; i++)
        sStorage->boxMonsSprites[i] = NULL;

    sStorage->movingMonSprite = NULL;
    sStorage->unkUnused1 = 0;
}

static u8 sub_8090058(void)
{
    return (IsCursorInBox() ? 2 : 1);
}

void CreateMovingMonIcon(void)
{
    u32 personality = GetMonData(&sStorage->movingMon, MON_DATA_PERSONALITY);
    u16 species = GetMonData(&sStorage->movingMon, MON_DATA_SPECIES2);
    u8 priority = sub_8090058();

    sStorage->movingMonSprite = CreateMonIconSprite(species, personality, 0, 0, priority, 7);
    sStorage->movingMonSprite->callback = sub_80911B0;
}

static void sub_80900D4(u8 boxId)
{
    u8 boxPosition;
    u16 i, j, count;
    u16 species;
    u32 personality;

    count = 0;
    boxPosition = 0;
    for (i = 0; i < IN_BOX_COLUMNS; i++)
    {
        for (j = 0; j < IN_BOX_ROWS; j++)
        {
            species = GetBoxMonDataAt(boxId, boxPosition, MON_DATA_SPECIES2);
            if (species != SPECIES_NONE)
            {
                personality = GetBoxMonDataAt(boxId, boxPosition, MON_DATA_PERSONALITY);
                sStorage->boxMonsSprites[count] = CreateMonIconSprite(species, personality, 8 * (3 * j) + 100, 8 * (3 * i) + 44, 2, 19 - j);
            }
            else
            {
                sStorage->boxMonsSprites[count] = NULL;
            }
            boxPosition++;
            count++;
        }
    }

    if (sStorage->boxOption == BOX_OPTION_MOVE_ITEMS)
    {
        for (boxPosition = 0; boxPosition < IN_BOX_COUNT; boxPosition++)
        {
            if (GetBoxMonDataAt(boxId, boxPosition, MON_DATA_HELD_ITEM) == 0)
                sStorage->boxMonsSprites[boxPosition]->oam.objMode = ST_OAM_OBJ_BLEND;
        }
    }
}

void CreateBoxMonIconAtPos(u8 boxPosition)
{
    u16 species = GetCurrentBoxMonData(boxPosition, MON_DATA_SPECIES2);

    if (species != SPECIES_NONE)
    {
        s16 x = 8 * (3 * (boxPosition % IN_BOX_ROWS)) + 100;
        s16 y = 8 * (3 * (boxPosition / IN_BOX_ROWS)) + 44;
        u32 personality = GetCurrentBoxMonData(boxPosition, MON_DATA_PERSONALITY);

        sStorage->boxMonsSprites[boxPosition] = CreateMonIconSprite(species, personality, x, y, 2, 19 - (boxPosition % IN_BOX_ROWS));
        if (sStorage->boxOption == BOX_OPTION_MOVE_ITEMS)
            sStorage->boxMonsSprites[boxPosition]->oam.objMode = ST_OAM_OBJ_BLEND;
    }
}

static void sub_809029C(s16 arg0)
{
    u16 i;

    for (i = 0; i < IN_BOX_COUNT; i++)
    {
        if (sStorage->boxMonsSprites[i] != NULL)
        {
            sStorage->boxMonsSprites[i]->data[2] = arg0;
            sStorage->boxMonsSprites[i]->data[4] = 1;
            sStorage->boxMonsSprites[i]->callback = sub_8090324;
        }
    }
}

static void sub_80902E0(struct Sprite *sprite)
{
    if (sprite->data[1] != 0)
    {
        sprite->data[1]--;
        sprite->pos1.x += sprite->data[2];
    }
    else
    {
        sStorage->iconScrollNumIncoming--;
        sprite->pos1.x = sprite->data[3];
        sprite->callback = SpriteCallbackDummy;
    }
}

static void sub_8090324(struct Sprite *sprite)
{
    if (sprite->data[4] != 0)
    {
        sprite->data[4]--;
    }
    else
    {
        sprite->pos1.x += sprite->data[2];
        sprite->data[5] = sprite->pos1.x + sprite->pos2.x;
        if (sprite->data[5] <= 68 || sprite->data[5] >= 252)
            sprite->callback = SpriteCallbackDummy;
    }
}

static void DestroyAllIconsInRow(u8 row)
{
    u16 column;
    u8 boxPosition = row;

    for (column = 0; column < IN_BOX_COLUMNS; column++)
    {
        if (sStorage->boxMonsSprites[boxPosition] != NULL)
        {
            DestroyBoxMonIcon(sStorage->boxMonsSprites[boxPosition]);
            sStorage->boxMonsSprites[boxPosition] = NULL;
        }
        boxPosition += IN_BOX_ROWS;
    }
}

static u8 sub_80903A4(u8 row, u16 times, s16 xDelta)
{
    s32 i;
    u16 y = 44;
    s16 xDest = 8 * (3 * row) + 100;
    u16 x = xDest - ((times + 1) * xDelta);
    u8 subpriority = 19 - row;
    u8 count = 0;
    u8 boxPosition = row;

    if (sStorage->boxOption != BOX_OPTION_MOVE_ITEMS)
    {
        for (i = 0; i < IN_BOX_COLUMNS; i++)
        {
            if (sStorage->boxSpecies[boxPosition] != SPECIES_NONE)
            {
                sStorage->boxMonsSprites[boxPosition] = CreateMonIconSprite(sStorage->boxSpecies[boxPosition],
                                                                            sStorage->boxPersonalities[boxPosition],
                                                                            x, y, 2, subpriority);
                if (sStorage->boxMonsSprites[boxPosition] != NULL)
                {
                    sStorage->boxMonsSprites[boxPosition]->data[1] = times;
                    sStorage->boxMonsSprites[boxPosition]->data[2] = xDelta;
                    sStorage->boxMonsSprites[boxPosition]->data[3] = xDest;
                    sStorage->boxMonsSprites[boxPosition]->callback = sub_80902E0;
                    count++;
                }
            }
            boxPosition += IN_BOX_ROWS;
            y += 24;
        }
    }
    else
    {
        for (i = 0; i < IN_BOX_COLUMNS; i++)
        {
            if (sStorage->boxSpecies[boxPosition] != SPECIES_NONE)
            {
                sStorage->boxMonsSprites[boxPosition] = CreateMonIconSprite(sStorage->boxSpecies[boxPosition],
                                                                            sStorage->boxPersonalities[boxPosition],
                                                                            x, y, 2, subpriority);
                if (sStorage->boxMonsSprites[boxPosition] != NULL)
                {
                    sStorage->boxMonsSprites[boxPosition]->data[1] = times;
                    sStorage->boxMonsSprites[boxPosition]->data[2] = xDelta;
                    sStorage->boxMonsSprites[boxPosition]->data[3] = xDest;
                    sStorage->boxMonsSprites[boxPosition]->callback = sub_80902E0;
                    if (GetBoxMonDataAt(sStorage->incomingBoxId, boxPosition, MON_DATA_HELD_ITEM) == 0)
                        sStorage->boxMonsSprites[boxPosition]->oam.objMode = ST_OAM_OBJ_BLEND;
                    count++;
                }
            }
            boxPosition += IN_BOX_ROWS;
            y += 24;
        }
    }

    return count;
}

static void sub_8090574(u8 boxId, s8 direction)
{
    sStorage->iconScrollState = 0;
    sStorage->iconScrollToBoxId = boxId;
    sStorage->iconScrollDirection = direction;
    sStorage->iconScrollDistance = 32;
    sStorage->iconScrollSpeed = -(6 * direction);
    sStorage->iconScrollNumIncoming = 0;
    SetBoxSpeciesAndPersonalities(boxId);
    if (direction > 0)
        sStorage->iconScrollCurColumn = 0;
    else
        sStorage->iconScrollCurColumn = IN_BOX_ROWS - 1;

    sStorage->iconScrollPos = (24 * sStorage->iconScrollCurColumn) + 100;
    sub_809029C(sStorage->iconScrollSpeed);
}

static bool8 sub_809062C(void)
{
    if (sStorage->iconScrollDistance != 0)
        sStorage->iconScrollDistance--;

    switch (sStorage->iconScrollState)
    {
    case 0:
        sStorage->iconScrollPos += sStorage->iconScrollSpeed;
        if (sStorage->iconScrollPos <= 64 || sStorage->iconScrollPos >= 252)
        {
            DestroyAllIconsInRow(sStorage->iconScrollCurColumn);
            sStorage->iconScrollPos += sStorage->iconScrollDirection * 24;
            sStorage->iconScrollState++;
        }
        break;
    case 1:
        sStorage->iconScrollPos += sStorage->iconScrollSpeed;
        sStorage->iconScrollNumIncoming += sub_80903A4(sStorage->iconScrollCurColumn, sStorage->iconScrollDistance, sStorage->iconScrollSpeed);
        if ((sStorage->iconScrollDirection > 0 && sStorage->iconScrollCurColumn == IN_BOX_ROWS - 1)
            || (sStorage->iconScrollDirection < 0 && sStorage->iconScrollCurColumn == 0))
        {
            sStorage->iconScrollState++;
        }
        else
        {
            sStorage->iconScrollCurColumn += sStorage->iconScrollDirection;
            sStorage->iconScrollState = 0;
        }
        break;
    case 2:
        if (sStorage->iconScrollNumIncoming == 0)
        {
            sStorage->iconScrollDistance++;
            return FALSE;
        }
        break;
    default:
        return FALSE;
    }

    return TRUE;
}

static void SetBoxSpeciesAndPersonalities(u8 boxId)
{
    s32 i, j, boxPosition;

    boxPosition = 0;
    for (i = 0; i < IN_BOX_COLUMNS; i++)
    {
        for (j = 0; j < IN_BOX_ROWS; j++)
        {
            sStorage->boxSpecies[boxPosition] = GetBoxMonDataAt(boxId, boxPosition, MON_DATA_SPECIES2);
            if (sStorage->boxSpecies[boxPosition] != SPECIES_NONE)
                sStorage->boxPersonalities[boxPosition] = GetBoxMonDataAt(boxId, boxPosition, MON_DATA_PERSONALITY);
            boxPosition++;
        }
    }

    sStorage->incomingBoxId = boxId;
}

void DestroyBoxMonIconAtPosition(u8 boxPosition)
{
    if (sStorage->boxMonsSprites[boxPosition] != NULL)
    {
        DestroyBoxMonIcon(sStorage->boxMonsSprites[boxPosition]);
        sStorage->boxMonsSprites[boxPosition] = NULL;
    }
}

void SetBoxMonIconObjMode(u8 boxPosition, u8 objMode)
{
    if (sStorage->boxMonsSprites[boxPosition] != NULL)
    {
        sStorage->boxMonsSprites[boxPosition]->oam.objMode = objMode;
    }
}

void CreatePartyMonsSprites(bool8 arg0)
{
    u16 i, count;
    u16 species = GetMonData(&gPlayerParty[0], MON_DATA_SPECIES2);
    u32 personality = GetMonData(&gPlayerParty[0], MON_DATA_PERSONALITY);

    sStorage->partySprites[0] = CreateMonIconSprite(species, personality, 104, 64, 1, 12);
    count = 1;
    for (i = 1; i < PARTY_SIZE; i++)
    {
        species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2);
        if (species != SPECIES_NONE)
        {
            personality = GetMonData(&gPlayerParty[i], MON_DATA_PERSONALITY);
            sStorage->partySprites[i] = CreateMonIconSprite(species, personality, 152, 8 * (3 * (i - 1)) + 16, 1, 12);
            count++;
        }
        else
        {
            sStorage->partySprites[i] = NULL;
        }
    }

    if (!arg0)
    {
        for (i = 0; i < count; i++)
        {
            sStorage->partySprites[i]->pos1.y -= 160;
            sStorage->partySprites[i]->invisible = TRUE;
        }
    }

    if (sStorage->boxOption == BOX_OPTION_MOVE_ITEMS)
    {
        for (i = 0; i < PARTY_SIZE; i++)
        {
            if (sStorage->partySprites[i] != NULL && GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM) == 0)
                sStorage->partySprites[i]->oam.objMode = ST_OAM_OBJ_BLEND;
        }
    }
}

void CompactPartySprites(void)
{
    u16 i, count;

    sStorage->numPartyToCompact = 0;
    for (i = 0, count = 0; i < PARTY_SIZE; i++)
    {
        if (sStorage->partySprites[i] != NULL)
        {
            if (i != count)
            {
                sub_8090A74(sStorage->partySprites[i], count);
                sStorage->partySprites[i] = NULL;
                sStorage->numPartyToCompact++;
            }
            count++;
        }
    }
}

u8 GetNumPartySpritesCompacting(void)
{
    return sStorage->numPartyToCompact;
}

static void sub_8090A74(struct Sprite *sprite, u16 partyId)
{
    s16 x, y;

    sprite->data[1] = partyId;
    if (partyId == 0)
        x = 104, y = 64;
    else
        x = 152, y = 8 * (3 * (partyId - 1)) + 16;

    sprite->data[2] = (u16)(sprite->pos1.x) * 8;
    sprite->data[3] = (u16)(sprite->pos1.y) * 8;
    sprite->data[4] = ((x * 8) - sprite->data[2]) / 8;
    sprite->data[5] = ((y * 8) - sprite->data[3]) / 8;
    sprite->data[6] = 8;
    sprite->callback = sub_8090AE0;
}

static void sub_8090AE0(struct Sprite *sprite)
{
    if (sprite->data[6] != 0)
    {
        s16 x = sprite->data[2] += sprite->data[4];
        s16 y = sprite->data[3] += sprite->data[5];
        sprite->pos1.x = x / 8u;
        sprite->pos1.y = y / 8u;
        sprite->data[6]--;
    }
    else
    {
        if (sprite->data[1] == 0)
        {
            sprite->pos1.x = 104;
            sprite->pos1.y = 64;
        }
        else
        {
            sprite->pos1.x = 152;
            sprite->pos1.y = 8 * (3 * (sprite->data[1] - 1)) + 16;
        }
        sprite->callback = SpriteCallbackDummy;
        sStorage->partySprites[sprite->data[1]] = sprite;
        sStorage->numPartyToCompact--;
    }
}

void DestroyMovingMonIcon(void)
{
    if (sStorage->movingMonSprite != NULL)
    {
        DestroyBoxMonIcon(sStorage->movingMonSprite);
        sStorage->movingMonSprite = NULL;
    }
}

void MovePartySprites(s16 yDelta)
{
    u16 i, posY;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (sStorage->partySprites[i] != NULL)
        {
            sStorage->partySprites[i]->pos1.y += yDelta;
            posY = sStorage->partySprites[i]->pos1.y + sStorage->partySprites[i]->pos2.y + sStorage->partySprites[i]->centerToCornerVecY;
            posY += 16;
            if (posY > 192)
                sStorage->partySprites[i]->invisible = TRUE;
            else
                sStorage->partySprites[i]->invisible = FALSE;
        }
    }
}

void DestroyPartyMonIcon(u8 partyId)
{
    if (sStorage->partySprites[partyId] != NULL)
    {
        DestroyBoxMonIcon(sStorage->partySprites[partyId]);
        sStorage->partySprites[partyId] = NULL;
    }
}

void DestroyAllPartyMonIcons(void)
{
    u16 i;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (sStorage->partySprites[i] != NULL)
        {
            DestroyBoxMonIcon(sStorage->partySprites[i]);
            sStorage->partySprites[i] = NULL;
        }
    }
}

void SetPartyMonIconObjMode(u8 partyId, u8 objMode)
{
    if (sStorage->partySprites[partyId] != NULL)
    {
        sStorage->partySprites[partyId]->oam.objMode = objMode;
    }
}

void SetMovingMonSprite(u8 cursorArea, u8 cursorPos)
{
    if (cursorArea == MODE_PARTY)
    {
        sStorage->movingMonSprite = sStorage->partySprites[cursorPos];
        sStorage->partySprites[cursorPos] = NULL;
    }
    else if (cursorArea == MODE_BOX)
    {
        sStorage->movingMonSprite = sStorage->boxMonsSprites[cursorPos];
        sStorage->boxMonsSprites[cursorPos] = NULL;
    }
    else
    {
        return;
    }

    sStorage->movingMonSprite->callback = sub_80911B0;
    sStorage->movingMonSprite->oam.priority = sub_8090058();
    sStorage->movingMonSprite->subpriority = 7;
}

void SetPlacedMonSprite(u8 cursorArea, u8 cursorPos)
{
    if (cursorArea == TOTAL_BOXES_COUNT) // party mon
    {
        sStorage->partySprites[cursorPos] = sStorage->movingMonSprite;
        sStorage->partySprites[cursorPos]->oam.priority = 1;
        sStorage->partySprites[cursorPos]->subpriority = 12;
    }
    else
    {
        sStorage->boxMonsSprites[cursorPos] = sStorage->movingMonSprite;
        sStorage->boxMonsSprites[cursorPos]->oam.priority = 2;
        sStorage->boxMonsSprites[cursorPos]->subpriority = 19 - (cursorPos % IN_BOX_ROWS);
    }
    sStorage->movingMonSprite->callback = SpriteCallbackDummy;
    sStorage->movingMonSprite = NULL;
}

void SaveMonSpriteAtPos(u8 boxId, u8 cursorPos)
{
    if (boxId == TOTAL_BOXES_COUNT) // party mon
        sStorage->shiftMonSpritePtr = &sStorage->partySprites[cursorPos];
    else
        sStorage->shiftMonSpritePtr = &sStorage->boxMonsSprites[cursorPos];

    sStorage->movingMonSprite->callback = SpriteCallbackDummy;
    sStorage->shiftTimer = 0;
}

bool8 MoveShiftingMons(void)
{
    if (sStorage->shiftTimer == 16)
        return FALSE;

    sStorage->shiftTimer++;
    if (sStorage->shiftTimer & 1)
    {
        (*sStorage->shiftMonSpritePtr)->pos1.y--;
        sStorage->movingMonSprite->pos1.y++;
    }

    (*sStorage->shiftMonSpritePtr)->pos2.x = gSineTable[sStorage->shiftTimer * 8] / 16;
    sStorage->movingMonSprite->pos2.x = -(gSineTable[sStorage->shiftTimer * 8] / 16);
    if (sStorage->shiftTimer == 8)
    {
        sStorage->movingMonSprite->oam.priority = (*sStorage->shiftMonSpritePtr)->oam.priority;
        sStorage->movingMonSprite->subpriority = (*sStorage->shiftMonSpritePtr)->subpriority;
        (*sStorage->shiftMonSpritePtr)->oam.priority = sub_8090058();
        (*sStorage->shiftMonSpritePtr)->subpriority = 7;
    }

    if (sStorage->shiftTimer == 16)
    {
        struct Sprite *sprite = sStorage->movingMonSprite;
        sStorage->movingMonSprite = (*sStorage->shiftMonSpritePtr);
        *sStorage->shiftMonSpritePtr = sprite;

        sStorage->movingMonSprite->callback = sub_80911B0;
        (*sStorage->shiftMonSpritePtr)->callback = SpriteCallbackDummy;
    }

    return TRUE;
}

void SetReleaseMon(u8 mode, u8 position)
{
    switch (mode)
    {
    case MODE_PARTY:
        sStorage->releaseMonSpritePtr = &sStorage->partySprites[position];
        break;
    case MODE_BOX:
        sStorage->releaseMonSpritePtr = &sStorage->boxMonsSprites[position];
        break;
    case MODE_MOVE:
        sStorage->releaseMonSpritePtr = &sStorage->movingMonSprite;
        break;
    default:
        return;
    }

    if (*sStorage->releaseMonSpritePtr != NULL)
    {
        InitSpriteAffineAnim(*sStorage->releaseMonSpritePtr);
        (*sStorage->releaseMonSpritePtr)->oam.affineMode = ST_OAM_AFFINE_NORMAL;
        (*sStorage->releaseMonSpritePtr)->affineAnims = gUnknown_83CEC38;
        StartSpriteAffineAnim(*sStorage->releaseMonSpritePtr, 0);
    }
}

bool8 TryHideReleaseMonSprite(void)
{
    if (*sStorage->releaseMonSpritePtr == NULL || (*sStorage->releaseMonSpritePtr)->invisible)
        return FALSE;

    if ((*sStorage->releaseMonSpritePtr)->affineAnimEnded)
        (*sStorage->releaseMonSpritePtr)->invisible = TRUE;

    return TRUE;
}

void DestroyReleaseMonIcon(void)
{
    if (*sStorage->releaseMonSpritePtr != NULL)
    {
        FreeOamMatrix((*sStorage->releaseMonSpritePtr)->oam.matrixNum);
        DestroyBoxMonIcon(*sStorage->releaseMonSpritePtr);
        *sStorage->releaseMonSpritePtr = NULL;
    }
}

void ReshowReleaseMon(void)
{
    if (*sStorage->releaseMonSpritePtr != NULL)
    {
        (*sStorage->releaseMonSpritePtr)->invisible = FALSE;
        StartSpriteAffineAnim(*sStorage->releaseMonSpritePtr, 1);
    }
}

bool8 ResetReleaseMonSpritePtr(void)
{
    if (sStorage->releaseMonSpritePtr == NULL)
        return FALSE;

    if ((*sStorage->releaseMonSpritePtr)->affineAnimEnded)
        sStorage->releaseMonSpritePtr = NULL;

    return TRUE;
}

void SetMovingMonPriority(u8 priority)
{
    sStorage->movingMonSprite->oam.priority = priority;
}

static void sub_80911B0(struct Sprite *sprite)
{
    sprite->pos1.x = sStorage->cursorSprite->pos1.x;
    sprite->pos1.y = sStorage->cursorSprite->pos1.y + sStorage->cursorSprite->pos2.y + 4;
}

static u16 sub_80911D4(u16 species)
{
    u16 i, var;

    // Find the currently-allocated slot
    for (i = 0; i < MAX_MON_ICONS; i++)
    {
        if (sStorage->iconSpeciesList[i] == species)
            break;
    }

    if (i == MAX_MON_ICONS)
    {
        // Find the first empty slot
        for (i = 0; i < MAX_MON_ICONS; i++)
        {
            if (sStorage->iconSpeciesList[i] == SPECIES_NONE)
                break;
        }
        if (i == MAX_MON_ICONS)
            return 0xFFFF;
    }

    sStorage->iconSpeciesList[i] = species;
    sStorage->numIconsPerSpecies[i]++;
    var = 16 * i;
    CpuCopy32(GetMonIconTiles(species, TRUE), (void*)(OBJ_VRAM0) + var * 32, 0x200);

    return var;
}

static void sub_8091290(u16 species)
{
    u16 i;

    for (i = 0; i < MAX_MON_ICONS; i++)
    {
        if (sStorage->iconSpeciesList[i] == species)
        {
            if (--sStorage->numIconsPerSpecies[i] == 0)
                sStorage->iconSpeciesList[i] = 0;
            break;
        }
    }
}

struct Sprite *CreateMonIconSprite(u16 species, u32 personality, s16 x, s16 y, u8 oamPriority, u8 subpriority)
{
    u16 tileNum;
    u8 spriteId;
    struct SpriteTemplate template = gUnknown_83CEBF0;

    species = GetIconSpecies(species, personality);
    template.paletteTag = 0xDAC0 + gMonIconPaletteIndices[species];
    tileNum = sub_80911D4(species);
    if (tileNum == 0xFFFF)
        return NULL;

    spriteId = CreateSprite(&template, x, y, subpriority);
    if (spriteId == MAX_SPRITES)
    {
        sub_8091290(species);
        return NULL;
    }

    gSprites[spriteId].oam.tileNum = tileNum;
    gSprites[spriteId].oam.priority = oamPriority;
    gSprites[spriteId].data[0] = species;
    return &gSprites[spriteId];
}

static void DestroyBoxMonIcon(struct Sprite *sprite)
{
    sub_8091290(sprite->data[0]);
    DestroySprite(sprite);
}

void CreateInitBoxTask(u8 box)
{
    u8 taskId = CreateTask(sub_8091420, 2);

    gTasks[taskId].data[2] = box;
}

bool8 IsInitBoxActive(void)
{
    return FuncIsActiveTask(sub_8091420);
}

static void sub_8091420(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        sStorage->wallpaperOffset = 0;
        sStorage->bg2_X = 0;
        task->data[1] = RequestDma3Fill(0, sStorage->wallpaperBgTilemapBuffer, 0x1000, DMA3_32BIT);
        break;
    case 1:
        if (WaitDma3Request(task->data[1]) == -1)
            return;

        SetBgTilemapBuffer(2, sStorage->wallpaperBgTilemapBuffer);
        ShowBg(2);
        break;
    case 2:
        LoadWallpaperGfx(task->data[2], 0);
        break;
    case 3:
        if (!WaitForWallpaperGfxLoad())
            return;

        sub_8091A94(task->data[2]);
        sub_8091F80();
        sub_80900D4(task->data[2]);
        SetGpuReg(REG_OFFSET_BG2CNT, BGCNT_PRIORITY(2) | BGCNT_CHARBASE(2) | BGCNT_SCREENBASE(27) | BGCNT_TXT512x256);
        break;
    case 4:
        DestroyTask(taskId);
        break;
    default:
        task->data[0] = 0;
        return;
    }

    task->data[0]++;
}

void SetUpScrollToBox(u8 boxId)
{
    s8 direction = sub_80916F4(boxId);

    sStorage->scrollSpeed = (direction > 0) ? 6 : -6;
    sStorage->scrollUnused1 = (direction > 0) ? 1 : 2;
    sStorage->scrollTimer = 32;
    sStorage->scrollToBoxIdUnused = boxId;
    sStorage->scrollUnused2 = (direction <= 0) ? 5 : 0;
    sStorage->scrollDirectionUnused = direction;
    sStorage->scrollUnused3 = (direction > 0) ? 264 : 56;
    sStorage->scrollUnused4 = (direction <= 0) ? 5 : 0;
    sStorage->scrollUnused5 = 0;
    sStorage->scrollUnused6 = 2;
    sStorage->scrollToBoxId = boxId;
    sStorage->scrollDirection = direction;
    sStorage->scrollState = 0;
}

bool8 ScrollToBox(void)
{
    bool8 var;

    switch (sStorage->scrollState)
    {
    case 0:
        LoadWallpaperGfx(sStorage->scrollToBoxId, sStorage->scrollDirection);
        sStorage->scrollState++;
    case 1:
        if (!WaitForWallpaperGfxLoad())
            return TRUE;

        sub_8090574(sStorage->scrollToBoxId, sStorage->scrollDirection);
        sub_8091C48(sStorage->scrollToBoxId, sStorage->scrollDirection);
        sub_809200C(sStorage->scrollDirection);
        break;
    case 2:
        var = sub_809062C();
        if (sStorage->scrollTimer != 0)
        {
            sStorage->bg2_X += sStorage->scrollSpeed;
            if (--sStorage->scrollTimer != 0)
                return TRUE;
            sub_8091E34();
            sub_80920AC();
        }
        return var;
    }

    sStorage->scrollState++;
    return TRUE;
}

static s8 sub_80916F4(u8 boxId)
{
    u8 i;
    u8 currentBox = StorageGetCurrentBox();

    for (i = 0; currentBox != boxId; i++)
    {
        currentBox++;
        if (currentBox >= TOTAL_BOXES_COUNT)
            currentBox = 0;
    }

    return (i < TOTAL_BOXES_COUNT / 2) ? 1 : -1;
}

void SetWallpaperForCurrentBox(u8 wallpaperId)
{
    u8 boxId = StorageGetCurrentBox();
    SetBoxWallpaper(boxId, wallpaperId);
    sStorage->wallpaperChangeState = 0;
}

bool8 DoWallpaperGfxChange(void)
{
    switch (sStorage->wallpaperChangeState)
    {
    case 0:
        BeginNormalPaletteFade(sStorage->wallpaperPalBits, 1, 0, 16, RGB_WHITEALPHA);
        sStorage->wallpaperChangeState++;
        break;
    case 1:
        if (!UpdatePaletteFade())
        {
            u8 curBox = StorageGetCurrentBox();
            LoadWallpaperGfx(curBox, 0);
            sStorage->wallpaperChangeState++;
        }
        break;
    case 2:
        if (WaitForWallpaperGfxLoad() == TRUE)
        {
            sub_8091EF0();
            BeginNormalPaletteFade(sStorage->wallpaperPalBits, 1, 16, 0, RGB_WHITEALPHA);
            sStorage->wallpaperChangeState++;
        }
        break;
    case 3:
        if (!UpdatePaletteFade())
            sStorage->wallpaperChangeState++;
        break;
    case 4:
        return FALSE;
    }

    return TRUE;
}

static void LoadWallpaperGfx(u8 boxId, s8 direction)
{
    u8 wallpaperId;
    const struct WallpaperTable *wallpaperGfx;
    void *iconGfx;
    u32 size1, size2;

    sStorage->wallpaperLoadState = 0;
    sStorage->wallpaperLoadBoxId = boxId;
    sStorage->wallpaperLoadDir = direction;
    if (sStorage->wallpaperLoadDir != 0)
    {
        sStorage->wallpaperOffset = (sStorage->wallpaperOffset == 0);
        sub_8091A24(sStorage->wallpaperBgTilemapBuffer);
    }

    wallpaperId = GetBoxWallpaper(sStorage->wallpaperLoadBoxId);
    wallpaperGfx = &sWallpaperTable[wallpaperId];
    LZ77UnCompWram(wallpaperGfx->tileMap, sStorage->wallpaperTilemap);
    sub_8091984(sStorage->wallpaperBgTilemapBuffer, sStorage->wallpaperTilemap, sStorage->wallpaperLoadDir, sStorage->wallpaperOffset);

    if (sStorage->wallpaperLoadDir != 0)
        LoadPalette(wallpaperGfx->palettes, (sStorage->wallpaperOffset * 32) + 0x40, 0x40);
    else
        CpuCopy16(wallpaperGfx->palettes, &gPlttBufferUnfaded[(sStorage->wallpaperOffset * 32) + 0x40], 0x40);

    DecompressAndLoadBgGfxUsingHeap(2, wallpaperGfx->tiles, 0, 256 * sStorage->wallpaperOffset, 0);

    CopyBgTilemapBufferToVram(2);
}

static bool32 WaitForWallpaperGfxLoad(void)
{
    if (IsDma3ManagerBusyWithBgCopy() == TRUE)
        return FALSE;

    return TRUE;
}

static void sub_8091984(void *buffer, const void *tilemap, s8 direction, u8 arg2)
{
    s16 var = (arg2 * 2) + 3;
    s16 x = ((sStorage->bg2_X / 8 + 10) + (direction * 24)) & 0x3F;

    CopyRectToBgTilemapBufferRect(2, tilemap, 0, 0, 0x14, 0x12, x, 2, 0x14, 0x12, 0x11, arg2 << 8, var);

    if (direction == 0)
        return;
    else if (direction > 0)
        x *= 1, x += 0x14; // x * 1 is needed to match, but can be safely removed as it makes no functional difference
    else
        x -= 4;

    FillBgTilemapBufferRect(2, 0, x, 2, 4, 0x12, 0x11);
}

static void sub_8091A24(void *arg0)
{
    u16 i;
    u16 *dest = arg0;
    s16 r3 = ((sStorage->bg2_X / 8) + 30) & 0x3F;

    if (r3 <= 31)
        dest += r3 + 0x260;
    else
        dest += r3 + 0x640;

    for (i = 0; i < 0x2C; i++)
    {
        *dest++ = 0;
        r3 = (r3 + 1) & 0x3F;
        if (r3 == 0)
            dest -= 0x420;
        if (r3 == 0x20)
            dest += 0x3e0;
    }
}

static void sub_8091A94(u8 boxId)
{
    u8 tagIndex;
    s16 r6;
    u16 i;

    struct SpriteSheet spriteSheet = {sStorage->boxTitleTiles, 0x200, TAG_TILE_3};
    struct SpritePalette palettes[] = {
        {sStorage->boxTitlePal, TAG_PAL_DAC9},
        {}
    };

    u16 wallpaperId = GetBoxWallpaper(boxId);

    sStorage->boxTitlePal[14] = gUnknown_83D29D0[wallpaperId][0];
    sStorage->boxTitlePal[15] = gUnknown_83D29D0[wallpaperId][1];
    LoadSpritePalettes(palettes);
    sStorage->wallpaperPalBits = 0x3f0;

    tagIndex = IndexOfSpritePaletteTag(TAG_PAL_DAC9);
    sStorage->boxTitlePalOffset = 0x10e + 16 * tagIndex;
    sStorage->wallpaperPalBits |= 0x10000 << tagIndex;

    tagIndex = IndexOfSpritePaletteTag(TAG_PAL_DAC9);
    sStorage->boxTitleAltPalOffset = 0x10e + 16 * tagIndex;
    sStorage->wallpaperPalBits |= 0x10000 << tagIndex;

    StringCopyPadded(sStorage->boxTitleText, GetBoxNamePtr(boxId), 0, 8);
    DrawTextWindowAndBufferTiles(sStorage->boxTitleText, sStorage->boxTitleTiles, 0, 0, sStorage->boxTitleTileBuffer, 2);
    LoadSpriteSheet(&spriteSheet);
    r6 = sub_8091F60(GetBoxNamePtr(boxId));

    for (i = 0; i < 2; i++)
    {
        u8 spriteId = CreateSprite(&gUnknown_83D2B7C, r6 + i * 32, 28, 24);
        sStorage->curBoxTitleSprites[i] = &gSprites[spriteId];
        StartSpriteAnim(sStorage->curBoxTitleSprites[i], i);
    }
    sStorage->boxTitleCycleId = 0;
}

static void sub_8091C48(u8 boxId, s8 direction)
{
    u16 r8;
    s16 x, x2;
    u16 i;
    struct SpriteSheet spriteSheet = {sStorage->boxTitleTiles, 0x200, TAG_TILE_3};
    struct SpriteTemplate template = gUnknown_83D2B7C;

    sStorage->boxTitleCycleId = (sStorage->boxTitleCycleId == 0);
    if (sStorage->boxTitleCycleId == 0)
    {
        spriteSheet.tag = TAG_TILE_3;
        r8 = sStorage->boxTitlePalOffset;
    }
    else
    {
        spriteSheet.tag = TAG_TILE_4;
        r8 = sStorage->boxTitlePalOffset;
        template.tileTag = TAG_TILE_4;
        template.paletteTag = TAG_PAL_DAC9;
    }

    StringCopyPadded(sStorage->boxTitleText, GetBoxNamePtr(boxId), 0, 8);
    DrawTextWindowAndBufferTiles(sStorage->boxTitleText, sStorage->boxTitleTiles, 0, 0, sStorage->boxTitleTileBuffer, 2);
    LoadSpriteSheet(&spriteSheet);
    LoadPalette(gUnknown_83D29D0[GetBoxWallpaper(boxId)], r8, 4);
    x = sub_8091F60(GetBoxNamePtr(boxId));
    x2 = x;
    x2 += direction * 192;

    for (i = 0; i < 2; i++)
    {
        u8 spriteId = CreateSprite(&template, i * 32 + x2, 28, 24);

        sStorage->nextBoxTitleSprites[i] = &gSprites[spriteId];
        sStorage->nextBoxTitleSprites[i]->data[0] = (-direction) * 6;
        sStorage->nextBoxTitleSprites[i]->data[1] = i * 32 + x;
        sStorage->nextBoxTitleSprites[i]->data[2] = 0;
        sStorage->nextBoxTitleSprites[i]->callback = sub_8091E84;
        StartSpriteAnim(sStorage->nextBoxTitleSprites[i], i);

        sStorage->curBoxTitleSprites[i]->data[0] = (-direction) * 6;
        sStorage->curBoxTitleSprites[i]->data[1] = 1;
        sStorage->curBoxTitleSprites[i]->callback = sub_8091EB8;
    }
}

static void sub_8091E34(void)
{
    if (sStorage->boxTitleCycleId == 0)
        FreeSpriteTilesByTag(TAG_TILE_4);
    else
        FreeSpriteTilesByTag(TAG_TILE_3);

    sStorage->curBoxTitleSprites[0] = sStorage->nextBoxTitleSprites[0];
    sStorage->curBoxTitleSprites[1] = sStorage->nextBoxTitleSprites[1];
}

static void sub_8091E84(struct Sprite *sprite)
{
    if (sprite->data[2] != 0)
        sprite->data[2]--;
    else if ((sprite->pos1.x += sprite->data[0]) == sprite->data[1])
        sprite->callback = SpriteCallbackDummy;
}

static void sub_8091EB8(struct Sprite *sprite)
{
    if (sprite->data[1] != 0)
    {
        sprite->data[1]--;
    }
    else
    {
        sprite->pos1.x += sprite->data[0];
        sprite->data[2] = sprite->pos1.x + sprite->pos2.x;
        if (sprite->data[2] < 0x40 || sprite->data[2] > 0x100)
            DestroySprite(sprite);
    }
}

static void sub_8091EF0(void)
{
    u8 boxId = StorageGetCurrentBox();
    u8 wallpaperId = GetBoxWallpaper(boxId);
    if (sStorage->boxTitleCycleId == 0)
        CpuCopy16(gUnknown_83D29D0[wallpaperId], gPlttBufferUnfaded + sStorage->boxTitlePalOffset, 4);
    else
        CpuCopy16(gUnknown_83D29D0[wallpaperId], gPlttBufferUnfaded + sStorage->boxTitleAltPalOffset, 4);
}

static s16 sub_8091F60(const u8 *string)
{
    return 0xB0 - GetStringWidth(1, string, 0) / 2;
}

static void sub_8091F80(void)
{
    u16 i;

    LoadSpriteSheet(&gUnknown_83D2B54);
    for (i = 0; i < 2; i++)
    {
        u8 spriteId = CreateSprite(&gUnknown_83D2BB4, 0x5c + i * 0x88, 28, 22);
        if (spriteId != MAX_SPRITES)
        {
            struct Sprite *sprite = &gSprites[spriteId];
            StartSpriteAnim(sprite, i);
            sprite->data[3] = (i == 0) ? -1 : 1;
            sStorage->arrowSprites[i] = sprite;
        }
    }
    if (IsCursorOnBox())
        AnimateBoxScrollArrows(TRUE);
}

static void sub_809200C(s8 direction)
{
    u16 i;

    for (i = 0; i < 2; i++)
    {
        sStorage->arrowSprites[i]->pos2.x = 0;
        sStorage->arrowSprites[i]->data[0] = 2;
    }
    if (direction < 0)
    {
        sStorage->arrowSprites[0]->data[1] = 29;
        sStorage->arrowSprites[1]->data[1] = 5;
        sStorage->arrowSprites[0]->data[2] = 0x48;
        sStorage->arrowSprites[1]->data[2] = 0x48;
    }
    else
    {
        sStorage->arrowSprites[0]->data[1] = 5;
        sStorage->arrowSprites[1]->data[1] = 29;
        sStorage->arrowSprites[0]->data[2] = 0xF8;
        sStorage->arrowSprites[1]->data[2] = 0xF8;
    }
    sStorage->arrowSprites[0]->data[7] = 0;
    sStorage->arrowSprites[1]->data[7] = 1;
}

static void sub_80920AC(void)
{
    u16 i;

    for (i = 0; i < 2; i++)
    {
        sStorage->arrowSprites[i]->pos1.x = 0x88 * i + 0x5c;
        sStorage->arrowSprites[i]->pos2.x = 0;
        sStorage->arrowSprites[i]->invisible = FALSE;
    }
    AnimateBoxScrollArrows(TRUE);
}

void AnimateBoxScrollArrows(bool8 species)
{
    u16 i;

    if (species)
    {
        for (i = 0; i < 2; i++)
        {
            sStorage->arrowSprites[i]->data[0] = 1;
            sStorage->arrowSprites[i]->data[1] = 0;
            sStorage->arrowSprites[i]->data[2] = 0;
            sStorage->arrowSprites[i]->data[4] = 0;
        }
    }
    else
    {
        for (i = 0; i < 2; i++)
        {
            sStorage->arrowSprites[i]->data[0] = 0;
        }
    }
}

static void sub_8092164(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->pos2.x = 0;
        break;
    case 1:
        if (++sprite->data[1] > 3)
        {
            sprite->data[1] = 0;
            sprite->pos2.x += sprite->data[3];
            if (++sprite->data[2] > 5)
            {
                sprite->data[2] = 0;
                sprite->pos2.x = 0;
            }
        }
        break;
    case 2:
        sprite->data[0] = 3;
        break;
    case 3:
        sprite->pos1.x -= sStorage->scrollSpeed;
        if (sprite->pos1.x < 73 || sprite->pos1.x > 247)
            sprite->invisible = TRUE;
        if (--sprite->data[1] == 0)
        {
            sprite->pos1.x = sprite->data[2];
            sprite->invisible = FALSE;
            sprite->data[0] = 4;
        }
        break;
    case 4:
        sprite->pos1.x -= sStorage->scrollSpeed;
        break;
    }
}

struct Sprite *CreateChooseBoxArrows(u16 x, u16 y, u8 animId, u8 priority, u8 subpriority)
{
    u8 spriteId = CreateSprite(&gUnknown_83D2BB4, x, y, subpriority);
    if (spriteId == MAX_SPRITES)
        return NULL;

    animId %= 2;
    StartSpriteAnim(&gSprites[spriteId], animId);
    gSprites[spriteId].oam.priority = priority;
    gSprites[spriteId].callback = SpriteCallbackDummy;
    return &gSprites[spriteId];
}
