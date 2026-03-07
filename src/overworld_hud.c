#include "global.h"
#include "chase_stamina.h"
#include "gflib.h"
#include "overworld.h"
#include "overworld_hud.h"
#include "script.h"
#include "pokemon_icon.h"
#include "constants/species.h"

#define OVERWORLD_HUD_BG           0
#define OVERWORLD_HUD_LEFT         1
#define OVERWORLD_HUD_TOP          0
#define OVERWORLD_HUD_WIDTH        12
#define OVERWORLD_HUD_HEIGHT       2
#define OVERWORLD_HUD_PAL          13
#define OVERWORLD_HUD_BASE_BLOCK   0x148
#define OVERWORLD_CHASE_COUNT_LEFT 24
#define OVERWORLD_CHASE_COUNT_TOP  0
#define OVERWORLD_CHASE_COUNT_WIDTH 6
#define OVERWORLD_CHASE_COUNT_HEIGHT 2
#define OVERWORLD_CHASE_COUNT_PAL  13
#define OVERWORLD_CHASE_COUNT_BASE_BLOCK 0x160

#define STAMINA_BAR_X              0
#define STAMINA_BAR_Y              2
#define STAMINA_BAR_WIDTH          (OVERWORLD_HUD_WIDTH * 8)
#define STAMINA_BAR_HEIGHT         8
#define CHASE_ICON_COUNT_MAX       2
#define CHASE_ICON_X_START         180
#define CHASE_ICON_X_SPACING       18
#define CHASE_ICON_Y               11
#define CHASE_HUD_ICON_SPECIES     SPECIES_HOUNDOUR
#define CHASE_RESOLVED_DISPLAY_FRAMES 30
#define CHASE_PRESSURE_HIGH_COUNT  2
#define CHASE_PULSE_SLOW_FRAMES    14
#define CHASE_PULSE_FAST_FRAMES    6

#define TOAST_WINDOW_BG            OVERWORLD_HUD_BG
#define TOAST_WINDOW_LEFT          1
#define TOAST_WINDOW_TOP           3
#define TOAST_WINDOW_WIDTH         18
#define TOAST_WINDOW_HEIGHT        2
#define TOAST_WINDOW_PAL           13
#define TOAST_WINDOW_BASE_BLOCK    0x160
#define TOAST_TEXT_X               4
#define TOAST_TEXT_Y               2

#define TOAST_DURATION_DEFAULT     120

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
static const struct WindowTemplate sToastWindowTemplate = {
    .bg = TOAST_WINDOW_BG,
    .tilemapLeft = TOAST_WINDOW_LEFT,
    .tilemapTop = TOAST_WINDOW_TOP,
    .width = TOAST_WINDOW_WIDTH,
    .height = TOAST_WINDOW_HEIGHT,
    .paletteNum = TOAST_WINDOW_PAL,
    .baseBlock = TOAST_WINDOW_BASE_BLOCK,
};


static const struct WindowTemplate sOverworldChaseCountWindowTemplate = {
    .bg = OVERWORLD_HUD_BG,
    .tilemapLeft = OVERWORLD_CHASE_COUNT_LEFT,
    .tilemapTop = OVERWORLD_CHASE_COUNT_TOP,
    .width = OVERWORLD_CHASE_COUNT_WIDTH,
    .height = OVERWORLD_CHASE_COUNT_HEIGHT,
    .paletteNum = OVERWORLD_CHASE_COUNT_PAL,
    .baseBlock = OVERWORLD_CHASE_COUNT_BASE_BLOCK,
};

static EWRAM_DATA u8 sOverworldHudWindowId = WINDOW_NONE;
static EWRAM_DATA u8 sOverworldChaseCountWindowId = WINDOW_NONE;
static EWRAM_DATA u8 sToastWindowId = WINDOW_NONE;
static EWRAM_DATA u8 sToastTimer = 0;
static EWRAM_DATA u8 sLastStaminaCurrent = 0xFF;
static EWRAM_DATA u8 sLastStaminaMax = 0xFF;
static EWRAM_DATA u8 sLastChaserCount = 0xFF;
static EWRAM_DATA u8 sLastPulseDelay = 0xFF;
static EWRAM_DATA u8 sPulseFrameCounter = 0;
static EWRAM_DATA u8 sChaseIconSpriteIds[CHASE_ICON_COUNT_MAX] = {MAX_SPRITES, MAX_SPRITES};
static EWRAM_DATA u8 sChaseResolvedDisplayFrames = 0;

static const u8 sOverworldChaseCountTextColor[] = {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_WHITE, TEXT_COLOR_DARK_GRAY};

static void OverworldHud_UpdateChaseCount(u8 chaserCount)
{
    u8 text[6];
    s32 x;

    if (sOverworldChaseCountWindowId == WINDOW_NONE)
        return;

    if (chaserCount == 0)
    {
        if (sLastChaserCount != 0)
        {
            FillWindowPixelBuffer(sOverworldChaseCountWindowId, PIXEL_FILL(0));
            CopyWindowToVram(sOverworldChaseCountWindowId, COPYWIN_GFX);
        }
        sLastChaserCount = 0;
        return;
    }

    if (sLastChaserCount == chaserCount)
        return;

    FillWindowPixelBuffer(sOverworldChaseCountWindowId, PIXEL_FILL(0));
    StringCopy(text, (u8 *)"x");
    ConvertIntToDecimalStringN(text + 1, chaserCount, STR_CONV_MODE_LEFT_ALIGN, 2);
    x = 2 + (OVERWORLD_CHASE_COUNT_WIDTH * 8 - 4 - GetStringWidth(FONT_SMALL, text, 0)) / 2;
    AddTextPrinterParameterized3(sOverworldChaseCountWindowId, FONT_SMALL, x, 5, sOverworldChaseCountTextColor, 0, text);
    CopyWindowToVram(sOverworldChaseCountWindowId, COPYWIN_GFX);

    sLastChaserCount = chaserCount;
}

static void OverworldHud_DestroyChaseIcons(void)
{
    u8 i;

    for (i = 0; i < CHASE_ICON_COUNT_MAX; i++)
    {
        if (sChaseIconSpriteIds[i] != MAX_SPRITES)
        {
            DestroyMonIcon(&gSprites[sChaseIconSpriteIds[i]]);
            sChaseIconSpriteIds[i] = MAX_SPRITES;
        }
    }

    SafeFreeMonIconPalette(CHASE_HUD_ICON_SPECIES);
}

static void OverworldHud_UpdateChaseIcons(void)
{
    u8 iconCount;
    u8 chaserCount;
    u8 pulseDelay;
    u8 i;

    // These are HUD-only indicators for chase pressure (screen-space icons),
    // not the overworld pursuing object events handled by chase_overworld.c.
    if (ChaseStamina_IsChaseActive())
        iconCount = min(ChaseStamina_GetActiveChasers(), CHASE_ICON_COUNT_MAX);
    else if (sChaseResolvedDisplayFrames != 0)
        iconCount = 1;
        chaserCount = ChaseStamina_GetActiveChasers();
    else
        chaserCount = 0;

    if (chaserCount != 0)
        iconCount = min(chaserCount, CHASE_ICON_COUNT_MAX);
    else
        iconCount = 0;

    pulseDelay = (chaserCount >= CHASE_PRESSURE_HIGH_COUNT) ? CHASE_PULSE_FAST_FRAMES : CHASE_PULSE_SLOW_FRAMES;

    if (iconCount == 0)
    {
        sPulseFrameCounter = 0;
        sLastPulseDelay = pulseDelay;
    }
    else
    {
        if (sLastPulseDelay != pulseDelay)
            sPulseFrameCounter = 0;
        sPulseFrameCounter++;
        sLastPulseDelay = pulseDelay;
    }

    for (i = 0; i < CHASE_ICON_COUNT_MAX; i++)
    {
        if (i < iconCount)
        {
            if (sChaseIconSpriteIds[i] == MAX_SPRITES)
            {
                SafeLoadMonIconPalette(CHASE_HUD_ICON_SPECIES);
                sChaseIconSpriteIds[i] = CreateMonIcon(CHASE_HUD_ICON_SPECIES,
                                                       SpriteCB_MonIcon,
                                                       CHASE_ICON_X_START + i * CHASE_ICON_X_SPACING,
                                                       CHASE_ICON_Y,
                                                       0,
                                                       0,
                                                       FALSE);
                if (sChaseIconSpriteIds[i] == MAX_SPRITES)
                    SafeFreeMonIconPalette(CHASE_HUD_ICON_SPECIES);
            }

            if (sChaseIconSpriteIds[i] != MAX_SPRITES)
            {
                struct Sprite *iconSprite = &gSprites[sChaseIconSpriteIds[i]];
                if (sPulseFrameCounter % pulseDelay < pulseDelay / 2)
                    iconSprite->y2 = 0;
                else
                    iconSprite->y2 = -1;
            }
        }
        else if (sChaseIconSpriteIds[i] != MAX_SPRITES)
        {
            DestroyMonIcon(&gSprites[sChaseIconSpriteIds[i]]);
            sChaseIconSpriteIds[i] = MAX_SPRITES;
            SafeFreeMonIconPalette(CHASE_HUD_ICON_SPECIES);
        }
    }

    OverworldHud_UpdateChaseCount(chaserCount);
}

static void OverworldHud_DrawStaminaBar(u8 current, u8 max)
{
    u16 fillWidth = 0;

    FillWindowPixelRect(sOverworldHudWindowId, STAMINA_COLOR_EMPTY, STAMINA_BAR_X, STAMINA_BAR_Y, STAMINA_BAR_WIDTH, STAMINA_BAR_HEIGHT);

    if (max != 0)
        fillWidth = (current * STAMINA_BAR_WIDTH) / max;

    if (fillWidth != 0)
        FillWindowPixelRect(sOverworldHudWindowId, STAMINA_COLOR_FILL, STAMINA_BAR_X, STAMINA_BAR_Y, fillWidth, STAMINA_BAR_HEIGHT);
}

static bool8 OverworldHud_IsToastSuppressed(void)
{
    if (ScriptContext_IsEnabled())
        return TRUE;

    if (gPaletteFade.active)
        return TRUE;

    if (IsUpdateLinkStateCBActive())
        return TRUE;

    return FALSE;
}

static void OverworldHud_HideToast(void)
{
    if (sToastWindowId == WINDOW_NONE)
        return;

    ClearWindowTilemap(sToastWindowId);
    FillWindowPixelBuffer(sToastWindowId, PIXEL_FILL(0));
    CopyWindowToVram(sToastWindowId, COPYWIN_FULL);
    RemoveWindow(sToastWindowId);
    sToastWindowId = WINDOW_NONE;
    sToastTimer = 0;
}

void OverworldHud_ShowToast(const u8 *text, u8 durationFrames)
{
    if (text == NULL || OverworldHud_IsToastSuppressed())
        return;

    if (durationFrames == 0)
        durationFrames = TOAST_DURATION_DEFAULT;

    if (sToastWindowId == WINDOW_NONE)
        sToastWindowId = AddWindow(&sToastWindowTemplate);

    FillWindowPixelBuffer(sToastWindowId, PIXEL_FILL(1));
    PutWindowTilemap(sToastWindowId);
    AddTextPrinterParameterized(sToastWindowId, FONT_SMALL, text, TOAST_TEXT_X, TOAST_TEXT_Y, TEXT_SKIP_DRAW, NULL);
    CopyWindowToVram(sToastWindowId, COPYWIN_FULL);
    sToastTimer = durationFrames;
}

void OverworldHud_Show(void)
{
    if (sOverworldHudWindowId != WINDOW_NONE)
        return;

    sOverworldHudWindowId = AddWindow(&sOverworldHudWindowTemplate);
    sOverworldChaseCountWindowId = AddWindow(&sOverworldChaseCountWindowTemplate);
    FillWindowPixelBuffer(sOverworldHudWindowId, PIXEL_FILL(0));
    FillWindowPixelBuffer(sOverworldChaseCountWindowId, PIXEL_FILL(0));
    LoadPalette(sOverworldHudPalette, BG_PLTT_ID(OVERWORLD_HUD_PAL), sizeof(sOverworldHudPalette));
    PutWindowTilemap(sOverworldHudWindowId);
    PutWindowTilemap(sOverworldChaseCountWindowId);
    CopyWindowToVram(sOverworldHudWindowId, COPYWIN_FULL);
    CopyWindowToVram(sOverworldChaseCountWindowId, COPYWIN_FULL);

    sLastStaminaCurrent = 0xFF;
    sLastStaminaMax = 0xFF;
    sChaseResolvedDisplayFrames = 0;
    sLastChaserCount = 0xFF;
    sPulseFrameCounter = 0;
    sLastPulseDelay = 0xFF;
    OverworldHud_UpdateChaseIcons();
}

void OverworldHud_Hide(void)
{
    if (sOverworldHudWindowId == WINDOW_NONE)
        return;

    ClearWindowTilemap(sOverworldHudWindowId);
    ClearWindowTilemap(sOverworldChaseCountWindowId);
    FillWindowPixelBuffer(sOverworldHudWindowId, PIXEL_FILL(0));
    FillWindowPixelBuffer(sOverworldChaseCountWindowId, PIXEL_FILL(0));
    CopyWindowToVram(sOverworldHudWindowId, COPYWIN_FULL);
    CopyWindowToVram(sOverworldChaseCountWindowId, COPYWIN_FULL);
    RemoveWindow(sOverworldHudWindowId);
    RemoveWindow(sOverworldChaseCountWindowId);
    sOverworldHudWindowId = WINDOW_NONE;
    sOverworldChaseCountWindowId = WINDOW_NONE;
    OverworldHud_DestroyChaseIcons();
    OverworldHud_HideToast();
}

void OverworldHud_Update(void)
{
    u8 current;
    u8 max;

    if (sToastWindowId != WINDOW_NONE)
    {
        if (OverworldHud_IsToastSuppressed())
            OverworldHud_HideToast();
        else if (sToastTimer != 0 && --sToastTimer == 0)
            OverworldHud_HideToast();
    }

    if (sOverworldHudWindowId == WINDOW_NONE)
        OverworldHud_Show();

    if (sChaseResolvedDisplayFrames != 0 && !ChaseStamina_IsChaseActive())
        sChaseResolvedDisplayFrames--;

    current = ChaseStamina_GetCurrent();
    max = ChaseStamina_GetMax();

    if (current == sLastStaminaCurrent && max == sLastStaminaMax)
    {
        OverworldHud_UpdateChaseIcons();
        return;
    }

    sLastStaminaCurrent = current;
    sLastStaminaMax = max;

    OverworldHud_DrawStaminaBar(current, max);
    CopyWindowToVram(sOverworldHudWindowId, COPYWIN_GFX);
    OverworldHud_UpdateChaseIcons();
}

void OverworldHud_BeginChaseResolvedState(void)
{
    sChaseResolvedDisplayFrames = CHASE_RESOLVED_DISPLAY_FRAMES;
}
