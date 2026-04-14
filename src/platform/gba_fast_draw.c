#ifdef FAST_DRAW
#include "global.h"
#include <stdbool.h>
#include "platform/dma.h"

#define mosaicBGEffectX (REG_MOSAIC & 0xF)
#define mosaicBGEffectY ((REG_MOSAIC >> 4) & 0xF)
#define mosaicSpriteEffectX ((REG_MOSAIC >> 8) & 0xF)
#define mosaicSpriteEffectY ((REG_MOSAIC >> 12) & 0xF)
#define applyBGHorizontalMosaicEffect(x) (x - (x % (mosaicBGEffectX+1)))
#define applyBGVerticalMosaicEffect(y) (y - (y % (mosaicBGEffectY+1)))
#define applySpriteHorizontalMosaicEffect(x) (x - (x % (mosaicSpriteEffectX+1)))
#define applySpriteVerticalMosaicEffect(y) (y - (y % (mosaicSpriteEffectY+1)))

#define getColorFromPixel(x) (pal[(paletteNum << 4) + (x)])
#define setAlphaBitIfEnabled(x) (((x) != 0) << 15)
#define getbgtilePixel(x) (((x) != 0) ? (getColorFromPixel(x) | setAlphaBitIfEnabled(x)) : 0)
#define get32BitDoublePixel(x, y) getbgtilePixel(x) | (getbgtilePixel(y) << 16)

#define getAlphaBit(x) ((x >> 15) & 1)
#define getRedChannel(x) ((x >>  0) & 0x1F)
#define getGreenChannel(x) ((x >>  5) & 0x1F)
#define getBlueChannel(x) ((x >>  10) & 0x1F)
#define isbgEnabled(x) ((REG_DISPCNT >> 8) & 0xF) & (1 << x)

#ifdef PLATFORM_WIN32
//gcc doesn't optimally inline some functions which causes a significant framerate drop in frame rate
#define inline_hack __attribute__ ((always_inline))
#else
#define inline_hack
#endif

extern IntrFunc gIntrTable[];

#define TILE_WIDTH 8
#define TILE_HEIGHT 8

struct scanlineData {
    uint16_t bgcnts[4];
    uint16_t winMask[DISPLAY_WIDTH];
    uint16_t bgMask[DISPLAY_WIDTH];
    //priority bookkeeping
    char bgtoprio[4]; //background to priority
    char prioritySortedBgs[4][4];
    char prioritySortedBgsCount[4];
};

struct bgPriority {
    char priority;
    char subPriority;
};

static const uint16_t bgMapSizes[][2] =
{
    {32, 32},
    {64, 32},
    {32, 64},
    {64, 64},
};

static uint16_t alphaBlendColor(uint16_t targetA, uint16_t targetB)
{
    unsigned int eva = REG_BLDALPHA & 0x1F;
    unsigned int evb = (REG_BLDALPHA >> 8) & 0x1F;
    // shift right by 4 = division by 16
    unsigned int r = ((getRedChannel(targetA) * eva) + (getRedChannel(targetB) * evb)) >> 4;
    unsigned int g = ((getGreenChannel(targetA) * eva) + (getGreenChannel(targetB) * evb)) >> 4;
    unsigned int b = ((getBlueChannel(targetA) * eva) + (getBlueChannel(targetB) * evb)) >> 4;
    
    if (r > 31)
        r = 31;
    if (g > 31)
        g = 31;
    if (b > 31)
        b = 31;

     return r | (g << 5) | (b << 10) | (1 << 15);
}

static uint16_t alphaBrightnessIncrease(uint16_t targetA)
{
    unsigned int evy = (REG_BLDY & 0x1F);
    unsigned int r = getRedChannel(targetA) + (31 - getRedChannel(targetA)) * evy / 16;
    unsigned int g = getGreenChannel(targetA) + (31 - getGreenChannel(targetA)) * evy / 16;
    unsigned int b = getBlueChannel(targetA) + (31 - getBlueChannel(targetA)) * evy / 16;
    
    if (r > 31)
        r = 31;
    if (g > 31)
        g = 31;
    if (b > 31)
        b = 31;
    
     return r | (g << 5) | (b << 10) | (1 << 15);
}

static uint16_t alphaBrightnessDecrease(uint16_t targetA)
{
    unsigned int evy = (REG_BLDY & 0x1F);
    unsigned int r = getRedChannel(targetA) - getRedChannel(targetA) * evy / 16;
    unsigned int g = getGreenChannel(targetA) - getGreenChannel(targetA) * evy / 16;
    unsigned int b = getBlueChannel(targetA) - getBlueChannel(targetA) * evy / 16;
    
    if (r > 31)
        r = 31;
    if (g > 31)
        g = 31;
    if (b > 31)
        b = 31;
    
     return r | (g << 5) | (b << 10) | (1 << 15);
}

#define WINMASK_BG0    (1 << 0)
#define WINMASK_BG1    (1 << 1)
#define WINMASK_BG2    (1 << 2)
#define WINMASK_BG3    (1 << 3)
#define WINMASK_OBJ    (1 << 4)
#define WINMASK_CLR    (1 << 5)
#define WINMASK_WINOUT  (1 << 6)

//checks if window horizontal is in bounds and takes account WIN wraparound
static bool winCheckHorizontalBounds(u16 left, u16 right, u16 xpos)
{
    if (left > right)
        return (xpos >= left || xpos < right);
    else
        return (xpos >= left && xpos < right);
}

static void RenderBGScanlineWinBlend(int bgNum, uint16_t control, uint16_t hoffs, uint16_t voffs, int lineNum, uint16_t *line, struct scanlineData* scanline, bool windowsEnabled)
{
    unsigned int charBaseBlock = (control >> 2) & 3;
    unsigned int screenBaseBlock = (control >> 8) & 0x1F;
    unsigned int bitsPerPixel = 4;//((control >> 7) & 1) ? 8 : 4;
    unsigned int mapWidth = bgMapSizes[control >> 14][0];
    unsigned int mapHeight = bgMapSizes[control >> 14][1];
    unsigned int mapWidthInPixels = mapWidth * 8;
    unsigned int mapHeightInPixels = mapHeight * 8;
    uint16_t *bgmap = (uint16_t *)BG_SCREEN_ADDR(screenBaseBlock);
    uint16_t* mask = scanline->bgMask;
    uint8_t blendMode = (REG_BLDCNT >> 6) & 3;
    
    //for (int i = 0; i < DISPLAY_WIDTH; i++)
    //{
    //  line[i] = 0x8F00;
    //}
    //return;
    
    uint8_t *bgtiles = (uint8_t *)BG_CHAR_ADDR(charBaseBlock);
    uint16_t *pal = (uint16_t *)PLTT;
     
    if (control & BGCNT_MOSAIC)
        lineNum = applyBGVerticalMosaicEffect(lineNum);
    
    unsigned int xx = hoffs & 0x1FF;
    unsigned int yy = (lineNum + voffs) & 0x1FF;
    
    
    if (yy > 255 && mapHeightInPixels > 256) {
        //the width check is for 512x512 mode support, it jumps by two screen bases instead
        bgmap += (mapWidthInPixels > 256) ? 0x800 : 0x400;
    }
    
    xx &= 0x1FF;
    yy &= 0xFF;
    
    uint32_t lineTile = ((lineNum + voffs) & 0xFF) / 8;
    uint32_t firstTile = bgmap[lineTile*32] & 0x3FF;
    uint32_t firstTileData = *(uint32_t*)&bgtiles[(firstTile * 32) + ((lineTile & 7) * bitsPerPixel)];
    if (firstTileData == 0 && mapWidthInPixels > 256)
    {
        for (uint32_t i = 1; i < 32; i++)
        {
            uint32_t tile = bgmap[lineTile*32+i] & 0x3FF;
            if (firstTile != tile)
                goto exitBlankScanlineLoop;
        }
        if (mapWidthInPixels > 256)
        {
            for (uint32_t i = 0; i < 32; i++)
            {
                uint32_t tile = bgmap[lineTile*32+i+0x400] & 0x3FF;
                if (firstTile != tile)
                    goto exitBlankScanlineLoop;
            }   
        }
        return;
    }
    exitBlankScanlineLoop:;
    
    unsigned int startTileX = xx / 8;
    unsigned int startTileY = yy / 8;
    unsigned int startTileYLoc = startTileY * 32;
    unsigned int visibleTilePixels = xx & 7;
    unsigned int tileY = yy & 7;
    uint32_t entry;
    
    if (startTileX > 31 && mapWidthInPixels > 256)
        entry = bgmap[startTileYLoc + (startTileX & 31) + 0x400];
    else
        entry = bgmap[startTileYLoc + (startTileX & 31)];
    unsigned int tileNum = entry & 0x3FF;
    unsigned int paletteNum = (entry >> 12) & 0xF;
    uint32_t tileLoc;
    uint32_t pixel;
    unsigned int x = 0;
    //bool shouldBlend = true;
    
    //memset(line, 0x8F00, DISPLAY_WIDTH*2);
    //for (int i = 0; i < DISPLAY_WIDTH; i++)
    //{
    //  line[i] = 0x8F00;
    //}
    
    #define writeBgPixel(pixel, x)  \
        if (scanline->winMask[x] & WINMASK_CLR) { \
            switch (blendMode) { \
            case 1: \
                if ((mask[x] & (REG_BLDCNT >> 8))) \
                    line[x] = alphaBlendColor(pal[(paletteNum << 4) + (pixel)], line[x]) | 0x8000; \
                else \
                    line[x] = pal[(paletteNum << 4) + (pixel)] | 0x8000;\
                break; \
            case 2: \
                line[x] = alphaBrightnessIncrease(pal[(paletteNum << 4) + (pixel)]) | 0x8000; \
                break; \
            case 3: \
                line[x] = alphaBrightnessDecrease(pal[(paletteNum << 4) + (pixel)]) | 0x8000; \
                break; } \
        }else{ \
            line[x] = pal[(paletteNum << 4) + (pixel)] | 0x8000; \
        } \
        mask[x] = 1 << bgNum;
    
    #define writeBgPixelWin(pixel, x)   \
        if ( ((pixel)) != 0 ) { \
            if (scanline->winMask[x] & (1 << bgNum)) { \
                writeBgPixel(pixel, x) \
            } \
        }
    
    if (entry & (1 << 11))
        tileLoc = (tileNum * (bitsPerPixel * 8)) + (7 - tileY)*bitsPerPixel;
    else
        tileLoc = (tileNum * (bitsPerPixel * 8)) + tileY*bitsPerPixel;

    //draw left most tile
    if (entry & (1 << 10))
    {
        for (int i = visibleTilePixels; i < 8; i++)
        {
            pixel = bgtiles[tileLoc + (3-(i/2))];

            if (i & 1)
                pixel &= 0xF;
            else
                pixel >>= 4;

            //if (pixel != 0)
            writeBgPixelWin(pixel, x)
            x += 1;
        }
    }
    else
    {
        for (int i = visibleTilePixels; i < 8; i++)
        {
            pixel = bgtiles[tileLoc + (i/2)];

            if (i & 1)
                pixel >>= 4;
            else
                pixel &= 0xF;

            writeBgPixelWin(pixel, x)
            x += 1;
        }
    }

    //draw all middle pixels
    for (int currTile = 1; currTile < ( (DISPLAY_WIDTH / 8)); currTile++)
    {
        if (( (startTileX+currTile) & 63) > 31 && mapWidthInPixels > 256)
            entry = bgmap[startTileYLoc + ((startTileX+currTile) & 31) + 0x400];
        else
            entry = bgmap[startTileYLoc + ((startTileX+currTile) & 31)];
        tileNum = entry & 0x3FF;
        paletteNum = (entry >> 12) & 0xF;
        if (entry & (1 << 11))
            tileLoc = (tileNum * (bitsPerPixel * 8)) + (7 - tileY)*bitsPerPixel;
        else
            tileLoc = (tileNum * (bitsPerPixel * 8)) + tileY*bitsPerPixel;
        uint32_t pixel32 = *(uint32_t*)&bgtiles[tileLoc];
        if (pixel32 != 0) {
            if (entry & (1 << 10))
            {
                writeBgPixelWin(pixel32 >> 28, x)
                writeBgPixelWin((pixel32 >> 24) & 0xF, x+1)
                writeBgPixelWin((pixel32 >> 20) & 0xF, x+2)
                writeBgPixelWin((pixel32 >> 16) & 0xF, x+3)
                writeBgPixelWin((pixel32 >> 12) & 0xF, x+4)
                writeBgPixelWin((pixel32 >> 8) & 0xF, x+5)
                writeBgPixelWin((pixel32 >> 4) & 0xF, x+6)
                writeBgPixelWin(pixel32 & 0xF, x+7)
            }
            else
            {
                writeBgPixelWin(pixel32 & 0xF, x)
                writeBgPixelWin((pixel32 >> 4) & 0xF, x+1)
                writeBgPixelWin((pixel32 >> 8) & 0xF, x+2)
                writeBgPixelWin((pixel32 >> 12) & 0xF, x+3)
                writeBgPixelWin((pixel32 >> 16) & 0xF, x+4)
                writeBgPixelWin((pixel32 >> 20) & 0xF, x+5)
                writeBgPixelWin((pixel32 >> 24) & 0xF, x+6)
                writeBgPixelWin(pixel32 >> 28, x+7)
            }
        }
        x += 8;
    }
    //draw right most tile
    if (((startTileX+(DISPLAY_WIDTH/8)) & 63) > 31 && mapWidthInPixels > 256)
        entry = bgmap[startTileYLoc + ((startTileX+(DISPLAY_WIDTH/8)) & 31) + 0x400];
    else
        entry = bgmap[startTileYLoc + ((startTileX+(DISPLAY_WIDTH/8)) & 31)];
    tileNum = entry & 0x3FF;
    paletteNum = (entry >> 12) & 0xF;
    if (entry & (1 << 11))
        tileLoc = (tileNum * (bitsPerPixel * 8)) + (7 - tileY)*bitsPerPixel;
    else
        tileLoc = (tileNum * (bitsPerPixel * 8)) + tileY*bitsPerPixel;
    if((*(uint32_t*)&bgtiles[tileLoc]) != 0)
    {
        if (entry & (1 << 10)) //horizontally flipped
        {
            for (int i = 0; i < visibleTilePixels; i++)
            {
                pixel = bgtiles[tileLoc + (3-(i/2))];

                if (i & 1)
                    pixel &= 0xF;
                else
                    pixel >>= 4;

                //if (pixel != 0)
                writeBgPixelWin(pixel, x)
                    //line[x] = pal[16 * paletteNum + pixel] | 0x8000;
                x += 1;
            }
        }
        else //not horizontally flipped
        {
            for (int i = 0; i < visibleTilePixels; i++)
            {
                pixel = bgtiles[tileLoc + (i/2)];
                
                if (i & 1)
                    pixel >>= 4;
                else
                    pixel &= 0xF;

                writeBgPixelWin(pixel, x)
                x += 1;
            }
        }
    }
    //apply horiziontal mosaic if needed
    if (control & BGCNT_MOSAIC && mosaicBGEffectX > 0)
    {
        for (int x = 0; x < DISPLAY_WIDTH; x++)
        {
            uint16_t color = line[applyBGHorizontalMosaicEffect(x)];
            line[x] = color;
        }
    }
}

#undef writeBgPixel
#undef writeBgPixelWin

static void RenderBGScanlineWin(int bgNum, uint16_t control, uint16_t hoffs, uint16_t voffs, int lineNum, uint16_t *line, struct scanlineData* scanline, bool windowsEnabled)
{
    unsigned int charBaseBlock = (control >> 2) & 3;
    unsigned int screenBaseBlock = (control >> 8) & 0x1F;
    unsigned int bitsPerPixel = 4;//((control >> 7) & 1) ? 8 : 4;
    unsigned int mapWidth = bgMapSizes[control >> 14][0];
    unsigned int mapHeight = bgMapSizes[control >> 14][1];
    unsigned int mapWidthInPixels = mapWidth * 8;
    unsigned int mapHeightInPixels = mapHeight * 8;
    uint16_t *bgmap = (uint16_t *)BG_SCREEN_ADDR(screenBaseBlock);
    uint16_t* mask = scanline->bgMask;
    uint8_t blendMode = (REG_BLDCNT >> 6) & 3;
    
    //for (int i = 0; i < DISPLAY_WIDTH; i++)
    //{
    //  line[i] = 0x8F00;
    //}
    //return;
    
    uint8_t *bgtiles = (uint8_t *)BG_CHAR_ADDR(charBaseBlock);
    uint16_t *pal = (uint16_t *)PLTT;
     
    if (control & BGCNT_MOSAIC)
        lineNum = applyBGVerticalMosaicEffect(lineNum);
    
    unsigned int xx = hoffs & 0x1FF;
    unsigned int yy = (lineNum + voffs) & 0x1FF;
    
    
    if (yy > 255 && mapHeightInPixels > 256) {
        //the width check is for 512x512 mode support, it jumps by two screen bases instead
        bgmap += (mapWidthInPixels > 256) ? 0x800 : 0x400;
    }
    
    xx &= 0x1FF;
    yy &= 0xFF;
    
    uint32_t lineTile = ((lineNum + voffs) & 0xFF) / 8;
    uint32_t firstTile = bgmap[lineTile*32] & 0x3FF;
    uint32_t firstTileData = *(uint32_t*)&bgtiles[(firstTile * 32) + ((lineTile & 7) * bitsPerPixel)];
    if (firstTileData == 0 && mapWidthInPixels > 256)
    {
        for (uint32_t i = 1; i < 32; i++)
        {
            uint32_t tile = bgmap[lineTile*32+i] & 0x3FF;
            if (firstTile != tile)
                goto exitBlankScanlineLoop;
        }
        if (mapWidthInPixels > 256)
        {
            for (uint32_t i = 0; i < 32; i++)
            {
                uint32_t tile = bgmap[lineTile*32+i+0x400] & 0x3FF;
                if (firstTile != tile)
                    goto exitBlankScanlineLoop;
            }   
        }
        return;
    }
    exitBlankScanlineLoop:;
    
    unsigned int startTileX = xx / 8;
    unsigned int startTileY = yy / 8;
    unsigned int startTileYLoc = startTileY * 32;
    unsigned int visibleTilePixels = xx & 7;
    unsigned int tileY = yy & 7;
    uint32_t entry;
    
    if (startTileX > 31 && mapWidthInPixels > 256)
        entry = bgmap[startTileYLoc + (startTileX & 31) + 0x400];
    else
        entry = bgmap[startTileYLoc + (startTileX & 31)];
    unsigned int tileNum = entry & 0x3FF;
    unsigned int paletteNum = (entry >> 12) & 0xF;
    uint32_t tileLoc;
    uint32_t pixel;
    unsigned int x = 0;
    
    //memset(line, 0x8F00, DISPLAY_WIDTH*2);
    //for (int i = 0; i < DISPLAY_WIDTH; i++)
    //{
    //  line[i] = 0x8F00;
    //}
    
    #define writeBgPixel(pixel, x)  \
        line[x] = pal[(paletteNum << 4) + (pixel)] | 0x8000; \
        mask[x] = 1 << bgNum;
    
    #define writeBgPixelWin(pixel, x)   \
        if ( ((pixel)) != 0 ) { \
            if (scanline->winMask[x] & (1 << bgNum)) { \
                writeBgPixel(pixel, x) \
            } \
        }
    
    if (entry & (1 << 11))
        tileLoc = (tileNum * (bitsPerPixel * 8)) + (7 - tileY)*bitsPerPixel;
    else
        tileLoc = (tileNum * (bitsPerPixel * 8)) + tileY*bitsPerPixel;
    //if((*(uint32_t*)&bgtiles[tileLoc]) != 0)
    //{
        //draw left most tile
        if (entry & (1 << 10))
        {
            for (int i = visibleTilePixels; i < 8; i++)
            {
                pixel = bgtiles[tileLoc + (3-(i/2))];

                if (i & 1)
                    pixel &= 0xF;
                else
                    pixel >>= 4;

                //if (pixel != 0)
                writeBgPixelWin(pixel, x)
                x += 1;
            }
        }
        else
        {
            for (int i = visibleTilePixels; i < 8; i++)
            {
                pixel = bgtiles[tileLoc + (i/2)];

                if (i & 1)
                    pixel >>= 4;
                else
                    pixel &= 0xF;

                writeBgPixelWin(pixel, x)
                x += 1;
            }
        }
    //}
    
    //draw all middle pixels
    for (int currTile = 1; currTile < ( (DISPLAY_WIDTH / 8)); currTile++)
    {
        if (( (startTileX+currTile) & 63) > 31 && mapWidthInPixels > 256)
            entry = bgmap[startTileYLoc + ((startTileX+currTile) & 31) + 0x400];
        else
            entry = bgmap[startTileYLoc + ((startTileX+currTile) & 31)];
        tileNum = entry & 0x3FF;
        paletteNum = (entry >> 12) & 0xF;
        if (entry & (1 << 11))
            tileLoc = (tileNum * (bitsPerPixel * 8)) + (7 - tileY)*bitsPerPixel;
        else
            tileLoc = (tileNum * (bitsPerPixel * 8)) + tileY*bitsPerPixel;
        uint32_t pixel32 = *(uint32_t*)&bgtiles[tileLoc];
        if (pixel32 != 0) {
            if (entry & (1 << 10))
            {
                writeBgPixelWin(pixel32 >> 28, x)
                writeBgPixelWin((pixel32 >> 24) & 0xF, x+1)
                writeBgPixelWin((pixel32 >> 20) & 0xF, x+2)
                writeBgPixelWin((pixel32 >> 16) & 0xF, x+3)
                writeBgPixelWin((pixel32 >> 12) & 0xF, x+4)
                writeBgPixelWin((pixel32 >> 8) & 0xF, x+5)
                writeBgPixelWin((pixel32 >> 4) & 0xF, x+6)
                writeBgPixelWin(pixel32 & 0xF, x+7)
            }
            else
            {
                writeBgPixelWin(pixel32 & 0xF, x)
                writeBgPixelWin((pixel32 >> 4) & 0xF, x+1)
                writeBgPixelWin((pixel32 >> 8) & 0xF, x+2)
                writeBgPixelWin((pixel32 >> 12) & 0xF, x+3)
                writeBgPixelWin((pixel32 >> 16) & 0xF, x+4)
                writeBgPixelWin((pixel32 >> 20) & 0xF, x+5)
                writeBgPixelWin((pixel32 >> 24) & 0xF, x+6)
                writeBgPixelWin(pixel32 >> 28, x+7)
            }
        }
        x += 8;
    }
    //draw right most tile
    if (((startTileX+(DISPLAY_WIDTH/8)) & 63) > 31 && mapWidthInPixels > 256)
        entry = bgmap[startTileYLoc + ((startTileX+(DISPLAY_WIDTH/8)) & 31) + 0x400];
    else
        entry = bgmap[startTileYLoc + ((startTileX+(DISPLAY_WIDTH/8)) & 31)];
    tileNum = entry & 0x3FF;
    paletteNum = (entry >> 12) & 0xF;
    if (entry & (1 << 11))
        tileLoc = (tileNum * (bitsPerPixel * 8)) + (7 - tileY)*bitsPerPixel;
    else
        tileLoc = (tileNum * (bitsPerPixel * 8)) + tileY*bitsPerPixel;
    if((*(uint32_t*)&bgtiles[tileLoc]) != 0)
    {
        if (entry & (1 << 10)) //horizontally flipped
        {
            for (int i = 0; i < visibleTilePixels; i++)
            {
                pixel = bgtiles[tileLoc + (3-(i/2))];

                if (i & 1)
                    pixel &= 0xF;
                else
                    pixel >>= 4;

                //if (pixel != 0)
                writeBgPixelWin(pixel, x)
                    //line[x] = pal[16 * paletteNum + pixel] | 0x8000;
                x += 1;
            }
        }
        else //not horizontally flipped
        {
            for (int i = 0; i < visibleTilePixels; i++)
            {
                pixel = bgtiles[tileLoc + (i/2)];
                
                if (i & 1)
                    pixel >>= 4;
                else
                    pixel &= 0xF;

                writeBgPixelWin(pixel, x)
                x += 1;
            }
        }
    }
    //apply horiziontal mosaic if needed
    if (control & BGCNT_MOSAIC && mosaicBGEffectX > 0)
    {
        for (int x = 0; x < DISPLAY_WIDTH; x++)
        {
            uint16_t color = line[applyBGHorizontalMosaicEffect(x)];
            line[x] = color;
        }
    }
}

#undef writeBgPixel
#undef writeBgPixelWin

static void RenderBGScanlineBlend(int bgNum, uint16_t control, uint16_t hoffs, uint16_t voffs, int lineNum, uint16_t *line, struct scanlineData* scanline, bool windowsEnabled)
{
    unsigned int charBaseBlock = (control >> 2) & 3;
    unsigned int screenBaseBlock = (control >> 8) & 0x1F;
    unsigned int bitsPerPixel = 4;//((control >> 7) & 1) ? 8 : 4;
    unsigned int mapWidth = bgMapSizes[control >> 14][0];
    unsigned int mapHeight = bgMapSizes[control >> 14][1];
    unsigned int mapWidthInPixels = mapWidth * 8;
    unsigned int mapHeightInPixels = mapHeight * 8;
    uint16_t *bgmap = (uint16_t *)BG_SCREEN_ADDR(screenBaseBlock);
    uint16_t* mask = scanline->bgMask;
    uint8_t blendMode = (REG_BLDCNT >> 6) & 3;
    
    if (windowsEnabled)
    {
        if (!(REG_WINOUT & (1 << bgNum)))
            return;
    }
    
    uint8_t *bgtiles = (uint8_t *)BG_CHAR_ADDR(charBaseBlock);
    uint16_t *pal = (uint16_t *)PLTT;
     
    if (control & BGCNT_MOSAIC)
        lineNum = applyBGVerticalMosaicEffect(lineNum);
    
    unsigned int xx = hoffs & 0x1FF;
    unsigned int yy = (lineNum + voffs) & 0x1FF;
    
    
    if (yy > 255 && mapHeightInPixels > 256) {
        //the width check is for 512x512 mode support, it jumps by two screen bases instead
        bgmap += (mapWidthInPixels > 256) ? 0x800 : 0x400;
    }
    
    xx &= 0x1FF;
    yy &= 0xFF;
    
    uint32_t lineTile = ((lineNum + voffs) & 0xFF) / 8;
    uint32_t firstTile = bgmap[lineTile*32] & 0x3FF;
    uint32_t firstTileData = *(uint32_t*)&bgtiles[(firstTile * 32) + ((lineTile & 7) * bitsPerPixel)];
    if (firstTileData == 0 && mapWidthInPixels > 256)
    {
        for (uint32_t i = 1; i < 32; i++)
        {
            uint32_t tile = bgmap[lineTile*32+i] & 0x3FF;
            if (firstTile != tile)
                goto exitBlankScanlineLoop;
        }
        if (mapWidthInPixels > 256)
        {
            for (uint32_t i = 0; i < 32; i++)
            {
                uint32_t tile = bgmap[lineTile*32+i+0x400] & 0x3FF;
                if (firstTile != tile)
                    goto exitBlankScanlineLoop;
            }   
        }
        return;
    }
    exitBlankScanlineLoop:;
    
    unsigned int startTileX = xx / 8;
    unsigned int startTileY = yy / 8;
    unsigned int startTileYLoc = startTileY * 32;
    unsigned int visibleTilePixels = xx & 7;
    unsigned int tileY = yy & 7;
    uint32_t entry;
    
    if (startTileX > 31 && mapWidthInPixels > 256)
        entry = bgmap[startTileYLoc + (startTileX & 31) + 0x400];
    else
        entry = bgmap[startTileYLoc + (startTileX & 31)];
    unsigned int tileNum = entry & 0x3FF;
    unsigned int paletteNum = (entry >> 12) & 0xF;
    uint32_t tileLoc;
    uint32_t pixel;
    unsigned int x = 0;
    
    //memset(line, 0x8F00, DISPLAY_WIDTH*2);
    //for (int i = 0; i < DISPLAY_WIDTH; i++)
    //{
    //  line[i] = 0x8F00;
    //}
    
    #define writeBgPixel(pixel, x)  \
    if ( ((pixel)) != 0 ) { \
        switch (blendMode) {\
        case 1: \
            if ((mask[x] & (REG_BLDCNT >> 8))) \
                line[x] = alphaBlendColor(pal[(paletteNum << 4) + (pixel)], line[x]) | 0x8000; \
            else \
                line[x] = pal[(paletteNum << 4) + (pixel)] | 0x8000;\
            break; \
        case 2: \
            line[x] = alphaBrightnessIncrease(pal[(paletteNum << 4) + (pixel)]) | 0x8000; \
            break; \
        case 3: \
            line[x] = alphaBrightnessDecrease(pal[(paletteNum << 4) + (pixel)]) | 0x8000; \
            break; } \
        mask[x] = 1 << bgNum; \
    } else \
    { \
        line[x] = 0; \
    }

    if (entry & (1 << 11))
        tileLoc = (tileNum * (bitsPerPixel * 8)) + (7 - tileY)*bitsPerPixel;
    else
        tileLoc = (tileNum * (bitsPerPixel * 8)) + tileY*bitsPerPixel;
    //if((*(uint32_t*)&bgtiles[tileLoc]) != 0)
    {
        //draw left most tile
        if (entry & (1 << 10))
        {
            for (int i = visibleTilePixels; i < 8; i++)
            {
                pixel = bgtiles[tileLoc + (3-(i/2))];

                if (i & 1)
                    pixel &= 0xF;
                else
                    pixel >>= 4;

                //if (pixel != 0)
                writeBgPixel(pixel, x)
                x += 1;
            }
        }
        else
        {
            for (int i = visibleTilePixels; i < 8; i++)
            {
                pixel = bgtiles[tileLoc + (i/2)];

                if (i & 1)
                    pixel >>= 4;
                else
                    pixel &= 0xF;

                writeBgPixel(pixel, x)
                x += 1;
            }
        }
    }
    
    //draw all middle pixels
    for (int currTile = 1; currTile < ( (DISPLAY_WIDTH / 8)); currTile++)
    {
        if (( (startTileX+currTile) & 63) > 31 && mapWidthInPixels > 256)
            entry = bgmap[startTileYLoc + ((startTileX+currTile) & 31) + 0x400];
        else
            entry = bgmap[startTileYLoc + ((startTileX+currTile) & 31)];
        tileNum = entry & 0x3FF;
        paletteNum = (entry >> 12) & 0xF;
        if (entry & (1 << 11))
            tileLoc = (tileNum * (bitsPerPixel * 8)) + (7 - tileY)*bitsPerPixel;
        else
            tileLoc = (tileNum * (bitsPerPixel * 8)) + tileY*bitsPerPixel;
        uint32_t pixel32 = *(uint32_t*)&bgtiles[tileLoc];
        if (pixel32 != 0) {
            if (entry & (1 << 10))
            {
                writeBgPixel(pixel32 >> 28, x)
                writeBgPixel((pixel32 >> 24) & 0xF, x+1)
                writeBgPixel((pixel32 >> 20) & 0xF, x+2)
                writeBgPixel((pixel32 >> 16) & 0xF, x+3)
                writeBgPixel((pixel32 >> 12) & 0xF, x+4)
                writeBgPixel((pixel32 >> 8) & 0xF, x+5)
                writeBgPixel((pixel32 >> 4) & 0xF, x+6)
                writeBgPixel(pixel32 & 0xF, x+7)
            }
            else
            {
                writeBgPixel(pixel32 & 0xF, x)
                writeBgPixel((pixel32 >> 4) & 0xF, x+1)
                writeBgPixel((pixel32 >> 8) & 0xF, x+2)
                writeBgPixel((pixel32 >> 12) & 0xF, x+3)
                writeBgPixel((pixel32 >> 16) & 0xF, x+4)
                writeBgPixel((pixel32 >> 20) & 0xF, x+5)
                writeBgPixel((pixel32 >> 24) & 0xF, x+6)
                writeBgPixel(pixel32 >> 28, x+7)
            }
        }
        x += 8;
    }
    //draw right most tile
    if (((startTileX+(DISPLAY_WIDTH/8)) & 63) > 31 && mapWidthInPixels > 256)
        entry = bgmap[startTileYLoc + ((startTileX+(DISPLAY_WIDTH/8)) & 31) + 0x400];
    else
        entry = bgmap[startTileYLoc + ((startTileX+(DISPLAY_WIDTH/8)) & 31)];
    tileNum = entry & 0x3FF;
    paletteNum = (entry >> 12) & 0xF;
    if (entry & (1 << 11))
        tileLoc = (tileNum * (bitsPerPixel * 8)) + (7 - tileY)*bitsPerPixel;
    else
        tileLoc = (tileNum * (bitsPerPixel * 8)) + tileY*bitsPerPixel;
    if((*(uint32_t*)&bgtiles[tileLoc]) != 0)
    {
        if (entry & (1 << 10)) //horizontally flipped
        {
            for (int i = 0; i < visibleTilePixels; i++)
            {
                pixel = bgtiles[tileLoc + (3-(i/2))];

                if (i & 1)
                    pixel &= 0xF;
                else
                    pixel >>= 4;

                //if (pixel != 0)
                writeBgPixel(pixel, x)
                    //line[x] = pal[16 * paletteNum + pixel] | 0x8000;
                x += 1;
            }
        }
        else //not horizontally flipped
        {
            for (int i = 0; i < visibleTilePixels; i++)
            {
                pixel = bgtiles[tileLoc + (i/2)];
                
                if (i & 1)
                    pixel >>= 4;
                else
                    pixel &= 0xF;

                writeBgPixel(pixel, x)
                x += 1;
            }
        }
    }
    //apply horiziontal mosaic if needed
    if (control & BGCNT_MOSAIC && mosaicBGEffectX > 0)
    {
        for (int x = 0; x < DISPLAY_WIDTH; x++)
        {
            uint16_t color = line[applyBGHorizontalMosaicEffect(x)];
            line[x] = color;
        }
    }
}
#undef writeBgPixel

static void RenderBGScanlineNoEffect(int bgNum, uint16_t control, uint16_t hoffs, uint16_t voffs, int lineNum, uint16_t *line, struct scanlineData* scanline, bool windowsEnabled)
{
    unsigned int charBaseBlock = (control >> 2) & 3;
    unsigned int screenBaseBlock = (control >> 8) & 0x1F;
    unsigned int bitsPerPixel = 4;//((control >> 7) & 1) ? 8 : 4;
    unsigned int mapWidth = bgMapSizes[control >> 14][0];
    unsigned int mapHeight = bgMapSizes[control >> 14][1];
    unsigned int mapWidthInPixels = mapWidth * 8;
    unsigned int mapHeightInPixels = mapHeight * 8;
    uint16_t *bgmap = (uint16_t *)BG_SCREEN_ADDR(screenBaseBlock);
    uint16_t* mask = scanline->bgMask;
    uint8_t blendMode = (REG_BLDCNT >> 6) & 3;
    
    if (windowsEnabled)
    {
        if (!(REG_WINOUT & (1 << bgNum)))
            return;
    }
    
    uint8_t *bgtiles = (uint8_t *)BG_CHAR_ADDR(charBaseBlock);
    uint16_t *pal = (uint16_t *)PLTT;
     
    if (control & BGCNT_MOSAIC)
        lineNum = applyBGVerticalMosaicEffect(lineNum);
    
    unsigned int xx = hoffs & 0x1FF;
    unsigned int yy = (lineNum + voffs) & 0x1FF;
    
    
    if (yy > 255 && mapHeightInPixels > 256) {
        //the width check is for 512x512 mode support, it jumps by two screen bases instead
        bgmap += (mapWidthInPixels > 256) ? 0x800 : 0x400;
    }
    
    xx &= 0x1FF;
    yy &= 0xFF;
    
    uint32_t lineTile = ((lineNum + voffs) & 0xFF) / 8;
    uint32_t firstTile = bgmap[lineTile*32] & 0x3FF;
    uint32_t firstTileData = *(uint32_t*)&bgtiles[(firstTile * 32) + ((lineTile & 7) * bitsPerPixel)];
    if (firstTileData == 0 && mapWidthInPixels > 256)
    {
        for (uint32_t i = 1; i < 32; i++)
        {
            uint32_t tile = bgmap[lineTile*32+i] & 0x3FF;
            if (firstTile != tile)
                goto exitBlankScanlineLoop;
        }
        if (mapWidthInPixels > 256)
        {
            for (uint32_t i = 0; i < 32; i++)
            {
                uint32_t tile = bgmap[lineTile*32+i+0x400] & 0x3FF;
                if (firstTile != tile)
                    goto exitBlankScanlineLoop;
            }   
        }
        return;
    }
    exitBlankScanlineLoop:;
    
    unsigned int startTileX = xx / 8;
    unsigned int startTileY = yy / 8;
    unsigned int startTileYLoc = startTileY * 32;
    unsigned int visibleTilePixels = xx & 7;
    unsigned int tileY = yy & 7;
    uint32_t entry;
    
    if (startTileX > 31 && mapWidthInPixels > 256)
        entry = bgmap[startTileYLoc + (startTileX & 31) + 0x400];
    else
        entry = bgmap[startTileYLoc + (startTileX & 31)];
    unsigned int tileNum = entry & 0x3FF;
    unsigned int paletteNum = (entry >> 12) & 0xF;
    uint32_t tileLoc;
    uint32_t pixel;
    unsigned int x = 0;
    bool shouldBlend = true;
    
    //memset(line, 0x8F00, DISPLAY_WIDTH*2);
    //for (int i = 0; i < DISPLAY_WIDTH; i++)
    //{
    //  line[i] = 0x8F00;
    //}
    
    #define writeBgPixel(pixel, x)  \
        if ( ((pixel)) != 0 ) { \
            line[x] = pal[(paletteNum << 4) + (pixel)] | 0x8000; \
            mask[x] = 1 << bgNum; \
        } \
        else \
        { \
            line[x] = 0; \
        } \

    if (entry & (1 << 11))
        tileLoc = (tileNum * (bitsPerPixel * 8)) + (7 - tileY)*bitsPerPixel;
    else
        tileLoc = (tileNum * (bitsPerPixel * 8)) + tileY*bitsPerPixel;
    //if((*(uint32_t*)&bgtiles[tileLoc]) != 0)
    {
        //draw left most tile
        if (entry & (1 << 10))
        {
            for (int i = visibleTilePixels; i < 8; i++)
            {
                pixel = bgtiles[tileLoc + (3-(i/2))];

                if (i & 1)
                    pixel &= 0xF;
                else
                    pixel >>= 4;

                //if (pixel != 0)
                writeBgPixel(pixel, x)
                x += 1;
            }
        }
        else
        {
            for (int i = visibleTilePixels; i < 8; i++)
            {
                pixel = bgtiles[tileLoc + (i/2)];

                if (i & 1)
                    pixel >>= 4;
                else
                    pixel &= 0xF;

                writeBgPixel(pixel, x)
                x += 1;
            }
        }
    }
    
    //draw all middle pixels
    for (int currTile = 1; currTile < ( (DISPLAY_WIDTH / 8)); currTile++)
    {
        if (( (startTileX+currTile) & 63) > 31 && mapWidthInPixels > 256)
            entry = bgmap[startTileYLoc + ((startTileX+currTile) & 31) + 0x400];
        else
            entry = bgmap[startTileYLoc + ((startTileX+currTile) & 31)];
        tileNum = entry & 0x3FF;
        paletteNum = (entry >> 12) & 0xF;
        if (entry & (1 << 11))
            tileLoc = (tileNum * (bitsPerPixel * 8)) + (7 - tileY)*bitsPerPixel;
        else
            tileLoc = (tileNum * (bitsPerPixel * 8)) + tileY*bitsPerPixel;
        uint32_t pixel32 = *(uint32_t*)&bgtiles[tileLoc];
        if (pixel32 != 0) {
            if (entry & (1 << 10))
            {
                writeBgPixel(pixel32 >> 28, x)
                writeBgPixel((pixel32 >> 24) & 0xF, x+1)
                writeBgPixel((pixel32 >> 20) & 0xF, x+2)
                writeBgPixel((pixel32 >> 16) & 0xF, x+3)
                writeBgPixel((pixel32 >> 12) & 0xF, x+4)
                writeBgPixel((pixel32 >> 8) & 0xF, x+5)
                writeBgPixel((pixel32 >> 4) & 0xF, x+6)
                writeBgPixel(pixel32 & 0xF, x+7)
            }
            else
            {
                writeBgPixel(pixel32 & 0xF, x)
                writeBgPixel((pixel32 >> 4) & 0xF, x+1)
                writeBgPixel((pixel32 >> 8) & 0xF, x+2)
                writeBgPixel((pixel32 >> 12) & 0xF, x+3)
                writeBgPixel((pixel32 >> 16) & 0xF, x+4)
                writeBgPixel((pixel32 >> 20) & 0xF, x+5)
                writeBgPixel((pixel32 >> 24) & 0xF, x+6)
                writeBgPixel(pixel32 >> 28, x+7)
            }
        }
        x += 8;
    }
    //draw right most tile
    if (((startTileX+(DISPLAY_WIDTH/8)) & 63) > 31 && mapWidthInPixels > 256)
        entry = bgmap[startTileYLoc + ((startTileX+(DISPLAY_WIDTH/8)) & 31) + 0x400];
    else
        entry = bgmap[startTileYLoc + ((startTileX+(DISPLAY_WIDTH/8)) & 31)];
    tileNum = entry & 0x3FF;
    paletteNum = (entry >> 12) & 0xF;
    if (entry & (1 << 11))
        tileLoc = (tileNum * (bitsPerPixel * 8)) + (7 - tileY)*bitsPerPixel;
    else
        tileLoc = (tileNum * (bitsPerPixel * 8)) + tileY*bitsPerPixel;
    if((*(uint32_t*)&bgtiles[tileLoc]) != 0)
    {
        if (entry & (1 << 10)) //horizontally flipped
        {
            for (int i = 0; i < visibleTilePixels; i++)
            {
                pixel = bgtiles[tileLoc + (3-(i/2))];

                if (i & 1)
                    pixel &= 0xF;
                else
                    pixel >>= 4;

                //if (pixel != 0)
                writeBgPixel(pixel, x)
                    //line[x] = pal[16 * paletteNum + pixel] | 0x8000;
                x += 1;
            }
        }
        else //not horizontally flipped
        {
            for (int i = 0; i < visibleTilePixels; i++)
            {
                pixel = bgtiles[tileLoc + (i/2)];
                
                if (i & 1)
                    pixel >>= 4;
                else
                    pixel &= 0xF;

                writeBgPixel(pixel, x)
                x += 1;
            }
        }
    }
    //apply horiziontal mosaic if needed
    if (control & BGCNT_MOSAIC && mosaicBGEffectX > 0)
    {
        for (int x = 0; x < DISPLAY_WIDTH; x++)
        {
            uint16_t color = line[applyBGHorizontalMosaicEffect(x)];
            line[x] = color;
        }
    }
}
#undef writeBgPixel

static inline uint32_t getBgX(int bgNumber)
{
    if (bgNumber == 2)
    {
        return REG_BG2X;
    }
    else if (bgNumber == 3)
    {
        return REG_BG3X;
    }
}

static inline uint32_t getBgY(int bgNumber)
{
    if (bgNumber == 2)
    {
        return REG_BG2Y;
    }
    else if (bgNumber == 3)
    {
        return REG_BG3Y;
    }
}

static inline uint16_t getBgPA(int bgNumber)
{
    if (bgNumber == 2)
    {
        return REG_BG2PA;
    }
    else if (bgNumber == 3)
    {
        return REG_BG3PA;
    }
}

static inline uint16_t getBgPB(int bgNumber)
{
    if (bgNumber == 2)
    {
        return REG_BG2PB;
    }
    else if (bgNumber == 3)
    {
        return REG_BG3PB;
    }
}

static inline uint16_t getBgPC(int bgNumber)
{
    if (bgNumber == 2)
    {
        return REG_BG2PC;
    }
    else if (bgNumber == 3)
    {
        return REG_BG3PC;
    }
}

static inline uint16_t getBgPD(int bgNumber)
{
    if (bgNumber == 2)
    {
        return REG_BG2PD;
    }
    else if (bgNumber == 3)
    {
        return REG_BG3PD;
    }
}

static void RenderRotScaleBGScanlineWinBlend(int bgNum, uint16_t control, uint16_t x, uint16_t y, int lineNum, uint16_t *line, struct scanlineData* scanline, bool windowsEnabled)
{
    vBgCnt *bgcnt = (vBgCnt *)&control;
    unsigned int charBaseBlock = bgcnt->charBaseBlock;
    unsigned int screenBaseBlock = bgcnt->screenBaseBlock;
    unsigned int mapWidth = 1 << (4 + (bgcnt->screenSize)); // number of tiles

    uint8_t *bgtiles = (uint8_t *)(VRAM_ + charBaseBlock * 0x4000);
    uint8_t *bgmap = (uint8_t *)(VRAM_ + screenBaseBlock * 0x800);
    uint16_t *pal = (uint16_t *)PLTT;
    uint8_t blendMode = (REG_BLDCNT >> 6) & 3;
    uint16_t* mask = scanline->bgMask;

    if (control & BGCNT_MOSAIC)
        lineNum = applyBGVerticalMosaicEffect(lineNum);
    

    s16 pa = getBgPA(bgNum);
    s16 pb = getBgPB(bgNum);
    s16 pc = getBgPC(bgNum);
    s16 pd = getBgPD(bgNum);

    int sizeX = 128;
    int sizeY = 128;

    switch (bgcnt->screenSize)
    {
    case 0:
        break;
    case 1:
        sizeX = sizeY = 256;
        break;
    case 2:
        sizeX = sizeY = 512;
        break;
    case 3:
        sizeX = sizeY = 1024;
        break;
    }

    int maskX = sizeX - 1;
    int maskY = sizeY - 1;
    int yshift = ((control >> 14) & 3) + 4;
    int currentX = getBgX(bgNum);
    int currentY = getBgY(bgNum);
    //sign extend 28 bit number
    currentX = ((currentX & (1 << 27)) ? currentX | 0xF0000000 : currentX);
    currentY = ((currentY & (1 << 27)) ? currentY | 0xF0000000 : currentY);

    currentX += lineNum * pb;
    currentY += lineNum * pd;

    int realX = currentX;
    int realY = currentY;
    
    #define writeBgPixel(pixel, x)  \
        if (scanline->winMask[x] & WINMASK_CLR) { \
            switch (blendMode) { \
            case 1: \
                if ((mask[x] & (REG_BLDCNT >> 8))) \
                    line[x] = alphaBlendColor(pal[pixel], line[x]) | 0x8000; \
                else \
                    line[x] = pal[pixel] | 0x8000;\
                break; \
            case 2: \
                line[x] = alphaBrightnessIncrease(pal[pixel]) | 0x8000; \
                break; \
            case 3: \
                line[x] = alphaBrightnessDecrease(pal[pixel]) | 0x8000; \
                break; } \
        }else{ \
            line[x] = pal[pixel] | 0x8000; \
        } \
        mask[x] = 1 << bgNum;
    
    #define writeBgPixelWin(pixel, x)   \
        if ( ((pixel)) != 0 ) { \
            if (scanline->winMask[x] & (1 << bgNum)) { \
                writeBgPixel(pixel, x) \
            } \
        }

    if (bgcnt->areaOverflowMode)
    {
        for (int x = 0; x < DISPLAY_WIDTH; x++)
        {
            int xxx = (realX >> 8) & maskX;
            int yyy = (realY >> 8) & maskY;

            int tile = bgmap[(xxx >> 3) + ((yyy >> 3) << yshift)];

            int tileX = xxx & 7;
            int tileY = yyy & 7;

            uint8_t pixel = bgtiles[(tile << 6) + (tileY << 3) + tileX];

            writeBgPixelWin(pixel, x)

            realX += pa;
            realY += pc;
        }
    }
    else
    {
        for (int x = 0; x < DISPLAY_WIDTH; x++)
        {
            int xxx = (realX >> 8);
            int yyy = (realY >> 8);

            if (xxx < 0 || yyy < 0 || xxx >= sizeX || yyy >= sizeY)
            {
                //line[x] = 0x80000000;
            }
            else
            {
                int tile = bgmap[(xxx >> 3) + ((yyy >> 3) << yshift)];

                int tileX = xxx & 7;
                int tileY = yyy & 7;

                uint8_t pixel = bgtiles[(tile << 6) + (tileY << 3) + tileX];

                writeBgPixelWin(pixel, x)
            }
            realX += pa;
            realY += pc;
        }
    }
    //apply mosaic effect if enabled
    if (control & BGCNT_MOSAIC && mosaicBGEffectX > 0)
    {
        for (int x = 0; x < DISPLAY_WIDTH; x++)
        {
            uint16_t color = line[applyBGHorizontalMosaicEffect(x)];
            line[x] = color;
            
        }
    }
}

#undef writeBgPixel
#undef writeBgPixelWin

static void RenderRotScaleBGScanlineWin(int bgNum, uint16_t control, uint16_t x, uint16_t y, int lineNum, uint16_t *line, struct scanlineData* scanline, bool windowsEnabled)
{
    vBgCnt *bgcnt = (vBgCnt *)&control;
    unsigned int charBaseBlock = bgcnt->charBaseBlock;
    unsigned int screenBaseBlock = bgcnt->screenBaseBlock;
    unsigned int mapWidth = 1 << (4 + (bgcnt->screenSize)); // number of tiles

    uint8_t *bgtiles = (uint8_t *)(VRAM_ + charBaseBlock * 0x4000);
    uint8_t *bgmap = (uint8_t *)(VRAM_ + screenBaseBlock * 0x800);
    uint16_t *pal = (uint16_t *)PLTT;
    uint16_t* mask = scanline->bgMask;

    if (control & BGCNT_MOSAIC)
        lineNum = applyBGVerticalMosaicEffect(lineNum);
    

    s16 pa = getBgPA(bgNum);
    s16 pb = getBgPB(bgNum);
    s16 pc = getBgPC(bgNum);
    s16 pd = getBgPD(bgNum);

    int sizeX = 128;
    int sizeY = 128;

    switch (bgcnt->screenSize)
    {
    case 0:
        break;
    case 1:
        sizeX = sizeY = 256;
        break;
    case 2:
        sizeX = sizeY = 512;
        break;
    case 3:
        sizeX = sizeY = 1024;
        break;
    }

    int maskX = sizeX - 1;
    int maskY = sizeY - 1;
    int yshift = ((control >> 14) & 3) + 4;
    int currentX = getBgX(bgNum);
    int currentY = getBgY(bgNum);
    //sign extend 28 bit number
    currentX = ((currentX & (1 << 27)) ? currentX | 0xF0000000 : currentX);
    currentY = ((currentY & (1 << 27)) ? currentY | 0xF0000000 : currentY);

    currentX += lineNum * pb;
    currentY += lineNum * pd;

    int realX = currentX;
    int realY = currentY;
    
    #define writeBgPixel(pixel, x)  \
        line[x] = pal[pixel] | 0x8000; \
        mask[x] = 1 << bgNum;
    
    #define writeBgPixelWin(pixel, x)   \
        if ( ((pixel)) != 0 ) { \
            if (scanline->winMask[x] & (1 << bgNum)) { \
                writeBgPixel(pixel, x) \
            } \
        }

    if (bgcnt->areaOverflowMode)
    {
        for (int x = 0; x < DISPLAY_WIDTH; x++)
        {
            int xxx = (realX >> 8) & maskX;
            int yyy = (realY >> 8) & maskY;

            int tile = bgmap[(xxx >> 3) + ((yyy >> 3) << yshift)];

            int tileX = xxx & 7;
            int tileY = yyy & 7;

            uint8_t pixel = bgtiles[(tile << 6) + (tileY << 3) + tileX];

            writeBgPixelWin(pixel, x)

            realX += pa;
            realY += pc;
        }
    }
    else
    {
        for (int x = 0; x < DISPLAY_WIDTH; x++)
        {
            int xxx = (realX >> 8);
            int yyy = (realY >> 8);

            if (xxx < 0 || yyy < 0 || xxx >= sizeX || yyy >= sizeY)
            {
                //line[x] = 0x80000000;
            }
            else
            {
                int tile = bgmap[(xxx >> 3) + ((yyy >> 3) << yshift)];

                int tileX = xxx & 7;
                int tileY = yyy & 7;

                uint8_t pixel = bgtiles[(tile << 6) + (tileY << 3) + tileX];

                writeBgPixelWin(pixel, x)
            }
            realX += pa;
            realY += pc;
        }
    }
    //apply mosaic effect if enabled
    if (control & BGCNT_MOSAIC && mosaicBGEffectX > 0)
    {
        for (int x = 0; x < DISPLAY_WIDTH; x++)
        {
            uint16_t color = line[applyBGHorizontalMosaicEffect(x)];
            line[x] = color;
            
        }
    }
}

#undef writeBgPixel
#undef writeBgPixelWin

static void RenderRotScaleBGScanlineBlend(int bgNum, uint16_t control, uint16_t x, uint16_t y, int lineNum, uint16_t *line, struct scanlineData* scanline, bool windowsEnabled)
{
    vBgCnt *bgcnt = (vBgCnt *)&control;
    unsigned int charBaseBlock = bgcnt->charBaseBlock;
    unsigned int screenBaseBlock = bgcnt->screenBaseBlock;
    unsigned int mapWidth = 1 << (4 + (bgcnt->screenSize)); // number of tiles

    uint8_t *bgtiles = (uint8_t *)(VRAM_ + charBaseBlock * 0x4000);
    uint8_t *bgmap = (uint8_t *)(VRAM_ + screenBaseBlock * 0x800);
    uint16_t *pal = (uint16_t *)PLTT;
    uint8_t blendMode = (REG_BLDCNT >> 6) & 3;
    uint16_t* mask = scanline->bgMask;
    
    if (windowsEnabled)
    {
        if (!(REG_WINOUT & (1 << bgNum)))
            return;
    }

    if (control & BGCNT_MOSAIC)
        lineNum = applyBGVerticalMosaicEffect(lineNum);
    

    s16 pa = getBgPA(bgNum);
    s16 pb = getBgPB(bgNum);
    s16 pc = getBgPC(bgNum);
    s16 pd = getBgPD(bgNum);

    int sizeX = 128;
    int sizeY = 128;
    

    switch (bgcnt->screenSize)
    {
    case 0:
        break;
    case 1:
        sizeX = sizeY = 256;
        break;
    case 2:
        sizeX = sizeY = 512;
        break;
    case 3:
        sizeX = sizeY = 1024;
        break;
    }

    int maskX = sizeX - 1;
    int maskY = sizeY - 1;
    int yshift = ((control >> 14) & 3) + 4;
    int currentX = getBgX(bgNum);
    int currentY = getBgY(bgNum);
    //sign extend 28 bit number
    currentX = ((currentX & (1 << 27)) ? currentX | 0xF0000000 : currentX);
    currentY = ((currentY & (1 << 27)) ? currentY | 0xF0000000 : currentY);

    currentX += lineNum * pb;
    currentY += lineNum * pd;

    int realX = currentX;
    int realY = currentY;
    
    #define writeBgPixel(pixel, x)  \
    if ( ((pixel)) != 0 ) { \
        switch (blendMode) {\
        case 1: \
            if ((mask[x] & (REG_BLDCNT >> 8))) \
                line[x] = alphaBlendColor(pal[pixel], line[x]) | 0x8000; \
            else \
                line[x] = pal[pixel] | 0x8000;\
            break; \
        case 2: \
            line[x] = alphaBrightnessIncrease(pal[pixel]) | 0x8000; \
            break; \
        case 3: \
            line[x] = alphaBrightnessDecrease(pal[pixel]) | 0x8000; \
            break; } \
        mask[x] = 1 << bgNum; \
    }

    if (bgcnt->areaOverflowMode)
    {
        for (int x = 0; x < DISPLAY_WIDTH; x++)
        {
            int xxx = (realX >> 8) & maskX;
            int yyy = (realY >> 8) & maskY;

            int tile = bgmap[(xxx >> 3) + ((yyy >> 3) << yshift)];

            int tileX = xxx & 7;
            int tileY = yyy & 7;

            uint8_t pixel = bgtiles[(tile << 6) + (tileY << 3) + tileX];

            //if (pixel != 0) {
            //    line[x] = pal[pixel] | 0x8000;
            //}
            writeBgPixel(pixel, x)

            realX += pa;
            realY += pc;
        }
    }
    else
    {
        for (int x = 0; x < DISPLAY_WIDTH; x++)
        {
            int xxx = (realX >> 8);
            int yyy = (realY >> 8);

            if (xxx < 0 || yyy < 0 || xxx >= sizeX || yyy >= sizeY)
            {
                //line[x] = 0x80000000;
            }
            else
            {
                int tile = bgmap[(xxx >> 3) + ((yyy >> 3) << yshift)];

                int tileX = xxx & 7;
                int tileY = yyy & 7;

                uint8_t pixel = bgtiles[(tile << 6) + (tileY << 3) + tileX];

                writeBgPixel(pixel, x)
            }
            realX += pa;
            realY += pc;
        }
    }
    //apply mosaic effect if enabled
    if (control & BGCNT_MOSAIC && mosaicBGEffectX > 0)
    {
        for (int x = 0; x < DISPLAY_WIDTH; x++)
        {
            uint16_t color = line[applyBGHorizontalMosaicEffect(x)];
            line[x] = color;
            
        }
    }
}

#undef writeBgPixel

static void RenderRotScaleBGScanlineNoEffect(int bgNum, uint16_t control, uint16_t x, uint16_t y, int lineNum, uint16_t *line, struct scanlineData* scanline, bool windowsEnabled)
{
    vBgCnt *bgcnt = (vBgCnt *)&control;
    unsigned int charBaseBlock = bgcnt->charBaseBlock;
    unsigned int screenBaseBlock = bgcnt->screenBaseBlock;
    unsigned int mapWidth = 1 << (4 + (bgcnt->screenSize)); // number of tiles

    uint8_t *bgtiles = (uint8_t *)(VRAM_ + charBaseBlock * 0x4000);
    uint8_t *bgmap = (uint8_t *)(VRAM_ + screenBaseBlock * 0x800);
    uint16_t *pal = (uint16_t *)PLTT;
    
    if (windowsEnabled)
    {
        if (!(REG_WINOUT & (1 << bgNum)))
            return;
    }

    if (control & BGCNT_MOSAIC)
        lineNum = applyBGVerticalMosaicEffect(lineNum);
    

    s16 pa = getBgPA(bgNum);
    s16 pb = getBgPB(bgNum);
    s16 pc = getBgPC(bgNum);
    s16 pd = getBgPD(bgNum);

    int sizeX = 128;
    int sizeY = 128;

    switch (bgcnt->screenSize)
    {
    case 0:
        break;
    case 1:
        sizeX = sizeY = 256;
        break;
    case 2:
        sizeX = sizeY = 512;
        break;
    case 3:
        sizeX = sizeY = 1024;
        break;
    }

    int maskX = sizeX - 1;
    int maskY = sizeY - 1;
    int yshift = ((control >> 14) & 3) + 4;
    int currentX = getBgX(bgNum);
    int currentY = getBgY(bgNum);
    //sign extend 28 bit number
    currentX = ((currentX & (1 << 27)) ? currentX | 0xF0000000 : currentX);
    currentY = ((currentY & (1 << 27)) ? currentY | 0xF0000000 : currentY);

    currentX += lineNum * pb;
    currentY += lineNum * pd;

    int realX = currentX;
    int realY = currentY;

    if (bgcnt->areaOverflowMode)
    {
        for (int x = 0; x < DISPLAY_WIDTH; x++)
        {
            int xxx = (realX >> 8) & maskX;
            int yyy = (realY >> 8) & maskY;

            int tile = bgmap[(xxx >> 3) + ((yyy >> 3) << yshift)];

            int tileX = xxx & 7;
            int tileY = yyy & 7;

            uint8_t pixel = bgtiles[(tile << 6) + (tileY << 3) + tileX];

            if (pixel != 0) {
                line[x] = pal[pixel] | 0x8000;
            }

            realX += pa;
            realY += pc;
        }
    }
    else
    {
        for (int x = 0; x < DISPLAY_WIDTH; x++)
        {
            int xxx = (realX >> 8);
            int yyy = (realY >> 8);

            if (xxx < 0 || yyy < 0 || xxx >= sizeX || yyy >= sizeY)
            {
                //line[x] = 0x80000000;
            }
            else
            {
                int tile = bgmap[(xxx >> 3) + ((yyy >> 3) << yshift)];

                int tileX = xxx & 7;
                int tileY = yyy & 7;

                uint8_t pixel = bgtiles[(tile << 6) + (tileY << 3) + tileX];

                if (pixel != 0) {
                    line[x] = pal[pixel] | 0x8000;
                }
            }
            realX += pa;
            realY += pc;
        }
    }
    //apply mosaic effect if enabled
    if (control & BGCNT_MOSAIC && mosaicBGEffectX > 0)
    {
        for (int x = 0; x < DISPLAY_WIDTH; x++)
        {
            uint16_t color = line[applyBGHorizontalMosaicEffect(x)];
            line[x] = color;
            
        }
    }
}

const u8 spriteSizes[][2] =
{
    {8, 16},
    {8, 32},
    {16, 32},
    {32, 64},
};

static void DrawSpritesWinMask(struct scanlineData* scanline, uint16_t vcount)
{
    int i;
    void *objtiles = VRAM_ + 0x10000;

    int16_t matrix[2][2] = {};

    if (!(REG_DISPCNT & (1 << 6)))
    {
        puts("2-D OBJ Character mapping not supported.");
    }

    for (i = 127; i >= 0; i--)
    {
        struct OamData *oam = &((struct OamData *)OAM)[i];
        if (oam->objMode != 2)
            continue;
        
        unsigned int width;
        unsigned int height;

        bool isAffine  = oam->affineMode & 1;
        bool doubleSizeOrDisabled = (oam->affineMode >> 1) & 1;

        if (!(isAffine) && doubleSizeOrDisabled) // disable for non-affine
        {
            continue;
        }

        if (oam->shape == 0)
        {
            width = (1 << oam->size) * 8;
            height = (1 << oam->size) * 8;
        }
        else if (oam->shape == 1) // wide
        {
            width = spriteSizes[oam->size][1];
            height = spriteSizes[oam->size][0];
        }
        else if (oam->shape == 2) // tall
        {
            width = spriteSizes[oam->size][0];
            height = spriteSizes[oam->size][1];
        }
        else
        {
            continue; // prohibited, do not draw
        }

        int rect_width = width;
        int rect_height = height;

        int half_width = width / 2;
        int half_height = height / 2;

        int32_t x = oam->x;
        int32_t y = oam->y;

        if (x >= DISPLAY_WIDTH)
            x -= 512;
        if (y >= DISPLAY_HEIGHT)
            y -= 256;

        if (isAffine)
        {
            //TODO: there is probably a better way to do this
            u8 matrixNum = oam->matrixNum * 4;

            struct OamData *oam1 = &((struct OamData *)OAM)[matrixNum];
            struct OamData *oam2 = &((struct OamData *)OAM)[matrixNum + 1];
            struct OamData *oam3 = &((struct OamData *)OAM)[matrixNum + 2];
            struct OamData *oam4 = &((struct OamData *)OAM)[matrixNum + 3];

            matrix[0][0] = oam1->affineParam;
            matrix[0][1] = oam2->affineParam;
            matrix[1][0] = oam3->affineParam;
            matrix[1][1] = oam4->affineParam;

            if (doubleSizeOrDisabled) // double size for affine
            {
                rect_width *= 2;
                rect_height *= 2;
                half_width *= 2;
                half_height *= 2;
            }
        }
        else
        {
            // Identity
            matrix[0][0] = 0x100;
            matrix[0][1] = 0;
            matrix[1][0] = 0;
            matrix[1][1] = 0x100;
        }

        x += half_width;
        y += half_height;

        // Does this sprite actually draw on this scanline?
        if (vcount >= (y - half_height) && vcount < (y + half_height))
        {
            int local_y = (oam->mosaic == 1) ? applySpriteVerticalMosaicEffect(vcount) - y : vcount - y;
            bool flipX  = !isAffine && ((oam->matrixNum >> 3) & 1);
            bool flipY  = !isAffine && ((oam->matrixNum >> 4) & 1);
            bool is8BPP  = oam->bpp & 1;

            for (int local_x = -half_width; local_x <= half_width; local_x++)
            {
                uint8_t *tiledata = (uint8_t *)objtiles;
                uint16_t *palette = (uint16_t *)(PLTT + 0x200);
                int local_mosaicX;
                int tex_x;
                int tex_y;

                unsigned int global_x = local_x + x;

                if (global_x < 0 || global_x >= DISPLAY_WIDTH)
                    continue;

                if (oam->mosaic == 1)
                {
                    //mosaic effect has to be applied to global coordinates otherwise the mosaic will scroll
                    local_mosaicX = applySpriteHorizontalMosaicEffect(global_x) - x;
                    tex_x = ((matrix[0][0] * local_mosaicX + matrix[0][1] * local_y) >> 8) + (width / 2);
                    tex_y = ((matrix[1][0] * local_mosaicX + matrix[1][1] * local_y) >> 8) + (height / 2);
                }else{
                    tex_x = ((matrix[0][0] * local_x + matrix[0][1] * local_y) >> 8) + (width / 2);
                    tex_y = ((matrix[1][0] * local_x + matrix[1][1] * local_y) >> 8) + (height / 2);
                }


                /* Check if transformed coordinates are inside bounds. */

                if (tex_x >= width || tex_y >= height || tex_x < 0 || tex_y < 0)
                    continue;

                if (flipX)
                    tex_x = width  - tex_x - 1;
                if (flipY)
                    tex_y = height - tex_y - 1;

                int tile_x = tex_x % 8;
                int tile_y = tex_y % 8;
                int block_x = tex_x / 8;
                int block_y = tex_y / 8;
                int block_offset = ((block_y * (REG_DISPCNT & 0x40 ? (width / 8) : 16)) + block_x);
                uint16_t pixel = 0;

                if (!is8BPP)
                {
                    pixel = tiledata[(block_offset + oam->tileNum) * 32 + (tile_y * 4) + (tile_x / 2)];
                    if (tile_x & 1)
                        pixel >>= 4;
                    else
                        pixel &= 0xF;
                    palette += oam->paletteNum * 16;
                }
                else
                {
                    pixel = tiledata[(block_offset * 2 + oam->tileNum) * 32 + (tile_y * 8) + tile_x];
                }

                if (pixel != 0)
                {
                    //this code runs if pixel is to be drawn
                    if (global_x < DISPLAY_WIDTH && global_x >= 0)
                    {
                        if (scanline->winMask[global_x] & WINMASK_WINOUT)
                            scanline->winMask[global_x] = (REG_WINOUT >> 8) & 0x3F;
                    }
                }
            }
        }
    }
}

static void inline_hack DrawAffineSprite(int SpriteIndex, struct scanlineData* scanline, uint16_t vcount, bool windowsEnabled, uint16_t* pixels, bool IsInsideWinIn)
{
    struct OamData *oam = &((struct OamData *)OAM)[SpriteIndex];
    void *objtiles = VRAM_ + 0x10000;
    unsigned int blendMode = (REG_BLDCNT >> 6) & 3;
    bool winShouldBlendPixel = true;
    unsigned int width;
    unsigned int height;

    bool isAffine  = oam->affineMode & 1;
    bool doubleSizeOrDisabled = (oam->affineMode >> 1) & 1;
    bool isSemiTransparent = (oam->objMode == 1);

    if (!(isAffine) && doubleSizeOrDisabled) // disable for non-affine
    {
        return;
    }

    if (oam->shape == 0)
    {
        width = (1 << oam->size) * 8;
        height = (1 << oam->size) * 8;
    }
    else if (oam->shape == 1) // wide
    {
        width = spriteSizes[oam->size][1];
        height = spriteSizes[oam->size][0];
    }
    else if (oam->shape == 2) // tall
    {
        width = spriteSizes[oam->size][0];
        height = spriteSizes[oam->size][1];
    }
    else
    {
        return; // prohibited, do not draw
    }

    int rect_width = width;
    int rect_height = height;

    int half_width = width / 2;
    int half_height = height / 2;

    int32_t x = oam->x;
    int32_t y = oam->y;

    if (x >= DISPLAY_WIDTH)
        x -= 512;
    if (y >= DISPLAY_HEIGHT)
        y -= 256;
    
    int16_t matrix[2][2];

    if (isAffine)
    {
        //TODO: there is probably a better way to do this
        u8 matrixNum = oam->matrixNum * 4;

        struct OamData *oam1 = &((struct OamData *)OAM)[matrixNum];
        struct OamData *oam2 = &((struct OamData *)OAM)[matrixNum + 1];
        struct OamData *oam3 = &((struct OamData *)OAM)[matrixNum + 2];
        struct OamData *oam4 = &((struct OamData *)OAM)[matrixNum + 3];

        matrix[0][0] = oam1->affineParam;
        matrix[0][1] = oam2->affineParam;
        matrix[1][0] = oam3->affineParam;
        matrix[1][1] = oam4->affineParam;

        if (doubleSizeOrDisabled) // double size for affine
        {
            rect_width *= 2;
            rect_height *= 2;
            half_width *= 2;
            half_height *= 2;
        }
    }
    else
    {
        // Identity
        matrix[0][0] = 0x100;
        matrix[0][1] = 0;
        matrix[1][0] = 0;
        matrix[1][1] = 0x100;
    }

    x += half_width;
    y += half_height;

    // Does this sprite actually draw on this scanline?
    if (vcount >= (y - half_height) && vcount < (y + half_height))
    {
        int local_y = (oam->mosaic == 1) ? applySpriteVerticalMosaicEffect(vcount) - y : vcount - y;
        bool flipX  = !isAffine && ((oam->matrixNum >> 3) & 1);
        bool flipY  = !isAffine && ((oam->matrixNum >> 4) & 1);
        bool is8BPP  = oam->bpp & 1;

        for (int local_x = -half_width; local_x <= half_width; local_x++)
        {
            uint8_t *tiledata = (uint8_t *)objtiles;
            uint16_t *palette = (uint16_t *)(PLTT + 0x200);
            int local_mosaicX;
            int tex_x;
            int tex_y;

            unsigned int global_x = local_x + x;

            if (global_x < 0 || global_x >= DISPLAY_WIDTH)
                continue;

            if (isAffine)
            {
                if (oam->mosaic == 1)
                {
                    //mosaic effect has to be applied to global coordinates otherwise the mosaic will scroll
                    local_mosaicX = applySpriteHorizontalMosaicEffect(global_x) - x;
                    tex_x = ((matrix[0][0] * local_mosaicX + matrix[0][1] * local_y) >> 8) + (width / 2);
                    tex_y = ((matrix[1][0] * local_mosaicX + matrix[1][1] * local_y) >> 8) + (height / 2);
                }
                else
                {
                    tex_x = ((matrix[0][0] * local_x + matrix[0][1] * local_y) >> 8) + (width / 2);
                    tex_y = ((matrix[1][0] * local_x + matrix[1][1] * local_y) >> 8) + (height / 2);
                }
            }
            else
            {
                tex_x = (oam->mosaic == 1 ? applySpriteHorizontalMosaicEffect(global_x) - x : local_x) + (width / 2);
                tex_y = local_y + (height / 2);
            }


            /* Check if transformed coordinates are inside bounds. */

            if (tex_x >= width || tex_y >= height || tex_x < 0 || tex_y < 0)
                continue;

            if (flipX)
                tex_x = width  - tex_x - 1;
            if (flipY)
                tex_y = height - tex_y - 1;

            int tile_x = tex_x % 8;
            int tile_y = tex_y % 8;
            int block_x = tex_x / 8;
            int block_y = tex_y / 8;
            int block_offset = ((block_y * (REG_DISPCNT & 0x40 ? (width / 8) : 16)) + block_x);
            uint16_t pixel = 0;

            if (!is8BPP)
            {
                pixel = tiledata[(block_offset + oam->tileNum) * 32 + (tile_y * 4) + (tile_x / 2)];
                if (tile_x & 1)
                    pixel >>= 4;
                else
                    pixel &= 0xF;
                palette += oam->paletteNum * 16;
            }
            else
            {
                pixel = tiledata[(block_offset * 2 + oam->tileNum) * 32 + (tile_y * 8) + tile_x];
            }

            if (pixel != 0)
            {
                uint16_t color = palette[pixel];;
                
                //if sprite mode is 2 then write to the window mask instead
                /*if (isObjWin)
                {
                    if (scanline->winMask[global_x] & WINMASK_WINOUT)
                    scanline->winMask[global_x] = (REG_WINOUT >> 8) & 0x3F;
                    continue;
                }*/
                if (windowsEnabled && !(scanline->winMask[global_x] & WINMASK_OBJ) && IsInsideWinIn == true)
                {
                    continue;
                }
                
                //this code runs if pixel is to be drawn
                if (global_x < DISPLAY_WIDTH && global_x >= 0)
                {
                    //check if its enabled in the window (if window is enabled)
                    if (IsInsideWinIn == true)
                        winShouldBlendPixel = (windowsEnabled == false || scanline->winMask[global_x] & WINMASK_CLR);
                    else
                        winShouldBlendPixel = (windowsEnabled == false || REG_WINOUT & WINOUT_WIN01_CLR);
                    //has to be separated from the blend mode switch statement because of OBJ semi transparancy feature
                    if ((blendMode == 1 && REG_BLDCNT & BLDCNT_TGT1_OBJ && winShouldBlendPixel) || isSemiTransparent)
                    {
                        uint16_t targetA = color;

                        if (scanline->bgMask[global_x] & (REG_BLDCNT >> 8))
                            color = alphaBlendColor(targetA, pixels[global_x]);
                    }
                    else if (REG_BLDCNT & BLDCNT_TGT1_OBJ && winShouldBlendPixel)
                    {
                        switch (blendMode)
                        {
                        case 2:
                            color = alphaBrightnessIncrease(color);
                            break;
                        case 3:
                            color = alphaBrightnessDecrease(color);
                            break;
                        }
                    }
                    
                    //write pixel to pixel framebuffer
                    pixels[global_x] = color | (1 << 15);
                    scanline->bgMask[global_x] = (1 << 4); // top most obj pixel bit
                }
            }
        }
    }
}

static void inline_hack DrawNonAffineSprite(int SpriteIndex, struct scanlineData* scanline, uint16_t vcount, bool windowsEnabled, uint16_t* pixels, bool IsInsideWinIn)
{
    struct OamData *oam = &((struct OamData *)OAM)[SpriteIndex];
    void *objtiles = VRAM_ + 0x10000;
    unsigned int blendMode = (REG_BLDCNT >> 6) & 3;
    bool winShouldBlendPixel = true;
    unsigned int width;
    unsigned int height;

    bool isAffine  = oam->affineMode & 1;
    bool doubleSizeOrDisabled = (oam->affineMode >> 1) & 1;
    bool isSemiTransparent = (oam->objMode == 1);

    if (!(isAffine) && doubleSizeOrDisabled) // disable for non-affine
    {
        return;
    }

    if (oam->shape == 0)
    {
        width = (1 << oam->size) * 8;
        height = (1 << oam->size) * 8;
    }
    else if (oam->shape == 1) // wide
    {
        width = spriteSizes[oam->size][1];
        height = spriteSizes[oam->size][0];
    }
    else if (oam->shape == 2) // tall
    {
        width = spriteSizes[oam->size][0];
        height = spriteSizes[oam->size][1];
    }
    else
    {
        return; // prohibited, do not draw
    }

    int half_height = height / 2;
    int32_t x = oam->x;
    int32_t y = oam->y;

    if (x >= DISPLAY_WIDTH)
        x -= 512;
    if (y >= DISPLAY_HEIGHT)
        y -= 256;

    y += half_height;

    // Does this sprite actually draw on this scanline?
    if (vcount >= (y - half_height) && vcount < (y + half_height))
    {
        int local_y = (oam->mosaic == 1) ? applySpriteVerticalMosaicEffect(vcount) - y : vcount - y;
        //int palette = oam->paletteNum;
        bool flipX  = !isAffine && ((oam->matrixNum >> 3) & 1);
        bool flipY  = !isAffine && ((oam->matrixNum >> 4) & 1);
        uint8_t *tiledata = (uint8_t *)objtiles;
        uint16_t *palette = (uint16_t *)OBJ_PLTT;
        palette += oam->paletteNum * 16; //choose the palette
        int tex_y = local_y + (height / 2);
        if (flipY)
            tex_y = height - tex_y - 1;
        //run the block drawing loop in reverse if sprite is flipped otherwise run as normal
        int blockStart, blockEnd, blockIncrement;
        if (flipX)
        {
            blockStart = width / TILE_WIDTH-1;
            blockEnd = -1;
            blockIncrement = -1;
        }
        else
        {
            blockStart = 0;
            blockEnd = width / TILE_WIDTH;
            blockIncrement = 1;
        }
        
        for (int block_x = blockStart; block_x != blockEnd; block_x += blockIncrement)
        {
            int tile_y = tex_y & (TILE_HEIGHT-1);
            int block_y = tex_y / TILE_HEIGHT;
            int block_offset = ((block_y * (REG_DISPCNT & DISPCNT_OBJ_1D_MAP ? (width / 8) : 16)) + block_x);
            uint8_t* pixelData = &tiledata[(oam->tileNum + block_offset) * TILE_SIZE_4BPP + (tile_y * 4)];
            uint32_t pixel32 = *(uint32_t*)pixelData; //load whole tile worth of palette pixels
            
            if (x >= 0 && x + TILE_WIDTH <= DISPLAY_WIDTH)
            {
                if (windowsEnabled)
                {
                    if (blendMode != 0 || isSemiTransparent) //Windowing and blending
                    {
                        #define writeSpritePixelWinBlend(pixel, x) \
                            if (pixel && ((IsInsideWinIn && scanline->winMask[x] & WINMASK_OBJ) || (!IsInsideWinIn && REG_WINOUT & WINOUT_WIN01_OBJ))) { \
                                uint16_t color = palette[pixel]; \
                                winShouldBlendPixel = (IsInsideWinIn && scanline->winMask[x] & WINMASK_CLR) || (!IsInsideWinIn && REG_WINOUT & WINOUT_WIN01_CLR); \
                                \
                                if (((blendMode == 1 && REG_BLDCNT & BLDCNT_TGT1_OBJ) && winShouldBlendPixel) || isSemiTransparent) \
                                { \
                                    if (scanline->bgMask[x] & (REG_BLDCNT >> 8)) \
                                        color = alphaBlendColor(color, pixels[x]); \
                                } \
                                else if(REG_BLDCNT & BLDCNT_TGT1_OBJ && winShouldBlendPixel) \
                                { \
                                    switch (blendMode) \
                                    { \
                                        case 2: \
                                            color = alphaBrightnessIncrease(color); \
                                            break; \
                                        case 3: \
                                            color = alphaBrightnessDecrease(color); \
                                            break; \
                                    } \
                                } \
                                pixels[x] = color | (1 << 15); \
                                scanline->bgMask[x] = (1 << 4); \
                            }

                        if (flipX)
                        {
                            writeSpritePixelWinBlend(pixel32 >> 28, x)
                            writeSpritePixelWinBlend((pixel32 >> 24) & 0xF, x+1)
                            writeSpritePixelWinBlend((pixel32 >> 20) & 0xF, x+2)
                            writeSpritePixelWinBlend((pixel32 >> 16) & 0xF, x+3)
                            writeSpritePixelWinBlend((pixel32 >> 12) & 0xF, x+4)
                            writeSpritePixelWinBlend((pixel32 >> 8) & 0xF, x+5)
                            writeSpritePixelWinBlend((pixel32 >> 4) & 0xF, x+6)
                            writeSpritePixelWinBlend(pixel32 & 0xF, x+7)
                        }
                        else
                        {
                            writeSpritePixelWinBlend(pixel32 & 0xF, x)
                            writeSpritePixelWinBlend((pixel32 >> 4) & 0xF, x+1)
                            writeSpritePixelWinBlend((pixel32 >> 8) & 0xF, x+2)
                            writeSpritePixelWinBlend((pixel32 >> 12) & 0xF, x+3)
                            writeSpritePixelWinBlend((pixel32 >> 16) & 0xF, x+4)
                            writeSpritePixelWinBlend((pixel32 >> 20) & 0xF, x+5)
                            writeSpritePixelWinBlend((pixel32 >> 24) & 0xF, x+6)
                            writeSpritePixelWinBlend(pixel32 >> 28, x+7)
                        }
                        #undef writeSpritePixelWinBlend
                    }
                    else //Windowing
                    {
                        #define writeSpritePixelWin(pixel, x) \
                            if (pixel && ((IsInsideWinIn && scanline->winMask[x] & WINMASK_OBJ) || (!IsInsideWinIn && REG_WINOUT & WINOUT_WIN01_OBJ))) { \
                                pixels[x] = palette[pixel] | (1 << 15); \
                                scanline->bgMask[x] = (1 << 4); \
                            }

                        if (flipX)
                        {
                            writeSpritePixelWin(pixel32 >> 28, x)
                            writeSpritePixelWin((pixel32 >> 24) & 0xF, x+1)
                            writeSpritePixelWin((pixel32 >> 20) & 0xF, x+2)
                            writeSpritePixelWin((pixel32 >> 16) & 0xF, x+3)
                            writeSpritePixelWin((pixel32 >> 12) & 0xF, x+4)
                            writeSpritePixelWin((pixel32 >> 8) & 0xF, x+5)
                            writeSpritePixelWin((pixel32 >> 4) & 0xF, x+6)
                            writeSpritePixelWin(pixel32 & 0xF, x+7)
                        }
                        else
                        {
                            writeSpritePixelWin(pixel32 & 0xF, x)
                            writeSpritePixelWin((pixel32 >> 4) & 0xF, x+1)
                            writeSpritePixelWin((pixel32 >> 8) & 0xF, x+2)
                            writeSpritePixelWin((pixel32 >> 12) & 0xF, x+3)
                            writeSpritePixelWin((pixel32 >> 16) & 0xF, x+4)
                            writeSpritePixelWin((pixel32 >> 20) & 0xF, x+5)
                            writeSpritePixelWin((pixel32 >> 24) & 0xF, x+6)
                            writeSpritePixelWin(pixel32 >> 28, x+7)
                        }
                        #undef writeSpritePixelWin
                    }
                }
                else //Choose between Blend and none
                {
                    if (blendMode != 0 || isSemiTransparent) //Blend
                    {
                        #define writeSpritePixelBlend(pixel, x) \
                        if (pixel) { \
                            uint16_t color = palette[pixel]; \
                            \
                            if ( (blendMode == 1 && REG_BLDCNT & BLDCNT_TGT1_OBJ) || isSemiTransparent) \
                            { \
                                if (scanline->bgMask[x] & (REG_BLDCNT >> 8)) \
                                    color = alphaBlendColor(color, pixels[x]); \
                            } \
                            else if(REG_BLDCNT & BLDCNT_TGT1_OBJ) \
                            { \
                                switch (blendMode) \
                                { \
                                    case 2: \
                                        color = alphaBrightnessIncrease(color); \
                                        break; \
                                    case 3: \
                                        color = alphaBrightnessDecrease(color); \
                                        break; \
                                } \
                            } \
                            \
                            pixels[x] = color | (1 << 15); \
                            scanline->bgMask[x] = (1 << 4); \
                        }

                        if (flipX)
                        {
                            writeSpritePixelBlend(pixel32 >> 28, x)
                            writeSpritePixelBlend((pixel32 >> 24) & 0xF, x+1)
                            writeSpritePixelBlend((pixel32 >> 20) & 0xF, x+2)
                            writeSpritePixelBlend((pixel32 >> 16) & 0xF, x+3)
                            writeSpritePixelBlend((pixel32 >> 12) & 0xF, x+4)
                            writeSpritePixelBlend((pixel32 >> 8) & 0xF, x+5)
                            writeSpritePixelBlend((pixel32 >> 4) & 0xF, x+6)
                            writeSpritePixelBlend(pixel32 & 0xF, x+7)
                        }
                        else
                        {
                            writeSpritePixelBlend(pixel32 & 0xF, x)
                            writeSpritePixelBlend((pixel32 >> 4) & 0xF, x+1)
                            writeSpritePixelBlend((pixel32 >> 8) & 0xF, x+2)
                            writeSpritePixelBlend((pixel32 >> 12) & 0xF, x+3)
                            writeSpritePixelBlend((pixel32 >> 16) & 0xF, x+4)
                            writeSpritePixelBlend((pixel32 >> 20) & 0xF, x+5)
                            writeSpritePixelBlend((pixel32 >> 24) & 0xF, x+6)
                            writeSpritePixelBlend(pixel32 >> 28, x+7)
                        }
                        #undef writeSpritePixelBlend
                    }
                    else //None
                    {
                        #define writeSpritePixel(pixel, x) \
                            if (pixel) { \
                                pixels[x] = palette[pixel] | (1 << 15); \
                                scanline->bgMask[x] = (1 << 4); \
                            }

                        if (flipX)
                        {
                            writeSpritePixel(pixel32 >> 28, x)
                            writeSpritePixel((pixel32 >> 24) & 0xF, x+1)
                            writeSpritePixel((pixel32 >> 20) & 0xF, x+2)
                            writeSpritePixel((pixel32 >> 16) & 0xF, x+3)
                            writeSpritePixel((pixel32 >> 12) & 0xF, x+4)
                            writeSpritePixel((pixel32 >> 8) & 0xF, x+5)
                            writeSpritePixel((pixel32 >> 4) & 0xF, x+6)
                            writeSpritePixel(pixel32 & 0xF, x+7)
                        }
                        else
                        {
                            writeSpritePixel(pixel32 & 0xF, x)
                            writeSpritePixel((pixel32 >> 4) & 0xF, x+1)
                            writeSpritePixel((pixel32 >> 8) & 0xF, x+2)
                            writeSpritePixel((pixel32 >> 12) & 0xF, x+3)
                            writeSpritePixel((pixel32 >> 16) & 0xF, x+4)
                            writeSpritePixel((pixel32 >> 20) & 0xF, x+5)
                            writeSpritePixel((pixel32 >> 24) & 0xF, x+6)
                            writeSpritePixel(pixel32 >> 28, x+7)
                        }
                        #undef writeSpritePixel
                    }
                }
            }
            else //handle tiles that are partially cut off screen, for the sake of readibility the writeSpritePixel handles all special effect spaces, should affect performance very little
            {
                bool winShouldDraw = true;
                #define writeSpritePixel(pixel, x) \
                    winShouldDraw = windowsEnabled == false || ((IsInsideWinIn && scanline->winMask[x] & WINMASK_OBJ) || (!IsInsideWinIn && REG_WINOUT & WINOUT_WIN01_OBJ));\
                    if (pixel && winShouldDraw) { \
                        uint16_t color = palette[pixel]; \
                        \
                        winShouldBlendPixel = windowsEnabled == false || ( (IsInsideWinIn && scanline->winMask[x] & WINMASK_CLR) || (!IsInsideWinIn && REG_WINOUT & WINOUT_WIN01_CLR) ); \
                        if ((blendMode == 1 && REG_BLDCNT & BLDCNT_TGT1_OBJ && winShouldBlendPixel) || isSemiTransparent) \
                        { \
                            if (scanline->bgMask[x] & (REG_BLDCNT >> 8)) \
                                color = alphaBlendColor(color, pixels[x]); \
                        } \
                        else if(REG_BLDCNT & BLDCNT_TGT1_OBJ && winShouldBlendPixel) \
                        { \
                            switch (blendMode) \
                            { \
                                case 2: \
                                    color = alphaBrightnessIncrease(color); \
                                    break; \
                                case 3: \
                                    color = alphaBrightnessDecrease(color); \
                                    break; \
                            } \
                        } \
                        \
                        pixels[x] = color | (1 << 15); \
                        scanline->bgMask[x] = (1 << 4); \
                    }

                if (x > -TILE_WIDTH && x < 0) //left side
                {
                    int amountOfPixelsToBeDrawn = TILE_WIDTH - abs(x);
                    if (flipX)
                    {
                        for (int i = 0; i < amountOfPixelsToBeDrawn; i++)
                        {
                            int pixelOffset = abs(x);
                            writeSpritePixel((pixel32 >> (28-((pixelOffset+i)*4))) & 0xF, i);
                        }
                    }
                    else
                    {
                        for (int i = 0; i < amountOfPixelsToBeDrawn; i++)
                        {
                            int pixelOffset = abs(x);
                            writeSpritePixel((pixel32 >> ((pixelOffset+i)*4)) & 0xF, i);
                        }
                    }
                }
                else if(x < DISPLAY_WIDTH && x + TILE_WIDTH > DISPLAY_WIDTH) //right side
                {
                    int amountOfPixelsToBeDrawn = DISPLAY_WIDTH-x;
                    if (flipX)
                    {
                        for (int i = 0; i < amountOfPixelsToBeDrawn; i++)
                        {
                            writeSpritePixel((pixel32 >> (28-(i*4))) & 0xF, x+i);
                        }
                    }
                    else
                    {
                        for (int i = 0; i < amountOfPixelsToBeDrawn; i++)
                        {
                            writeSpritePixel((pixel32 >> i*4) & 0xF, x+i);
                        }
                    }
                }
                #undef writeSpritePixel
            }
            x += TILE_WIDTH; //Move on onto the next block
        }
    }
}

// Parts of this code heavily borrowed from NanoboyAdvance.
static void DrawSprites(struct scanlineData* scanline, uint16_t vcount, bool windowsEnabled, uint8_t priority, uint16_t* pixels, bool IsInsideWinIn)
{
    int SpriteIndex;
    
    if (windowsEnabled == true && IsInsideWinIn == false)
    {
        if (!(REG_WINOUT & WINOUT_WIN01_OBJ))
            return;
    }

    if (!(REG_DISPCNT & (1 << 6)))
    {
        puts("2-D OBJ Character mapping not supported.");
    }

    for (SpriteIndex = 127; SpriteIndex >= 0; SpriteIndex--)
    {
        struct OamData *oam = &((struct OamData *)OAM)[SpriteIndex];
        
        if (oam->priority != priority)
            continue;
        if (oam->objMode == 2)
            continue;
        
        if (oam->affineMode & 1 || oam->bpp & 1 || oam->mosaic == 1)
            DrawAffineSprite(SpriteIndex, scanline, vcount, windowsEnabled, pixels, IsInsideWinIn);
        else
            DrawNonAffineSprite(SpriteIndex, scanline, vcount, windowsEnabled, pixels, IsInsideWinIn);
    }
}

static void DrawScanline(uint16_t *pixels, uint16_t vcount)
{
    unsigned int mode = REG_DISPCNT & 3;
    unsigned char numOfBgs = (mode == 0 ? 4 : 3);
    int bgnum, prnum;
    struct scanlineData scanline;
    unsigned int blendMode = (REG_BLDCNT >> 6) & 3;
    unsigned int xpos;


    //initialize all priority bookkeeping data
    memset(scanline.prioritySortedBgsCount, 0, sizeof(scanline.prioritySortedBgsCount));
    
    //windows code!!!
    bool windowsEnabled = false;
    bool IsInsideWinIn;
    uint16_t WIN0bottom, WIN0top, WIN0right, WIN0left;
    uint16_t WIN1bottom, WIN1top, WIN1right, WIN1left;
    bool WIN0enable, WIN1enable;
    WIN0enable = false;
    WIN1enable = false;

    //figure out if WIN0 masks on this scanline
    if (REG_DISPCNT & DISPCNT_WIN0_ON)
    {
        //acquire the window coordinates
        WIN0bottom = (REG_WIN0V & 0xFF); //y2;
        WIN0top = (REG_WIN0V & 0xFF00) >> 8; //y1;
        WIN0right = (REG_WIN0H & 0xFF); //x2
        WIN0left = (REG_WIN0H & 0xFF00) >> 8; //x1
        
        //figure out WIN Y wraparound and check bounds accordingly
        if (WIN0top > WIN0bottom) {
            if (vcount >= WIN0top || vcount < WIN0bottom)
                WIN0enable = true;
        } else {
            if (vcount >= WIN0top && vcount < WIN0bottom)
                WIN0enable = true;
        }
        
        windowsEnabled = true;
    }
    //figure out if WIN1 masks on this scanline
    if (REG_DISPCNT & DISPCNT_WIN1_ON)
    {
        WIN1bottom = (REG_WIN0V & 0xFF); //y2;
        WIN1top = (REG_WIN0V & 0xFF00) >> 8; //y1;
        WIN1right = (REG_WIN0H & 0xFF); //x2
        WIN1left = (REG_WIN0H & 0xFF00) >> 8; //x1
        
        if (WIN1top > WIN1bottom) {
            if (vcount >= WIN1top || vcount < WIN1bottom)
                WIN1enable = true;
        } else {
            if (vcount >= WIN1top && vcount < WIN1bottom)
                WIN1enable = true;
        }
        
        windowsEnabled = true;
    }
    //enable windows if OBJwin is enabled
    if (REG_DISPCNT & DISPCNT_OBJWIN_ON && REG_DISPCNT & DISPCNT_OBJ_ON)
        windowsEnabled = true;
    
    IsInsideWinIn = (WIN0enable || WIN1enable || (REG_DISPCNT & DISPCNT_OBJWIN_ON && REG_DISPCNT & DISPCNT_OBJ_ON));
    
    
    //draw to pixel mask
    if (IsInsideWinIn)
    {
        for (xpos = 0; xpos < DISPLAY_WIDTH; xpos++)
        {
            //win0 checks
            if (WIN0enable && winCheckHorizontalBounds(WIN0left, WIN0right, xpos))
                scanline.winMask[xpos] = REG_WININ & 0x3F;
            //win1 checks
            else if (WIN1enable && winCheckHorizontalBounds(WIN1left, WIN1right, xpos))
                scanline.winMask[xpos] = (REG_WININ >> 8) & 0x3F;
            else
                scanline.winMask[xpos] = (REG_WINOUT & 0x3F) | WINMASK_WINOUT;
        }
    }
    
    //draw to window mask if OBJwin is enabled
    if (REG_DISPCNT & DISPCNT_OBJWIN_ON && REG_DISPCNT & DISPCNT_OBJ_ON)
        DrawSpritesWinMask(&scanline, vcount);
    
    //init bgmask for alpha blending
    for (int i = 0; i < DISPLAY_WIDTH; i++)
    {
        scanline.bgMask[i] = 0x20; //backdrop bit
    }

    for (bgnum = 0; bgnum < numOfBgs; bgnum++)
    {
        uint16_t bgcnt = *(uint16_t*)(REG_ADDR_BG0CNT + bgnum * 2);
        uint16_t priority;
        scanline.bgcnts[bgnum] = bgcnt;
        scanline.bgtoprio[bgnum] = priority = (bgcnt & 3);
        
        char priorityCount = scanline.prioritySortedBgsCount[priority];
        scanline.prioritySortedBgs[priority][priorityCount] = bgnum;
        scanline.prioritySortedBgsCount[priority]++;
    }
    
    switch (mode)
    {
    case 0:
        for (prnum = 3; prnum >= 0; prnum--)
        {
            for (char prsub = scanline.prioritySortedBgsCount[prnum] - 1; prsub >= 0; prsub--)
            {
                bgnum = scanline.prioritySortedBgs[prnum][prsub];
                if (isbgEnabled(bgnum))
                {
                    uint16_t bghoffs = *(uint16_t *)(REG_ADDR_BG0HOFS + bgnum * 4);
                    uint16_t bgvoffs = *(uint16_t *)(REG_ADDR_BG0VOFS + bgnum * 4);
                    bool doesBGblend = (blendMode != 0 && REG_BLDCNT & (1 << bgnum));
                    
                    if (IsInsideWinIn)
                    {
                        //blending check
                        if (doesBGblend)
                            RenderBGScanlineWinBlend(bgnum, scanline.bgcnts[bgnum], bghoffs, bgvoffs, vcount, pixels, &scanline, windowsEnabled);
                        else
                            RenderBGScanlineWin(bgnum, scanline.bgcnts[bgnum], bghoffs, bgvoffs, vcount, pixels, &scanline, windowsEnabled);
                        
                    } else {
                        
                        if (doesBGblend && (windowsEnabled == false || (REG_WINOUT & WINOUT_WIN01_CLR)) )
                            RenderBGScanlineBlend(bgnum, scanline.bgcnts[bgnum], bghoffs, bgvoffs, vcount, pixels, &scanline, windowsEnabled);
                        else
                            RenderBGScanlineNoEffect(bgnum, scanline.bgcnts[bgnum], bghoffs, bgvoffs, vcount, pixels, &scanline, windowsEnabled);
                    }
                
                }
            }
            if (REG_DISPCNT & DISPCNT_OBJ_ON)
                DrawSprites(&scanline, vcount, windowsEnabled, prnum, pixels, IsInsideWinIn);
        }
        
        break;
    case 1:
        for (prnum = 3; prnum >= 0; prnum--)
        {
            for (char prsub = scanline.prioritySortedBgsCount[prnum] - 1; prsub >= 0; prsub--)
            {
                bgnum = scanline.prioritySortedBgs[prnum][prsub];
                if (isbgEnabled(bgnum))
                {
                    uint16_t bghoffs = *(uint16_t *)(REG_ADDR_BG0HOFS + bgnum * 4);
                    uint16_t bgvoffs = *(uint16_t *)(REG_ADDR_BG0VOFS + bgnum * 4);
                    bool doesBGblend = (blendMode != 0 && REG_BLDCNT & (1 << bgnum));
                    
                    
                    if (bgnum != 2)
                    {
                        if (IsInsideWinIn)
                        {
                            //blending check
                            if (doesBGblend)
                                RenderBGScanlineWinBlend(bgnum, scanline.bgcnts[bgnum], bghoffs, bgvoffs, vcount, pixels, &scanline, windowsEnabled);
                            else
                                RenderBGScanlineWin(bgnum, scanline.bgcnts[bgnum], bghoffs, bgvoffs, vcount, pixels, &scanline, windowsEnabled);
                            
                        } else {
                            
                            if (doesBGblend)
                                RenderBGScanlineBlend(bgnum, scanline.bgcnts[bgnum], bghoffs, bgvoffs, vcount, pixels, &scanline, windowsEnabled);
                            else
                                RenderBGScanlineNoEffect(bgnum, scanline.bgcnts[bgnum], bghoffs, bgvoffs, vcount, pixels, &scanline, windowsEnabled);
                        }
                    }
                    else
                    {
                        if (IsInsideWinIn)
                        {
                            //blending check
                            if (doesBGblend)
                                RenderRotScaleBGScanlineWinBlend(bgnum, scanline.bgcnts[bgnum], bghoffs, bgvoffs, vcount, pixels, &scanline, windowsEnabled);
                            else
                                RenderRotScaleBGScanlineWin(bgnum, scanline.bgcnts[bgnum], bghoffs, bgvoffs, vcount, pixels, &scanline, windowsEnabled);
                            
                        } else {
                            
                            if (doesBGblend && (windowsEnabled == false || (REG_WINOUT & WINOUT_WIN01_CLR)))
                                RenderRotScaleBGScanlineBlend(bgnum, scanline.bgcnts[bgnum], bghoffs, bgvoffs, vcount, pixels, &scanline, windowsEnabled);
                            else
                                RenderRotScaleBGScanlineNoEffect(bgnum, scanline.bgcnts[bgnum], bghoffs, bgvoffs, vcount, pixels, &scanline, windowsEnabled);
                        }
                    }
                }
            }
            if (REG_DISPCNT & DISPCNT_OBJ_ON)
                DrawSprites(&scanline, vcount, windowsEnabled, prnum, pixels, IsInsideWinIn);
        }
        break;
    default:
        printf("Video mode %u is unsupported.\n", mode);
        break;
    }
}

uint16_t *memsetu16(uint16_t *dst, uint16_t fill, size_t count)
{
    for (int i = 0; i < count; i++)
    {
        *dst++ = fill;
    }
}

unsigned int frameskipcounter = 0;

void DrawFrame(uint16_t *pixels)
{
    int i;
    int j;
    
    //memsetu16(pixels, *(uint16_t *)PLTT, DISPLAY_WIDTH * DISPLAY_HEIGHT);

    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        REG_VCOUNT = i;
        if(((REG_DISPSTAT >> 8) & 0xFF) == REG_VCOUNT)
        {
            REG_DISPSTAT |= INTR_FLAG_VCOUNT;
            if(REG_DISPSTAT & DISPSTAT_VCOUNT_INTR)
                    gIntrTable[0]();
        }
        
        // backdrop color brightness effects
        unsigned int blendMode = (REG_BLDCNT >> 6) & 3;
        uint16_t backdropColor = *(uint16_t *)PLTT;
        if (REG_BLDCNT & BLDCNT_TGT1_BD)
        {
            switch (blendMode)
            {
            case 2:
                backdropColor = alphaBrightnessIncrease(backdropColor);
                break;
            case 3:
                backdropColor = alphaBrightnessDecrease(backdropColor);
                break;
            }
        }
        
        memsetu16(&pixels[i*DISPLAY_WIDTH], backdropColor, DISPLAY_WIDTH);
        DrawScanline(&pixels[i*DISPLAY_WIDTH], i);
        
        REG_DISPSTAT |= INTR_FLAG_HBLANK;

        RunDMAs(DMA_HBLANK);
        
        if (REG_DISPSTAT & DISPSTAT_HBLANK_INTR)
            gIntrTable[3]();

        REG_DISPSTAT &= ~INTR_FLAG_HBLANK;
        REG_DISPSTAT &= ~INTR_FLAG_VCOUNT;
    }
}
#endif
