#include "global.h"
#include "text.h"
#include "dynamic_placeholder_text_util.h"
#include "string_util.h"

static EWRAM_DATA const u8 *sStringPointers[8] = {0};

static const u8 sTextColorTable[] =
{
     0,  0,  0, 16, 17, 17, 17, 16, 16,  0,  0, 17,  1,  0, 17, 16,
     0, 16, 16,  0,  1,  1,  1,  1,  1,  1,  0,  0,  0,  1,  0,  0,
    17,  1,  0,  0,  0, 16, 17,  0, 16, 16, 16,  0,  1,  0, 51, 51,
    51, 51, 51, 51, 51, 51, 35, 34, 34, 34, 34, 34, 34, 34, 34, 34,
    34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 50,
};

void DynamicPlaceholderTextUtil_Reset(void)
{
    const u8 **ptr = sStringPointers;
    u8 *fillval = NULL;
    const u8 **ptr2 = ptr + (NELEMS(sStringPointers) - 1);
    
    do
    {
        *ptr2-- = fillval;
    }
    while ((intptr_t)ptr2 >= (intptr_t)ptr);
}

void DynamicPlaceholderTextUtil_SetPlaceholderPtr(u8 idx, const u8 *ptr)
{
    if (idx < NELEMS(sStringPointers))
        sStringPointers[idx] = ptr;
}

u8 *DynamicPlaceholderTextUtil_ExpandPlaceholders(u8 *dest, const u8 *src)
{
    while (*src != EOS)
    {
        if (*src != CHAR_SPECIAL_F7)
        {
            *dest++ = *src++;
        }
        else
        {
            src++;
            if (sStringPointers[*src] != NULL)
                dest = StringCopy(dest, sStringPointers[*src]);
            src++;
        }
    }
    *dest = EOS;
    return dest;
}

const u8 *DynamicPlaceholderTextUtil_GetPlaceholderPtr(u8 idx)
{
    return sStringPointers[idx];
}

u8 GetColorFromTextColorTable(u16 graphicId)
{
    u32 test = graphicId >> 1;
    u32 shift = (graphicId & 1) << 2;

    if (test > 0x4B)
        return 3;
    else
        return (sTextColorTable[graphicId >> 1] >> shift) & 0xF;
}
