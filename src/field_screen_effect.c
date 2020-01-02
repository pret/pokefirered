#include "global.h"

void SetFlashScanlineEffectWindowBoundary(u16 *dest, u32 y, s32 left, s32 right)
{
    if (y <= 160)
    {
        if (left < 0)
            left = 0;
        if (left > 255)
            left = 255;
        if (right < 0)
            right = 0;
        if (right > 255)
            right = 255;
        dest[y] = (left << 8) | right;
    }
}

/*
 * Draws a circle by approximating xy² + yx² = radius².
 *
 * error is approximately xy² - yx². Negative values mean the circle is
 * slightly too large, and positive values mean the circle is slightly
 * too small. By decreasing xy whenever the error becomes negative the
 * code slightly under-approximates the size of the circle.
 *
 * The subtractive terms compute yx² - (yx - 1)², and therefore the sum
 * is yx² - 1:
 *   yx               |  0 |  1 |  2 |  3 |  4 |  5 |  6 |  7
 *   (yx * 2) - 1     | -1 |  1 |  3 |  5 |  7 |  9 | 11 | 13
 *   yx² - (yx - 1)²  | -1 |  1 |  3 |  5 |  7 |  9 | 11 | 13
 *   cumulative error | -1 |  0 |  3 |  8 | 15 | 24 | 35 | 48
 *   yx²              |  0 |  1 |  4 |  9 | 16 | 25 | 36 | 49
 *
 * The additive terms compute xy² - (xy - 1)² - 1, and therefore the sum
 * (badly) approximates Σi² - (i - 1)², i ∈ (xy, r), consider r = 18:
 *   xy               | 18 | 17 | 16 |  15 |  14 |  13 | ... |   0
 *   xy² - (xy - 1)²  | 35 | 33 | 31 |  29 |  27 |  25 | ... |  -1
 *   2 * (xy - 1)     | 34 | 32 | 30 |  28 |  26 |  24 | ... |  -2
 *   cumulative error | 34 | 66 | 96 | 124 | 150 | 174 | ... | 304
 *   Σi² - (i - 1)²   | 35 | 68 | 99 | 128 | 155 | 180 | ... | 323
 * 18² = 324, so if the iterations ran until xy = 0 the cumulative error
 * would be xy² - r.
 *
 * The error is initialized to r, which corrects for the error in the
 * additive terms. In practice all r iterations don't occur because we
 * early-exit when yx > xy, so it's half-way between a fix for that
 * error and an approximation of the midpoint between r² and (r + 1)².
 *
 * The algorithm takes advantage of symmetry to compute boundaries in
 * both directions out from centerY (using yx for y), and also both
 * directions *in* from centerY ± radius (using xy for y). Because xy
 * doesn't change on every iteration, we will frequently overwrite
 * boundaries set in the previous iteration.
 */
void SetFlashScanlineEffectWindowBoundaries(u16 *dest, s32 centerX, s32 centerY, s32 radius)
{
    s32 xy = radius;
    s32 error = radius;
    s32 yx = 0;
    while (xy >= yx)
    {
        SetFlashScanlineEffectWindowBoundary(dest, centerY - yx, centerX - xy, centerX + xy);
        SetFlashScanlineEffectWindowBoundary(dest, centerY + yx, centerX - xy, centerX + xy);
        SetFlashScanlineEffectWindowBoundary(dest, centerY - xy, centerX - yx, centerX + yx);
        SetFlashScanlineEffectWindowBoundary(dest, centerY + xy, centerX - yx, centerX + yx);
        error -= (yx * 2) - 1;
        yx++;
        if (error < 0)
        {
            error += 2 * (xy - 1);
            xy--;
        }
    }
}
