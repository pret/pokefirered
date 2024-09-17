#include "global.h"
#include "gflib.h"
#include "util.h"
#include "decompress.h"
#include "task.h"

enum
{
    NORMAL_FADE,
    FAST_FADE,
    HARDWARE_FADE,
    TIME_OF_DAY_FADE,
};

static u32 UpdateNormalPaletteFade(void);
static void BeginFastPaletteFadeInternal(u32);
static u32 UpdateFastPaletteFade(void);
static u8 UpdateTimeOfDayPaletteFade(void);
static u32 UpdateHardwarePaletteFade(void);
static void UpdateBlendRegisters(void);
static bool32 IsSoftwarePaletteFadeFinishing(void);
static void Task_BlendPalettesGradually(u8 taskId);

ALIGNED(4) EWRAM_DATA u16 gPlttBufferUnfaded[PLTT_BUFFER_SIZE] = {0};
ALIGNED(4) EWRAM_DATA u16 gPlttBufferFaded[PLTT_BUFFER_SIZE] = {0};
EWRAM_DATA struct PaletteFadeControl gPaletteFade = {0};
static EWRAM_DATA u32 sPlttBufferTransferPending = 0;

static const u8 sRoundedDownGrayscaleMap[] =
{
     0,  0,  0,  0,  0,
     5,  5,  5,  5,  5,
    11, 11, 11, 11, 11,
    16, 16, 16, 16, 16,
    21, 21, 21, 21, 21,
    27, 27, 27, 27, 27,
    31, 31
};

void LoadCompressedPalette(const u32 *src, u32 offset, u32 size)
{
    LZDecompressWram(src, gDecompressionBuffer);
    CpuCopy16(gDecompressionBuffer, &gPlttBufferUnfaded[offset], size);
    CpuCopy16(gDecompressionBuffer, &gPlttBufferFaded[offset], size);
}

void LoadPalette(const void *src, u32 offset, u32 size)
{
    CpuCopy16(src, &gPlttBufferUnfaded[offset], size);
    CpuCopy16(src, &gPlttBufferFaded[offset], size);
}

void FillPalette(u32 value, u32 offset, u32 size)
{
    CpuFill16(value, &gPlttBufferUnfaded[offset], size);
    CpuFill16(value, &gPlttBufferFaded[offset], size);
}

void TransferPlttBuffer(void)
{
    if (!gPaletteFade.bufferTransferDisabled)
    {
        void *src = gPlttBufferFaded;
        void *dest = (void *)PLTT;
        DmaCopy16(3, src, dest, PLTT_SIZE);
        sPlttBufferTransferPending = FALSE;
        if (gPaletteFade.mode == HARDWARE_FADE && gPaletteFade.active)
            UpdateBlendRegisters();
    }
}

u32 UpdatePaletteFade(void)
{
    u32 result;

    if (sPlttBufferTransferPending)
        return PALETTE_FADE_STATUS_LOADING;
    if (gPaletteFade.mode == NORMAL_FADE)
        result = UpdateNormalPaletteFade();
    else if (gPaletteFade.mode == FAST_FADE)
        result = UpdateFastPaletteFade();
    else if (gPaletteFade.mode == TIME_OF_DAY_FADE)
        result = UpdateTimeOfDayPaletteFade();
    else
        result = UpdateHardwarePaletteFade();
    sPlttBufferTransferPending = gPaletteFade.multipurpose1;
    return result;
}

void ResetPaletteFade(void)
{
    ResetPaletteFadeControl();
}

bool32 BeginNormalPaletteFade(u32 selectedPalettes, s8 delay, u8 startY, u8 targetY, u32 blendColor)
{
    u8 temp;

    if (gPaletteFade.active)
    {
        return FALSE;
    }
    else
    {
        gPaletteFade.deltaY = 2;
        if (delay < 0)
        {
            gPaletteFade.deltaY += (delay * -1);
            delay = 0;
        }
        gPaletteFade_selectedPalettes = selectedPalettes;
        gPaletteFade.delayCounter = delay;
        gPaletteFade_delay = delay;
        gPaletteFade.y = startY;
        gPaletteFade.targetY = targetY;
        gPaletteFade.blendColor = blendColor;
        gPaletteFade.active = TRUE;
        gPaletteFade.mode = NORMAL_FADE;
        if (startY < targetY)
            gPaletteFade.yDec = FALSE;
        else
            gPaletteFade.yDec = TRUE;
        UpdatePaletteFade();
        temp = gPaletteFade.bufferTransferDisabled;
        gPaletteFade.bufferTransferDisabled = FALSE;
        CpuCopy32(gPlttBufferFaded, (void *)PLTT, PLTT_SIZE);
        sPlttBufferTransferPending = FALSE;
        if (gPaletteFade.mode == HARDWARE_FADE && gPaletteFade.active)
            UpdateBlendRegisters();
        gPaletteFade.bufferTransferDisabled = temp;
        return TRUE;
    }
}

// Like normal palette fade but respects sprite/tile palettes immune to time of day fading
bool32 BeginTimeOfDayPaletteFade(u32 selectedPalettes, s8 delay, u8 startY, u8 targetY, struct BlendSettings *bld0, struct BlendSettings *bld1, u32 weight, u32 color)
{
    u8 temp;

    if (gPaletteFade.active)
    {
        return FALSE;
    }
    else
    {
        gPaletteFade.deltaY = 2;

        if (delay < 0)
        {
            gPaletteFade.deltaY += (delay * -1);
            delay = 0;
        }

        gPaletteFade_selectedPalettes = selectedPalettes;
        gPaletteFade.delayCounter = delay;
        gPaletteFade_delay = delay;
        gPaletteFade.y = startY;
        gPaletteFade.targetY = targetY;
        gPaletteFade.active = 1;
        gPaletteFade.mode = TIME_OF_DAY_FADE;

        gPaletteFade.blendColor = color;
        gPaletteFade.bld0 = bld0;
        gPaletteFade.bld1 = bld1;
        gPaletteFade.weight = weight;

        if (startY < targetY)
            gPaletteFade.yDec = 0;
        else
            gPaletteFade.yDec = 1;

        UpdatePaletteFade();

        temp = gPaletteFade.bufferTransferDisabled;
        gPaletteFade.bufferTransferDisabled = 0;
        CpuCopy32(gPlttBufferFaded, (void *)PLTT, PLTT_SIZE);
        sPlttBufferTransferPending = 0;
        if (gPaletteFade.mode == HARDWARE_FADE && gPaletteFade.active)
            UpdateBlendRegisters();
        gPaletteFade.bufferTransferDisabled = temp;
        return TRUE;
    }
}

void ResetPaletteFadeControl(void)
{
    gPaletteFade.multipurpose1 = 0;
    gPaletteFade.multipurpose2 = 0;
    gPaletteFade.delayCounter = 0;
    gPaletteFade.y = 0;
    gPaletteFade.targetY = 0;
    gPaletteFade.blendColor = 0;
    gPaletteFade.active = FALSE;
    gPaletteFade.multipurpose2 = 0; // assign same value twice
    gPaletteFade.yDec = FALSE;
    gPaletteFade.bufferTransferDisabled = FALSE;
    gPaletteFade.shouldResetBlendRegisters = FALSE;
    gPaletteFade.hardwareFadeFinishing = FALSE;
    gPaletteFade.softwareFadeFinishing = FALSE;
    gPaletteFade.softwareFadeFinishingCounter = 0;
    gPaletteFade.objPaletteToggle = 0;
    gPaletteFade.deltaY = 2;
}

// Like normal palette fade, but respects sprite/tile palettes immune to time of day fading
static u8 UpdateTimeOfDayPaletteFade(void)
{
    u16 paletteOffset;
    u16 selectedPalettes;
    u16 timePalettes = 0; // palettes passed to the time-blender
    u16 copyPalettes;
    u16 * src;
    u16 * dst;

    if (!gPaletteFade.active)
        return PALETTE_FADE_STATUS_DONE;

    if (IsSoftwarePaletteFadeFinishing())
        return gPaletteFade.active ? PALETTE_FADE_STATUS_ACTIVE : PALETTE_FADE_STATUS_DONE;

    if (!gPaletteFade.objPaletteToggle)
    {
        if (gPaletteFade.delayCounter < gPaletteFade_delay)
        {
            gPaletteFade.delayCounter++;
            return 2;
        }
        gPaletteFade.delayCounter = 0;
    }

    paletteOffset = 0;

    if (!gPaletteFade.objPaletteToggle)
    {
        selectedPalettes = gPaletteFade_selectedPalettes;
    }
    else
    {
        selectedPalettes = gPaletteFade_selectedPalettes >> 16;
        paletteOffset = 256;
    }

    src = gPlttBufferUnfaded + paletteOffset;
    dst = gPlttBufferFaded + paletteOffset;

    // First pply TOD blend to relevant subset of palettes
    if (gPaletteFade.objPaletteToggle) // Sprite palettes, don't blend those with tags
    {
        u32 i;
        u32 j = 1;
        for (i = 0; i < 16; i++, j <<= 1) // Mask out palettes that should not be light blended
        {
            if ((selectedPalettes & j) && !IS_BLEND_IMMUNE_TAG(GetSpritePaletteTagByPaletteNum(i)))
                timePalettes |= j;
        }
    }
    else // tile palettes, don't blend [13, 15]
    {
        timePalettes = selectedPalettes & PALETTES_MAP;
    }
    TimeMixPalettes(timePalettes, src, dst, gPaletteFade.bld0, gPaletteFade.bld1, gPaletteFade.weight);

    // palettes that were not blended above must be copied through
    if ((copyPalettes = ~timePalettes))
    {
        u16 * src1 = src;
        u16 * dst1 = dst;
        while (copyPalettes)
        {
            if (copyPalettes & 1)
                CpuFastCopy(src1, dst1, 32);
            copyPalettes >>= 1;
            src1 += 16;
            dst1 += 16;
        }
    }

    // Then, blend from faded->faded with native BlendPalettes
    BlendPalettesFine(selectedPalettes, dst, dst, gPaletteFade.y, gPaletteFade.blendColor);

    gPaletteFade.objPaletteToggle ^= 1;

    if (!gPaletteFade.objPaletteToggle)
    {
        if ((gPaletteFade.yDec && gPaletteFade.y == 0) || (!gPaletteFade.yDec && gPaletteFade.y == gPaletteFade.targetY))
        {
            gPaletteFade_selectedPalettes = 0;
            gPaletteFade.softwareFadeFinishing = 1;
        }
        else
        {
            s8 val;

            if (!gPaletteFade.yDec)
            {
                val = gPaletteFade.y;
                val += gPaletteFade.deltaY;
                if (val > gPaletteFade.targetY)
                    val = gPaletteFade.targetY;
                gPaletteFade.y = val;
            }
            else
            {
                val = gPaletteFade.y;
                val -= gPaletteFade.deltaY;
                if (val < 0)
                    val = 0;
                gPaletteFade.y = val;
            }
        }
    }

    // gPaletteFade.active cannot change since the last time it was checked. So this
    // is equivalent to `return PALETTE_FADE_STATUS_ACTIVE;`
    return PALETTE_FADE_STATUS_ACTIVE;
}

static u32 UpdateNormalPaletteFade(void)
{
    u16 paletteOffset;
    u16 selectedPalettes;

    if (!gPaletteFade.active)
        return PALETTE_FADE_STATUS_DONE;
    if (IsSoftwarePaletteFadeFinishing())
    {
        return gPaletteFade.active ? PALETTE_FADE_STATUS_ACTIVE : PALETTE_FADE_STATUS_DONE;
    }
    else
    {
        if (!gPaletteFade.objPaletteToggle)
        {
            if (gPaletteFade.delayCounter < gPaletteFade_delay)
            {
                gPaletteFade.delayCounter++;
                return 2;
            }
            gPaletteFade.delayCounter = 0;
        }
        paletteOffset = 0;
        if (!gPaletteFade.objPaletteToggle)
        {
            selectedPalettes = gPaletteFade_selectedPalettes;
        }
        else
        {
            selectedPalettes = gPaletteFade_selectedPalettes >> 16;
            paletteOffset = OBJ_PLTT_OFFSET;
        }
        while (selectedPalettes)
        {
            if (selectedPalettes & 1)
                BlendPalette(paletteOffset,
                             16,
                             gPaletteFade.y,
                             gPaletteFade.blendColor);
            selectedPalettes >>= 1;
            paletteOffset += 16;
        }
        gPaletteFade.objPaletteToggle ^= 1;
        if (!gPaletteFade.objPaletteToggle)
        {
            if (gPaletteFade.y == gPaletteFade.targetY)
            {
                gPaletteFade_selectedPalettes = 0;
                gPaletteFade.softwareFadeFinishing = TRUE;
            }
            else
            {
                s8 val;

                if (!gPaletteFade.yDec)
                {
                    val = gPaletteFade.y;
                    val += gPaletteFade.deltaY;
                    if (val > gPaletteFade.targetY)
                        val = gPaletteFade.targetY;
                    gPaletteFade.y = val;
                }
                else
                {
                    val = gPaletteFade.y;
                    val -= gPaletteFade.deltaY;
                    if (val < gPaletteFade.targetY)
                        val = gPaletteFade.targetY;
                    gPaletteFade.y = val;
                }
            }
        }
        // gPaletteFade.active cannot change since the last time it was checked. So this
        // is equivalent to `return PALETTE_FADE_STATUS_ACTIVE;`
        return gPaletteFade.active ? PALETTE_FADE_STATUS_ACTIVE : PALETTE_FADE_STATUS_DONE;
    }
}

void InvertPlttBuffer(u32 selectedPalettes)
{
    u16 paletteOffset = 0;

    while (selectedPalettes)
    {
        if (selectedPalettes & 1)
        {
            u8 i;

            for (i = 0; i < 16; ++i)
                gPlttBufferFaded[paletteOffset + i] = ~gPlttBufferFaded[paletteOffset + i];
        }
        selectedPalettes >>= 1;
        paletteOffset += 16;
    }
}

void BeginFastPaletteFade(u32 submode)
{
    gPaletteFade.deltaY = 2;
    BeginFastPaletteFadeInternal(submode);
}

static void BeginFastPaletteFadeInternal(u32 submode)
{
    gPaletteFade.y = 31;
    gPaletteFade_submode = submode & 0x3F;
    gPaletteFade.active = TRUE;
    gPaletteFade.mode = FAST_FADE;
    if (submode == FAST_FADE_IN_FROM_BLACK)
        CpuFill16(RGB_BLACK, gPlttBufferFaded, PLTT_SIZE);
    if (submode == FAST_FADE_IN_FROM_WHITE)
        CpuFill16(RGB_WHITE, gPlttBufferFaded, PLTT_SIZE);
    UpdatePaletteFade();
}

static u32 UpdateFastPaletteFade(void)
{
    u32 i;
    u16 paletteOffsetStart, paletteOffsetEnd;
    s8 r0, g0, b0, r, g, b;

    if (!gPaletteFade.active)
        return PALETTE_FADE_STATUS_DONE;
    if (IsSoftwarePaletteFadeFinishing())
        return gPaletteFade.active ? PALETTE_FADE_STATUS_ACTIVE : PALETTE_FADE_STATUS_DONE;
    if (gPaletteFade.objPaletteToggle)
    {
        paletteOffsetStart = OBJ_PLTT_OFFSET;
        paletteOffsetEnd = PLTT_BUFFER_SIZE;
    }
    else
    {
        paletteOffsetStart = 0;
        paletteOffsetEnd = OBJ_PLTT_OFFSET;
    }
    switch (gPaletteFade_submode)
    {
    case FAST_FADE_IN_FROM_WHITE:
        for (i = paletteOffsetStart; i < paletteOffsetEnd; ++i)
        {
            struct PlttData *unfaded;
            struct PlttData *faded;

            unfaded = (struct PlttData *)&gPlttBufferUnfaded[i];
            r0 = unfaded->r;
            g0 = unfaded->g;
            b0 = unfaded->b;
            faded = (struct PlttData *)&gPlttBufferFaded[i];
            r = faded->r - 2;
            g = faded->g - 2;
            b = faded->b - 2;
            if (r < r0)
                r = r0;
            if (g < g0)
                g = g0;
            if (b < b0)
                b = b0;
            gPlttBufferFaded[i] = r | (g << 5) | (b << 10);
        }
        break;
    case FAST_FADE_OUT_TO_WHITE:
        for (i = paletteOffsetStart; i < paletteOffsetEnd; ++i)
        {
            struct PlttData *data = (struct PlttData *)&gPlttBufferFaded[i];

            r = data->r + 2;
            g = data->g + 2;
            b = data->b + 2;
            if (r > 31)
                r = 31;
            if (g > 31)
                g = 31;
            if (b > 31)
                b = 31;
            gPlttBufferFaded[i] = r | (g << 5) | (b << 10);
        }
        break;
    case FAST_FADE_IN_FROM_BLACK:
        for (i = paletteOffsetStart; i < paletteOffsetEnd; ++i)
        {
            struct PlttData *unfaded;
            struct PlttData *faded;

            unfaded = (struct PlttData *)&gPlttBufferUnfaded[i];
            r0 = unfaded->r;
            g0 = unfaded->g;
            b0 = unfaded->b;
            faded = (struct PlttData *)&gPlttBufferFaded[i];
            r = faded->r + 2;
            g = faded->g + 2;
            b = faded->b + 2;
            if (r > r0)
                r = r0;
            if (g > g0)
                g = g0;
            if (b > b0)
                b = b0;
            gPlttBufferFaded[i] = r | (g << 5) | (b << 10);
        }
        break;
    case FAST_FADE_OUT_TO_BLACK:
        for (i = paletteOffsetStart; i < paletteOffsetEnd; ++i)
        {
            struct PlttData *data = (struct PlttData *)&gPlttBufferFaded[i];

            r = data->r - 2;
            g = data->g - 2;
            b = data->b - 2;
            if (r < 0)
                r = 0;
            if (g < 0)
                g = 0;
            if (b < 0)
                b = 0;
            gPlttBufferFaded[i] = r | (g << 5) | (b << 10);
        }
    }
    gPaletteFade.objPaletteToggle ^= 1;
    if (gPaletteFade.objPaletteToggle)
        // gPaletteFade.active cannot change since the last time it was checked. So this
        // is equivalent to `return PALETTE_FADE_STATUS_ACTIVE;`
        return gPaletteFade.active ? PALETTE_FADE_STATUS_ACTIVE : PALETTE_FADE_STATUS_DONE;
    if (gPaletteFade.y - gPaletteFade.deltaY < 0)
        gPaletteFade.y = 0;
    else
        gPaletteFade.y -= gPaletteFade.deltaY;
    if (gPaletteFade.y == 0)
    {
        switch (gPaletteFade_submode)
        {
        case FAST_FADE_IN_FROM_WHITE:
        case FAST_FADE_IN_FROM_BLACK:
            CpuCopy32(gPlttBufferUnfaded, gPlttBufferFaded, PLTT_SIZE);
            break;
        case FAST_FADE_OUT_TO_WHITE:
            CpuFill32(0xFFFFFFFF, gPlttBufferFaded, PLTT_SIZE);
            break;
        case FAST_FADE_OUT_TO_BLACK:
            CpuFill32(0x00000000, gPlttBufferFaded, PLTT_SIZE);
            break;
        }
        gPaletteFade.mode = NORMAL_FADE;
        gPaletteFade.softwareFadeFinishing = TRUE;
    }
    // gPaletteFade.active cannot change since the last time it was checked. So this
    // is equivalent to `return PALETTE_FADE_STATUS_ACTIVE;`
    return gPaletteFade.active ? PALETTE_FADE_STATUS_ACTIVE : PALETTE_FADE_STATUS_DONE;
}

void BeginHardwarePaletteFade(u32 blendCnt, u32 delay, u32 y, u32 targetY, u32 shouldResetBlendRegisters)
{
    gPaletteFade_blendCnt = blendCnt;
    gPaletteFade.delayCounter = delay;
    gPaletteFade_delay = delay;
    gPaletteFade.y = y;
    gPaletteFade.targetY = targetY;
    gPaletteFade.active = TRUE;
    gPaletteFade.mode = HARDWARE_FADE;
    gPaletteFade.shouldResetBlendRegisters = shouldResetBlendRegisters & 1;
    gPaletteFade.hardwareFadeFinishing = FALSE;
    if (y < targetY)
        gPaletteFade.yDec = FALSE;
    else
        gPaletteFade.yDec = TRUE;
}

static u32 UpdateHardwarePaletteFade(void)
{
    if (!gPaletteFade.active)
        return PALETTE_FADE_STATUS_DONE;
    if (gPaletteFade.delayCounter < gPaletteFade_delay)
    {
        gPaletteFade.delayCounter++;
        return PALETTE_FADE_STATUS_DELAY;
    }
    gPaletteFade.delayCounter = 0;
    if (!gPaletteFade.yDec)
    {
        gPaletteFade.y++;
        if (gPaletteFade.y > gPaletteFade.targetY)
        {
            gPaletteFade.hardwareFadeFinishing++;
            gPaletteFade.y--;
        }
    }
    else
    {
        if (gPaletteFade.y-- - 1 < gPaletteFade.targetY)
        {
            gPaletteFade.hardwareFadeFinishing++;
            gPaletteFade.y++;
        }
    }

    if (gPaletteFade.hardwareFadeFinishing)
    {
        if (gPaletteFade.shouldResetBlendRegisters)
        {
            gPaletteFade_blendCnt = 0;
            gPaletteFade.y = 0;
        }
        gPaletteFade.shouldResetBlendRegisters = FALSE;
    }
    // gPaletteFade.active cannot change since the last time it was checked. So this
    // is equivalent to `return PALETTE_FADE_STATUS_ACTIVE;`
    return gPaletteFade.active ? PALETTE_FADE_STATUS_ACTIVE : PALETTE_FADE_STATUS_DONE;
}

static void UpdateBlendRegisters(void)
{
    SetGpuReg(REG_OFFSET_BLDCNT, (u16)gPaletteFade_blendCnt);
    SetGpuReg(REG_OFFSET_BLDY, gPaletteFade.y);
    if (gPaletteFade.hardwareFadeFinishing)
    {
        gPaletteFade.hardwareFadeFinishing = FALSE;
        gPaletteFade.mode = 0;
        gPaletteFade_blendCnt = 0;
        gPaletteFade.y = 0;
        gPaletteFade.active = FALSE;
    }
}

static bool32 IsSoftwarePaletteFadeFinishing(void)
{
    if (gPaletteFade.softwareFadeFinishing)
    {
        if (gPaletteFade.softwareFadeFinishingCounter == 4)
        {
            gPaletteFade.active = FALSE;
            gPaletteFade.softwareFadeFinishing = FALSE;
            gPaletteFade.softwareFadeFinishingCounter = 0;
        }
        else
        {
            gPaletteFade.softwareFadeFinishingCounter++;
        }
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

// optimized based on lucktyphlosion's BlendPalettesFine
void BlendPalettesFine(u32 palettes, u16 *src, u16 *dst, u32 coeff, u32 color)
{
    s32 newR, newG, newB;

    if (!palettes)
        return;

    coeff *= 2;
    newR = (color << 27) >> 27;
    newG = (color << 22) >> 27;
    newB = (color << 17) >> 27;

    do
    {
        if (palettes & 1)
        {
            u16 *srcEnd = src + 16;
            while (src != srcEnd) // Transparency is blended (for backdrop reasons)
            {
                u32 srcColor = *src;
                s32 r = (srcColor << 27) >> 27;
                s32 g = (srcColor << 22) >> 27;
                s32 b = (srcColor << 16) >> 26;

                *dst++ = ((r + (((newR - r) * (s32)coeff) >> 5)) << 0)
                       | ((g + (((newG - g) * (s32)coeff) >> 5)) << 5)
                       | ((b + (((newB - (b & 31)) * (s32)coeff) >> 5)) << 10);
                src++;
            }
        }
        else
        {
            src += 16;
            dst += 16;
        }
        palettes >>= 1;
    } while (palettes);
}

void BlendPalettes(u32 selectedPalettes, u8 coeff, u32 color)
{
    u16 paletteOffset;

    for (paletteOffset = 0; selectedPalettes; paletteOffset += 16)
    {
        if (selectedPalettes & 1)
            BlendPalette(paletteOffset, 16, coeff, color);
        selectedPalettes >>= 1;
    }
}

#define DEFAULT_LIGHT_COLOR 0x3f9f

// Like BlendPalette, but ignores blendColor if the transparency high bit is set
// Optimization help by lucktyphlosion
void TimeBlendPalette(u16 palOffset, u32 coeff, u32 blendColor)
{
    s32 newR, newG, newB, defR, defG, defB;
    u16 * src = gPlttBufferUnfaded + palOffset;
    u16 * dst = gPlttBufferFaded + palOffset;
    u32 defaultBlendColor = DEFAULT_LIGHT_COLOR;
    u16 *srcEnd = src + 16;
    u32 altBlendColor = *dst++ = *src++; // color 0 is copied through unchanged

    coeff *= 2;
    newR = (blendColor << 27) >> 27;
    newG = (blendColor << 22) >> 27;
    newB = (blendColor << 17) >> 27;

    if (altBlendColor >> 15) // Transparency high bit set; alt blend color
    {
        defR = (altBlendColor << 27) >> 27;
        defG = (altBlendColor << 22) >> 27;
        defB = (altBlendColor << 17) >> 27;
    }
    else
    {
        defR = (defaultBlendColor << 27) >> 27;
        defG = (defaultBlendColor << 22) >> 27;
        defB = (defaultBlendColor << 17) >> 27;
        altBlendColor = 0;
    }
    while (src != srcEnd)
    {
        u32 srcColor = *src;
        s32 r = (srcColor << 27) >> 27;
        s32 g = (srcColor << 22) >> 27;
        s32 b = (srcColor << 16) >> 26;

        if (srcColor >> 15)
        {
            *dst = ((r + (((defR - r) * (s32)coeff) >> 5)) << 0)
                 | ((g + (((defG - g) * (s32)coeff) >> 5)) << 5)
                 | ((b + (((defB - (b & 31)) * (s32)coeff) >> 5)) << 10);
        }
        else // Use provided blend color
        {
            *dst = ((r + (((newR - r) * (s32)coeff) >> 5)) << 0)
                 | ((g + (((newG - g) * (s32)coeff) >> 5)) << 5)
                 | ((b + (((newB - (b & 31)) * (s32)coeff) >> 5)) << 10);
        }
        src++;
        dst++;
    }
}

// Blends a weighted average of two blend parameters
// Parameters can be either blended (as in BlendPalettes) or tinted (as in TintPaletteRGB_Copy)
void TimeMixPalettes(u32 palettes, u16 *src, u16 *dst, struct BlendSettings *blend0, struct BlendSettings *blend1, u16 weight0)
{
    s32 r0, g0, b0, r1, g1, b1, defR, defG, defB, altR, altG, altB;
    u32 color0, coeff0, color1, coeff1;
    bool8 tint0, tint1;
    u32 defaultColor = DEFAULT_LIGHT_COLOR;

    if (!palettes)
    return;

    color0 = blend0->blendColor;
    tint0 = blend0->isTint;
    coeff0 = tint0 ? 8*2 : blend0->coeff*2;
    color1 = blend1->blendColor;
    tint1 = blend1->isTint;
    coeff1 = tint1 ? 8*2 : blend1->coeff*2;

    if (tint0)
    {
        r0 = (color0 << 24) >> 24;
        g0 = (color0 << 16) >> 24;
        b0 = (color0 << 8) >> 24;
    }
    else
    {
        r0 = (color0 << 27) >> 27;
        g0 = (color0 << 22) >> 27;
        b0 = (color0 << 17) >> 27;
    }
    if (tint1)
    {
        r1 = (color1 << 24) >> 24;
        g1 = (color1 << 16) >> 24;
        b1 = (color1 << 8) >> 24;
    }
    else
    {
        r1 = (color1 << 27) >> 27;
        g1 = (color1 << 22) >> 27;
        b1 = (color1 << 17) >> 27;
    }
    defR = (defaultColor << 27) >> 27;
    defG = (defaultColor << 22) >> 27;
    defB = (defaultColor << 17) >> 27;

    do
    {
        if (palettes & 1)
        {
            u16 *srcEnd = src + 16;
            u32 altBlendColor = *dst++ = *src++; // color 0 is copied through
            if (altBlendColor >> 15) // Transparency high bit set; alt blend color
            {
                altR = (altBlendColor << 27) >> 27;
                altG = (altBlendColor << 22) >> 27;
                altB = (altBlendColor << 17) >> 27;
            }
            else
            {
                altBlendColor = 0;
            }
            while (src != srcEnd)
            {
                u32 srcColor = *src;
                s32 r = (srcColor << 27) >> 27;
                s32 g = (srcColor << 22) >> 27;
                s32 b = (srcColor << 17) >> 27;
                s32 r2, g2, b2;

                if (srcColor >> 15)
                {
                    if (altBlendColor)
                    {
                        // Use alternate blend color
                        r2 = r + (((altR - r) * (s32)coeff1) >> 5);
                        g2 = g + (((altG - g) * (s32)coeff1) >> 5);
                        b2 = b + (((altB - b) * (s32)coeff1) >> 5);
                        r  = r + (((altR - r) * (s32)coeff0) >> 5);
                        g  = g + (((altG - g) * (s32)coeff0) >> 5);
                        b  = b + (((altB - b) * (s32)coeff0) >> 5);
                    }
                    else
                    {
                        // Use default blend color
                        r2 = r + (((defR - r) * (s32)coeff1) >> 5);
                        g2 = g + (((defG - g) * (s32)coeff1) >> 5);
                        b2 = b + (((defB - b) * (s32)coeff1) >> 5);
                        r  = r + (((defR - r) * (s32)coeff0) >> 5);
                        g  = g + (((defG - g) * (s32)coeff0) >> 5);
                        b  = b + (((defB - b) * (s32)coeff0) >> 5);
                    }
                }
                else
                {
                    // Use provided blend colors
                    if (!tint1)
                    {
                        // blend-based
                        r2 = (r + (((r1 - r) * (s32)coeff1) >> 5));
                        g2 = (g + (((g1 - g) * (s32)coeff1) >> 5));
                        b2 = (b + (((b1 - b) * (s32)coeff1) >> 5));
                    }
                    else
                    {
                        // tint-based
                        r2 = (u16)((r1 * r)) >> 8;
                        g2 = (u16)((g1 * g)) >> 8;
                        b2 = (u16)((b1 * b)) >> 8;
                        if (r2 > 31)
                            r2 = 31;
                        if (g2 > 31)
                            g2 = 31;
                        if (b2 > 31)
                            b2 = 31;
                    }
                    if (!tint0)
                    {
                        // blend-based
                        r = (r + (((r0 - r) * (s32)coeff0) >> 5));
                        g = (g + (((g0 - g) * (s32)coeff0) >> 5));
                        b = (b + (((b0 - b) * (s32)coeff0) >> 5));
                    }
                    else
                    {
                        // tint-based
                        r = (u16)((r0 * r)) >> 8;
                        g = (u16)((g0 * g)) >> 8;
                        b = (u16)((b0 * b)) >> 8;
                        if (r > 31)
                            r = 31;
                        if (g > 31)
                            g = 31;
                        if (b > 31)
                            b = 31;
                    }
                }
                r  = r2 + (((r - r2) * (s32)weight0) >> 8);
                g  = g2 + (((g - g2) * (s32)weight0) >> 8);
                b  = b2 + (((b - b2) * (s32)weight0) >> 8);
                *dst++ = RGB2(r, g, b);
                // *dst++ = RGB2(r, g, b) | (srcColor >> 15) << 15;
                src++;
            }
        }
        else
        {
            src += 16;
            dst += 16;
        }
        palettes >>= 1;
    } while (palettes);
}

// Apply weighted average to palettes, preserving high bits of dst throughout
void AvgPaletteWeighted(u16 *src0, u16 *src1, u16 *dst, u16 weight0)
{
    u16 *srcEnd = src0 + 16;
    src0++;
    src1++;
    dst++; // leave dst transparency unchanged
    while (src0 != srcEnd)
    {
        u32 src0Color = *src0++;
        s32 r0 = (src0Color << 27) >> 27;
        s32 g0 = (src0Color << 22) >> 27;
        s32 b0 = (src0Color << 17) >> 27;
        u32 src1Color = *src1++;
        s32 r1 = (src1Color << 27) >> 27;
        s32 g1 = (src1Color << 22) >> 27;
        s32 b1 = (src1Color << 17) >> 27;

        // Average and bitwise-OR
        r0 = r1 + (((r0 - r1) * weight0) >> 8);
        g0 = g1 + (((g0 - g1) * weight0) >> 8);
        b0 = b1 + (((b0 - b1) * weight0) >> 8);
        *dst = (*dst & RGB_ALPHA) | RGB2(r0, g0, b0);  // preserve high bit of dst
        dst++;
    }
}

void BlendPalettesUnfaded(u32 selectedPalettes, u8 coeff, u32 color)
{
    // This copy is done via DMA in both RUBY and EMERALD
    CpuFastCopy(gPlttBufferUnfaded, gPlttBufferFaded, PLTT_SIZE);
    BlendPalettes(selectedPalettes, coeff, color);
}

void TintPalette_GrayScale(u16 *palette, u32 count)
{
    s32 r, g, b, i;
    u32 gray;

    for (i = 0; i < count; ++i)
    {
        r = GET_R(*palette);
        g = GET_G(*palette);
        b = GET_B(*palette);
        gray = (r * Q_8_8(0.3) + g * Q_8_8(0.59) + b * Q_8_8(0.1133)) >> 8;
        *palette++ = RGB2(gray, gray, gray);
    }
}

void TintPalette_GrayScale2(u16 *palette, u32 count)
{
    s32 r, g, b, i;
    u32 gray;

    for (i = 0; i < count; ++i)
    {
        r = GET_R(*palette);
        g = GET_G(*palette);
        b = GET_B(*palette);
        gray = (r * Q_8_8(0.3) + g * Q_8_8(0.59) + b * Q_8_8(0.1133)) >> 8;

        if (gray > 31)
            gray = 31;
        gray = sRoundedDownGrayscaleMap[gray];
        *palette++ = RGB2(gray, gray, gray);
    }
}

void TintPalette_SepiaTone(u16 *palette, u32 count)
{
    s32 r, g, b, i;
    u32 gray;

    for (i = 0; i < count; ++i)
    {
        r = GET_R(*palette);
        g = GET_G(*palette);
        b = GET_B(*palette);
        gray = (r * Q_8_8(0.3) + g * Q_8_8(0.59) + b * Q_8_8(0.1133)) >> 8;
        r = (u16)((Q_8_8(1.2) * gray)) >> 8;
        g = (u16)((Q_8_8(1.0) * gray)) >> 8;
        b = (u16)((Q_8_8(0.94) * gray)) >> 8;
        if (r > 31)
            r = 31;
        *palette++ = RGB2(r, g, b);
    }
}

void TintPalette_CustomTone(u16 *palette, u32 count, u16 rTone, u16 gTone, u16 bTone)
{
    s32 r, g, b, i;
    u32 gray;

    for (i = 0; i < count; ++i)
    {
        r = GET_R(*palette);
        g = GET_G(*palette);
        b = GET_B(*palette);
        gray = (r * Q_8_8(0.3) + g * Q_8_8(0.59) + b * Q_8_8(0.1133)) >> 8;
        r = (u16)((rTone * gray)) >> 8;
        g = (u16)((gTone * gray)) >> 8;
        b = (u16)((bTone * gray)) >> 8;
        if (r > 31)
            r = 31;
        if (g > 31)
            g = 31;
        if (b > 31)
            b = 31;
        *palette++ = RGB2(r, g, b);
    }
}

void CopyPaletteInvertedTint(const u16 *src, u16 *dst, u32 count, u8 tone)
{
    s32 r, g, b, i;
    u32 gray;

    if (!tone)
    {
        for (i = 0; i < count; i++)
            *dst++ = *src++;
    }
    else
    {
        for (i = 0; i < count; src++, dst++, i++)
        {
            r = GET_R(*src);
            g = GET_G(*src);
            b = GET_B(*src);
            gray = (r * Q_8_8(0.3) + g * Q_8_8(0.59) + b * Q_8_8(0.1133)) >> 8;
            r += (tone * (gray - r) >> 4);
            g += (tone * (gray - g) >> 4);
            b += (tone * (gray - b) >> 4);
            *dst = RGB2(r, g, b);
        }
    }
}

#define tCoeff       data[0]
#define tCoeffTarget data[1]
#define tCoeffDelta  data[2]
#define tDelay       data[3]
#define tDelayTimer  data[4]
#define IDX_PALETTES      5  // data[5] and data[6], set/get via Set/GetWordTaskArg
#define tColor       data[7]
#define tId          data[8]

// Blend the selected palettes in a series of steps toward or away from the color.
void BlendPalettesGradually(u32 selectedPalettes, s8 delay, u8 coeff, u8 coeffTarget, u16 color, u8 priority, u8 id)
{
    u8 taskId;

    taskId = CreateTask(Task_BlendPalettesGradually, priority);
    gTasks[taskId].tCoeff = coeff;
    gTasks[taskId].tCoeffTarget = coeffTarget;
    if (delay >= 0)
    {
        gTasks[taskId].tDelay = delay;
        gTasks[taskId].tCoeffDelta = 1;
    }
    else
    {
        gTasks[taskId].tDelay = 0;
        gTasks[taskId].tCoeffDelta = -delay + 1;
    }
    if (coeffTarget < coeff)
        gTasks[taskId].tCoeffDelta *= -1;
    SetWordTaskArg(taskId, IDX_PALETTES, selectedPalettes);
    gTasks[taskId].tColor = color;
    gTasks[taskId].tId = id;
    gTasks[taskId].func(taskId);
}

bool32 IsBlendPalettesGraduallyTaskActive(u8 id)
{
    s32 i;

    for (i = 0; i < NUM_TASKS; ++i)
        if (gTasks[i].isActive == TRUE
         && gTasks[i].func == Task_BlendPalettesGradually
         && gTasks[i].tId == id)
            return TRUE;
    return FALSE;
}

void DestroyBlendPalettesGraduallyTask(void)
{
    u8 taskId;

    while (TRUE)
    {
        taskId = FindTaskIdByFunc(Task_BlendPalettesGradually);
        if (taskId == TASK_NONE)
            break;
        DestroyTask(taskId);
    }
}

static void Task_BlendPalettesGradually(u8 taskId)
{
    u32 palettes;
    s16 *data;
    s16 target;

    data = gTasks[taskId].data;
    palettes = GetWordTaskArg(taskId, IDX_PALETTES);
    if (++tDelayTimer > tDelay)
    {
        tDelayTimer = 0;
        BlendPalettes(palettes, tCoeff, tColor);
        target = tCoeffTarget;
        if (tCoeff == target)
        {
            DestroyTask(taskId);
        }
        else
        {
            tCoeff += tCoeffDelta;
            if (tCoeffDelta >= 0)
            {
                if (tCoeff < target)
                    return;
            }
            else if (tCoeff > target)
            {
                return;
            }
            tCoeff = target;
        }
    }
}
