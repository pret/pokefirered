#include "global.h"
#include "gflib.h"
#include "text_window_graphics.h"
#include "mon_markings.h"
#include "graphics.h"
#include "constants/songs.h"

static EWRAM_DATA struct PokemonMarkMenu * sMenu = NULL;

static void CreateMonMarkingsMenuSprites(s16 x, s16 y, u16 tilesTag, u16 paletteTag);
static void nullsub_62(struct Sprite * sprite);
static void SpriteCB_MarkingIcon(struct Sprite * sprite);
static void SpriteCB_Cursor(struct Sprite * sprite);
static struct Sprite * CreateMonMarkingSprite(u16 tilesTag, u16 paletteTag, const u16 *palette, u16 size);

static const u16 sMonMarkingsPal[] = INCBIN_U16("graphics/misc/mon_markings.gbapal");
static const u16 sMonMarkingsTiles[] = INCBIN_U16("graphics/misc/mon_markings.4bpp");
static const u8 sUnref_83EE828[] = {0x09, 0x50, 0x13, 0x02, 0xFF};

static const struct OamData sOamData_64x64 = {
    .shape = SPRITE_SHAPE(64x64),
    .size = SPRITE_SIZE(64x64)
};

static const struct OamData sOamData_8x8 = {
    .shape = SPRITE_SHAPE(8x8),
    .size = SPRITE_SIZE(8x8)
};

static const union AnimCmd sAnimCmd_MenuMark_CircleOff[] = {
    ANIMCMD_FRAME(0x0, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_MenuMark_CircleOn[] = {
    ANIMCMD_FRAME(0x1, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_MenuMark_SquareOff[] = {
    ANIMCMD_FRAME(0x2, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_MenuMark_SquareOn[] = {
    ANIMCMD_FRAME(0x3, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_MenuMark_TriangleOff[] = {
    ANIMCMD_FRAME(0x4, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_MenuMark_TriangleOn[] = {
    ANIMCMD_FRAME(0x5, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_MenuMark_HeartOff[] = {
    ANIMCMD_FRAME(0x6, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_MenuMark_HeartOn[] = {
    ANIMCMD_FRAME(0x7, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_MenuMark_Cursor[] = {
    ANIMCMD_FRAME(0x8, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_MenuMark_Blank[] = {
    ANIMCMD_FRAME(0x9, 5),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_MenuMark[] = {
    sAnimCmd_MenuMark_CircleOff,
    sAnimCmd_MenuMark_CircleOn,
    sAnimCmd_MenuMark_SquareOff,
    sAnimCmd_MenuMark_SquareOn,
    sAnimCmd_MenuMark_TriangleOff,
    sAnimCmd_MenuMark_TriangleOn,
    sAnimCmd_MenuMark_HeartOff,
    sAnimCmd_MenuMark_HeartOn,
    sAnimCmd_MenuMark_Cursor,
    sAnimCmd_MenuMark_Blank
};

static const union AnimCmd sAnimCmd_Frame_0[] = {
    ANIMCMD_FRAME(0x0, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_Frame_1[] = {
    ANIMCMD_FRAME(0x40, 5),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_Frame[] = {
    sAnimCmd_Frame_0,
    sAnimCmd_Frame_1
};

static const struct OamData sOamData_32x8 = {
    .shape = SPRITE_SHAPE(32x8),
    .size = SPRITE_SIZE(32x8)
};

static const union AnimCmd sAnimCmd_MonMark_0000[] = {
    ANIMCMD_FRAME(0x0, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_MonMark_1000[] = {
    ANIMCMD_FRAME(0x4, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_MonMark_0100[] = {
    ANIMCMD_FRAME(0x8, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_MonMark_1100[] = {
    ANIMCMD_FRAME(0xc, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_MonMark_0010[] = {
    ANIMCMD_FRAME(0x10, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_MonMark_1010[] = {
    ANIMCMD_FRAME(0x14, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_MonMark_0110[] = {
    ANIMCMD_FRAME(0x18, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_MonMark_1110[] = {
    ANIMCMD_FRAME(0x1c, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_MonMark_0001[] = {
    ANIMCMD_FRAME(0x20, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_MonMark_1001[] = {
    ANIMCMD_FRAME(0x24, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_MonMark_0101[] = {
    ANIMCMD_FRAME(0x28, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_MonMark_1101[] = {
    ANIMCMD_FRAME(0x2c, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_MonMark_0011[] = {
    ANIMCMD_FRAME(0x30, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_MonMark_1011[] = {
    ANIMCMD_FRAME(0x34, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_MonMark_0111[] = {
    ANIMCMD_FRAME(0x38, 5),
    ANIMCMD_END
};

static const union AnimCmd sAnimCmd_MonMark_1111[] = {
    ANIMCMD_FRAME(0x3c, 5),
    ANIMCMD_END
};

static const union AnimCmd *const sSpriteAnimTable_MonMarkSet[] = {
    sAnimCmd_MonMark_0000,
    sAnimCmd_MonMark_1000,
    sAnimCmd_MonMark_0100,
    sAnimCmd_MonMark_1100,
    sAnimCmd_MonMark_0010,
    sAnimCmd_MonMark_1010,
    sAnimCmd_MonMark_0110,
    sAnimCmd_MonMark_1110,
    sAnimCmd_MonMark_0001,
    sAnimCmd_MonMark_1001,
    sAnimCmd_MonMark_0101,
    sAnimCmd_MonMark_1101,
    sAnimCmd_MonMark_0011,
    sAnimCmd_MonMark_1011,
    sAnimCmd_MonMark_0111,
    sAnimCmd_MonMark_1111
};

void SetMonMarkingsMenuPointer(struct PokemonMarkMenu * markMenu)
{
    sMenu = markMenu;
}

static void GetUserFrameForMonMarkings(void)
{
    const struct TextWindowGraphics * frame = GetUserFrameGraphicsInfo(gSaveBlock2Ptr->optionsWindowFrameType);
    sMenu->frameTiles = frame->tiles;
    sMenu->framePalette = frame->palette;
    sMenu->tileLoadState = 0;
    CpuFill16(0, sMenu->menuWindowSpriteTiles, sizeof(sMenu->menuWindowSpriteTiles));
}

static bool8 DoLoadMonMarkingsFrameGfx(void)
{
    u16 i;
    u8 *menuWindowSpriteTiles = &sMenu->menuWindowSpriteTiles[256 * sMenu->tileLoadState];
    switch (sMenu->tileLoadState)
    {
    case 0:
        CpuFastCopy(sMenu->frameTiles + 0x00, menuWindowSpriteTiles, 0x20);
        for (i = 0; i < 6; i++)
            CpuFastCopy(sMenu->frameTiles + 0x20, menuWindowSpriteTiles + 0x20 * (i + 1), 0x20);
        CpuFastCopy(sMenu->frameTiles + 0x40, menuWindowSpriteTiles + 0x20 * 7, 0x20);
        sMenu->tileLoadState++;
        break;
    default:
        CpuFastCopy(sMenu->frameTiles + 0x60, menuWindowSpriteTiles + 0x00, 0x20);
        for (i = 0; i < 6; i++)
            CpuFastCopy(sMenu->frameTiles + 0x80, menuWindowSpriteTiles + 0x20 * (i + 1), 0x20);
        CpuFastCopy(sMenu->frameTiles + 0xA0, menuWindowSpriteTiles + 0x20 * 7, 0x20);
        sMenu->tileLoadState++;
        break;
    case 13:
        CpuFastCopy(sMenu->frameTiles + 0xC0, menuWindowSpriteTiles + 0x00, 0x20);
        for (i = 0; i < 6; i++)
            CpuFastCopy(sMenu->frameTiles + 0xE0, menuWindowSpriteTiles + 0x20 * (i + 1), 0x20);
        CpuFastCopy(sMenu->frameTiles + 0x100, menuWindowSpriteTiles + 0x20 * 7, 0x20);
        sMenu->tileLoadState++;
        return FALSE;
    case 14:
        return FALSE;
    }
    return TRUE;
}

void LoadMonMarkingsFrameGfx(void)
{
    GetUserFrameForMonMarkings();
    while (DoLoadMonMarkingsFrameGfx())
    {}
}

void DrawMonMarkingsMenu(u8 markings, s16 x, s16 y)
{
    u16 i;
    sMenu->cursorPos = 0;
    sMenu->markings = markings;
    for (i = 0; i < 4; i++)
    {
        sMenu->markingsArray[i] = (sMenu->markings >> i) & 1;
    }
    CreateMonMarkingsMenuSprites(x, y, sMenu->baseTileTag, sMenu->basePaletteTag);;
}

void TeardownMonMarkingsMenu(void)
{
    u16 i;
    for (i = 0; i < 3; i++)
        FreeSpriteTilesByTag(sMenu->baseTileTag + i);
    FreeSpritePaletteByTag(sMenu->basePaletteTag);
    FreeSpritePaletteByTag(sMenu->basePaletteTag + 1);
    for (i = 0; i < 2; i++)
    {
        if (sMenu->menuWindowSprites[i] == NULL)
            return; // break;
        DestroySprite(sMenu->menuWindowSprites[i]);
    }
    for (i = 0; i < 4; i++)
    {
        if (sMenu->menuMarkingSprites[i] == NULL)
            return; // break;
        DestroySprite(sMenu->menuMarkingSprites[i]);
    }
    if (sMenu->unkSprite != NULL)
        DestroySprite(sMenu->unkSprite);
    if (sMenu->menuTextSprite != NULL)
        DestroySprite(sMenu->menuTextSprite);
}

bool8 MonMarkingsHandleInput(void)
{
    u16 i;
    if (JOY_NEW(DPAD_UP))
    {
        PlaySE(SE_SELECT);
        if (--sMenu->cursorPos < 0)
            sMenu->cursorPos = 5;
        return TRUE;
    }
    if (JOY_NEW(DPAD_DOWN))
    {
        PlaySE(SE_SELECT);
        if (++sMenu->cursorPos > 5)
            sMenu->cursorPos = 0;
        return TRUE;
    }
    if (JOY_NEW(A_BUTTON))
    {
        PlaySE(SE_SELECT);
        switch (sMenu->cursorPos)
        {
        case 4:
            sMenu->markings = 0;
            for (i = 0; i < 4; i++)
                sMenu->markings |= sMenu->markingsArray[i] << i;
            return FALSE;
        case 5:
            return FALSE;
        }
        sMenu->markingsArray[sMenu->cursorPos] = sMenu->markingsArray[sMenu->cursorPos] ? FALSE : TRUE;
        return TRUE;
    }
    if (JOY_NEW(B_BUTTON))
    {
        PlaySE(SE_SELECT);
        return FALSE;
    }
    return TRUE;
}

static void CreateMonMarkingsMenuSprites(s16 x, s16 y, u16 tilesTag, u16 paletteTag)
{
    u16 i;
    u8 spriteId;
    struct SpriteSheet sheets[] = {
        {
            .data = sMenu->menuWindowSpriteTiles,
            .size = 0x1000,
            .tag = tilesTag
        }, {
            .data = gUnknown_8E9CBBC,
            .size = 0x320,
            .tag = tilesTag + 1
        }, {}
    };
    struct SpritePalette palettes[] = {
        {
            .data = sMenu->framePalette,
            .tag = paletteTag
        }, {
            .data = gUnknown_8E9CB9C,
            .tag = paletteTag + 1
        }, {}
    };
    struct SpriteTemplate sprTemplate = {
        .tileTag = tilesTag,
        .paletteTag = paletteTag,
        .oam = &sOamData_64x64,
        .anims = sSpriteAnimTable_Frame,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = nullsub_62
    };
    LoadSpriteSheets(sheets);
    LoadSpritePalettes(palettes);

    for (i = 0; i < 2; i++)
    {
        spriteId = CreateSprite(&sprTemplate, x + 32, y + 32, 1);
        if (spriteId != MAX_SPRITES)
        {
            sMenu->menuWindowSprites[i] = &gSprites[spriteId];
            StartSpriteAnim(&gSprites[spriteId], i);
        }
        else
        {
            sMenu->menuWindowSprites[i] = NULL;
            return;
        }
    }

    sMenu->menuWindowSprites[1]->y = y + 96;

    sprTemplate.tileTag++;
    sprTemplate.paletteTag++;
    sprTemplate.anims = sSpriteAnimTable_MenuMark;
    sprTemplate.callback = SpriteCB_MarkingIcon;
    sprTemplate.oam = &sOamData_8x8;

    for (i = 0; i < 4; i++)
    {
        spriteId = CreateSprite(&sprTemplate, x + 32, y + 16 + 16 * i, 0);
        if (spriteId != MAX_SPRITES)
        {
            sMenu->menuMarkingSprites[i] = &gSprites[spriteId];
            gSprites[spriteId].data[0] = i;
        }
        else
        {
            sMenu->menuMarkingSprites[i] = NULL;
            return;
        }
    }

    sprTemplate.callback = SpriteCallbackDummy;

    spriteId = CreateSprite(&sprTemplate, 0, 0, 0);

    if (spriteId != MAX_SPRITES)
    {
        sMenu->menuTextSprite = &gSprites[spriteId];
        sMenu->menuTextSprite->oam.shape = ST_OAM_SQUARE;
        sMenu->menuTextSprite->oam.size = 2;
        StartSpriteAnim(sMenu->menuTextSprite, 9);
        sMenu->menuTextSprite->x = x + 32;
        sMenu->menuTextSprite->y = y + 80;
        CalcCenterToCornerVec(sMenu->menuTextSprite, 1, 2, 0);
    }
    else
    {
        sMenu->menuTextSprite = NULL;
    }

    sprTemplate.callback = SpriteCB_Cursor;

    spriteId = CreateSprite(&sprTemplate, x + 12, 0, 0);

    if (spriteId != MAX_SPRITES)
    {
        sMenu->unkSprite = &gSprites[spriteId];
        sMenu->unkSprite->data[0] = y + 16;
        StartSpriteAnim(sMenu->unkSprite, 8);
    }
    else
    {
        sMenu->unkSprite = NULL;
    }
}

static void nullsub_62(struct Sprite * sprite)
{}

static void SpriteCB_MarkingIcon(struct Sprite * sprite)
{
    if (sMenu->markingsArray[sprite->data[0]])
        StartSpriteAnim(sprite, 2 * sprite->data[0] + 1);
    else
        StartSpriteAnim(sprite, 2 * sprite->data[0] + 0);
}

static void SpriteCB_Cursor(struct Sprite * sprite)
{
    sprite->y = 16 * sMenu->cursorPos + sprite->data[0];
}

struct Sprite * CreateMonMarkingSprite_SelectCombo(u16 tileTag, u16 paletteTag, const u16 *palette)
{
    if (palette == NULL)
        palette = sMonMarkingsPal;
    return CreateMonMarkingSprite(tileTag, paletteTag, palette, 16);
}

struct Sprite * CreateMonMarkingSprite_AllOff(u16 tileTag, u16 paletteTag, const u16 *palette)
{
    if (palette == NULL)
        palette = sMonMarkingsPal;
    return CreateMonMarkingSprite(tileTag, paletteTag, palette, 1);
}

static struct Sprite * CreateMonMarkingSprite(u16 tileTag, u16 paletteTag, const u16 *palette, u16 size)
{
    u8 spriteId;
    struct SpriteTemplate sprTemplate;
    struct SpriteSheet sheet = { sMonMarkingsTiles, 0x80, tileTag };
    struct SpritePalette sprPalette = { palette, paletteTag };

    sprTemplate.tileTag = tileTag;
    sprTemplate.paletteTag = paletteTag;
    sprTemplate.oam = &sOamData_32x8;
    sprTemplate.anims = sSpriteAnimTable_MonMarkSet;
    sprTemplate.images = NULL;
    sprTemplate.affineAnims = gDummySpriteAffineAnimTable;
    sprTemplate.callback = nullsub_62;

    sheet.size = size * 0x80;

    LoadSpriteSheet(&sheet);
    LoadSpritePalette(&sprPalette);

    spriteId = CreateSprite(&sprTemplate, 0, 0, 0);
    if (spriteId != MAX_SPRITES)
        return &gSprites[spriteId];
    else
        return NULL;
}

void RequestDma3LoadMonMarking(u8 markings, void * dest)
{
    RequestDma3Copy(&sMonMarkingsTiles[64 * markings], dest, 0x80, DMA3_32BIT);
}

