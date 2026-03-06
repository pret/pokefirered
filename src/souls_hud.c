#include "global.h"
#include "gflib.h"
#include "menu.h"
#include "strings.h"
#include "souls_hud.h"
#include "text_window.h"

#define SOULS_HUD_BG           0
#define SOULS_HUD_LEFT         21
#define SOULS_HUD_TOP          1
#define SOULS_HUD_WIDTH        10
#define SOULS_HUD_HEIGHT       4
#define SOULS_HUD_PAL          13
#define SOULS_HUD_BASE_BLOCK   0x120
#define SOULS_HUD_FRAME_TILE   0x240
#define SOULS_HUD_TEXT_X       2
#define SOULS_HUD_TEXT_WIDTH   76

static const struct WindowTemplate sSoulsHudWindowTemplate = {
    .bg = SOULS_HUD_BG,
    .tilemapLeft = SOULS_HUD_LEFT,
    .tilemapTop = SOULS_HUD_TOP,
    .width = SOULS_HUD_WIDTH,
    .height = SOULS_HUD_HEIGHT,
    .paletteNum = SOULS_HUD_PAL,
    .baseBlock = SOULS_HUD_BASE_BLOCK,
};

static EWRAM_DATA u8 sSoulsHudWindowId = WINDOW_NONE;
static EWRAM_DATA u32 sSoulsHudLastDrawnValue = 0;
static EWRAM_DATA bool8 sSoulsHudSuppressed = FALSE;

static void SoulsHud_PrintLabel(void)
{
    s32 x = SOULS_HUD_TEXT_X + (SOULS_HUD_TEXT_WIDTH - GetStringWidth(FONT_SMALL, gText_SoulsHudLabel, 0)) / 2;
    AddTextPrinterParameterized(sSoulsHudWindowId, FONT_SMALL, gText_SoulsHudLabel, x, 1, TEXT_SKIP_DRAW, NULL);
}

static void SoulsHud_PrintValue(u32 souls)
{
    u8 text[16];
    s32 x;

    ConvertIntToDecimalStringN(text, souls, STR_CONV_MODE_LEFT_ALIGN, 6);
    FillWindowPixelRect(sSoulsHudWindowId, PIXEL_FILL(1), SOULS_HUD_TEXT_X, 16, SOULS_HUD_TEXT_WIDTH, 8);
    x = SOULS_HUD_TEXT_X + (SOULS_HUD_TEXT_WIDTH - GetStringWidth(FONT_SMALL, text, 0)) / 2;
    AddTextPrinterParameterized(sSoulsHudWindowId, FONT_SMALL, text, x, 16, TEXT_SKIP_DRAW, NULL);
}

bool8 SoulsHud_IsVisible(void)
{
    return sSoulsHudWindowId != WINDOW_NONE;
}

bool8 SoulsHud_IsSuppressed(void)
{
    return sSoulsHudSuppressed;
}

void SoulsHud_Toggle(void)
{
    if (SoulsHud_IsVisible())
    {
        sSoulsHudSuppressed = TRUE;
        SoulsHud_Hide();
    }
    else
    {
        sSoulsHudSuppressed = FALSE;
        SoulsHud_Show();
    }
}

void SoulsHud_Show(void)
{
    if (SoulsHud_IsVisible())
        return;

    sSoulsHudWindowId = AddWindow(&sSoulsHudWindowTemplate);
    FillWindowPixelBuffer(sSoulsHudWindowId, PIXEL_FILL(1));
    PutWindowTilemap(sSoulsHudWindowId);
    LoadStdWindowGfx(sSoulsHudWindowId, SOULS_HUD_FRAME_TILE, BG_PLTT_ID(SOULS_HUD_PAL));
    DrawStdFrameWithCustomTileAndPalette(sSoulsHudWindowId, FALSE, SOULS_HUD_FRAME_TILE, SOULS_HUD_PAL);
    SoulsHud_PrintLabel();
    CopyWindowToVram(sSoulsHudWindowId, COPYWIN_FULL);

    sSoulsHudLastDrawnValue = (u32)-1;
    SoulsHud_Update();
}

void SoulsHud_Hide(void)
{
    if (!SoulsHud_IsVisible())
        return;

    ClearStdWindowAndFrameToTransparent(sSoulsHudWindowId, FALSE);
    CopyWindowToVram(sSoulsHudWindowId, COPYWIN_GFX);
    RemoveWindow(sSoulsHudWindowId);
    sSoulsHudWindowId = WINDOW_NONE;
}

void SoulsHud_Update(void)
{
    u32 souls;

    if (!SoulsHud_IsVisible())
        return;

    souls = gSaveBlock1Ptr->corpseRun.droppedSouls;
    if (souls == sSoulsHudLastDrawnValue)
        return;

    sSoulsHudLastDrawnValue = souls;
    SoulsHud_PrintValue(souls);
    CopyWindowToVram(sSoulsHudWindowId, COPYWIN_GFX);
}
