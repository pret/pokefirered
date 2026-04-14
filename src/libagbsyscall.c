#include "global.h"
#include "gba/flash_internal.h"

struct SoundInfo *SOUND_INFO_PTR;
u16 INTR_CHECK;
void *INTR_VECTOR;

u8 REG_BASE[0x400] __attribute__ ((aligned (4))) = {0};
u8 PLTT[PLTT_SIZE] __attribute__ ((aligned (4))) = {0};
u8 VRAM_[VRAM_SIZE] __attribute__ ((aligned (4))) = {0};
u8 OAM[OAM_SIZE] __attribute__ ((aligned (4))) = {0};
u8 FLASH_BASE[FLASH_ROM_SIZE_1M] __attribute__ ((aligned (4))) = {0};


const s16 sineTable[256] = {
  (s16)0x0000, (s16)0x0192, (s16)0x0323, (s16)0x04B5, (s16)0x0645, (s16)0x07D5, (s16)0x0964, (s16)0x0AF1,
  (s16)0x0C7C, (s16)0x0E05, (s16)0x0F8C, (s16)0x1111, (s16)0x1294, (s16)0x1413, (s16)0x158F, (s16)0x1708,
  (s16)0x187D, (s16)0x19EF, (s16)0x1B5D, (s16)0x1CC6, (s16)0x1E2B, (s16)0x1F8B, (s16)0x20E7, (s16)0x223D,
  (s16)0x238E, (s16)0x24DA, (s16)0x261F, (s16)0x275F, (s16)0x2899, (s16)0x29CD, (s16)0x2AFA, (s16)0x2C21,
  (s16)0x2D41, (s16)0x2E5A, (s16)0x2F6B, (s16)0x3076, (s16)0x3179, (s16)0x3274, (s16)0x3367, (s16)0x3453,
  (s16)0x3536, (s16)0x3612, (s16)0x36E5, (s16)0x37AF, (s16)0x3871, (s16)0x392A, (s16)0x39DA, (s16)0x3A82,
  (s16)0x3B20, (s16)0x3BB6, (s16)0x3C42, (s16)0x3CC5, (s16)0x3D3E, (s16)0x3DAE, (s16)0x3E14, (s16)0x3E71,
  (s16)0x3EC5, (s16)0x3F0E, (s16)0x3F4E, (s16)0x3F84, (s16)0x3FB1, (s16)0x3FD3, (s16)0x3FEC, (s16)0x3FFB,
  (s16)0x4000, (s16)0x3FFB, (s16)0x3FEC, (s16)0x3FD3, (s16)0x3FB1, (s16)0x3F84, (s16)0x3F4E, (s16)0x3F0E,
  (s16)0x3EC5, (s16)0x3E71, (s16)0x3E14, (s16)0x3DAE, (s16)0x3D3E, (s16)0x3CC5, (s16)0x3C42, (s16)0x3BB6,
  (s16)0x3B20, (s16)0x3A82, (s16)0x39DA, (s16)0x392A, (s16)0x3871, (s16)0x37AF, (s16)0x36E5, (s16)0x3612,
  (s16)0x3536, (s16)0x3453, (s16)0x3367, (s16)0x3274, (s16)0x3179, (s16)0x3076, (s16)0x2F6B, (s16)0x2E5A,
  (s16)0x2D41, (s16)0x2C21, (s16)0x2AFA, (s16)0x29CD, (s16)0x2899, (s16)0x275F, (s16)0x261F, (s16)0x24DA,
  (s16)0x238E, (s16)0x223D, (s16)0x20E7, (s16)0x1F8B, (s16)0x1E2B, (s16)0x1CC6, (s16)0x1B5D, (s16)0x19EF,
  (s16)0x187D, (s16)0x1708, (s16)0x158F, (s16)0x1413, (s16)0x1294, (s16)0x1111, (s16)0x0F8C, (s16)0x0E05,
  (s16)0x0C7C, (s16)0x0AF1, (s16)0x0964, (s16)0x07D5, (s16)0x0645, (s16)0x04B5, (s16)0x0323, (s16)0x0192,
  (s16)0x0000, (s16)0xFE6E, (s16)0xFCDD, (s16)0xFB4B, (s16)0xF9BB, (s16)0xF82B, (s16)0xF69C, (s16)0xF50F,
  (s16)0xF384, (s16)0xF1FB, (s16)0xF074, (s16)0xEEEF, (s16)0xED6C, (s16)0xEBED, (s16)0xEA71, (s16)0xE8F8,
  (s16)0xE783, (s16)0xE611, (s16)0xE4A3, (s16)0xE33A, (s16)0xE1D5, (s16)0xE075, (s16)0xDF19, (s16)0xDDC3,
  (s16)0xDC72, (s16)0xDB26, (s16)0xD9E1, (s16)0xD8A1, (s16)0xD767, (s16)0xD633, (s16)0xD506, (s16)0xD3DF,
  (s16)0xD2BF, (s16)0xD1A6, (s16)0xD095, (s16)0xCF8A, (s16)0xCE87, (s16)0xCD8C, (s16)0xCC99, (s16)0xCBAD,
  (s16)0xCACA, (s16)0xC9EE, (s16)0xC91B, (s16)0xC851, (s16)0xC78F, (s16)0xC6D6, (s16)0xC626, (s16)0xC57E,
  (s16)0xC4E0, (s16)0xC44A, (s16)0xC3BE, (s16)0xC33B, (s16)0xC2C2, (s16)0xC252, (s16)0xC1EC, (s16)0xC18F,
  (s16)0xC13B, (s16)0xC0F2, (s16)0xC0B2, (s16)0xC07C, (s16)0xC04F, (s16)0xC02D, (s16)0xC014, (s16)0xC005,
  (s16)0xC000, (s16)0xC005, (s16)0xC014, (s16)0xC02D, (s16)0xC04F, (s16)0xC07C, (s16)0xC0B2, (s16)0xC0F2,
  (s16)0xC13B, (s16)0xC18F, (s16)0xC1EC, (s16)0xC252, (s16)0xC2C2, (s16)0xC33B, (s16)0xC3BE, (s16)0xC44A,
  (s16)0xC4E0, (s16)0xC57E, (s16)0xC626, (s16)0xC6D6, (s16)0xC78F, (s16)0xC851, (s16)0xC91B, (s16)0xC9EE,
  (s16)0xCACA, (s16)0xCBAD, (s16)0xCC99, (s16)0xCD8C, (s16)0xCE87, (s16)0xCF8A, (s16)0xD095, (s16)0xD1A6,
  (s16)0xD2BF, (s16)0xD3DF, (s16)0xD506, (s16)0xD633, (s16)0xD767, (s16)0xD8A1, (s16)0xD9E1, (s16)0xDB26,
  (s16)0xDC72, (s16)0xDDC3, (s16)0xDF19, (s16)0xE075, (s16)0xE1D5, (s16)0xE33A, (s16)0xE4A3, (s16)0xE611,
  (s16)0xE783, (s16)0xE8F8, (s16)0xEA71, (s16)0xEBED, (s16)0xED6C, (s16)0xEEEF, (s16)0xF074, (s16)0xF1FB,
  (s16)0xF384, (s16)0xF50F, (s16)0xF69C, (s16)0xF82B, (s16)0xF9BB, (s16)0xFB4B, (s16)0xFCDD, (s16)0xFE6E
};

static uint32_t CPUReadMemory(const void *src)
{
    return *(uint32_t *)src;
}

static void CPUWriteMemory(void *dest, uint32_t val)
{
    *(uint32_t *)dest = val;
}

static uint16_t CPUReadHalfWord(const void *src)
{
    return *(uint16_t *)src;
}

static void CPUWriteHalfWord(void *dest, uint16_t val)
{
    *(uint16_t *)dest = val;
}

static uint8_t CPUReadByte(const void *src)
{
    return *(uint8_t *)src;
}

static void CPUWriteByte(void *dest, uint8_t val)
{
    *(uint8_t *)dest = val;
}

u16 ArcTan(s16 i)
{
    s32 a = -((i * i) >> 14);
    s32 b = ((0xA9 * a) >> 14) + 0x390;
    b = ((b * a) >> 14) + 0x91C;
    b = ((b * a) >> 14) + 0xFB6;
    b = ((b * a) >> 14) + 0x16AA;
    b = ((b * a) >> 14) + 0x2081;
    b = ((b * a) >> 14) + 0x3651;
    b = ((b * a) >> 14) + 0xA2F9;

    return (i * b) >> 16;
}

u16 ArcTan2(s16 x, s16 y)
{
    if (!y)
    {
        if (x >= 0)
            return 0;
        return 0x8000;
    }
    if (!x)
    {
        if (y >= 0)
            return 0x4000;
        return 0xC000;
    }
    if (y >= 0)
    {
        if (x >= 0)
        {
            if (x >= y)
                return ArcTan((y << 14) / x);
        }
        else if (-x >= y)
            return ArcTan((y << 14) / x) + 0x8000;
        return 0x4000 - ArcTan((x << 14) / y);
    }
    else
    {
        if (x <= 0)
        {
            if (-x > -y)
                return ArcTan((y << 14) / x) + 0x8000;
        }
        else if (x >= -y)
            return ArcTan((y << 14) / x) + 0x10000;
        return 0xC000 - ArcTan((x << 14) / y);
    }
}

void BgAffineSet(struct BgAffineSrcData *src, struct BgAffineDstData *dest, s32 count)
{
    for(s32 i=0; i<count; i++)
    {
        s32 cx = src[i].texX;
        s32 cy = src[i].texY;
        s16 dispx = src[i].scrX;
        s16 dispy = src[i].scrY;
        s16 rx = src[i].sx;
        s16 ry = src[i].sy;
        u16 theta = src[i].alpha>>8;
        s32 a = sineTable[(theta+0x40)&255];
        s32 b = sineTable[theta];

        s16 dx =  (rx * a)>>14;
        s16 dmx = (rx * b)>>14;
        s16 dy =  (ry * b)>>14;
        s16 dmy = (ry * a)>>14;

        dest[i].pa = dx;
        dest[i].pb = -dmx;
        dest[i].pc = dy;
        dest[i].pd = dmy;

        s32 startx = cx - dx * dispx + dmx * dispy;
        s32 starty = cy - dy * dispx - dmy * dispy;

        dest[i].dx = startx;
        dest[i].dy = starty;
    }
}

void CpuFastSet(const void *src, void *dst, u32 cnt)
{
    if(dst == NULL)
    {
        puts("Attempted to CpuFastSet to NULL\n");
        return;
    }
    
    int count = cnt & 0x1FFFFF;

    const u8 *source = src;
    u8 *dest = dst;
    
    //source = (u8 *)((uint32_t )source & ~3);
    //dest = (u8 *)((uint32_t )dest & ~3);

    // fill?
    if((cnt >> 24) & 1) {
        uint32_t value = CPUReadMemory(source);
        while(count > 0) {
            // BIOS always transfers 32 bytes at a time
            for(int i = 0; i < 8; i++) {
                CPUWriteMemory(dest, value);
                dest += 4;
            }
            count -= 8;
        }
    } else {
        // copy
        while(count > 0) {
            // BIOS always transfers 32 bytes at a time
            for(int i = 0; i < 8; i++) {
                uint32_t value = CPUReadMemory(source);
                CPUWriteMemory(dest, value);
                source += 4;
                dest += 4;
            }
            count -= 8;
        }
    }
}

void CpuSet(const void *src, void *dst, u32 cnt)
{
    if(dst == NULL)
    {
        puts("Attempted to CpuSet to NULL\n");
        return;
    }
    
    int count = cnt & 0x1FFFFF;

    const u8 *source = src;
    u8 *dest = dst;

    // 32-bit ?
    if ((cnt >> 26) & 1) {
        
        //assert(((uintptr_t)src & ~3) == (uintptr_t)src);
        //assert(((uintptr_t)dst & ~3) == (uintptr_t)dst);
        
        // needed for 32-bit mode!
        //source = (u8 *)((uint32_t )source & ~3);
        //dest = (u8 *)((uint32_t )dest & ~3);

        // fill ?
        if ((cnt >> 24) & 1) {
            uint32_t value = CPUReadMemory(source);
            while (count) {
                CPUWriteMemory(dest, value);
                dest += 4;
                count--;
            }
        } else {
            // copy
            while (count) {
                CPUWriteMemory(dest, CPUReadMemory(source));
                source += 4;
                dest += 4;
                count--;
            }
        }
    } else {
        // No align on 16-bit fill?
        //assert(((uintptr_t)src & ~1) == (uintptr_t)src);
        //assert(((uintptr_t)dst & ~1) == (uintptr_t)dst);

        // 16-bit fill?
        if ((cnt >> 24) & 1) {
            uint16_t value = CPUReadHalfWord(source);
            while (count) {
                CPUWriteHalfWord(dest, value);
                dest += 2;
                count--;
            }
        } else {
            // copy
            while (count) {
                CPUWriteHalfWord(dest, CPUReadHalfWord(source));
                source += 2;
                dest += 2;
                count--;
            }
        }
    }
}

s32 Div(s32 num, s32 denom) {
    s32 result = num / denom;
    return result;
}

void LZ77UnCompVram(const void *src_, void *dest_)
{
    const u8 *src = (u8 *)src_;
    u8 *dest = (u8 *)dest_;
    int destSize = (src[3] << 16) | (src[2] << 8) | src[1];
    int srcPos = 4;
    int destPos = 0;

    for (;;) {
        unsigned char flags = src[srcPos++];

        for (int i = 0; i < 8; i++) {
            if (flags & 0x80) {
                int blockSize = (src[srcPos] >> 4) + 3;
                int blockDistance = (((src[srcPos] & 0xF) << 8) | src[srcPos + 1]) + 1;

                srcPos += 2;

                int blockPos = destPos - blockDistance;

                // Some Ruby/Sapphire tilesets overflow.
                if (destPos + blockSize > destSize) {
                    blockSize = destSize - destPos;
                    puts("Destination buffer overflow.\n");
                }

                if (blockPos < 0)
                    goto fail;

                for (int j = 0; j < blockSize; j++)
                    dest[destPos++] = dest[blockPos + j];
            } else {
                if (destPos >= destSize)
                    goto fail;

                dest[destPos++] = src[srcPos++];
            }

            if (destPos == destSize) {
                return;
            }

            flags <<= 1;
        }
    }

fail:
    puts("Fatal error while decompressing LZ file.\n");
}

void LZ77UnCompWram(const void *src, void *dst)
{
    const uint8_t *source = (uint8_t *)src;
    uint8_t *dest = (uint8_t *)dst;

    uint32_t header = CPUReadMemory(source);
    source += 4;

    int len = header >> 8;

    while (len > 0) {
        uint8_t d = CPUReadByte(source++);

        if (d) {
            for (int i = 0; i < 8; i++) {
                if (d & 0x80) {
                    uint16_t data = CPUReadByte(source++) << 8;
                    data |= CPUReadByte(source++);
                    int length = (data >> 12) + 3;
                    int offset = (data & 0x0FFF);
                    uint8_t *windowOffset = dest - offset - 1;
                    for (int i2 = 0; i2 < length; i2++) {
                        CPUWriteByte(dest++, CPUReadByte(windowOffset++));
                        len--;
                        if (len == 0)
                            return;
                    }
                } else {
                    CPUWriteByte(dest++, CPUReadByte(source++));
                    len--;
                    if (len == 0)
                        return;
                }
                d <<= 1;
            }
        } else {
            for (int i = 0; i < 8; i++) {
                CPUWriteByte(dest++, CPUReadByte(source++));
                len--;
                if (len == 0)
                    return;
            }
        }
    }
}

int MultiBoot(struct MultiBootParam *mp){
    return 0; // Not implemented
}

void ObjAffineSet(struct ObjAffineSrcData *src, void *dest, s32 count, s32 offset)
{
    for(s32 i=0; i<count; i++)
    {
        s16 rx = src[i].xScale;
        s16 ry = src[i].yScale;
        u16 theta = src[i].rotation>>8;

        s32 a = (s32)sineTable[(theta + 64) & 255];
        s32 b = (s32)sineTable[theta];

        s16 dx =  ((s32)rx * a)>>14;
        s16 dmx = ((s32)rx * b)>>14;
        s16 dy =  ((s32)ry * b)>>14;
        s16 dmy = ((s32)ry * a)>>14;

        CPUWriteHalfWord(dest, dx);
        dest += offset;
        CPUWriteHalfWord(dest, -dmx);
        dest += offset;
        CPUWriteHalfWord(dest, dy);
        dest += offset;
        CPUWriteHalfWord(dest, dmy);
        dest += offset;
    }
}

void RegisterRamReset(u32 resetFlags){}

void SoftReset(u32 resetFlags){}

u16 Sqrt(u32 num)
{
    if (!num)
        return 0;
    u32 lower;
    u32 upper = num;
    u32 bound = 1;
    while (bound < upper)
    {
        upper >>= 1;
        bound <<= 1;
    }
    while (1)
    {
        upper = num;
        u32 accum = 0;
        lower = bound;
        while (1)
        {
            u32 oldLower = lower;
            if (lower <= upper >> 1)
                lower <<= 1;
            if (oldLower >= upper >> 1)
                break;
        }
        while (1)
        {
            accum <<= 1;
            if (upper >= lower)
            {
                ++accum;
                upper -= lower;
            }
            if (lower == bound)
                break;
            lower >>= 1;
        }
        u32 oldBound = bound;
        bound += accum;
        bound >>= 1;
        if (bound >= oldBound)
        {
            bound = oldBound;
            break;
        }
    }
    return bound;
}

