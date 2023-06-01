#include "global.h"
#include "gflib.h"
#include "blend_palette.h"
#include "field_effect.h"
#include "field_weather.h"
#include "field_weather_util.h"
#include "field_weather_effects.h"
#include "task.h"
#include "trig.h"
#include "constants/field_weather.h"
#include "constants/weather.h"
#include "constants/songs.h"

#define DROUGHT_COLOR_INDEX(color) ((((color) >> 1) & 0xF) | (((color) >> 2) & 0xF0) | (((color) >> 3) & 0xF00))

enum
{
    GAMMA_NONE,
    GAMMA_NORMAL,
    GAMMA_ALT,
};

struct RGBColor
{
    u16 r:5;
    u16 g:5;
    u16 b:5;
};

struct WeatherPaletteData
{
    u16 gammaShiftColors[8][0x1000]; // 0x1000 is the number of bytes that make up all palettes.
};

struct WeatherCallbacks
{
    void (*initVars)(void);
    void (*main)(void);
    void (*initAll)(void);
    bool8 (*finish)(void);
};

static EWRAM_DATA struct Weather sWeather = {};
static EWRAM_DATA u8 sFieldEffectPaletteGammaTypes[32] = {};
static EWRAM_DATA const u8 *sPaletteGammaTypes = NULL;
static EWRAM_DATA u16 sDroughtFrameDelay = 0;

static void Task_WeatherMain(u8 taskId);
static void Task_WeatherInit(u8 taskId);
static void None_Init(void);
static void None_Main(void);
static bool8 None_Finish(void);
static void BuildGammaShiftTables(void);
static void UpdateWeatherGammaShift(void);
static void ApplyGammaShift(u8 startPalIndex, u8 numPalettes, s8 gammaIndex);
static void ApplyGammaShiftWithBlend(u8 startPalIndex, u8 numPalettes, s8 gammaIndex, u8 blendCoeff, u16 blendColor);
static void ApplyDroughtGammaShiftWithBlend(s8 gammaIndex, u8 blendCoeff, u16 blendColor);
static void FadeInScreenWithWeather(void);
static bool8 FadeInScreen_RainShowShade(void);
static bool8 FadeInScreen_Drought(void);
static bool8 FadeInScreen_FogHorizontal(void);
static void DoNothing(void);
static void ApplyFogBlend(u8 blendCoeff, u16 blendColor);
static bool8 LightenSpritePaletteInFog(u8 paletteIndex);

struct Weather *const gWeatherPtr = &sWeather;

static const struct WeatherCallbacks sWeatherFuncs[] = {
    {None_Init, None_Main, None_Init, None_Finish},
    {Clouds_InitVars, Clouds_Main, Clouds_InitAll, Clouds_Finish},
    {Sunny_InitVars, Sunny_Main, Sunny_InitAll, Sunny_Finish},
    {Rain_InitVars, Rain_Main, Rain_InitAll, Rain_Finish},
    {Snow_InitVars, Snow_Main, Snow_InitAll, Snow_Finish},
    {Thunderstorm_InitVars, Thunderstorm_Main, Thunderstorm_InitAll, Thunderstorm_Finish},
    {FogHorizontal_InitVars, FogHorizontal_Main, FogHorizontal_InitAll, FogHorizontal_Finish},
    {Ash_InitVars, Ash_Main, Ash_InitAll, Ash_Finish},
    {Sandstorm_InitVars, Sandstorm_Main, Sandstorm_InitAll, Sandstorm_Finish},
    {FogDiagonal_InitVars, FogDiagonal_Main, FogDiagonal_InitAll, FogDiagonal_Finish},
    {FogHorizontal_InitVars, FogHorizontal_Main, FogHorizontal_InitAll, FogHorizontal_Finish},
    {Shade_InitVars, Shade_Main, Shade_InitAll, Shade_Finish},
    {Drought_InitVars, Drought_Main, Drought_InitAll, Drought_Finish},
    {Downpour_InitVars, Thunderstorm_Main, Downpour_InitAll, Thunderstorm_Finish},
    {Bubbles_InitVars, Bubbles_Main, Bubbles_InitAll, Bubbles_Finish},
};

static void (*const sWeatherPalStateFuncs[])(void) = {
    UpdateWeatherGammaShift,
    FadeInScreenWithWeather,
    DoNothing,
    DoNothing
};

static const u8 sBasePaletteGammaTypes[32] = {
    // background palettes
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NONE,
    GAMMA_NONE,
    GAMMA_NONE,
    // sprite palettes
    GAMMA_ALT,
    GAMMA_NORMAL,
    GAMMA_ALT,
    GAMMA_ALT,
    GAMMA_ALT,
    GAMMA_ALT,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_ALT,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
    GAMMA_NORMAL,
};

const u16 gDefaultWeatherSpritePalette[] = INCBIN_U16("graphics/weather/default.gbapal");
const u16 gCloudsWeatherPalette[] = INCBIN_U16("graphics/weather/cloud.gbapal");
const u16 gSandstormWeatherPalette[] = INCBIN_U16("graphics/weather/sandstorm.gbapal");
const u8 gWeatherFogDiagonalTiles[] = INCBIN_U8("graphics/weather/fog_diagonal.4bpp");
const u8 gWeatherFogHorizontalTiles[] = INCBIN_U8("graphics/weather/fog_horizontal.4bpp");
const u8 gWeatherCloudTiles[] = INCBIN_U8("graphics/weather/cloud.4bpp");
const u8 gWeatherSnow1Tiles[] = INCBIN_U8("graphics/weather/snow0.4bpp");
const u8 gWeatherSnow2Tiles[] = INCBIN_U8("graphics/weather/snow1.4bpp");
const u8 gWeatherBubbleTiles[] = INCBIN_U8("graphics/weather/bubble.4bpp");
const u8 gWeatherAshTiles[] = INCBIN_U8("graphics/weather/ash.4bpp");
const u8 gWeatherRainTiles[] = INCBIN_U8("graphics/weather/rain.4bpp");
const u8 gWeatherSandstormTiles[] = INCBIN_U8("graphics/weather/sandstorm.4bpp");

// code
void StartWeather(void)
{
    if (!FuncIsActiveTask(Task_WeatherMain))
    {
        u8 index = AllocSpritePalette(0x1200);
        CpuCopy32(gDefaultWeatherSpritePalette, &gPlttBufferUnfaded[OBJ_PLTT_ID(index)], PLTT_SIZE_4BPP);
        ApplyGlobalFieldPaletteTint(index);
        BuildGammaShiftTables();
        gWeatherPtr->altGammaSpritePalIndex = index;
        gWeatherPtr->weatherPicSpritePalIndex = index;
        gWeatherPtr->rainSpriteCount = 0;
        gWeatherPtr->curRainSpriteIndex = 0;
        gWeatherPtr->cloudSpritesCreated = FALSE;
        gWeatherPtr->snowflakeSpriteCount = 0;
        gWeatherPtr->ashSpritesCreated = FALSE;
        gWeatherPtr->fogHSpritesCreated = FALSE;
        gWeatherPtr->fogDSpritesCreated = FALSE;
        gWeatherPtr->sandstormSpritesCreated = FALSE;
        gWeatherPtr->sandstormSwirlSpritesCreated = FALSE;
        gWeatherPtr->bubblesSpritesCreated = FALSE;
        gWeatherPtr->lightenedFogSpritePalsCount = 0;
        Weather_SetBlendCoeffs(16, 0);
        gWeatherPtr->currWeather = WEATHER_NONE;
        gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_IDLE;
        gWeatherPtr->readyForInit = FALSE;
        gWeatherPtr->weatherChangeComplete = TRUE;
        gWeatherPtr->taskId = CreateTask(Task_WeatherInit, 80);
    }
}

void SetNextWeather(u8 weather)
{
    if (weather != WEATHER_RAIN && weather != WEATHER_RAIN_THUNDERSTORM && weather != WEATHER_DOWNPOUR)
    {
        PlayRainStoppingSoundEffect();
    }

    if (gWeatherPtr->nextWeather != weather && gWeatherPtr->currWeather == weather)
    {
        sWeatherFuncs[weather].initVars();
    }

    gWeatherPtr->weatherChangeComplete = FALSE;
    gWeatherPtr->nextWeather = weather;
    gWeatherPtr->finishStep = 0;
}


void SetCurrentAndNextWeather(u8 weather)
{
    PlayRainStoppingSoundEffect();
    gWeatherPtr->currWeather = weather;
    gWeatherPtr->nextWeather = weather;
}

static void SetCurrentAndNextWeatherNoDelay(u8 weather)
{
    PlayRainStoppingSoundEffect();
    gWeatherPtr->currWeather = weather;
    gWeatherPtr->nextWeather = weather;
    // Overrides the normal delay during screen fading.
    gWeatherPtr->readyForInit = TRUE;
}

static void Task_WeatherInit(u8 taskId)
{
    // Waits until it's ok to initialize weather.
    // When the screen fades in, this is set to TRUE.
    if (gWeatherPtr->readyForInit)
    {
        sWeatherFuncs[gWeatherPtr->currWeather].initAll();
        gTasks[taskId].func = Task_WeatherMain;
    }
}

static void Task_WeatherMain(u8 taskId)
{
    if (gWeatherPtr->currWeather != gWeatherPtr->nextWeather)
    {
        if (!sWeatherFuncs[gWeatherPtr->currWeather].finish()
            /*&& gWeatherPtr->palProcessingState != WEATHER_PAL_STATE_SCREEN_FADING_OUT*/)
        {
            // Finished cleaning up previous weather. Now transition to next weather.
            sWeatherFuncs[gWeatherPtr->nextWeather].initVars();
            gWeatherPtr->gammaStepFrameCounter = 0;
            gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_CHANGING_WEATHER;
            gWeatherPtr->currWeather = gWeatherPtr->nextWeather;
            gWeatherPtr->weatherChangeComplete = TRUE;
        }
    }
    else
    {
        sWeatherFuncs[gWeatherPtr->currWeather].main();
    }

    sWeatherPalStateFuncs[gWeatherPtr->palProcessingState]();
}


static void None_Init(void)
{
    gWeatherPtr->gammaTargetIndex = 0;
    gWeatherPtr->gammaStepDelay = 0;
}

static void None_Main(void)
{
}

static u8 None_Finish(void)
{
    return 0;
}

// Builds two tables that contain gamma shifts for palette colors.
// It's unclear why the two tables aren't declared as const arrays, since
// this function always builds the same two tables.
static void BuildGammaShiftTables(void)
{
    u16 v0;
    u8 (*gammaTable)[32];
    u16 v2;
    u16 v4;
    u16 v5;
    u16 gammaIndex;
    u16 v9;
    u32 v10;
    u16 v11;
    s16 dunno;

    sPaletteGammaTypes = sBasePaletteGammaTypes;
    for (v0 = 0; v0 <= 1; v0++)
    {
        if (v0 == 0)
            gammaTable = gWeatherPtr->gammaShifts;
        else
            gammaTable = gWeatherPtr->altGammaShifts;

        for (v2 = 0; v2 < 32; v2++)
        {
            v4 = v2 << 8;
            if (v0 == 0)
                v5 = (v2 << 8) / 16;
            else
                v5 = 0;
            for (gammaIndex = 0; gammaIndex <= 2; gammaIndex++)
            {
                v4 = (v4 - v5);
                gammaTable[gammaIndex][v2] = v4 >> 8;
            }
            v9 = v4;
            v10 = 0x1f00 - v4;
            if ((0x1f00 - v4) < 0)
            {
                v10 += 0xf;
            }
            v11 = v10 >> 4;
            if (v2 < 12)
            {
                for (; gammaIndex < 19; gammaIndex++)
                {
                    v4 += v11;
                    dunno = v4 - v9;
                    if (dunno > 0)
                        v4 -= (dunno + ((u16)dunno >> 15)) >> 1;
                    gammaTable[gammaIndex][v2] = v4 >> 8;
                    if (gammaTable[gammaIndex][v2] > 0x1f)
                        gammaTable[gammaIndex][v2] = 0x1f;
                }
            }
            else
            {
                for (; gammaIndex < 19; gammaIndex++)
                {
                    v4 += v11;
                    gammaTable[gammaIndex][v2] = v4 >> 8;
                    if (gammaTable[gammaIndex][v2] > 0x1f)
                        gammaTable[gammaIndex][v2] = 0x1f;
                }
            }
        }
    }
}

// When the weather is changing, it gradually updates the palettes
// towards the desired gamma shift.
static void UpdateWeatherGammaShift(void)
{
    if (gWeatherPtr->gammaIndex == gWeatherPtr->gammaTargetIndex)
    {
        gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_IDLE;
    }
    else
    {
        if (++gWeatherPtr->gammaStepFrameCounter >= gWeatherPtr->gammaStepDelay)
        {
            gWeatherPtr->gammaStepFrameCounter = 0;
            if (gWeatherPtr->gammaIndex < gWeatherPtr->gammaTargetIndex)
                gWeatherPtr->gammaIndex++;
            else
                gWeatherPtr->gammaIndex--;

            ApplyGammaShift(0, 32, gWeatherPtr->gammaIndex);
        }
    }
}

static void FadeInScreenWithWeather(void)
{
    if (++gWeatherPtr->fadeInCounter > 1)
        gWeatherPtr->fadeInActive = 0;

    switch (gWeatherPtr->currWeather)
    {
    case WEATHER_RAIN:
    case WEATHER_RAIN_THUNDERSTORM:
    case WEATHER_DOWNPOUR:
    case WEATHER_SNOW:
    case WEATHER_SHADE:
        if (FadeInScreen_RainShowShade() == FALSE)
        {
            gWeatherPtr->gammaIndex = 3;
            gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_IDLE;
        }
        break;
    case WEATHER_DROUGHT:
        if (FadeInScreen_Drought() == FALSE)
        {
            gWeatherPtr->gammaIndex = -6;
            gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_IDLE;
        }
        break;
    case WEATHER_FOG_HORIZONTAL:
        if (FadeInScreen_FogHorizontal() == FALSE)
        {
            gWeatherPtr->gammaIndex = 0;
            gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_IDLE;
        }
        break;
    case WEATHER_VOLCANIC_ASH:
    case WEATHER_SANDSTORM:
    case WEATHER_FOG_DIAGONAL:
    case WEATHER_UNDERWATER:
    default:
        if (!gPaletteFade.active)
        {
            gWeatherPtr->gammaIndex = gWeatherPtr->gammaTargetIndex;
            gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_IDLE;
        }
        break;
    }
}

static bool8 FadeInScreen_RainShowShade(void)
{
    if (gWeatherPtr->fadeScreenCounter == 16)
        return FALSE;

    if (++gWeatherPtr->fadeScreenCounter >= 16)
    {
        ApplyGammaShift(0, 32, 3);
        gWeatherPtr->fadeScreenCounter = 16;
        return FALSE;
    }

    ApplyGammaShiftWithBlend(0, 32, 3, 16 - gWeatherPtr->fadeScreenCounter, gWeatherPtr->fadeDestColor);
    return TRUE;
}

static bool8 FadeInScreen_Drought(void)
{
    if (gWeatherPtr->fadeScreenCounter == 16)
        return FALSE;

    if (++gWeatherPtr->fadeScreenCounter >= 16)
    {
        ApplyGammaShift(0, 32, -6);
        gWeatherPtr->fadeScreenCounter = 16;
        return FALSE;
    }

    ApplyDroughtGammaShiftWithBlend(-6, 16 - gWeatherPtr->fadeScreenCounter, gWeatherPtr->fadeDestColor);
    return TRUE;
}

static bool8 FadeInScreen_FogHorizontal(void)
{
    if (gWeatherPtr->fadeScreenCounter == 16)
        return FALSE;

    gWeatherPtr->fadeScreenCounter++;
    ApplyFogBlend(16 - gWeatherPtr->fadeScreenCounter, gWeatherPtr->fadeDestColor);
    return TRUE;
}

static void DoNothing(void)
{ }

static void ApplyGammaShift(u8 startPalIndex, u8 numPalettes, s8 gammaIndex)
{
    u16 curPalIndex;
    u16 palOffset;
    u8 *gammaTable;
    u16 i;

    if (gammaIndex > 0)
    {
        gammaIndex--;
        palOffset = PLTT_ID(startPalIndex);
        numPalettes += startPalIndex;
        curPalIndex = startPalIndex;

        // Loop through the speficied palette range and apply necessary gamma shifts to the colors.
        while (curPalIndex < numPalettes)
        {
            if (sPaletteGammaTypes[curPalIndex] == GAMMA_NONE)
            {
                // No palette change.
                CpuFastCopy(&gPlttBufferUnfaded[palOffset], &gPlttBufferFaded[palOffset], PLTT_SIZE_4BPP);
                palOffset += 16;
            }
            else
            {
                u8 r, g, b;

                if (sPaletteGammaTypes[curPalIndex] == GAMMA_ALT || curPalIndex - 16 == gWeatherPtr->altGammaSpritePalIndex)
                    gammaTable = gWeatherPtr->altGammaShifts[gammaIndex];
                else
                    gammaTable = gWeatherPtr->gammaShifts[gammaIndex];

                for (i = 0; i < 16; i++)
                {
                    // Apply gamma shift to the original color.
                    struct RGBColor baseColor = *(struct RGBColor *)&gPlttBufferUnfaded[palOffset];
                    r = gammaTable[baseColor.r];
                    g = gammaTable[baseColor.g];
                    b = gammaTable[baseColor.b];
                    gPlttBufferFaded[palOffset++] = (b << 10) | (g << 5) | r;
                }
            }

            curPalIndex++;
        }
    }
    else if (gammaIndex < 0)
    {
        // A negative gammIndex value means that the blending will come from the special Drought weather's palette tables.
        // Dummied out in FRLG
    }
    else
    {
        // No palette blending.
        CpuFastCopy(&gPlttBufferUnfaded[PLTT_ID(startPalIndex)], &gPlttBufferFaded[PLTT_ID(startPalIndex)], numPalettes * PLTT_SIZE_4BPP);
    }
}

static void ApplyGammaShiftWithBlend(u8 startPalIndex, u8 numPalettes, s8 gammaIndex, u8 blendCoeff, u16 blendColor)
{
    u16 palOffset;
    u16 curPalIndex;
    u16 i;
    struct RGBColor color = *(struct RGBColor *)&blendColor;
    u8 rBlend = color.r;
    u8 gBlend = color.g;
    u8 bBlend = color.b;

    palOffset = PLTT_ID(startPalIndex);
    numPalettes += startPalIndex;
    gammaIndex--;
    curPalIndex = startPalIndex;

    while (curPalIndex < numPalettes)
    {
        if (sPaletteGammaTypes[curPalIndex] == GAMMA_NONE)
        {
            // No gamma shift. Simply blend the colors.
            BlendPalette(palOffset, 16, blendCoeff, blendColor);
            palOffset += 16;
        }
        else
        {
            u8 *gammaTable;

            if (sPaletteGammaTypes[curPalIndex] == GAMMA_NORMAL)
                gammaTable = gWeatherPtr->gammaShifts[gammaIndex];
            else
                gammaTable = gWeatherPtr->altGammaShifts[gammaIndex];

            for (i = 0; i < 16; i++)
            {
                struct RGBColor baseColor = *(struct RGBColor *)&gPlttBufferUnfaded[palOffset];
                u8 r = gammaTable[baseColor.r];
                u8 g = gammaTable[baseColor.g];
                u8 b = gammaTable[baseColor.b];

                // Apply gamma shift and target blend color to the original color.
                r += ((rBlend - r) * blendCoeff) >> 4;
                g += ((gBlend - g) * blendCoeff) >> 4;
                b += ((bBlend - b) * blendCoeff) >> 4;
                gPlttBufferFaded[palOffset++] = (b << 10) | (g << 5) | r;
            }
        }

        curPalIndex++;
    }
}

static void ApplyDroughtGammaShiftWithBlend(s8 gammaIndex, u8 blendCoeff, u16 blendColor)
{
    struct RGBColor color;
    u8 rBlend;
    u8 gBlend;
    u8 bBlend;
    u16 curPalIndex;
    u16 palOffset;
    u16 i;

    gammaIndex = -gammaIndex - 1;
    color = *(struct RGBColor *)&blendColor;
    rBlend = color.r;
    gBlend = color.g;
    bBlend = color.b;
    palOffset = 0;
    for (curPalIndex = 0; curPalIndex < 32; curPalIndex++)
    {
        if (sPaletteGammaTypes[curPalIndex] == GAMMA_NONE)
        {
            // No gamma shift. Simply blend the colors.
            BlendPalette(palOffset, 16, blendCoeff, blendColor);
            palOffset += 16;
        }
        else
        {
            for (i = 0; i < 16; i++)
            {
                u32 offset;
                struct RGBColor color1;
                struct RGBColor color2;
                u8 r1, g1, b1;
                u8 r2, g2, b2;

                color1 = *(struct RGBColor *)&gPlttBufferUnfaded[palOffset];
                r1 = color1.r;
                g1 = color1.g;
                b1 = color1.b;

                r1 += ((rBlend - r1) * blendCoeff) >> 4;
                g1 += ((gBlend - g1) * blendCoeff) >> 4;
                b1 += ((bBlend - b1) * blendCoeff) >> 4;

                gPlttBufferFaded[palOffset++] = (b1 << 10) | (g1 << 5) | r1;
            }
        }
    }
}

static void ApplyFogBlend(u8 blendCoeff, u16 blendColor)
{
    struct RGBColor color;
    u8 rBlend;
    u8 gBlend;
    u8 bBlend;
    u16 curPalIndex;

    BlendPalette(0, 256, blendCoeff, blendColor);
    color = *(struct RGBColor *)&blendColor;
    rBlend = color.r;
    gBlend = color.g;
    bBlend = color.b;

    for (curPalIndex = 16; curPalIndex < 32; curPalIndex++)
    {
        if (LightenSpritePaletteInFog(curPalIndex))
        {
            u16 palEnd = PLTT_ID(curPalIndex + 1);
            u16 palOffset = PLTT_ID(curPalIndex);

            while (palOffset < palEnd)
            {
                struct RGBColor color = *(struct RGBColor *)&gPlttBufferUnfaded[palOffset];
                u8 r = color.r;
                u8 g = color.g;
                u8 b = color.b;

                r += ((28 - r) * 3) >> 2;
                g += ((31 - g) * 3) >> 2;
                b += ((28 - b) * 3) >> 2;

                r += ((rBlend - r) * blendCoeff) >> 4;
                g += ((gBlend - g) * blendCoeff) >> 4;
                b += ((bBlend - b) * blendCoeff) >> 4;

                gPlttBufferFaded[palOffset] = (b << 10) | (g << 5) | r;
                palOffset++;
            }
        }
        else
        {
            BlendPalette(PLTT_ID(curPalIndex), 16, blendCoeff, blendColor);
        }
    }
}

static void MarkFogSpritePalToLighten(u8 paletteIndex)
{
    if (gWeatherPtr->lightenedFogSpritePalsCount < 6)
    {
        gWeatherPtr->lightenedFogSpritePals[gWeatherPtr->lightenedFogSpritePalsCount] = paletteIndex;
        gWeatherPtr->lightenedFogSpritePalsCount++;
    }
}

static bool8 LightenSpritePaletteInFog(u8 paletteIndex)
{
    u16 i;

    for (i = 0; i < gWeatherPtr->lightenedFogSpritePalsCount; i++)
    {
        if (gWeatherPtr->lightenedFogSpritePals[i] == paletteIndex)
            return TRUE;
    }

    return FALSE;
}

void WeatherShiftGammaIfPalStateIdle(s8 gammaIndex)
{
    if (gWeatherPtr->palProcessingState == WEATHER_PAL_STATE_IDLE)
    {
        ApplyGammaShift(0, 32, gammaIndex);
        gWeatherPtr->gammaIndex = gammaIndex;
    }
}

void WeatherBeginGammaFade(u8 gammaIndex, u8 gammaTargetIndex, u8 gammaStepDelay)
{
    if (gWeatherPtr->palProcessingState == WEATHER_PAL_STATE_IDLE)
    {
        gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_CHANGING_WEATHER;
        gWeatherPtr->gammaIndex = gammaIndex;
        gWeatherPtr->gammaTargetIndex = gammaTargetIndex;
        gWeatherPtr->gammaStepFrameCounter = 0;
        gWeatherPtr->gammaStepDelay = gammaStepDelay;
        WeatherShiftGammaIfPalStateIdle(gammaIndex);
    }
}

void FadeScreen(u8 mode, s8 delay)
{
    u32 fadeColor;
    bool8 fadeOut;
    bool8 useWeatherPal;

    switch (mode)
    {
    case FADE_FROM_BLACK:
        fadeColor = RGB_BLACK;
        fadeOut = FALSE;
        break;
    case FADE_FROM_WHITE:
        fadeColor = RGB_WHITEALPHA;
        fadeOut = FALSE;
        break;
    case FADE_TO_BLACK:
        fadeColor = RGB_BLACK;
        fadeOut = TRUE;
        break;
    case FADE_TO_WHITE:
        fadeColor = RGB_WHITEALPHA;
        fadeOut = TRUE;
        break;
    default:
        return;
    }

    switch (gWeatherPtr->currWeather)
    {
    case WEATHER_RAIN:
    case WEATHER_RAIN_THUNDERSTORM:
    case WEATHER_DOWNPOUR:
    case WEATHER_SNOW:
    case WEATHER_FOG_HORIZONTAL:
    case WEATHER_SHADE:
    case WEATHER_DROUGHT:
        useWeatherPal = TRUE;
        break;
    default:
        useWeatherPal = FALSE;
        break;
    }

    if (fadeOut)
    {
        if (useWeatherPal)
            CpuFastCopy(gPlttBufferFaded, gPlttBufferUnfaded, PLTT_SIZE);

        BeginNormalPaletteFade(PALETTES_ALL, delay, 0, 16, fadeColor);
        gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_SCREEN_FADING_OUT;
    }
    else
    {
        gWeatherPtr->fadeDestColor = fadeColor;
        if (useWeatherPal)
            gWeatherPtr->fadeScreenCounter = 0;
        else
            BeginNormalPaletteFade(PALETTES_ALL, delay, 16, 0, fadeColor);

        gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_SCREEN_FADING_IN;
        gWeatherPtr->fadeInActive = 1;
        gWeatherPtr->fadeInCounter = 0;
        Weather_SetBlendCoeffs(gWeatherPtr->currBlendEVA, gWeatherPtr->currBlendEVB);
        gWeatherPtr->readyForInit = TRUE;
    }
}

void FadeSelectedPals(u8 mode, s8 delay, u32 selectedPalettes)
{
    u32 fadeColor;
    bool8 fadeOut;
    bool8 useWeatherPal;

    switch (mode)
    {
    case FADE_FROM_BLACK:
        fadeColor = RGB_BLACK;
        fadeOut = FALSE;
        break;
    case FADE_FROM_WHITE:
        fadeColor = RGB_WHITEALPHA;
        fadeOut = FALSE;
        break;
    case FADE_TO_BLACK:
        fadeColor = RGB_BLACK;
        fadeOut = TRUE;
        break;
    case FADE_TO_WHITE:
        fadeColor = RGB_WHITEALPHA;
        fadeOut = TRUE;
        break;
    default:
        return;
    }

    switch (gWeatherPtr->currWeather)
    {
    case WEATHER_RAIN:
    case WEATHER_RAIN_THUNDERSTORM:
    case WEATHER_DOWNPOUR:
    case WEATHER_SNOW:
    case WEATHER_FOG_HORIZONTAL:
    case WEATHER_SHADE:
    case WEATHER_DROUGHT:
        useWeatherPal = TRUE;
        break;
    default:
        useWeatherPal = FALSE;
        break;
    }

    if (fadeOut)
    {
        if (useWeatherPal)
            CpuFastCopy(gPlttBufferFaded, gPlttBufferUnfaded, PLTT_SIZE);

        BeginNormalPaletteFade(selectedPalettes, delay, 0, 16, fadeColor);
        gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_SCREEN_FADING_OUT;
    }
    else
    {
        gWeatherPtr->fadeDestColor = fadeColor;
        if (useWeatherPal)
            gWeatherPtr->fadeScreenCounter = 0;
        else
            BeginNormalPaletteFade(selectedPalettes, delay, 16, 0, fadeColor);

        gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_SCREEN_FADING_IN;
        gWeatherPtr->fadeInActive = 1;
        gWeatherPtr->fadeInCounter = 0;
        Weather_SetBlendCoeffs(gWeatherPtr->currBlendEVA, gWeatherPtr->currBlendEVB);
        gWeatherPtr->readyForInit = TRUE;
    }
}


bool8 IsWeatherNotFadingIn(void)
{
    return (gWeatherPtr->palProcessingState != WEATHER_PAL_STATE_SCREEN_FADING_IN);
}

void UpdateSpritePaletteWithWeather(u8 spritePaletteIndex)
{
    u16 paletteIndex = 16 + spritePaletteIndex;
    u16 i;

    switch (gWeatherPtr->palProcessingState)
    {
    case WEATHER_PAL_STATE_SCREEN_FADING_IN:
        if (gWeatherPtr->fadeInActive != 0)
        {
            if (gWeatherPtr->currWeather == WEATHER_FOG_HORIZONTAL)
                MarkFogSpritePalToLighten(paletteIndex);
            paletteIndex = PLTT_ID(paletteIndex);
            for (i = 0; i < 16; i++)
                gPlttBufferFaded[paletteIndex + i] = gWeatherPtr->fadeDestColor;
        }
        break;
    case WEATHER_PAL_STATE_SCREEN_FADING_OUT:
        paletteIndex = PLTT_ID(paletteIndex);
        CpuFastCopy(&gPlttBufferFaded[paletteIndex], &gPlttBufferUnfaded[paletteIndex], PLTT_SIZE_4BPP);
        BlendPalette(paletteIndex, 16, gPaletteFade.y, gPaletteFade.blendColor);
        break;
        // WEATHER_PAL_STATE_CHANGING_WEATHER
        // WEATHER_PAL_STATE_CHANGING_IDLE
    default:
        if (gWeatherPtr->currWeather != WEATHER_FOG_HORIZONTAL)
        {
            ApplyGammaShift(paletteIndex, 1, gWeatherPtr->gammaIndex);
        }
        else
        {
            paletteIndex = PLTT_ID(paletteIndex);
            BlendPalette(paletteIndex, 16, 12, RGB(28, 31, 28));
        }
        break;
    }
}

void ApplyWeatherGammaShiftToPal(u8 paletteIndex)
{
    ApplyGammaShift(paletteIndex, 1, gWeatherPtr->gammaIndex);
}

static u8 IsWeatherFadingIn(void)
{
    if (gWeatherPtr->palProcessingState == WEATHER_PAL_STATE_SCREEN_FADING_IN)
        return gWeatherPtr->fadeInActive;
    else
        return 0;
}

void LoadCustomWeatherSpritePalette(const u16 *palette)
{
    LoadPalette(palette, OBJ_PLTT_ID(gWeatherPtr->weatherPicSpritePalIndex), PLTT_SIZE_4BPP);
    UpdateSpritePaletteWithWeather(gWeatherPtr->weatherPicSpritePalIndex);
}

static void LoadDroughtWeatherPalette(u8 *gammaIndexPtr, u8 *a1)
{
    // Dummied out in FRLG
    // *gammaIndexPtr = 0x20;
    // *a1 = 0x20;
}

void ResetDroughtWeatherPaletteLoading(void)
{
    gWeatherPtr->loadDroughtPalsIndex = 1;
    gWeatherPtr->loadDroughtPalsOffset = 1;
}

bool8 LoadDroughtWeatherPalettes(void)
{
    if (gWeatherPtr->loadDroughtPalsIndex < 32)
    {
        LoadDroughtWeatherPalette(&gWeatherPtr->loadDroughtPalsIndex, &gWeatherPtr->loadDroughtPalsOffset);
        if (gWeatherPtr->loadDroughtPalsIndex < 32)
            return TRUE;
    }
    return FALSE;
}

static void SetDroughtGamma(s8 gammaIndex)
{
    WeatherShiftGammaIfPalStateIdle(-gammaIndex - 1);
}

void DroughtStateInit(void)
{
    gWeatherPtr->droughtBrightnessStage = 0;
    gWeatherPtr->droughtTimer = 0;
    gWeatherPtr->droughtState = 0;
    gWeatherPtr->droughtLastBrightnessStage = 0;
    sDroughtFrameDelay = 5;
}

void DroughtStateRun(void)
{
    switch (gWeatherPtr->droughtState)
    {
    case 0:
        // Ramp up
        if (++gWeatherPtr->droughtTimer > sDroughtFrameDelay)
        {
            gWeatherPtr->droughtTimer = 0;
            SetDroughtGamma(gWeatherPtr->droughtBrightnessStage++);
            if (gWeatherPtr->droughtBrightnessStage > 5)
            {
                gWeatherPtr->droughtLastBrightnessStage = gWeatherPtr->droughtBrightnessStage;
                gWeatherPtr->droughtState = 1;
                gWeatherPtr->droughtTimer = 60;
            }
        }
        break;
    case 1:
        // Oscillate
        gWeatherPtr->droughtTimer = (gWeatherPtr->droughtTimer + 3) & 0x7F;
        gWeatherPtr->droughtBrightnessStage = ((gSineTable[gWeatherPtr->droughtTimer] - 1) >> 6) + 2;
        if (gWeatherPtr->droughtBrightnessStage != gWeatherPtr->droughtLastBrightnessStage)
            SetDroughtGamma(gWeatherPtr->droughtBrightnessStage);
        gWeatherPtr->droughtLastBrightnessStage = gWeatherPtr->droughtBrightnessStage;
        break;
    case 2:
        // Ramp down
        if (++gWeatherPtr->droughtTimer > sDroughtFrameDelay)
        {
            gWeatherPtr->droughtTimer = 0;
            SetDroughtGamma(--gWeatherPtr->droughtBrightnessStage);
            if (gWeatherPtr->droughtBrightnessStage == 3)
                gWeatherPtr->droughtState = 0;
        }
        break;
    }
}

void Weather_SetBlendCoeffs(u8 eva, u8 evb)
{
    gWeatherPtr->currBlendEVA = eva;
    gWeatherPtr->currBlendEVB = evb;
    gWeatherPtr->targetBlendEVA = eva;
    gWeatherPtr->targetBlendEVB = evb;
    SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(eva, evb));
}

void Weather_SetTargetBlendCoeffs(u8 eva, u8 evb, int delay)
{
    gWeatherPtr->targetBlendEVA = eva;
    gWeatherPtr->targetBlendEVB = evb;
    gWeatherPtr->blendDelay = delay;
    gWeatherPtr->blendFrameCounter = 0;
    gWeatherPtr->blendUpdateCounter = 0;
}

bool8 Weather_UpdateBlend(void)
{
    if (gWeatherPtr->currBlendEVA == gWeatherPtr->targetBlendEVA
        && gWeatherPtr->currBlendEVB == gWeatherPtr->targetBlendEVB)
        return TRUE;

    if (++gWeatherPtr->blendFrameCounter > gWeatherPtr->blendDelay)
    {
        gWeatherPtr->blendFrameCounter = 0;
        gWeatherPtr->blendUpdateCounter++;

        // Update currBlendEVA and currBlendEVB on alternate frames
        if (gWeatherPtr->blendUpdateCounter & 1)
        {
            if (gWeatherPtr->currBlendEVA < gWeatherPtr->targetBlendEVA)
                gWeatherPtr->currBlendEVA++;
            else if (gWeatherPtr->currBlendEVA > gWeatherPtr->targetBlendEVA)
                gWeatherPtr->currBlendEVA--;
        }
        else
        {
            if (gWeatherPtr->currBlendEVB < gWeatherPtr->targetBlendEVB)
                gWeatherPtr->currBlendEVB++;
            else if (gWeatherPtr->currBlendEVB > gWeatherPtr->targetBlendEVB)
                gWeatherPtr->currBlendEVB--;
        }
    }

    SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(gWeatherPtr->currBlendEVA, gWeatherPtr->currBlendEVB));

    if (gWeatherPtr->currBlendEVA == gWeatherPtr->targetBlendEVA
        && gWeatherPtr->currBlendEVB == gWeatherPtr->targetBlendEVB)
        return TRUE;

    return FALSE;
}

// Unused. Uses the same numbering scheme as the coord events
static void SetFieldWeather(u8 weather)
{
    switch (weather)
    {
    case COORD_EVENT_WEATHER_SUNNY_CLOUDS:
        SetWeather(WEATHER_SUNNY_CLOUDS);
        break;
    case COORD_EVENT_WEATHER_SUNNY:
        SetWeather(WEATHER_SUNNY);
        break;
    case COORD_EVENT_WEATHER_RAIN:
        SetWeather(WEATHER_RAIN);
        break;
    case COORD_EVENT_WEATHER_SNOW:
        SetWeather(WEATHER_SNOW);
        break;
    case COORD_EVENT_WEATHER_RAIN_THUNDERSTORM:
        SetWeather(WEATHER_RAIN_THUNDERSTORM);
        break;
    case COORD_EVENT_WEATHER_FOG_HORIZONTAL:
        SetWeather(WEATHER_FOG_HORIZONTAL);
        break;
    case COORD_EVENT_WEATHER_FOG_DIAGONAL:
        SetWeather(WEATHER_FOG_DIAGONAL);
        break;
    case COORD_EVENT_WEATHER_VOLCANIC_ASH:
        SetWeather(WEATHER_VOLCANIC_ASH);
        break;
    case COORD_EVENT_WEATHER_SANDSTORM:
        SetWeather(WEATHER_SANDSTORM);
        break;
    case COORD_EVENT_WEATHER_SHADE:
        SetWeather(WEATHER_SHADE);
        break;
    }
}

u8 GetCurrentWeather(void)
{
    return gWeatherPtr->currWeather;
}

void SetRainStrengthFromSoundEffect(u16 soundEffect)
{
    if (gWeatherPtr->palProcessingState != WEATHER_PAL_STATE_SCREEN_FADING_OUT)
    {
        switch (soundEffect)
        {
        case SE_RAIN:
            gWeatherPtr->rainStrength = 0;
            break;
        case SE_DOWNPOUR:
            gWeatherPtr->rainStrength = 1;
            break;
        case SE_THUNDERSTORM:
            gWeatherPtr->rainStrength = 2;
            break;
        default:
            return;
        }

        PlaySE(soundEffect);
    }
}

void PlayRainStoppingSoundEffect(void)
{
    if (IsSpecialSEPlaying())
    {
        switch (gWeatherPtr->rainStrength)
        {
        case 0:
            PlaySE(SE_RAIN_STOP);
            break;
        case 1:
            PlaySE(SE_DOWNPOUR_STOP);
            break;
        case 2:
        default:
            PlaySE(SE_THUNDERSTORM_STOP);
            break;
        }
    }
}

u8 IsWeatherChangeComplete(void)
{
    return gWeatherPtr->weatherChangeComplete;
}

void SetWeatherScreenFadeOut(void)
{
    gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_SCREEN_FADING_OUT;
}

void WeatherProcessingIdle(void)
{
    gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_IDLE;
}

void PreservePaletteInWeather(u8 preservedPalIndex)
{
    CpuCopy16(sBasePaletteGammaTypes, sFieldEffectPaletteGammaTypes, 32);
    sFieldEffectPaletteGammaTypes[preservedPalIndex] = GAMMA_NONE;
    sPaletteGammaTypes = sFieldEffectPaletteGammaTypes;
}

void ResetPreservedPalettesInWeather(void)
{
    sPaletteGammaTypes = sBasePaletteGammaTypes;
}

void SlightlyDarkenPalsInWeather(u16 *palbuf, u16 *unused, u32 size)
{
    switch (gWeatherPtr->currWeather)
    {
    case WEATHER_RAIN:
    case WEATHER_SNOW:
    case WEATHER_RAIN_THUNDERSTORM:
    case WEATHER_SHADE:
    case WEATHER_DOWNPOUR:
        BlendPalettesAt(palbuf, RGB_BLACK, 3, size);
        break;
    }
}
