#include "graphics/gimmicks.h"

// Gimmick data

const struct GimmickInfo gGimmicksInfo[GIMMICKS_COUNT] =
{
    [GIMMICK_NONE] = {0},
    [GIMMICK_MEGA] =
    {
        .triggerSheet = &sSpriteSheet_MegaTrigger,
        .triggerPal = &sSpritePalette_MegaTrigger,
        .triggerTemplate = &sSpriteTemplate_GimmickTrigger,
        .indicatorData = sMegaIndicatorGfx,
        .indicatorPalTag = TAG_MEGA_INDICATOR_PAL,
        .CanActivate = CanMegaEvolve,
        .ActivateGimmick = ActivateMegaEvolution,
    },
    [GIMMICK_Z_MOVE] =
    {
        .triggerSheet = &sSpriteSheet_ZMoveTrigger,
        .triggerPal = &sSpritePalette_ZMoveTrigger,
        .triggerTemplate = &sSpriteTemplate_GimmickTrigger,
        .CanActivate = CanUseZMove,
        .ActivateGimmick = ActivateZMove,
    },
    [GIMMICK_ULTRA_BURST] =
    {
        .triggerSheet = &sSpriteSheet_BurstTrigger,
        .triggerPal = &sSpritePalette_BurstTrigger,
        .triggerTemplate = &sSpriteTemplate_GimmickTrigger,
        .CanActivate = CanUltraBurst,
        .ActivateGimmick = ActivateUltraBurst,
    },
    [GIMMICK_DYNAMAX] =
    {
        .triggerSheet = &sSpriteSheet_DynamaxTrigger,
        .triggerPal = &sSpritePalette_DynamaxTrigger,
        .triggerTemplate = &sSpriteTemplate_GimmickTrigger,
        .indicatorData = sDynamaxIndicatorGfx,
        .indicatorPalTag = TAG_MISC_INDICATOR_PAL,
        .CanActivate = CanDynamax,
        .ActivateGimmick = ActivateDynamax,
    },
    [GIMMICK_TERA] =
    {
        .triggerSheet = &sSpriteSheet_TeraTrigger,
        .triggerPal = &sSpritePalette_TeraTrigger,
        .triggerTemplate = &sSpriteTemplate_GimmickTrigger,
        .indicatorData = NULL, // handled separately
        .indicatorPalTag = TAG_TERA_INDICATOR_PAL,
        .CanActivate = CanTerastallize,
        .ActivateGimmick = ActivateTera,
    }
};
