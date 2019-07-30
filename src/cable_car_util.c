#include "global.h"

static void CableCarUtil_FillWrapped(void *dest, u16 value, u8 left, u8 top, u8 width, u8 height)
{
    u8 i;
    u8 j;
    u8 x;
    u8 y;

    for (i = 0, y = top; i < height; i++)
    {
        for (x = left, j = 0; j < width; j++)
        {
            *(u16 *)&((u8 *)dest)[y * 64 + x * 2] = value;
            x = (x + 1) % 32;
        }
        y = (y + 1) % 32;
    }
}

static void CableCarUtil_CopyWrapped(void *dest, const u16 *src, u8 left, u8 top, u8 width, u8 height)
{
    u8 i;
    u8 j;
    u8 x;
    u8 y;
    const u16 *_src;

    for (i = 0, _src = src, y = top; i < height; i++)
    {
        for (x = left, j = 0; j < width; j++)
        {
            *(u16 *)&((u8 *)dest)[y * 64 + x * 2] = *_src++;
            x = (x + 1) % 32;
        }
        y = (y + 1) % 32;
    }
}
