#include "global.h"
#include "dma3.h"
#include "text_window_graphics.h"
#include "sound.h"
#include "mon_markings.h"
#include "graphics.h"
#include "constants/songs.h"

EWRAM_DATA struct PokemonMarkMenu * sMenu = NULL;

void sub_80BE7CC(s16 x, s16 y, u16 tilesTag, u16 paletteTag);
void nullsub_62(struct Sprite * sprite);
void sub_80BEA8C(struct Sprite * sprite);
void sub_80BEAC8(struct Sprite * sprite);
struct Sprite * sub_80BEB20(u16 tilesTag, u16 paletteTag, const u16 *palette, u16 size);

const u16 gUnknown_83EE008[] = INCBIN_U16("graphics/misc/mon_markings.gbapal");
const u16 gUnknown_83EE028[] = INCBIN_U16("graphics/misc/mon_markings.4bpp");
const u8 gUnknown_83EE828[] = {0x09, 0x50, 0x13, 0x02, 0xFF};

const struct OamData gUnknown_83EE830 = {
    .shape = SPRITE_SHAPE(64x64),
    .size = SPRITE_SIZE(64x64)
};

const struct OamData gUnknown_83EE838 = {
    .shape = SPRITE_SHAPE(8x8),
    .size = SPRITE_SIZE(8x8)
};

const union AnimCmd gAnimCmd_83EE840[] = {
    ANIMCMD_FRAME(0x0, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE848[] = {
    ANIMCMD_FRAME(0x1, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE850[] = {
    ANIMCMD_FRAME(0x2, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE858[] = {
    ANIMCMD_FRAME(0x3, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE860[] = {
    ANIMCMD_FRAME(0x4, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE868[] = {
    ANIMCMD_FRAME(0x5, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE870[] = {
    ANIMCMD_FRAME(0x6, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE878[] = {
    ANIMCMD_FRAME(0x7, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE880[] = {
    ANIMCMD_FRAME(0x8, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE888[] = {
    ANIMCMD_FRAME(0x9, 5),
    ANIMCMD_END
};

const union AnimCmd *const gUnknown_83EE890[] = {
    gAnimCmd_83EE840,
    gAnimCmd_83EE848,
    gAnimCmd_83EE850,
    gAnimCmd_83EE858,
    gAnimCmd_83EE860,
    gAnimCmd_83EE868,
    gAnimCmd_83EE870,
    gAnimCmd_83EE878,
    gAnimCmd_83EE880,
    gAnimCmd_83EE888
};

const union AnimCmd gAnimCmd_83EE8B8[] = {
    ANIMCMD_FRAME(0x0, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE8C0[] = {
    ANIMCMD_FRAME(0x40, 5),
    ANIMCMD_END
};

const union AnimCmd *const gUnknown_83EE8C8[] = {
    gAnimCmd_83EE8B8,
    gAnimCmd_83EE8C0
};

const struct OamData gUnknown_83EE8D0 = {
    .shape = SPRITE_SHAPE(32x8),
    .size = SPRITE_SIZE(32x8)
};

const union AnimCmd gAnimCmd_83EE8D8[] = {
    ANIMCMD_FRAME(0x0, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE8E0[] = {
    ANIMCMD_FRAME(0x4, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE8E8[] = {
    ANIMCMD_FRAME(0x8, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE8F0[] = {
    ANIMCMD_FRAME(0xc, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE8F8[] = {
    ANIMCMD_FRAME(0x10, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE900[] = {
    ANIMCMD_FRAME(0x14, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE908[] = {
    ANIMCMD_FRAME(0x18, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE910[] = {
    ANIMCMD_FRAME(0x1c, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE918[] = {
    ANIMCMD_FRAME(0x20, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE920[] = {
    ANIMCMD_FRAME(0x24, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE928[] = {
    ANIMCMD_FRAME(0x28, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE930[] = {
    ANIMCMD_FRAME(0x2c, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE938[] = {
    ANIMCMD_FRAME(0x30, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE940[] = {
    ANIMCMD_FRAME(0x34, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE948[] = {
    ANIMCMD_FRAME(0x38, 5),
    ANIMCMD_END
};

const union AnimCmd gAnimCmd_83EE950[] = {
    ANIMCMD_FRAME(0x3c, 5),
    ANIMCMD_END
};

const union AnimCmd *const gUnknown_83EE958[] = {
    gAnimCmd_83EE8D8,
    gAnimCmd_83EE8E0,
    gAnimCmd_83EE8E8,
    gAnimCmd_83EE8F0,
    gAnimCmd_83EE8F8,
    gAnimCmd_83EE900,
    gAnimCmd_83EE908,
    gAnimCmd_83EE910,
    gAnimCmd_83EE918,
    gAnimCmd_83EE920,
    gAnimCmd_83EE928,
    gAnimCmd_83EE930,
    gAnimCmd_83EE938,
    gAnimCmd_83EE940,
    gAnimCmd_83EE948,
    gAnimCmd_83EE950
};

void sub_80BE46C(struct PokemonMarkMenu * markMenu)
{
    sMenu = markMenu;
}

void sub_80BE478(void)
{
    const struct TextWindowGraphics * frame = GetUserFrameGraphicsInfo(gSaveBlock2Ptr->optionsWindowFrameType);
    sMenu->frameTiles = frame->tiles;
    sMenu->framePalette = frame->palette;
    sMenu->tileLoadState = 0;
    CpuFill16(0, sMenu->menuWindowSpriteTiles, sizeof(sMenu->menuWindowSpriteTiles));
}

bool8 sub_80BE4C0(void)
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

void sub_80BE5F0(void)
{
    sub_80BE478();
    while (sub_80BE4C0())
    {}
}

void sub_80BE604(u8 markings, s16 x, s16 y)
{
    u16 i;
    sMenu->cursorPos = 0;
    sMenu->markings = markings;
    for (i = 0; i < 4; i++)
    {
        sMenu->markingsArray[i] = (sMenu->markings >> i) & 1;
    }
    sub_80BE7CC(x, y, sMenu->baseTileTag, sMenu->basePaletteTag);;
}

void sub_80BE658(void)
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

bool8 sub_80BE6F0(void)
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

void sub_80BE7CC(s16 x, s16 y, u16 tilesTag, u16 paletteTag)
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
        .oam = &gUnknown_83EE830,
        .anims = gUnknown_83EE8C8,
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

    sMenu->menuWindowSprites[1]->pos1.y = y + 96;

    sprTemplate.tileTag++;
    sprTemplate.paletteTag++;
    sprTemplate.anims = gUnknown_83EE890;
    sprTemplate.callback = sub_80BEA8C;
    sprTemplate.oam = &gUnknown_83EE838;

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
        sMenu->menuTextSprite->pos1.x = x + 32;
        sMenu->menuTextSprite->pos1.y = y + 80;
        CalcCenterToCornerVec(sMenu->menuTextSprite, 1, 2, 0);
    }
    else
    {
        sMenu->menuTextSprite = NULL;
    }

    sprTemplate.callback = sub_80BEAC8;
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

void nullsub_62(struct Sprite * sprite)
{}

void sub_80BEA8C(struct Sprite * sprite)
{
    if (sMenu->markingsArray[sprite->data[0]])
        StartSpriteAnim(sprite, 2 * sprite->data[0] + 1);
    else
        StartSpriteAnim(sprite, 2 * sprite->data[0] + 0);
}

void sub_80BEAC8(struct Sprite * sprite)
{
    sprite->pos1.y = 16 * sMenu->cursorPos + sprite->data[0];
}

struct Sprite * sub_80BEAE0(u16 tileTag, u16 paletteTag, const u16 *palette)
{
    if (palette == NULL)
        palette = gUnknown_83EE008;
    return sub_80BEB20(tileTag, paletteTag, palette, 16);
}

struct Sprite * sub_80BEB00(u16 tileTag, u16 paletteTag, const u16 *palette)
{
    if (palette == NULL)
        palette = gUnknown_83EE008;
    return sub_80BEB20(tileTag, paletteTag, palette, 1);
}

struct Sprite * sub_80BEB20(u16 tileTag, u16 paletteTag, const u16 *palette, u16 size)
{
    u8 spriteId;
    struct SpriteTemplate sprTemplate;
    struct SpriteSheet sheet = { gUnknown_83EE028, 0x80, tileTag };
    struct SpritePalette sprPalette = { palette, paletteTag };

    sprTemplate.tileTag = tileTag;
    sprTemplate.paletteTag = paletteTag;
    sprTemplate.oam = &gUnknown_83EE8D0;
    sprTemplate.anims = gUnknown_83EE958;
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

void sub_80BEBD0(u8 markings, void * dest)
{
    RequestDma3Copy(&gUnknown_83EE028[64 * markings], dest, 0x80, 1);
}

