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

EWRAM_DATA struct Weather gWeather = {};
EWRAM_DATA u8 sFieldEffectPaletteGammaTypes[32] = {};
EWRAM_DATA const u8 *sPaletteGammaTypes = NULL;
EWRAM_DATA u16 gUnknown_20386A8 = 0;

void Task_WeatherMain(u8 taskId);
void Task_WeatherInit(u8 taskId);
void None_Init(void);
void None_Main(void);
bool8 None_Finish(void);
void BuildGammaShiftTables(void);
void UpdateWeatherGammaShift(void);
void ApplyGammaShift(u8 startPalIndex, u8 numPalettes, s8 gammaIndex);
void ApplyGammaShiftWithBlend(u8 startPalIndex, u8 numPalettes, s8 gammaIndex, u8 blendCoeff, u16 blendColor);
void ApplyDroughtGammaShiftWithBlend(s8 gammaIndex, u8 blendCoeff, u16 blendColor);
void FadeInScreenWithWeather(void);
bool8 FadeInScreen_RainShowShade(void);
bool8 FadeInScreen_Drought(void);
bool8 FadeInScreen_FogHorizontal(void);
void DoNothing(void);
void ApplyFogBlend(u8 blendCoeff, u16 blendColor);
bool8 LightenSpritePaletteInFog(u8 paletteIndex);
void Weather_SetBlendCoeffs(u8, u8);

struct Weather *const gWeatherPtr = &gWeather;

const struct WeatherCallbacks sWeatherFuncs[] = {
    {None_Init, None_Main, None_Init, None_Finish},
    {Clouds_InitVars, Clouds_Main, Clouds_InitAll, Clouds_Finish},
    {Weather2_InitVars, nullsub_48, Weather2_InitAll, sub_807B434},
    {LightRain_InitVars, LightRain_Main, LightRain_InitAll, LightRain_Finish},
    {Snow_InitVars, snowflakes_progress2, Snow_InitAll, Snow_Finish},
    {sub_807C2E4, Rain_Main, sub_807C358, Rain_Finish},
    {Fog1_InitVars, Fog1_Main, Fog1_InitAll, Fog1_Finish},
    {Ash_InitVars, Ash_Main, Ash_InitAll, Ash_Finish},
    {Sandstorm_InitVars, Sandstorm_Main, Sandstorm_InitAll, Sandstorm_Finish},
    {Fog2_InitVars, Fog2_Main, Fog2_InitAll, Fog2_Finish},
    {Fog1_InitVars, Fog1_Main, Fog1_InitAll, Fog1_Finish},
    {Weather11_InitVars, nullsub_49, Weather11_InitAll, sub_807D8D0},
    {Drought_InitVars, Drought_Main, Drought_InitAll, sub_807B6BC},
    {sub_807C388, Rain_Main, sub_807C3F4, Rain_Finish},
    {Bubbles_InitVars, Bubbles_Main, Bubbles_InitAll, Bubbles_Finish},
};

void (*const gWeatherPalStateFuncs[])(void) = {
    UpdateWeatherGammaShift,
    FadeInScreenWithWeather,
    DoNothing,
    DoNothing
};

const u8 sBasePaletteGammaTypes[32] = {
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

const u16 gUnknown_83C2CE0[] = INCBIN_U16("graphics/field_effects/unk_83C2CE0.gbapal");

// code
void StartWeather(void)
{
    if (!FuncIsActiveTask(Task_WeatherMain))
    {
        u8 index = AllocSpritePalette(0x1200);
        CpuCopy32(gUnknown_83C2CE0, &gPlttBufferUnfaded[0x100 + index * 16], 32);
        sub_8083598(index);
        BuildGammaShiftTables();
        gWeatherPtr->altGammaSpritePalIndex = index;
        gWeatherPtr->weatherPicSpritePalIndex = index;
        gWeatherPtr->rainSpriteCount = 0;
        gWeatherPtr->curRainSpriteIndex = 0;
        gWeatherPtr->cloudSpritesCreated = 0;
        gWeatherPtr->snowflakeSpriteCount = 0;
        gWeatherPtr->ashSpritesCreated = 0;
        gWeatherPtr->fogHSpritesCreated = 0;
        gWeatherPtr->fogDSpritesCreated = 0;
        gWeatherPtr->sandstormSpritesCreated = 0;
        gWeatherPtr->sandstormSwirlSpritesCreated = 0;
        gWeatherPtr->bubblesSpritesCreated = 0;
        gWeatherPtr->lightenedFogSpritePalsCount = 0;
        Weather_SetBlendCoeffs(16, 0);
        gWeatherPtr->currWeather = 0;
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

void SetCurrentAndNextWeatherNoDelay(u8 weather)
{
    PlayRainStoppingSoundEffect();
    gWeatherPtr->currWeather = weather;
    gWeatherPtr->nextWeather = weather;
    // Overrides the normal delay during screen fading.
    gWeatherPtr->readyForInit = TRUE;
}

void Task_WeatherInit(u8 taskId)
{
    // Waits until it's ok to initialize weather.
    // When the screen fades in, this is set to TRUE.
    if (gWeatherPtr->readyForInit)
    {
        sWeatherFuncs[gWeatherPtr->currWeather].initAll();
        gTasks[taskId].func = Task_WeatherMain;
    }
}

void Task_WeatherMain(u8 taskId)
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

    gWeatherPalStateFuncs[gWeatherPtr->palProcessingState]();
}


void None_Init(void)
{
    gWeatherPtr->gammaTargetIndex = 0;
    gWeatherPtr->gammaStepDelay = 0;
}

void None_Main(void)
{
}

u8 None_Finish(void)
{
    return 0;
}

// Builds two tables that contain gamma shifts for palette colors.
// It's unclear why the two tables aren't declared as const arrays, since
// this function always builds the same two tables.
void BuildGammaShiftTables(void)
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
void UpdateWeatherGammaShift(void)
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

void FadeInScreenWithWeather(void)
{
    if (++gWeatherPtr->unknown_6CB > 1)
        gWeatherPtr->unknown_6CA = 0;

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

bool8 FadeInScreen_RainShowShade(void)
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

bool8 FadeInScreen_Drought(void)
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

bool8 FadeInScreen_FogHorizontal(void)
{
    if (gWeatherPtr->fadeScreenCounter == 16)
        return FALSE;

    gWeatherPtr->fadeScreenCounter++;
    ApplyFogBlend(16 - gWeatherPtr->fadeScreenCounter, gWeatherPtr->fadeDestColor);
    return TRUE;
}

void DoNothing(void)
{ }

void ApplyGammaShift(u8 startPalIndex, u8 numPalettes, s8 gammaIndex)
{
    u16 curPalIndex;
    u16 palOffset;
    u8 *gammaTable;
    u16 i;

    if (gammaIndex > 0)
    {
        gammaIndex--;
        palOffset = startPalIndex * 16;
        numPalettes += startPalIndex;
        curPalIndex = startPalIndex;

        // Loop through the speficied palette range and apply necessary gamma shifts to the colors.
        while (curPalIndex < numPalettes)
        {
            if (sPaletteGammaTypes[curPalIndex] == GAMMA_NONE)
            {
                // No palette change.
                CpuFastCopy(gPlttBufferUnfaded + palOffset, gPlttBufferFaded + palOffset, 16 * sizeof(u16));
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

        // gammaIndex = -gammaIndex - 1;
        // palOffset = startPalIndex * 16;
        // numPalettes += startPalIndex;
        // curPalIndex = startPalIndex;
        //
        // CpuFastCopy(gPlttBufferUnfaded + palOffset, gPlttBufferFaded + palOffset, 16 * sizeof(u16));
        // while (curPalIndex < numPalettes)
        // {
        //     if (sPaletteGammaTypes[curPalIndex] == GAMMA_NONE)
        //     {
        //         // No palette change.
        //         palOffset += 16;
        //     }
        //     else
        //     {
        //
        //         for (i = 0; i < 16; i++)
        //         {
        //             gPlttBufferFaded[palOffset] = sDroughtWeatherColors[gammaIndex][DROUGHT_COLOR_INDEX(gPlttBufferUnfaded[palOffset])];
        //             palOffset++;
        //         }
        //     }
        //
        //     curPalIndex++;
        // }
    }
    else
    {
        // No palette blending.
        CpuFastCopy(gPlttBufferUnfaded + startPalIndex * 16, gPlttBufferFaded + startPalIndex * 16, numPalettes * 16 * sizeof(u16));
    }
}

void ApplyGammaShiftWithBlend(u8 startPalIndex, u8 numPalettes, s8 gammaIndex, u8 blendCoeff, u16 blendColor)
{
    u16 palOffset;
    u16 curPalIndex;
    u16 i;
    struct RGBColor color = *(struct RGBColor *)&blendColor;
    u8 rBlend = color.r;
    u8 gBlend = color.g;
    u8 bBlend = color.b;

    palOffset = startPalIndex * 16;
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

void ApplyDroughtGammaShiftWithBlend(s8 gammaIndex, u8 blendCoeff, u16 blendColor)
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

void ApplyFogBlend(u8 blendCoeff, u16 blendColor)
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
            u16 palEnd = (curPalIndex + 1) * 16;
            u16 palOffset = curPalIndex * 16;

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
            BlendPalette(curPalIndex * 16, 16, blendCoeff, blendColor);
        }
    }
}

void MarkFogSpritePalToLighten(u8 paletteIndex)
{
    if (gWeatherPtr->lightenedFogSpritePalsCount < 6)
    {
        gWeatherPtr->lightenedFogSpritePals[gWeatherPtr->lightenedFogSpritePalsCount] = paletteIndex;
        gWeatherPtr->lightenedFogSpritePalsCount++;
    }
}

bool8 LightenSpritePaletteInFog(u8 paletteIndex)
{
    u16 i;

    for (i = 0; i < gWeatherPtr->lightenedFogSpritePalsCount; i++)
    {
        if (gWeatherPtr->lightenedFogSpritePals[i] == paletteIndex)
            return TRUE;
    }

    return FALSE;
}

void sub_807A790(s8 gammaIndex)
{
    if (gWeatherPtr->palProcessingState == WEATHER_PAL_STATE_IDLE)
    {
        ApplyGammaShift(0, 32, gammaIndex);
        gWeatherPtr->gammaIndex = gammaIndex;
    }
}

void sub_807A7C4(u8 gammaIndex, u8 gammaTargetIndex, u8 gammaStepDelay)
{
    if (gWeatherPtr->palProcessingState == WEATHER_PAL_STATE_IDLE)
    {
        gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_CHANGING_WEATHER;
        gWeatherPtr->gammaIndex = gammaIndex;
        gWeatherPtr->gammaTargetIndex = gammaTargetIndex;
        gWeatherPtr->gammaStepFrameCounter = 0;
        gWeatherPtr->gammaStepDelay = gammaStepDelay;
        sub_807A790(gammaIndex);
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
            CpuFastCopy(gPlttBufferFaded, gPlttBufferUnfaded, 0x400);

        BeginNormalPaletteFade(0xFFFFFFFF, delay, 0, 16, fadeColor);
        gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_SCREEN_FADING_OUT;
    }
    else
    {
        gWeatherPtr->fadeDestColor = fadeColor;
        if (useWeatherPal)
            gWeatherPtr->fadeScreenCounter = 0;
        else
            BeginNormalPaletteFade(0xFFFFFFFF, delay, 16, 0, fadeColor);

        gWeatherPtr->palProcessingState = WEATHER_PAL_STATE_SCREEN_FADING_IN;
        gWeatherPtr->unknown_6CA = 1;
        gWeatherPtr->unknown_6CB = 0;
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
            CpuFastCopy(gPlttBufferFaded, gPlttBufferUnfaded, 0x400);

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
        gWeatherPtr->unknown_6CA = 1;
        gWeatherPtr->unknown_6CB = 0;
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
        if (gWeatherPtr->unknown_6CA != 0)
        {
            if (gWeatherPtr->currWeather == WEATHER_FOG_HORIZONTAL)
                MarkFogSpritePalToLighten(paletteIndex);
            paletteIndex *= 16;
            for (i = 0; i < 16; i++)
                gPlttBufferFaded[paletteIndex + i] = gWeatherPtr->fadeDestColor;
        }
        break;
    case WEATHER_PAL_STATE_SCREEN_FADING_OUT:
        paletteIndex *= 16;
        CpuFastCopy(gPlttBufferFaded + paletteIndex, gPlttBufferUnfaded + paletteIndex, 32);
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
            paletteIndex *= 16;
            BlendPalette(paletteIndex, 16, 12, RGB(28, 31, 28));
        }
        break;
    }
}

void ApplyWeatherGammaShiftToPal(u8 paletteIndex)
{
    ApplyGammaShift(paletteIndex, 1, gWeatherPtr->gammaIndex);
}

u8 sub_80ABF20(void)
{
    if (gWeatherPtr->palProcessingState == WEATHER_PAL_STATE_SCREEN_FADING_IN)
        return gWeatherPtr->unknown_6CA;
    else
        return 0;
}

void LoadCustomWeatherSpritePalette(const u16 *palette)
{
    LoadPalette(palette, 0x100 + gWeatherPtr->weatherPicSpritePalIndex * 16, 32);
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

void sub_807AC50(s8 gammaIndex)
{
    sub_807A790(-gammaIndex - 1);
}

void sub_807AC60(void)
{
    gWeatherPtr->unknown_73C = 0;
    gWeatherPtr->unknown_740 = 0;
    gWeatherPtr->unknown_742 = 0;
    gWeatherPtr->unknown_73E = 0;
    gUnknown_20386A8 = 5;
}

void sub_807AC98(void)
{
    switch (gWeatherPtr->unknown_742)
    {
    case 0:
        if (++gWeatherPtr->unknown_740 > gUnknown_20386A8)
        {
            gWeatherPtr->unknown_740 = 0;
            sub_807AC50(gWeatherPtr->unknown_73C++);
            if (gWeatherPtr->unknown_73C > 5)
            {
                gWeatherPtr->unknown_73E = gWeatherPtr->unknown_73C;
                gWeatherPtr->unknown_742 = 1;
                gWeatherPtr->unknown_740 = 0x3C;
            }
        }
        break;
    case 1:
        gWeatherPtr->unknown_740 = (gWeatherPtr->unknown_740 + 3) & 0x7F;
        gWeatherPtr->unknown_73C = ((gSineTable[gWeatherPtr->unknown_740] - 1) >> 6) + 2;
        if (gWeatherPtr->unknown_73C != gWeatherPtr->unknown_73E)
            sub_807AC50(gWeatherPtr->unknown_73C);
        gWeatherPtr->unknown_73E = gWeatherPtr->unknown_73C;
        break;
    case 2:
        if (++gWeatherPtr->unknown_740 > gUnknown_20386A8)
        {
            gWeatherPtr->unknown_740 = 0;
            sub_807AC50(--gWeatherPtr->unknown_73C);
            if (gWeatherPtr->unknown_73C == 3)
                gWeatherPtr->unknown_742 = 0;
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

void sub_807AF00(u8 a)
{
    switch (a)
    {
    case 1:
        SetWeather(WEATHER_SUNNY_CLOUDS);
        break;
    case 2:
        SetWeather(WEATHER_SUNNY);
        break;
    case 3:
        SetWeather(WEATHER_RAIN);
        break;
    case 4:
        SetWeather(WEATHER_SNOW);
        break;
    case 5:
        SetWeather(WEATHER_RAIN_THUNDERSTORM);
        break;
    case 6:
        SetWeather(WEATHER_FOG_HORIZONTAL);
        break;
    case 7:
        SetWeather(WEATHER_FOG_DIAGONAL);
        break;
    case 8:
        SetWeather(WEATHER_VOLCANIC_ASH);
        break;
    case 9:
        SetWeather(WEATHER_SANDSTORM);
        break;
    case 10:
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
        case SE_T_KOAME:
            gWeatherPtr->rainStrength = 0;
            break;
        case SE_T_OOAME:
            gWeatherPtr->rainStrength = 1;
            break;
        case SE_T_AME:
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
            PlaySE(SE_T_KOAME_E);
            break;
        case 1:
            PlaySE(SE_T_OOAME_E);
            break;
        case 2:
        default:
            PlaySE(SE_T_AME_E);
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

void sub_807B070(void)
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

void sub_807B0C4(u16 *palbuf, u16 *unused, u32 size)
{
    switch (gWeatherPtr->currWeather)
    {
    case WEATHER_RAIN:
    case WEATHER_SNOW:
    case WEATHER_RAIN_THUNDERSTORM:
    case WEATHER_SHADE:
    case WEATHER_DOWNPOUR:
        sub_8045314(palbuf, RGB_BLACK, 3, size);
        break;
    }
}
