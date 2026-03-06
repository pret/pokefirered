#include "global.h"
#include "chase_stamina.h"
#include "gflib.h"
#include "menu.h"
#include "overworld_hud.h"
#include "strings.h"
#include "text_window.h"

#define OVERWORLD_HUD_BG           0
#define OVERWORLD_HUD_LEFT         1
#define OVERWORLD_HUD_TOP          1
#define OVERWORLD_HUD_WIDTH        11
#define OVERWORLD_HUD_HEIGHT       6
#define OVERWORLD_HUD_PAL          13
#define OVERWORLD_HUD_BASE_BLOCK   0x148
#define OVERWORLD_HUD_FRAME_TILE   0x280

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
static EWRAM_DATA u8 sLastActiveChasers = 0xFF;
static EWRAM_DATA u16 sLastChaseSteps = 0xFFFF;
static EWRAM_DATA bool8 sLastChaseActive = FALSE;

static void OverworldHud_PrintLine(u8 y, const u8 *text)
{
    AddTextPrinterParameterized(sOverworldHudWindowId, FONT_SMALL, text, 2, y, TEXT_SKIP_DRAW, NULL);
}

static void OverworldHud_PrintStamina(u8 current, u8 max)
{
    u8 text[24];

    StringCopy(text, gText_StaminaHudLabel);
    ConvertIntToDecimalStringN(text + StringLength(text), current, STR_CONV_MODE_LEFT_ALIGN, 3);
    StringAppend(text, gText_Slash);
    ConvertIntToDecimalStringN(text + StringLength(text), max, STR_CONV_MODE_LEFT_ALIGN, 3);
    FillWindowPixelRect(sOverworldHudWindowId, PIXEL_FILL(1), 2, 2, 84, 8);
    OverworldHud_PrintLine(2, text);
}

static void OverworldHud_PrintChase(bool8 active, u8 activeChasers, u16 chaseSteps)
{
    u8 text[24];

    FillWindowPixelRect(sOverworldHudWindowId, PIXEL_FILL(1), 2, 16, 84, 16);
    if (!active)
    {
        OverworldHud_PrintLine(16, gText_ChaseHudInactive);
        return;
    }

    StringCopy(text, gText_ChaseHudChasersLabel);
    ConvertIntToDecimalStringN(text + StringLength(text), activeChasers, STR_CONV_MODE_LEFT_ALIGN, 1);
    OverworldHud_PrintLine(16, text);

    StringCopy(text, gText_ChaseHudStepsLabel);
    ConvertIntToDecimalStringN(text + StringLength(text), chaseSteps, STR_CONV_MODE_LEFT_ALIGN, 4);
    OverworldHud_PrintLine(24, text);
}

void OverworldHud_Show(void)
{
    if (sOverworldHudWindowId != WINDOW_NONE)
        return;

    sOverworldHudWindowId = AddWindow(&sOverworldHudWindowTemplate);
    FillWindowPixelBuffer(sOverworldHudWindowId, PIXEL_FILL(1));
    PutWindowTilemap(sOverworldHudWindowId);
    LoadStdWindowGfx(sOverworldHudWindowId, OVERWORLD_HUD_FRAME_TILE, BG_PLTT_ID(OVERWORLD_HUD_PAL));
    DrawStdFrameWithCustomTileAndPalette(sOverworldHudWindowId, FALSE, OVERWORLD_HUD_FRAME_TILE, OVERWORLD_HUD_PAL);
    CopyWindowToVram(sOverworldHudWindowId, COPYWIN_FULL);

    sLastStaminaCurrent = 0xFF;
    sLastStaminaMax = 0xFF;
    sLastActiveChasers = 0xFF;
    sLastChaseSteps = 0xFFFF;
    sLastChaseActive = FALSE;
}

void OverworldHud_Hide(void)
{
    if (sOverworldHudWindowId == WINDOW_NONE)
        return;

    ClearStdWindowAndFrameToTransparent(sOverworldHudWindowId, FALSE);
    CopyWindowToVram(sOverworldHudWindowId, COPYWIN_GFX);
    RemoveWindow(sOverworldHudWindowId);
    sOverworldHudWindowId = WINDOW_NONE;
}

void OverworldHud_Update(void)
{
    u8 current;
    u8 max;
    u8 chasers;
    u16 chaseSteps;
    bool8 chaseActive;

    if (sOverworldHudWindowId == WINDOW_NONE)
        OverworldHud_Show();

    current = ChaseStamina_GetCurrent();
    max = ChaseStamina_GetMax();
    chasers = ChaseStamina_GetActiveChasers();
    chaseSteps = ChaseStamina_GetChaseStepsRemaining();
    chaseActive = ChaseStamina_IsChaseActive();

    if (current == sLastStaminaCurrent
     && max == sLastStaminaMax
     && chasers == sLastActiveChasers
     && chaseSteps == sLastChaseSteps
     && chaseActive == sLastChaseActive)
        return;

    sLastStaminaCurrent = current;
    sLastStaminaMax = max;
    sLastActiveChasers = chasers;
    sLastChaseSteps = chaseSteps;
    sLastChaseActive = chaseActive;

    OverworldHud_PrintStamina(current, max);
    OverworldHud_PrintChase(chaseActive, chasers, chaseSteps);
    CopyWindowToVram(sOverworldHudWindowId, COPYWIN_GFX);
}
