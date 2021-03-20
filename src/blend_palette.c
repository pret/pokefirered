#include "global.h"
#include "blend_palette.h"
#include "palette.h"

void BlendPalette(u16 palOffset, u16 numEntries, u8 coeff, u16 blendColor)
{
    u16 i;
    for (i = 0; i < numEntries; i++)
    {
        u16 index = i + palOffset;
        struct PlttData *data1 = (struct PlttData *)&gPlttBufferUnfaded[index];
        s8 r = data1->r;
        s8 g = data1->g;
        s8 b = data1->b;
        struct PlttData *data2 = (struct PlttData *)&blendColor;
        gPlttBufferFaded[index] = ((r + (((data2->r - r) * coeff) >> 4)) << 0)
                                | ((g + (((data2->g - g) * coeff) >> 4)) << 5)
                                | ((b + (((data2->b - b) * coeff) >> 4)) << 10);
    }
}

void BlendPalettesAt(u16 * palbuff, u16 blend_pal, u32 coefficient, s32 size)
{
    if (coefficient == 16)
    {
        while (--size != -1)
        {
            *palbuff++ = blend_pal;
        }
    }
    else
    {
        u16 r = (blend_pal >>  0) & 0x1F;
        u16 g = (blend_pal >>  5) & 0x1F;
        u16 b = (blend_pal >> 10) & 0x1F;
        while (--size != -1)
        {
            u16 r2 = (*palbuff >>  0) & 0x1F;
            u16 g2 = (*palbuff >>  5) & 0x1F;
            u16 b2 = (*palbuff >> 10) & 0x1F;
            *palbuff++ = ((r2 + (((r - r2) * coefficient) >> 4)) <<  0)
                       | ((g2 + (((g - g2) * coefficient) >> 4)) <<  5)
                       | ((b2 + (((b - b2) * coefficient) >> 4)) << 10);
        }
    }
}
