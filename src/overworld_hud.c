#include "global.h"
#include "chase_stamina.h"
#include "gflib.h"
#include "overworld_hud.h"

#define OVERWORLD_HUD_BG           0
#define OVERWORLD_HUD_LEFT         1
#define OVERWORLD_HUD_TOP          0
#define OVERWORLD_HUD_WIDTH        28
#define OVERWORLD_HUD_HEIGHT       2
#define OVERWORLD_HUD_PAL          13
#define OVERWORLD_HUD_BASE_BLOCK   0x148

#define STAMINA_BAR_X              0
#define STAMINA_BAR_Y              2
#define STAMINA_BAR_WIDTH          (OVERWORLD_HUD_WIDTH * 8)
#define STAMINA_BAR_HEIGHT         8

// Palette index 0 is kept transparent for the window background.
#define STAMINA_COLOR_EMPTY        PIXEL_FILL(1)
#define STAMINA_COLOR_FILL         PIXEL_FILL(2)

static const u16 sOverworldHudPalette[] = {
    RGB(0, 0, 0),
    RGB(8, 8, 8),     // Empty background
    RGB(0, 28, 0),    // Stamina fill
    RGB(4, 20, 4),
    RGB(31, 31, 31),
    RGB(0, 0, 0),
    RGB(0, 0, 0),
    RGB(0, 0, 0),
    RGB(0, 0, 0),
    RGB(0, 0, 0),
    RGB(0, 0, 0),
    RGB(0, 0, 0),
    RGB(0, 0, 0),
    RGB(0, 0, 0),
    RGB(0, 0, 0),
    RGB(0, 0, 0),
};

static const struct WindowTemplate sOverworldHudWindowTemplate = {
    .bg = OVERWORLD_HUD_BG,
    .tilemapLeft = OVERWORLD_HUD_LEFT,
    .tilemapTop = OVERWORLD_HUD_TOP,
    .width = OVERWORLD_HUD_WIDTH,
    .height = OVERWORLD_HUD_HEIGHT,
    .paletteNum = OVERWORLD_HUD_PAL,
    .baseBlock = OVERWORLD_HUD_BASE_BLOCK,
};

static EWRAM_DATA u8 sOverworldHudWindowId = WINDOW_NONE;
static EWRAM_DATA u8 sLastStaminaCurrent = 0xFF;
static EWRAM_DATA u8 sLastStaminaMax = 0xFF;

static void OverworldHud_DrawStaminaBar(u8 current, u8 max)
{
    u16 fillWidth = 0;

    FillWindowPixelRect(sOverworldHudWindowId, STAMINA_COLOR_EMPTY, STAMINA_BAR_X, STAMINA_BAR_Y, STAMINA_BAR_WIDTH, STAMINA_BAR_HEIGHT);

    if (max != 0)
        fillWidth = (current * STAMINA_BAR_WIDTH) / max;

    if (fillWidth != 0)
        FillWindowPixelRect(sOverworldHudWindowId, STAMINA_COLOR_FILL, STAMINA_BAR_X, STAMINA_BAR_Y, fillWidth, STAMINA_BAR_HEIGHT);
}

void OverworldHud_Show(void)
{
    if (sOverworldHudWindowId != WINDOW_NONE)
        return;

    sOverworldHudWindowId = AddWindow(&sOverworldHudWindowTemplate);
    FillWindowPixelBuffer(sOverworldHudWindowId, PIXEL_FILL(0));
    LoadPalette(sOverworldHudPalette, BG_PLTT_ID(OVERWORLD_HUD_PAL), sizeof(sOverworldHudPalette));
    PutWindowTilemap(sOverworldHudWindowId);
    CopyWindowToVram(sOverworldHudWindowId, COPYWIN_FULL);

    sLastStaminaCurrent = 0xFF;
    sLastStaminaMax = 0xFF;
}

void OverworldHud_Hide(void)
{
    if (sOverworldHudWindowId == WINDOW_NONE)
        return;

    ClearWindowTilemap(sOverworldHudWindowId);
    FillWindowPixelBuffer(sOverworldHudWindowId, PIXEL_FILL(0));
    CopyWindowToVram(sOverworldHudWindowId, COPYWIN_FULL);
    RemoveWindow(sOverworldHudWindowId);
    sOverworldHudWindowId = WINDOW_NONE;
}

void OverworldHud_Update(void)
{
    u8 current;
    u8 max;
    if (sOverworldHudWindowId == WINDOW_NONE)
        OverworldHud_Show();

    current = ChaseStamina_GetCurrent();
    max = ChaseStamina_GetMax();

    if (current == sLastStaminaCurrent && max == sLastStaminaMax)
        return;

    sLastStaminaCurrent = current;
    sLastStaminaMax = max;

    OverworldHud_DrawStaminaBar(current, max);
    CopyWindowToVram(sOverworldHudWindowId, COPYWIN_GFX);
}
