#include "global.h"

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

// palette: general 00
static const u16 sTilesetAnims_General_Flower_Frame0[] = INCBIN_U16("graphics/tileset_anims/anim_0_0.bin");
static const u16 sTilesetAnims_General_Flower_Frame1[] = INCBIN_U16("graphics/tileset_anims/anim_0_1.bin");
static const u16 sTilesetAnims_General_Flower_Frame2[] = INCBIN_U16("graphics/tileset_anims/anim_0_2.bin");
static const u16 sTilesetAnims_General_Flower_Frame3[] = INCBIN_U16("graphics/tileset_anims/anim_0_3.bin");
static const u16 sTilesetAnims_General_Flower_Frame4[] = INCBIN_U16("graphics/tileset_anims/anim_0_4.bin");

static const u16 *const sTilesetAnims_General_Flower[] = {
    sTilesetAnims_General_Flower_Frame0,
    sTilesetAnims_General_Flower_Frame1,
    sTilesetAnims_General_Flower_Frame2,
    sTilesetAnims_General_Flower_Frame3,
    sTilesetAnims_General_Flower_Frame4
};

// palette: general 04
static const u16 sTilesetAnims_General_Water_Current_LandWatersEdge_Frame0[] = INCBIN_U16("graphics/tileset_anims/anim_1_0.bin");
static const u16 sTilesetAnims_General_Water_Current_LandWatersEdge_Frame1[] = INCBIN_U16("graphics/tileset_anims/anim_1_1.bin");
static const u16 sTilesetAnims_General_Water_Current_LandWatersEdge_Frame2[] = INCBIN_U16("graphics/tileset_anims/anim_1_2.bin");
static const u16 sTilesetAnims_General_Water_Current_LandWatersEdge_Frame3[] = INCBIN_U16("graphics/tileset_anims/anim_1_3.bin");
static const u16 sTilesetAnims_General_Water_Current_LandWatersEdge_Frame4[] = INCBIN_U16("graphics/tileset_anims/anim_1_4.bin");
static const u16 sTilesetAnims_General_Water_Current_LandWatersEdge_Frame5[] = INCBIN_U16("graphics/tileset_anims/anim_1_5.bin");
static const u16 sTilesetAnims_General_Water_Current_LandWatersEdge_Frame6[] = INCBIN_U16("graphics/tileset_anims/anim_1_6.bin");
static const u16 sTilesetAnims_General_Water_Current_LandWatersEdge_Frame7[] = INCBIN_U16("graphics/tileset_anims/anim_1_7.bin");

static const u16 *const sTilesetAnims_General_Water_Current_LandWatersEdge[] = {
    sTilesetAnims_General_Water_Current_LandWatersEdge_Frame0,
    sTilesetAnims_General_Water_Current_LandWatersEdge_Frame1,
    sTilesetAnims_General_Water_Current_LandWatersEdge_Frame2,
    sTilesetAnims_General_Water_Current_LandWatersEdge_Frame3,
    sTilesetAnims_General_Water_Current_LandWatersEdge_Frame4,
    sTilesetAnims_General_Water_Current_LandWatersEdge_Frame5,
    sTilesetAnims_General_Water_Current_LandWatersEdge_Frame6,
    sTilesetAnims_General_Water_Current_LandWatersEdge_Frame7
};

// palette: general 04
static const u16 sTilesetAnims_General_SandWatersEdge_Frame0[] = INCBIN_U16("graphics/tileset_anims/anim_2_0.bin");
static const u16 sTilesetAnims_General_SandWatersEdge_Frame1[] = INCBIN_U16("graphics/tileset_anims/anim_2_1.bin");
static const u16 sTilesetAnims_General_SandWatersEdge_Frame2[] = INCBIN_U16("graphics/tileset_anims/anim_2_2.bin");
static const u16 sTilesetAnims_General_SandWatersEdge_Frame3[] = INCBIN_U16("graphics/tileset_anims/anim_2_3.bin");
static const u16 sTilesetAnims_General_SandWatersEdge_Frame4[] = INCBIN_U16("graphics/tileset_anims/anim_2_4.bin");
static const u16 sTilesetAnims_General_SandWatersEdge_Frame5[] = INCBIN_U16("graphics/tileset_anims/anim_2_5.bin");
static const u16 sTilesetAnims_General_SandWatersEdge_Frame6[] = INCBIN_U16("graphics/tileset_anims/anim_2_6.bin");
static const u16 sTilesetAnims_General_SandWatersEdge_Frame7[] = INCBIN_U16("graphics/tileset_anims/anim_2_7.bin");

static const u16 *const sTilesetAnims_General_SandWatersEdge[] = {
    sTilesetAnims_General_SandWatersEdge_Frame0,
    sTilesetAnims_General_SandWatersEdge_Frame1,
    sTilesetAnims_General_SandWatersEdge_Frame2,
    sTilesetAnims_General_SandWatersEdge_Frame3,
    sTilesetAnims_General_SandWatersEdge_Frame4,
    sTilesetAnims_General_SandWatersEdge_Frame5,
    sTilesetAnims_General_SandWatersEdge_Frame6,
    sTilesetAnims_General_SandWatersEdge_Frame7
};

// palette: general 00
static const u16 sTilesetAnims_CeladonCity_Fountain_Frame0[] = INCBIN_U16("graphics/tileset_anims/anim_3_0.bin");
static const u16 sTilesetAnims_CeladonCity_Fountain_Frame1[] = INCBIN_U16("graphics/tileset_anims/anim_3_1.bin");
static const u16 sTilesetAnims_CeladonCity_Fountain_Frame2[] = INCBIN_U16("graphics/tileset_anims/anim_3_2.bin");
static const u16 sTilesetAnims_CeladonCity_Fountain_Frame3[] = INCBIN_U16("graphics/tileset_anims/anim_3_3.bin");
static const u16 sTilesetAnims_CeladonCity_Fountain_Frame4[] = INCBIN_U16("graphics/tileset_anims/anim_3_4.bin");
static const u16 gUnknown_83ABD94[16] = {};

static const u16 *const sTilesetAnims_CeladonCity_Fountain[] = {
    sTilesetAnims_CeladonCity_Fountain_Frame0,
    sTilesetAnims_CeladonCity_Fountain_Frame1,
    sTilesetAnims_CeladonCity_Fountain_Frame2,
    sTilesetAnims_CeladonCity_Fountain_Frame3,
    sTilesetAnims_CeladonCity_Fountain_Frame4
};

static const u16 sTilesetAnims_SilphCo_Fountain_Frame0[] = INCBIN_U16("graphics/tileset_anims/anim_4_0.bin");
static const u16 sTilesetAnims_SilphCo_Fountain_Frame1[] = INCBIN_U16("graphics/tileset_anims/anim_4_1.bin");
static const u16 sTilesetAnims_SilphCo_Fountain_Frame2[] = INCBIN_U16("graphics/tileset_anims/anim_4_2.bin");
static const u16 sTilesetAnims_SilphCo_Fountain_Frame3[] = INCBIN_U16("graphics/tileset_anims/anim_4_3.bin");
static const u16 gUnknown_83AC1C8[16] = {};

static const u16 *const sTilesetAnims_SilphCo_Fountain[] = {
    sTilesetAnims_SilphCo_Fountain_Frame0,
    sTilesetAnims_SilphCo_Fountain_Frame1,
    sTilesetAnims_SilphCo_Fountain_Frame2,
    sTilesetAnims_SilphCo_Fountain_Frame3
};

static const u16 sTilesetAnims_MtEmber_Steam_Frame0[] = INCBIN_U16("graphics/tileset_anims/anim_5_0.bin");
static const u16 sTilesetAnims_MtEmber_Steam_Frame1[] = INCBIN_U16("graphics/tileset_anims/anim_5_1.bin");
static const u16 sTilesetAnims_MtEmber_Steam_Frame2[] = INCBIN_U16("graphics/tileset_anims/anim_5_2.bin");
static const u16 sTilesetAnims_MtEmber_Steam_Frame3[] = INCBIN_U16("graphics/tileset_anims/anim_5_3.bin");

static const u16 *const sTilesetAnims_MtEmber_Steam[] = {
    sTilesetAnims_MtEmber_Steam_Frame0,
    sTilesetAnims_MtEmber_Steam_Frame1,
    sTilesetAnims_MtEmber_Steam_Frame2,
    sTilesetAnims_MtEmber_Steam_Frame3
};

static const u16 sTilesetAnims_VermilionGym_MotorizedDoor_Frame0[] = INCBIN_U16("graphics/tileset_anims/anim_6_0.bin");
static const u16 sTilesetAnims_VermilionGym_MotorizedDoor_Frame1[] = INCBIN_U16("graphics/tileset_anims/anim_6_1.bin");

static const u16 *const sTilesetAnims_VermilionGym_MotorizedDoor[] = {
    sTilesetAnims_VermilionGym_MotorizedDoor_Frame0,
    sTilesetAnims_VermilionGym_MotorizedDoor_Frame1
};

static const u16 sTilesetAnims_CeladonGym_Flowers_Frame0[] = INCBIN_U16("graphics/tileset_anims/anim_7_0.bin");
static const u16 sTilesetAnims_CeladonGym_Flowers_Frame1[] = INCBIN_U16("graphics/tileset_anims/anim_7_1.bin");
static const u16 sTilesetAnims_CeladonGym_Flowers_Frame2[] = INCBIN_U16("graphics/tileset_anims/anim_7_2.bin");

static const u16 *const sTilesetAnims_CeladonGym_Flowers[] = {
    sTilesetAnims_CeladonGym_Flowers_Frame0,
    sTilesetAnims_CeladonGym_Flowers_Frame1,
    sTilesetAnims_CeladonGym_Flowers_Frame2,
    sTilesetAnims_CeladonGym_Flowers_Frame1
};

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
    if (gMapHeader.mapLayout->primaryTileset && gMapHeader.mapLayout->primaryTileset->callback)
        gMapHeader.mapLayout->primaryTileset->callback();
}

static void _InitSecondaryTilesetAnimation(void)
{
    sSecondaryTilesetAnimCounter = 0;
    sSecondaryTilesetAnimCounterMax = 0;
    sSecondaryTilesetAnimCallback = NULL;
    if (gMapHeader.mapLayout->secondaryTileset && gMapHeader.mapLayout->secondaryTileset->callback)
        gMapHeader.mapLayout->secondaryTileset->callback();
}

static void QueueAnimTiles_General_Flower(u16 timer)
{
    AppendTilesetAnimToBuffer(sTilesetAnims_General_Flower[timer % NELEMS(sTilesetAnims_General_Flower)], (u16 *)(BG_CHAR_ADDR(0) + TILE_OFFSET_4BPP(508)), 4 * TILE_SIZE_4BPP);
}

static void QueueAnimTiles_General_Water_Current_LandWatersEdge(u16 timer)
{
    AppendTilesetAnimToBuffer(sTilesetAnims_General_Water_Current_LandWatersEdge[timer % NELEMS(sTilesetAnims_General_Water_Current_LandWatersEdge)], (u16 *)(BG_CHAR_ADDR(0) + TILE_OFFSET_4BPP(416)), 48 * TILE_SIZE_4BPP);
}

static void QueueAnimTiles_General_SandWatersEdge(u16 timer)
{
    AppendTilesetAnimToBuffer(sTilesetAnims_General_SandWatersEdge[timer % NELEMS(sTilesetAnims_General_SandWatersEdge)], (u16 *)(BG_CHAR_ADDR(0) + TILE_OFFSET_4BPP(464)), 18 * TILE_SIZE_4BPP);
}

static void TilesetAnim_General(u16 timer)
{
    if (timer % 8 == 0)
        QueueAnimTiles_General_SandWatersEdge(timer >> 3);
    if (timer % 16 == 1)
        QueueAnimTiles_General_Water_Current_LandWatersEdge(timer >> 4);
    if (timer % 16 == 2)
        QueueAnimTiles_General_Flower(timer >> 4);
}

void InitTilesetAnim_General(void)
{
    sPrimaryTilesetAnimCounter = 0;
    sPrimaryTilesetAnimCounterMax = 640;
    sPrimaryTilesetAnimCallback = TilesetAnim_General;
}

static void QueueAnimTiles_CeladonCity_Fountain(u16 timer)
{
    AppendTilesetAnimToBuffer(sTilesetAnims_CeladonCity_Fountain[timer % NELEMS(sTilesetAnims_CeladonCity_Fountain)], (u16 *)(BG_CHAR_ADDR(1) + TILE_OFFSET_4BPP(232)), 8 * TILE_SIZE_4BPP);
}

static void TilesetAnim_CeladonCity(u16 timer)
{
    if (timer % 12 == 0)
        QueueAnimTiles_CeladonCity_Fountain(timer / 12);
}

void InitTilesetAnim_CeladonCity(void)
{
    sSecondaryTilesetAnimCounter = 0;
    sSecondaryTilesetAnimCounterMax = 120;
    sSecondaryTilesetAnimCallback = TilesetAnim_CeladonCity;
}

static void QueueAnimTiles_SilphCo_Fountain(u16 timer)
{
    AppendTilesetAnimToBuffer(sTilesetAnims_SilphCo_Fountain[timer % NELEMS(sTilesetAnims_SilphCo_Fountain)], (u16 *)(BG_CHAR_ADDR(1) + TILE_OFFSET_4BPP(464)), 8 * TILE_SIZE_4BPP);
}

static void TilesetAnim_SilphCo(u16 timer)
{
    if (timer % 10 == 0)
        QueueAnimTiles_SilphCo_Fountain(timer / 10);
}

void InitTilesetAnim_SilphCo(void)
{
    sSecondaryTilesetAnimCounter = 0;
    sSecondaryTilesetAnimCounterMax = 160;
    sSecondaryTilesetAnimCallback = TilesetAnim_SilphCo;
}

static void QueueAnimTiles_MtEmber_Steam(u16 timer)
{
    AppendTilesetAnimToBuffer(sTilesetAnims_MtEmber_Steam[timer % NELEMS(sTilesetAnims_MtEmber_Steam)], (u16 *)(BG_CHAR_ADDR(1) + TILE_OFFSET_4BPP(384)), 8 * TILE_SIZE_4BPP);
}

static void TilesetAnim_MtEmber(u16 timer)
{
    if (timer % 16 == 0)
        QueueAnimTiles_MtEmber_Steam(timer >> 4);
}

void InitTilesetAnim_MtEmber(void)
{
    sSecondaryTilesetAnimCounter = 0;
    sSecondaryTilesetAnimCounterMax = 256;
    sSecondaryTilesetAnimCallback = TilesetAnim_MtEmber;
}

static void QueueAnimTiles_VermilionGym_MotorizedDoor(u16 timer)
{
    u16 i = timer % NELEMS(sTilesetAnims_VermilionGym_MotorizedDoor);

    AppendTilesetAnimToBuffer(sTilesetAnims_VermilionGym_MotorizedDoor[i], (u16 *)(BG_CHAR_ADDR(1) + TILE_OFFSET_4BPP(368)), 7 * TILE_SIZE_4BPP);
}

static void TilesetAnim_VermilionGym(u16 timer)
{
    if (timer % 2 == 0)
        QueueAnimTiles_VermilionGym_MotorizedDoor(timer >> 1);
}

void InitTilesetAnim_VermilionGym(void)
{
    sSecondaryTilesetAnimCounter = 0;
    sSecondaryTilesetAnimCounterMax = 240;
    sSecondaryTilesetAnimCallback = TilesetAnim_VermilionGym;
}

static void QueueAnimTiles_CeladonGym_Flowers(u16 timer)
{
    u16 i = timer % NELEMS(sTilesetAnims_CeladonGym_Flowers);
    
    AppendTilesetAnimToBuffer(sTilesetAnims_CeladonGym_Flowers[i], (u16 *)(BG_CHAR_ADDR(1) + TILE_OFFSET_4BPP(227)), 4 * TILE_SIZE_4BPP);
}

static void TilesetAnim_CeladonGym(u16 timer)
{
    if (timer % 16 == 0)
        QueueAnimTiles_CeladonGym_Flowers(timer >> 4);
}

void InitTilesetAnim_CeladonGym(void)
{
    sSecondaryTilesetAnimCounter = 0;
    sSecondaryTilesetAnimCounterMax = 256;
    sSecondaryTilesetAnimCallback = TilesetAnim_CeladonGym;
}
