#include "global.h"
#include "window.h"
#include "text.h"
#include "decompress.h"
#include "palette.h"
#include "sprite.h"

#define NAMEBOX_TAG_GFX   0xD222
#define NAMEBOX_TAG_PAL   0xD223

static const u32 sNamebox_Gfx[] = INCBIN_U32("graphics/text_window/name_box.4bpp.lz");
static const u16 sNamebox_Pal[] = INCBIN_U16("graphics/text_window/name_box.gbapal");

static const struct CompressedSpriteSheet sSheet_Namebox = {
    .data = sNamebox_Gfx,
    .size = 64 * 32 / 2,     
    .tag  = NAMEBOX_TAG_GFX,
};

static const struct SpritePalette sPal_Namebox = {
    .data = sNamebox_Pal,
    .tag  = NAMEBOX_TAG_PAL,
};

static const struct OamData sOam_Namebox = {
    .shape     = SPRITE_SHAPE(64x32),
    .size      = SPRITE_SIZE(64x32),
    .priority  = 1,              
};

static const union AnimCmd sAnim_Namebox[] = { ANIMCMD_FRAME(0, 0), ANIMCMD_END };
static const union AnimCmd *const sAnimTable_Namebox[] = { sAnim_Namebox };

static const struct SpriteTemplate sTemplate_Namebox = {
    .tileTag      = NAMEBOX_TAG_GFX,
    .paletteTag   = NAMEBOX_TAG_PAL,
    .oam          = &sOam_Namebox,
    .anims        = sAnimTable_Namebox,
    .images       = NULL,
    .affineAnims  = gDummySpriteAffineAnimTable,
    .callback     = SpriteCallbackDummy,
};


static const struct WindowTemplate sWin_Namebox = {
    .bg           = 0,
    .tilemapLeft  = 1,
    .tilemapTop   = 12,
    .width        = 8,
    .height       = 2,
    .paletteNum   = 15,
    .baseBlock    = 0x100,
};

static EWRAM_DATA u8 sNameboxWinId   = 0;
static EWRAM_DATA u8 sNameboxSprId   = MAX_SPRITES;

bool8 IsNameboxDisplayed(void) { return sNameboxWinId != 0; }

void ClearNamebox(void)
{
    if (!IsNameboxDisplayed())
        return;

    ClearWindowTilemap(sNameboxWinId);
    FillWindowPixelBuffer(sNameboxWinId, PIXEL_FILL(0));
    CopyWindowToVram(sNameboxWinId, COPYWIN_GFX | COPYWIN_MAP);
    RemoveWindow(sNameboxWinId);
    sNameboxWinId = 0;

    if (sNameboxSprId < MAX_SPRITES)
        DestroySpriteAndFreeResources(&gSprites[sNameboxSprId]);
    sNameboxSprId = MAX_SPRITES;
}

void ShowNamebox(const u8 *text)
{
    if (IsNameboxDisplayed())
        ClearNamebox();

    sNameboxWinId = AddWindow(&sWin_Namebox);

    FillWindowPixelBuffer(sNameboxWinId, PIXEL_FILL(0));
    PutWindowTilemap(sNameboxWinId);

    AddTextPrinterParameterized(sNameboxWinId, FONT_NORMAL,
                                text,
                                6, 2,   
                                TEXT_SKIP_DRAW, NULL);

    CopyWindowToVram(sNameboxWinId, COPYWIN_GFX | COPYWIN_MAP);

    LoadCompressedSpriteSheet(&sSheet_Namebox);
    LoadSpritePalette(&sPal_Namebox);

    sNameboxSprId = CreateSprite(&sTemplate_Namebox,  37, 104, 0);
}