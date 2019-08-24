#include "global.h"
#include "graphics.h"
#include "palette.h"
#include "util.h"
#include "battle_transition.h"
#include "task.h"
#include "fieldmap.h"

static EWRAM_DATA struct {
    const u16 *src;
    u16 *dest;
    u16 size;
} sTilesetDMA3TransferBuffer[20] = {0};

static u8 sTilesetDMA3TransferBufferSize;
static u16 sPrimaryTilesetAnimCounter;
static u16 sPrimaryTilesetAnimCounterMax;
static u16 sSecondaryTilesetAnimCounter;
static u16 sSecondaryTilesetAnimCounterMax;
static void (*sPrimaryTilesetAnimCallback)(u16);
static void (*sSecondaryTilesetAnimCallback)(u16);

static void _InitPrimaryTilesetAnimation(void);
static void _InitSecondaryTilesetAnimation(void);

extern const u16 *const gUnknown_83A7660[];
extern const u16 *const gUnknown_83AA654[];
extern const u16 *const gUnknown_83AB874[];
extern const u16 *const gUnknown_83ABDB4[];
extern const u16 *const gUnknown_83AC1E8[];
extern const u16 *const gUnknown_83AC5F8[];
extern const u16 *const gUnknown_83AC7C8[];
extern const u16 *const gUnknown_83AC950[];

static void ResetTilesetAnimBuffer(void)
{
    sTilesetDMA3TransferBufferSize = 0;
    CpuFill32(0, sTilesetDMA3TransferBuffer, sizeof sTilesetDMA3TransferBuffer);
}

static void AppendTilesetAnimToBuffer(const u16 *src, u16 *dest, u16 size)
{
    if (sTilesetDMA3TransferBufferSize < 20)
    {
        sTilesetDMA3TransferBuffer[sTilesetDMA3TransferBufferSize].src = src;
        sTilesetDMA3TransferBuffer[sTilesetDMA3TransferBufferSize].dest = dest;
        sTilesetDMA3TransferBuffer[sTilesetDMA3TransferBufferSize].size = size;
        sTilesetDMA3TransferBufferSize++;
    }
}

void TransferTilesetAnimsBuffer(void)
{
    int i;

    for (i = 0; i < sTilesetDMA3TransferBufferSize; i++)
        DmaCopy16(3, sTilesetDMA3TransferBuffer[i].src, sTilesetDMA3TransferBuffer[i].dest, sTilesetDMA3TransferBuffer[i].size);

    sTilesetDMA3TransferBufferSize = 0;
}

void InitTilesetAnimations(void)
{
    ResetTilesetAnimBuffer();
    _InitPrimaryTilesetAnimation();
    _InitSecondaryTilesetAnimation();
}

void InitSecondaryTilesetAnimation(void)
{
    _InitSecondaryTilesetAnimation();
}

void UpdateTilesetAnimations(void)
{
    ResetTilesetAnimBuffer();
    if (++sPrimaryTilesetAnimCounter >= sPrimaryTilesetAnimCounterMax)
        sPrimaryTilesetAnimCounter = 0;
    if (++sSecondaryTilesetAnimCounter >= sSecondaryTilesetAnimCounterMax)
        sSecondaryTilesetAnimCounter = 0;

    if (sPrimaryTilesetAnimCallback)
        sPrimaryTilesetAnimCallback(sPrimaryTilesetAnimCounter);
    if (sSecondaryTilesetAnimCallback)
        sSecondaryTilesetAnimCallback(sSecondaryTilesetAnimCounter);
}

static void _InitPrimaryTilesetAnimation(void)
{
    sPrimaryTilesetAnimCounter = 0;
    sPrimaryTilesetAnimCounterMax = 0;
    sPrimaryTilesetAnimCallback = NULL;
    if (gMapHeader.mapData->primaryTileset && gMapHeader.mapData->primaryTileset->callback)
        gMapHeader.mapData->primaryTileset->callback();
}

static void _InitSecondaryTilesetAnimation(void)
{
    sSecondaryTilesetAnimCounter = 0;
    sSecondaryTilesetAnimCounterMax = 0;
    sSecondaryTilesetAnimCallback = NULL;
    if (gMapHeader.mapData->secondaryTileset && gMapHeader.mapData->secondaryTileset->callback)
        gMapHeader.mapData->secondaryTileset->callback();
}

static void sub_80700A4(u16 timer)
{
    const u16 *const *ptr = gUnknown_83A7660;
    u16 i = timer % 5;
    
    AppendTilesetAnimToBuffer(ptr[i], (u16 *)(BG_VRAM + TILE_OFFSET_4BPP(508)), 0x80);
}

static void sub_80700D0(u16 timer)
{
    const u16 *const *ptr = gUnknown_83AA654;
    u16 i = timer % 8;
    
    AppendTilesetAnimToBuffer(ptr[i], (u16 *)(BG_VRAM + TILE_OFFSET_4BPP(416)), 0x600);
}

static void sub_80700F8(u16 timer)
{
    const u16 *const *ptr = gUnknown_83AB874;
    u16 i = timer % 8;
    
    AppendTilesetAnimToBuffer(ptr[i], (u16 *)(BG_VRAM + TILE_OFFSET_4BPP(464)), 0x240);
}

static void sub_8070120(u16 timer)
{
    if (timer % 8 == 0)
        sub_80700F8(timer >> 3);
    if (timer % 16 == 1)
        sub_80700D0(timer >> 4);
    if (timer % 16 == 2)
        sub_80700A4(timer >> 4);
}

void sub_8070154(void)
{
    sPrimaryTilesetAnimCounter = 0;
    sPrimaryTilesetAnimCounterMax = 640;
    sPrimaryTilesetAnimCallback = sub_8070120;
}

static void sub_807017C(u16 timer)
{
    const u16 *const *ptr = gUnknown_83ABDB4;
    u16 i = timer % 5;
    
    AppendTilesetAnimToBuffer(ptr[i], (u16 *)(BG_VRAM + TILE_OFFSET_4BPP(744)), 0x100);
}

static void sub_80701AC(u16 timer)
{
    if (timer % 12 == 0)
        sub_807017C(timer / 12);
}

void sub_80701D8(void)
{
    sSecondaryTilesetAnimCounter = 0;
    sSecondaryTilesetAnimCounterMax = 120;
    sSecondaryTilesetAnimCallback = sub_80701AC;
}

static void sub_80701FC(u16 timer)
{
    const u16 *const *ptr = gUnknown_83AC1E8;
    u16 i = timer % 4;
    
    AppendTilesetAnimToBuffer(ptr[i], (u16 *)(BG_VRAM + TILE_OFFSET_4BPP(976)), 0x100);
}

static void sub_8070224(u16 timer)
{
    if (timer % 10 == 0)
        sub_80701FC(timer / 10);
}

void sub_8070250(void)
{
    sSecondaryTilesetAnimCounter = 0;
    sSecondaryTilesetAnimCounterMax = 160;
    sSecondaryTilesetAnimCallback = sub_8070224;
}

static void sub_8070274(u16 timer)
{
    const u16 *const *ptr = gUnknown_83AC5F8;
    u16 i = timer % 4;
    
    AppendTilesetAnimToBuffer(ptr[i], (u16 *)(BG_VRAM + TILE_OFFSET_4BPP(896)), 0x100);
}

static void sub_807029C(u16 timer)
{
    if (timer % 16 == 0)
        sub_8070274(timer >> 4);
}

void sub_80702B4(void)
{
    sSecondaryTilesetAnimCounter = 0;
    sSecondaryTilesetAnimCounterMax = 256;
    sSecondaryTilesetAnimCallback = sub_807029C;
}

static void sub_80702DC(u16 timer)
{
    u16 i = timer % 2;
    
    AppendTilesetAnimToBuffer(gUnknown_83AC7C8[i], (u16 *)(BG_VRAM + TILE_OFFSET_4BPP(880)), 0xE0);
}

static void sub_8070304(u16 timer)
{
    if (timer % 2 == 0)
        sub_80702DC(timer >> 1);
}

void sub_807031C(void)
{
    sSecondaryTilesetAnimCounter = 0;
    sSecondaryTilesetAnimCounterMax = 240;
    sSecondaryTilesetAnimCallback = sub_8070304;
}

static void sub_8070340(u16 timer)
{
    u16 i = timer % 4;
    
    AppendTilesetAnimToBuffer(gUnknown_83AC950[i], (u16 *)(BG_VRAM + TILE_OFFSET_4BPP(739)), 0x80);
}

static void sub_8070368(u16 timer)
{
    if (timer % 16 == 0)
        sub_8070340(timer >> 4);
}

void sub_8070380(void)
{
    sSecondaryTilesetAnimCounter = 0;
    sSecondaryTilesetAnimCounterMax = 256;
    sSecondaryTilesetAnimCallback = sub_8070368;
}
