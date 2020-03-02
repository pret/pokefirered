#include "global.h"
#include "palette.h"
#include "gpu_regs.h"
#include "scanline_effect.h"
#include "task.h"
#include "m4a.h"
#include "malloc.h"
#include "overworld.h"
#include "event_data.h"
#include "region_map.h"
#include "window.h"
#include "sound.h"
#include "party_menu.h"
#include "field_effect.h"
#include "new_menu_helpers.h"
#include "menu.h"
#include "string_util.h"
#include "strings.h"
#include "map_preview_screen.h"
#include "constants/flags.h"
#include "constants/songs.h"
#include "constants/region_map.h"
#include "constants/spawn_points.h"
#include "constants/maps.h"

#define FREE_IF_NOT_NULL(ptr) ({ \
    if (ptr) {                   \
        FREE_AND_SET_NULL(ptr);  \
    }                            \
})

struct UnkStruct_20399D4
{
    u8 field_0000[19];
    u8 field_0013[19];
    u16 layouts[5][600];
    // Inefficiency: these should be u8 or have half the elements each
    u16 bgTilemapBuffers[3][BG_SCREEN_SIZE];
    u8 mapType;
    bool8 regionMapPermissions[4];
    u8 field_479B;
    u8 field_479C;
    u8 ALIGNED(4) field_47A0;
    u8 ALIGNED(4) field_47A4;
    u8 ALIGNED(4) field_47A8;
    u16 field_47AA;
    u16 field_47AC;
    u16 field_47AE;
    u16 field_47B0;
    u8 filler_47B2[6];
    TaskFunc field_47B8;
    MainCallback savedCallback;
}; // size = 0x47C0

struct SelectionCursorSubspriteData
{
    u8 tiles[0x400];
    struct Sprite * sprite;
    u16 tileTag;
    u16 paletteTag;
    s16 xCoord;
};

struct UnkStruct_20399D8
{
    u8 bgTiles[0x1000];
    u16 tileMap[0x258];
    struct SelectionCursorSubspriteData selectionCursorSubspriteData[2];
    u8 field_1CC8;
    u8 selectionCursorLoadState;
    u8 field_1CCA;
    u8 field_1CCB;
    u8 field_1CCC;
    u8 field_1CCD;
    u16 field_1CCE;
    TaskFunc field_1CD0;
    u16 field_1CD4[4];
    u16 field_1CDC;
}; // size = 0x1CE0

struct GpuWindowParams
{
    u16 v0;
    u16 v2;
    u16 v4;
    u16 v6;
};

struct UnkStruct_83F1B3C
{
    u16 id;
    const u8 *name;
    const u8 *desc;
};

struct DungeonMapPreviewManagerStruct
{
    u16 tiles[0x1C20];
    u16 tilemap[0x280];
    const struct MapPreviewScreen * mapPreviewInfo;
    TaskFunc savedTask;
    u8 dungeonMapPreviewPrepState;
    u8 dungeonMapPreviewDrawState;
    u8 field_3D4A;
    u8 field_3D4B;
    u8 field_3D4C;
    u16 field_3D4E[0x30];
    u8 filler_3DAE[0x60];
    u16 field_3E0E;
    u16 field_3E10;
    u16 field_3E12;
    u16 field_3E14;
    u16 field_3E16;
    u16 field_3E18;
    u16 field_3E1A;
    u16 field_3E1C;
    u16 field_3E1E;
    u16 field_3E20;
    u16 field_3E22;
    u16 field_3E24;
}; // size = 0x3E28

struct UnkStruct_20399E0_000
{
    u16 field_000[0x200];
    struct Sprite * field_400;
    s16 field_404;
    s16 field_406;
    u16 field_408;
    u16 field_40A;
};

struct UnkStruct_20399E0
{
    struct UnkStruct_20399E0_000 * field_000[6];
    u16 field_018[0x400];
    u16 field_818[0x258];
    TaskFunc field_CC8;
    u8 field_CCC;
    u8 field_CCD;
    u8 field_CCE;
    u8 field_CCF;
    u8 field_CD0;
}; // size = 0xCD4

struct UnkStruct_20399E4
{
    s16 field_000;
    s16 field_002;
    u16 field_004;
    u16 field_006;
    s16 field_008;
    s16 field_00A;
    u16 field_00C;
    u8 field_00E;
    u8 (*field_010)(void);
    u16 field_014;
    u16 field_016;
    u16 field_018;
    struct Sprite * field_01C;
    u16 field_020;
    u16 field_022;
    u16 field_024[0x80];
}; // size = 0x124

struct UnkStruct_20399E8
{
    s16 field_00;
    s16 field_02;
    struct Sprite * field_04;
    u16 field_08;
    u16 field_0A;
    u16 field_0C[0x40];
}; // size = 0x8C

struct UnkStruct_20399EC_140
{
    u8 filler_0[4];
    u8 field_4;
    struct Sprite * field_8;
    u16 field_C;
    u16 field_E;
};

struct UnkStruct_20399EC
{
    u8 field_000[0x40];
    u8 field_040[0x100];
    struct UnkStruct_20399EC_140 field_140[25];
    struct UnkStruct_20399EC_140 field_2D0[25];
    u8 field_460;
    u8 filler_461[2];
    u8 field_463;
    u8 filler_464[4];
    TaskFunc field_468;
}; // size = 0x46C

struct UnkStruct_20399F0
{
    u16 bldcnt;
    u16 bldy;
    u16 bldalpha;
    u16 winin;
    u16 winout;
    u16 win0h;
    u16 win1h;
    u16 win0v;
    u16 win1v;
};

struct UnkStruct_20399FC
{
    u8 field_0;
    u8 field_1;
    u8 field_2;
};

static EWRAM_DATA struct UnkStruct_20399D4 * gUnknown_20399D4 = NULL;
static EWRAM_DATA struct UnkStruct_20399D8 * gUnknown_20399D8 = NULL;
static EWRAM_DATA struct DungeonMapPreviewManagerStruct * sDungeonMapPreviewManager = NULL;
static EWRAM_DATA struct UnkStruct_20399E0 * gUnknown_20399E0 = NULL;
static EWRAM_DATA struct UnkStruct_20399E4 * gUnknown_20399E4 = NULL;
static EWRAM_DATA struct UnkStruct_20399E8 * gUnknown_20399E8 = NULL;
static EWRAM_DATA struct UnkStruct_20399EC * gUnknown_20399EC = NULL;
static EWRAM_DATA struct UnkStruct_20399F0 * gUnknown_20399F0[3] = {};
static EWRAM_DATA struct UnkStruct_20399FC * gUnknown_20399FC = NULL;

static void sub_80BFFD0(void);
static void CB2_OpenRegionMap(void);
static bool8 HandleLoadRegionMapGfx(void);
static void sub_80C03E8(void);
static void sub_80C04E4(u8 taskId);
static void sub_80C07F8(u8 taskId);
static void sub_80C0820(u8 taskId);
static void sub_80C08B4(void);
static void NullVBlankHBlankCallbacks(void);
static void sub_80C08F4(void);
static void ResetGpu(void);
static void SetBgTilemapBuffers(void);
static void ResetOamForRegionMap(void);
static void SetBg0andBg3Visibility(u8 a0);
static void sub_80C0AB8(void);
static void sub_80C0B18(void);
static void sub_80C0B9C(void);
static void sub_80C0BB0(void);
static void sub_80C0CC8(u8 bg, u16 *map);
static bool8 GetRegionMapPermission(u8 a0);
static u8 GetWhichRegionMap(void);
static void sub_80C0E70(u8 a0, u8 taskId, TaskFunc taskFunc);
static void sub_80C1098(u8 taskId);
static void sub_80C1280(u8 taskId);
static bool8 sub_80C12EC(void);
static void sub_80C1324(u8 bg, u16 *map);
static void sub_80C1390(void);
static bool8 sub_80C144C(void);
static bool8 sub_80C1478(void);
static bool8 LoadAndCreateSelectionCursorSpriteGfx(void);
static void CreateSelectionCursorSubsprite(u8 whichSprite, u16 tileTag, u16 paletteTag);
static void RealCreateSelectionCursorSubsprite(u8 whichSprite, u16 tileTag, u16 paletteTag);
static void DestroySelectionCursorSprites(void);
static void RegionMapCreateDungeonMapPreview(u8 a0, u8 taskId, TaskFunc taskFunc);
static void Task_PrepDungeonMapPreviewAndFlavorText(u8 taskId);
static void Task_DrawDungeonMapPreviewAndFlavorText(u8 taskId);
static void DestroyMapPreviewAssets(u8 taskId);
static void sub_80C1E94(void);
static void CopyMapPreviewTilemapToBgTilemapBuffer(u8 bgId, const u16 * tilemap);
static bool8 sub_80C1F80(bool8 a0);
static void sub_80C2208(u8 taskId, TaskFunc taskFunc);
static void sub_80C24BC(void);
static void sub_80C267C(u8 taskId);
static void sub_80C25BC(void);
static void sub_80C2604(void);
static bool8 sub_80C29A4(void);
static void sub_80C2B48(void);
static void sub_80C2C1C(u8 taskId);
static void sub_80C2C7C(u8 taskId);
static bool8 sub_80C2E1C(void);
static void sub_80C3008(u16 a0, u16 a1);
static void sub_80C309C(void);
static void sub_80C3154(bool8 a0);
static void sub_80C3178(void);
static void sub_80C3188(void);
static u8 sub_80C31C0(void);
static u8 sub_80C3348(void);
static u8 sub_80C3400(void);
static void sub_80C3418(void);
static u16 GetMapCursorX(void);
static u16 GetMapCursorY(void);
static u16 sub_80C3520(void);
static u16 GetMapSecUnderCursor(void);
static u8 sub_80C35DC(u8 a0);
static u8 sub_80C3878(u8 a0);
static u8 sub_80C3AC8(u8 a0);
static void GetPlayerPositionOnRegionMap_HandleOverrides(void);
static u8 GetSelectedMapSection(u8 a0, u8 a1, s16 a2, s16 a3);
static void sub_80C41D8(u16 a0, u16 a1);
static void sub_80C4244(void);
static void sub_80C4324(bool8 a0);
static void sub_80C4348(void);
static u16 sub_80C4380(void);
static u16 sub_80C438C(void);
static void sub_80C4398(u8 a0, u8 taskId, TaskFunc taskFunc);
static void sub_80C440C(u8 taskId);
static void sub_80C44E4(u8 taskId);
static void sub_80C4750(void);
static void sub_80C47F0(void);
static void sub_80C48BC(u8 a0, u8 a1, bool8 a2);
static void sub_80C4960(u8 a0, u8 a1, bool8 a2);
static void sub_80C4A04(void);
static bool8 sub_80C4AAC(u8 a0);
static bool8 sub_80C4B30(u8 a0);
static void sub_80C4BE4(void);
static void sub_80C4C2C(u8 a0, u16 a1, u16 a2);
static void sub_80C4C48(u16 a0);
static void sub_80C4C5C(u16 a0, u16 a1);
static void sub_80C4C74(u16 a0, u16 a1);
static void sub_80C4C88(u16 a0);
static void sub_80C4C9C(u8 a0, u8 a1);
static void SetGpuWindowDims(u8 a0, const struct GpuWindowParams *a1);
static void sub_80C4D30(void);
static void sub_80C4E18(const u8 *str);
static void sub_80C4E74(const u8 *str);
static void sub_80C4ED0(bool8 a0);
static void sub_80C4F08(u8 taskId);
static void sub_80C51E8(void);
static void sub_80C5208(u8 taskId);
static void sub_80C527C(u16 a0);

#include "data/text/map_section_names.h"

static const u16 gUnknown_83EF23C[] = INCBIN_U16("graphics/region_map/unk_83EF23C.gbapal");
static const u16 gUnknown_83EF25C[] = INCBIN_U16("graphics/region_map/unk_83EF25C.gbapal");
static const u16 gUnknown_83EF27C[] = INCBIN_U16("graphics/region_map/unk_83EF27C.gbapal");
static const u16 gUnknown_83EF29C[] = INCBIN_U16("graphics/region_map/unk_83EF29C.gbapal");
static const u16 gUnknown_83EF2BC[] = INCBIN_U16("graphics/region_map/unk_83EF2BC.gbapal");
static const u16 gUnknown_83EF2DC[] = INCBIN_U16("graphics/region_map/unk_83EF2DC.gbapal");
static const u16 unref_83EF37C[] = {
    RGB(0, 0, 31),
    RGB(0, 12, 31),
    RGB_WHITE,
    RGB_WHITE
};
static const u16 sSelectionCursorPals[] = INCBIN_U16("graphics/region_map/unk_83EF384.gbapal");
static const u16 gUnknown_83EF3A4[] = INCBIN_U16("graphics/region_map/unk_83EF3A4.gbapal");
static const u32 sSelectionCursorLeftTiles[] = INCBIN_U32("graphics/region_map/unk_83EF3C4.4bpp.lz");
static const u32 sSelectionCursorRightTiles[] = INCBIN_U32("graphics/region_map/unk_83EF450.4bpp.lz");
static const u32 gUnknown_83EF4E0[] = INCBIN_U32("graphics/region_map/unk_83EF4E0.4bpp.lz");
static const u32 gUnknown_83EF524[] = INCBIN_U32("graphics/region_map/unk_83EF524.4bpp.lz");
static const u32 gUnknown_83EF59C[] = INCBIN_U32("graphics/region_map/unk_83EF59C.4bpp.lz");
static const u32 gUnknown_83EF61C[] = INCBIN_U32("graphics/region_map/unk_83EF61C.4bpp.lz");
static const u32 gUnknown_83F0330[] = INCBIN_U32("graphics/region_map/unk_83F0330.4bpp.lz");
static const u32 gUnknown_83F0580[] = INCBIN_U32("graphics/region_map/unk_83F0580.bin.lz");
static const u32 sRegionMapLayout_Kanto[] = INCBIN_U32("graphics/region_map/unk_83F089C.bin.lz");
static const u32 sRegionMapLayout_Sevii123[] = INCBIN_U32("graphics/region_map/unk_83F0AFC.bin.lz");
static const u32 sRegionMapLayout_Sevii45[] = INCBIN_U32("graphics/region_map/unk_83F0C0C.bin.lz");
static const u32 sRegionMapLayout_Sevii67[] = INCBIN_U32("graphics/region_map/unk_83F0CF0.bin.lz");
static const u32 gUnknown_83F0E0C[] = INCBIN_U32("graphics/region_map/unk_83F0E0C.bin.lz");
static const u32 gUnknown_83F0F1C[] = INCBIN_U32("graphics/region_map/unk_83F0F1C.bin.lz");
static const u32 gUnknown_83F1084[] = INCBIN_U32("graphics/region_map/unk_83F1084.bin.lz");
static const u32 gUnknown_83F1190[] = INCBIN_U32("graphics/region_map/unk_83F1190.bin.lz");
static const u32 gUnknown_83F12CC[] = INCBIN_U32("graphics/region_map/unk_83F12CC.4bpp.lz");
static const u32 gUnknown_83F13EC[] = INCBIN_U32("graphics/region_map/unk_83F13EC.4bpp.lz");
static const u32 gUnknown_83F1550[] = INCBIN_U32("graphics/region_map/unk_83F1550.4bpp.lz");
static const u32 gUnknown_83F1640[] = INCBIN_U32("graphics/region_map/unk_83F1640.4bpp.lz");
static const u32 gUnknown_83F1738[] = INCBIN_U32("graphics/region_map/unk_83F1738.4bpp.lz");
static const u32 gUnknown_83F1804[] = INCBIN_U32("graphics/region_map/unk_83F1804.4bpp.lz");
static const u32 gUnknown_83F18D8[] = INCBIN_U32("graphics/region_map/unk_83F18D8.4bpp.lz");
static const u32 gUnknown_83F1908[] = INCBIN_U32("graphics/region_map/unk_83F1908.4bpp.lz");
static const u32 gUnknown_83F1978[] = INCBIN_U32("graphics/region_map/unk_83F1978.4bpp.lz");
static const u32 gUnknown_83F19A0[] = INCBIN_U32("graphics/region_map/unk_83F19A0.bin.lz");

static const struct BgTemplate gUnknown_83F1A50[] = {
    {
        .bg = 0,
        .charBaseIndex = 0,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x000
    }, {
        .bg = 1,
        .charBaseIndex = 1,
        .mapBaseIndex = 15,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0x000
    }, {
        .bg = 2,
        .charBaseIndex = 2,
        .mapBaseIndex = 23,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0x000
    }, {
        .bg = 3,
        .charBaseIndex = 3,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }
};

static const struct WindowTemplate gUnknown_83F1A60[] = {
    {
        .bg = 3,
        .tilemapLeft = 3,
        .tilemapTop = 2,
        .width = 15,
        .height = 2,
        .paletteNum = 12,
        .baseBlock = 0x001
    }, {
        .bg = 3,
        .tilemapLeft = 3,
        .tilemapTop = 4,
        .width = 15,
        .height = 2,
        .paletteNum = 12,
        .baseBlock = 0x01f
    }, {
        .bg = 3,
        .tilemapLeft = 3,
        .tilemapTop = 6,
        .width = 25,
        .height = 11,
        .paletteNum = 12,
        .baseBlock = 0x03d
    }, {
        .bg = 3,
        .tilemapLeft = 18,
        .tilemapTop = 0,
        .width = 5,
        .height = 2,
        .paletteNum = 12,
        .baseBlock = 0x150
    }, {
        .bg = 3,
        .tilemapLeft = 24,
        .tilemapTop = 0,
        .width = 5,
        .height = 2,
        .paletteNum = 12,
        .baseBlock = 0x15a
    }, DUMMY_WIN_TEMPLATE
};

ALIGNED(4) const u8 sTextColor_White[] = {0, 1, 2};
ALIGNED(4) const u8 sTextColor_Green[] = {0, 7, 2};
ALIGNED(4) const u8 gUnknown_83F1A98[] = {0, 10, 2};

static const u8 *const gUnknown_83F1A9C[] = {
    sTextColor_Green,
    gUnknown_83F1A98
};

static const u8 sSeviiMapsecs[3][30] = {
    {
        MAPSEC_ONE_ISLAND,
        MAPSEC_TWO_ISLAND,
        MAPSEC_THREE_ISLAND,
        MAPSEC_KINDLE_ROAD,
        MAPSEC_TREASURE_BEACH,
        MAPSEC_CAPE_BRINK,
        MAPSEC_BOND_BRIDGE,
        MAPSEC_THREE_ISLE_PORT,
        MAPSEC_MT_EMBER,
        MAPSEC_BERRY_FOREST,
        MAPSEC_THREE_ISLE_PATH,
        MAPSEC_EMBER_SPA,
        MAPSEC_NONE
    }, {
        MAPSEC_FOUR_ISLAND,
        MAPSEC_FIVE_ISLAND,
        MAPSEC_SEVII_ISLE_6,
        MAPSEC_SEVII_ISLE_7,
        MAPSEC_SEVII_ISLE_8,
        MAPSEC_SEVII_ISLE_9,
        MAPSEC_RESORT_GORGEOUS,
        MAPSEC_WATER_LABYRINTH,
        MAPSEC_FIVE_ISLE_MEADOW,
        MAPSEC_MEMORIAL_PILLAR,
        MAPSEC_NAVEL_ROCK,
        MAPSEC_ICEFALL_CAVE,
        MAPSEC_ROCKET_WAREHOUSE,
        MAPSEC_LOST_CAVE,
        MAPSEC_NONE
    }, {
        MAPSEC_SEVEN_ISLAND,
        MAPSEC_SIX_ISLAND,
        MAPSEC_OUTCAST_ISLAND,
        MAPSEC_GREEN_PATH,
        MAPSEC_WATER_PATH,
        MAPSEC_RUIN_VALLEY,
        MAPSEC_TRAINER_TOWER,
        MAPSEC_CANYON_ENTRANCE,
        MAPSEC_SEVAULT_CANYON,
        MAPSEC_TANOBY_RUINS,
        MAPSEC_SEVII_ISLE_22,
        MAPSEC_SEVII_ISLE_23,
        MAPSEC_SEVII_ISLE_24,
        MAPSEC_TRAINER_TOWER_2,
        MAPSEC_DOTTED_HOLE,
        MAPSEC_PATTERN_BUSH,
        MAPSEC_ALTERING_CAVE,
        MAPSEC_TANOBY_CHAMBERS,
        MAPSEC_TANOBY_KEY,
        MAPSEC_BIRTH_ISLAND,
        MAPSEC_MONEAN_CHAMBER,
        MAPSEC_LIPTOO_CHAMBER,
        MAPSEC_WEEPTH_CHAMBER,
        MAPSEC_DILFORD_CHAMBER,
        MAPSEC_SCUFIB_CHAMBER,
        MAPSEC_RIXY_CHAMBER,
        MAPSEC_VIAPOIS_CHAMBER,
        MAPSEC_NONE
    }
};

ALIGNED(4) const bool8 sRegionMapPermissions[3][4] = {
    {TRUE , TRUE , TRUE , FALSE},
    {FALSE, FALSE, FALSE, FALSE},
    {FALSE, FALSE, FALSE, TRUE }
};

static const struct GpuWindowParams sStdWindowDims[3] = {
    {0x18, 0x10, 0x90, 0x20},
    {0x18, 0x20, 0x90, 0x30},
    {0x00, 0x00, 0x00, 0x00}
};

static const struct OamData sSelectionCursorOam = {
    .shape = SPRITE_SHAPE(32x32),
    .size = SPRITE_SIZE(32x32)
};

static const union AnimCmd gUnknown_83F1B2C[] = {
    ANIMCMD_FRAME(0x00, 20),
    ANIMCMD_FRAME(0x10, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const sSelectionCursorAnims[] = {
    gUnknown_83F1B2C
};

static const struct UnkStruct_83F1B3C sDungeonHighlights[] = {
    {
        .id = MAPSEC_VIRIDIAN_FOREST,
        .name = gMapSecName_ViridianForest,
        .desc = gText_RegionMap_AreaDesc_ViridianForest
    }, {
        .id = MAPSEC_MT_MOON,
        .name = gMapSecName_MtMoon,
        .desc = gText_RegionMap_AreaDesc_MtMoon
    }, {
        .id = MAPSEC_DIGLETTS_CAVE,
        .name = gMapSecName_DiglettsCave,
        .desc = gText_RegionMap_AreaDesc_DiglettsCave
    }, {
        .id = MAPSEC_KANTO_VICTORY_ROAD,
        .name = gMapSecName_VictoryRoad,
        .desc = gText_RegionMap_AreaDesc_VictoryRoad
    }, {
        .id = MAPSEC_POKEMON_MANSION,
        .name = gMapSecName_PokemonMansion,
        .desc = gText_RegionMap_AreaDesc_PokemonMansion
    }, {
        .id = MAPSEC_KANTO_SAFARI_ZONE,
        .name = gMapSecName_SafariZone,
        .desc = gText_RegionMap_AreaDesc_SafariZone
    }, {
        .id = MAPSEC_ROCK_TUNNEL,
        .name = gMapSecName_RockTunnel,
        .desc = gText_RegionMap_AreaDesc_RockTunnel
    }, {
        .id = MAPSEC_SEAFOAM_ISLANDS,
        .name = gMapSecName_SeafoamIslands,
        .desc = gText_RegionMap_AreaDesc_SeafoamIslands
    }, {
        .id = MAPSEC_POKEMON_TOWER,
        .name = gMapSecName_PokemonTower,
        .desc = gText_RegionMap_AreaDesc_PokemonTower
    }, {
        .id = MAPSEC_CERULEAN_CAVE,
        .name = gMapSecName_CeruleanCave,
        .desc = gText_RegionMap_AreaDesc_CeruleanCave
    }, {
        .id = MAPSEC_POWER_PLANT,
        .name = gMapSecName_PowerPlant,
        .desc = gText_RegionMap_AreaDesc_PowerPlant
    }, {
        .id = MAPSEC_MT_EMBER,
        .name = gMapSecName_MtEmber,
        .desc = gText_RegionMap_AreaDesc_MtEmber
    }, {
        .id = MAPSEC_BERRY_FOREST,
        .name = gMapSecName_BerryForest,
        .desc = gText_RegionMap_AreaDesc_BerryForest
    }, {
        .id = MAPSEC_ICEFALL_CAVE,
        .name = gMapSecName_IcefallCave,
        .desc = gText_RegionMap_AreaDesc_IcefallCave
    }, {
        .id = MAPSEC_LOST_CAVE,
        .name = gMapSecName_LostCave,
        .desc = gText_RegionMap_AreaDesc_LostCave
    }, {
        .id = MAPSEC_TANOBY_CHAMBERS,
        .name = gMapSecName_TanobyChambers,
        .desc = gText_RegionMap_AreaDesc_TanobyRuins
    }, {
        .id = MAPSEC_ALTERING_CAVE,
        .name = gMapSecName_AlteringCave,
        .desc = gText_RegionMap_AreaDesc_AlteringCave
    }, {
        .id = MAPSEC_PATTERN_BUSH,
        .name = gMapSecName_PatternBush,
        .desc = gText_RegionMap_AreaDesc_PatternBush
    }, {
        .id = MAPSEC_DOTTED_HOLE,
        .name = gMapSecName_DottedHole,
        .desc = gText_RegionMap_AreaDesc_DottedHole
    }
};

static const struct OamData gUnknown_83F1C20 = {
    .shape = SPRITE_SHAPE(32x64),
    .size = SPRITE_SIZE(32x64)
};

static const union AnimCmd gAnimCmd_83F1C28[] = {
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const gUnknown_83F1C30[] = {
    gAnimCmd_83F1C28
};

static const struct GpuWindowParams gUnknown_83F1C34 = {
    0x18, 0x10, 0xD8, 0xA0
};

static const struct OamData gUnknown_83F1C3C = {
    .shape = SPRITE_SHAPE(16x16),
    .size = SPRITE_SIZE(16x16),
    .priority = 2
};

static const union AnimCmd gAnimCmd_83F1C44[] = {
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_FRAME(4, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const gUnknown_83F1C50[] = {
    gAnimCmd_83F1C44
};

static const struct OamData gUnknown_83F1C54 = {
    .shape = SPRITE_SHAPE(16x16),
    .size = SPRITE_SIZE(16x16),
    .priority = 2
};

static const union AnimCmd gAnimCmd_83F1C5C[] = {
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

static const union AnimCmd *const gUnknown_83F1C64[] = {
    gAnimCmd_83F1C5C
};

static const struct OamData gUnknown_83F1C68 = {
    .shape = SPRITE_SHAPE(16x16),
    .size = SPRITE_SIZE(16x16),
    .priority = 2
};

static const struct OamData gUnknown_83F1C70 = {
    .shape = SPRITE_SHAPE(8x8),
    .size = SPRITE_SIZE(8x8),
    .priority = 2
};

static const union AnimCmd gAnimCmd_83F1C78[] = {
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_FRAME(4, 60),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd gAnimCmd_83F1C84[] = {
    ANIMCMD_FRAME(1, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd gAnimCmd_83F1C8C[] = {
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const gUnknown_83F1C94[] = {
    gAnimCmd_83F1C78
};

static const union AnimCmd *const gUnknown_83F1C98[] = {
    gAnimCmd_83F1C84,
    gAnimCmd_83F1C8C
};

static const u16 sWinFlags[] = {
    DISPCNT_WIN0_ON,
    DISPCNT_WIN1_ON
};

static const u8 sWinRegs[][2] = {
    {REG_OFFSET_WIN0V, REG_OFFSET_WIN0H},
    {REG_OFFSET_WIN1V, REG_OFFSET_WIN1H}
};

static const u8 gUnknown_83F1CA8[] = {15, 1, 2};

static const u8 *const sMapNames[] = {
    [MAPSEC_PALLET_TOWN        - MAPSECS_KANTO] = gMapSecName_PalletTown,
    [MAPSEC_VIRIDIAN_CITY      - MAPSECS_KANTO] = gMapSecName_ViridianCity,
    [MAPSEC_PEWTER_CITY        - MAPSECS_KANTO] = gMapSecName_PewterCity,
    [MAPSEC_CERULEAN_CITY      - MAPSECS_KANTO] = gMapSecName_CeruleanCity,
    [MAPSEC_LAVENDER_TOWN      - MAPSECS_KANTO] = gMapSecName_LavenderTown,
    [MAPSEC_VERMILION_CITY     - MAPSECS_KANTO] = gMapSecName_VermilionCity,
    [MAPSEC_CELADON_CITY       - MAPSECS_KANTO] = gMapSecName_CeladonCity,
    [MAPSEC_FUCHSIA_CITY       - MAPSECS_KANTO] = gMapSecName_FuchsiaCity,
    [MAPSEC_CINNABAR_ISLAND    - MAPSECS_KANTO] = gMapSecName_CinnabarIsland,
    [MAPSEC_INDIGO_PLATEAU     - MAPSECS_KANTO] = gMapSecName_IndigoPlateau,
    [MAPSEC_SAFFRON_CITY       - MAPSECS_KANTO] = gMapSecName_SaffronCity,
    [MAPSEC_ROUTE_4_FLYDUP     - MAPSECS_KANTO] = gMapSecName_Route4,
    [MAPSEC_ROUTE_10_FLYDUP    - MAPSECS_KANTO] = gMapSecName_Route10,
    [MAPSEC_ROUTE_1            - MAPSECS_KANTO] = gMapSecName_Route1,
    [MAPSEC_ROUTE_2            - MAPSECS_KANTO] = gMapSecName_Route2,
    [MAPSEC_ROUTE_3            - MAPSECS_KANTO] = gMapSecName_Route3,
    [MAPSEC_ROUTE_4            - MAPSECS_KANTO] = gMapSecName_Route4_2,
    [MAPSEC_ROUTE_5            - MAPSECS_KANTO] = gMapSecName_Route5,
    [MAPSEC_ROUTE_6            - MAPSECS_KANTO] = gMapSecName_Route6,
    [MAPSEC_ROUTE_7            - MAPSECS_KANTO] = gMapSecName_Route7,
    [MAPSEC_ROUTE_8            - MAPSECS_KANTO] = gMapSecName_Route8,
    [MAPSEC_ROUTE_9            - MAPSECS_KANTO] = gMapSecName_Route9,
    [MAPSEC_ROUTE_10           - MAPSECS_KANTO] = gMapSecName_Route10_2,
    [MAPSEC_ROUTE_11           - MAPSECS_KANTO] = gMapSecName_Route11,
    [MAPSEC_ROUTE_12           - MAPSECS_KANTO] = gMapSecName_Route12,
    [MAPSEC_ROUTE_13           - MAPSECS_KANTO] = gMapSecName_Route13,
    [MAPSEC_ROUTE_14           - MAPSECS_KANTO] = gMapSecName_Route14,
    [MAPSEC_ROUTE_15           - MAPSECS_KANTO] = gMapSecName_Route15,
    [MAPSEC_ROUTE_16           - MAPSECS_KANTO] = gMapSecName_Route16,
    [MAPSEC_ROUTE_17           - MAPSECS_KANTO] = gMapSecName_Route17,
    [MAPSEC_ROUTE_18           - MAPSECS_KANTO] = gMapSecName_Route18,
    [MAPSEC_ROUTE_19           - MAPSECS_KANTO] = gMapSecName_Route19,
    [MAPSEC_ROUTE_20           - MAPSECS_KANTO] = gMapSecName_Route20,
    [MAPSEC_ROUTE_21           - MAPSECS_KANTO] = gMapSecName_Route21,
    [MAPSEC_ROUTE_22           - MAPSECS_KANTO] = gMapSecName_Route22,
    [MAPSEC_ROUTE_23           - MAPSECS_KANTO] = gMapSecName_Route23,
    [MAPSEC_ROUTE_24           - MAPSECS_KANTO] = gMapSecName_Route24,
    [MAPSEC_ROUTE_25           - MAPSECS_KANTO] = gMapSecName_Route25,
    [MAPSEC_VIRIDIAN_FOREST    - MAPSECS_KANTO] = gMapSecName_ViridianForest,
    [MAPSEC_MT_MOON            - MAPSECS_KANTO] = gMapSecName_MtMoon,
    [MAPSEC_S_S_ANNE           - MAPSECS_KANTO] = gMapSecName_SSAnne,
    [MAPSEC_UNDERGROUND_PATH   - MAPSECS_KANTO] = gMapSecName_UndergroundPath,
    [MAPSEC_UNDERGROUND_PATH_2 - MAPSECS_KANTO] = gMapSecName_UndergroundPath_2,
    [MAPSEC_DIGLETTS_CAVE      - MAPSECS_KANTO] = gMapSecName_DiglettsCave,
    [MAPSEC_KANTO_VICTORY_ROAD - MAPSECS_KANTO] = gMapSecName_VictoryRoad,
    [MAPSEC_ROCKET_HIDEOUT     - MAPSECS_KANTO] = gMapSecName_RocketHideout,
    [MAPSEC_SILPH_CO           - MAPSECS_KANTO] = gMapSecName_SilphCo,
    [MAPSEC_POKEMON_MANSION    - MAPSECS_KANTO] = gMapSecName_PokemonMansion,
    [MAPSEC_KANTO_SAFARI_ZONE  - MAPSECS_KANTO] = gMapSecName_SafariZone,
    [MAPSEC_POKEMON_LEAGUE     - MAPSECS_KANTO] = gMapSecName_PokemonLeague,
    [MAPSEC_ROCK_TUNNEL        - MAPSECS_KANTO] = gMapSecName_RockTunnel,
    [MAPSEC_SEAFOAM_ISLANDS    - MAPSECS_KANTO] = gMapSecName_SeafoamIslands,
    [MAPSEC_POKEMON_TOWER      - MAPSECS_KANTO] = gMapSecName_PokemonTower,
    [MAPSEC_CERULEAN_CAVE      - MAPSECS_KANTO] = gMapSecName_CeruleanCave,
    [MAPSEC_POWER_PLANT        - MAPSECS_KANTO] = gMapSecName_PowerPlant,
    [MAPSEC_ONE_ISLAND         - MAPSECS_KANTO] = gMapSecName_OneIsland,
    [MAPSEC_TWO_ISLAND         - MAPSECS_KANTO] = gMapSecName_TwoIsland,
    [MAPSEC_THREE_ISLAND       - MAPSECS_KANTO] = gMapSecName_ThreeIsland,
    [MAPSEC_FOUR_ISLAND        - MAPSECS_KANTO] = gMapSecName_FourIsland,
    [MAPSEC_FIVE_ISLAND        - MAPSECS_KANTO] = gMapSecName_FiveIsland,
    [MAPSEC_SEVEN_ISLAND       - MAPSECS_KANTO] = gMapSecName_SevenIsland,
    [MAPSEC_SIX_ISLAND         - MAPSECS_KANTO] = gMapSecName_SixIsland,
    [MAPSEC_KINDLE_ROAD        - MAPSECS_KANTO] = gMapSecName_KindleRoad,
    [MAPSEC_TREASURE_BEACH     - MAPSECS_KANTO] = gMapSecName_TreasureBeach,
    [MAPSEC_CAPE_BRINK         - MAPSECS_KANTO] = gMapSecName_CapeBrink,
    [MAPSEC_BOND_BRIDGE        - MAPSECS_KANTO] = gMapSecName_BondBridge,
    [MAPSEC_THREE_ISLE_PORT    - MAPSECS_KANTO] = gMapSecName_ThreeIslePort,
    [MAPSEC_SEVII_ISLE_6       - MAPSECS_KANTO] = gMapSecName_SeviiIsle6,
    [MAPSEC_SEVII_ISLE_7       - MAPSECS_KANTO] = gMapSecName_SeviiIsle7,
    [MAPSEC_SEVII_ISLE_8       - MAPSECS_KANTO] = gMapSecName_SeviiIsle8,
    [MAPSEC_SEVII_ISLE_9       - MAPSECS_KANTO] = gMapSecName_SeviiIsle9,
    [MAPSEC_RESORT_GORGEOUS    - MAPSECS_KANTO] = gMapSecName_ResortGorgeous,
    [MAPSEC_WATER_LABYRINTH    - MAPSECS_KANTO] = gMapSecName_WaterLabyrinth,
    [MAPSEC_FIVE_ISLE_MEADOW   - MAPSECS_KANTO] = gMapSecName_FiveIsleMeadow,
    [MAPSEC_MEMORIAL_PILLAR    - MAPSECS_KANTO] = gMapSecName_MemorialPillar,
    [MAPSEC_OUTCAST_ISLAND     - MAPSECS_KANTO] = gMapSecName_OutcastIsland,
    [MAPSEC_GREEN_PATH         - MAPSECS_KANTO] = gMapSecName_GreenPath,
    [MAPSEC_WATER_PATH         - MAPSECS_KANTO] = gMapSecName_WaterPath,
    [MAPSEC_RUIN_VALLEY        - MAPSECS_KANTO] = gMapSecName_RuinValley,
    [MAPSEC_TRAINER_TOWER      - MAPSECS_KANTO] = gMapSecName_TrainerTower,
    [MAPSEC_CANYON_ENTRANCE    - MAPSECS_KANTO] = gMapSecName_CanyonEntrance,
    [MAPSEC_SEVAULT_CANYON     - MAPSECS_KANTO] = gMapSecName_SevaultCanyon,
    [MAPSEC_TANOBY_RUINS       - MAPSECS_KANTO] = gMapSecName_TanobyRuins,
    [MAPSEC_SEVII_ISLE_22      - MAPSECS_KANTO] = gMapSecName_SeviiIsle22,
    [MAPSEC_SEVII_ISLE_23      - MAPSECS_KANTO] = gMapSecName_SeviiIsle23,
    [MAPSEC_SEVII_ISLE_24      - MAPSECS_KANTO] = gMapSecName_SeviiIsle24,
    [MAPSEC_NAVEL_ROCK         - MAPSECS_KANTO] = gMapSecName_NavelRock,
    [MAPSEC_MT_EMBER           - MAPSECS_KANTO] = gMapSecName_MtEmber,
    [MAPSEC_BERRY_FOREST       - MAPSECS_KANTO] = gMapSecName_BerryForest,
    [MAPSEC_ICEFALL_CAVE       - MAPSECS_KANTO] = gMapSecName_IcefallCave,
    [MAPSEC_ROCKET_WAREHOUSE   - MAPSECS_KANTO] = gMapSecName_RocketWarehouse,
    [MAPSEC_TRAINER_TOWER_2    - MAPSECS_KANTO] = gMapSecName_TrainerTower_2,
    [MAPSEC_DOTTED_HOLE        - MAPSECS_KANTO] = gMapSecName_DottedHole,
    [MAPSEC_LOST_CAVE          - MAPSECS_KANTO] = gMapSecName_LostCave,
    [MAPSEC_PATTERN_BUSH       - MAPSECS_KANTO] = gMapSecName_PatternBush,
    [MAPSEC_ALTERING_CAVE      - MAPSECS_KANTO] = gMapSecName_AlteringCave,
    [MAPSEC_TANOBY_CHAMBERS    - MAPSECS_KANTO] = gMapSecName_TanobyChambers,
    [MAPSEC_THREE_ISLE_PATH    - MAPSECS_KANTO] = gMapSecName_ThreeIslePath,
    [MAPSEC_TANOBY_KEY         - MAPSECS_KANTO] = gMapSecName_TanobyKey,
    [MAPSEC_BIRTH_ISLAND       - MAPSECS_KANTO] = gMapSecName_BirthIsland,
    [MAPSEC_MONEAN_CHAMBER     - MAPSECS_KANTO] = gMapSecName_MoneanChamber,
    [MAPSEC_LIPTOO_CHAMBER     - MAPSECS_KANTO] = gMapSecName_LiptooChamber,
    [MAPSEC_WEEPTH_CHAMBER     - MAPSECS_KANTO] = gMapSecName_WeepthChamber,
    [MAPSEC_DILFORD_CHAMBER    - MAPSECS_KANTO] = gMapSecName_DilfordChamber,
    [MAPSEC_SCUFIB_CHAMBER     - MAPSECS_KANTO] = gMapSecName_ScufibChamber,
    [MAPSEC_RIXY_CHAMBER       - MAPSECS_KANTO] = gMapSecName_RixyChamber,
    [MAPSEC_VIAPOIS_CHAMBER    - MAPSECS_KANTO] = gMapSecName_ViapoisChamber,
    [MAPSEC_EMBER_SPA          - MAPSECS_KANTO] = gMapSecName_EmberSpa,
    [MAPSEC_SPECIAL_AREA       - MAPSECS_KANTO] = gMapSecName_CeladonDept
};

static const u16 sMapSectionTopLeftCorners[0xC6][2] = {
    [MAPSEC_PALLET_TOWN        - MAPSECS_KANTO] = {0x04, 0x0b},
    [MAPSEC_VIRIDIAN_CITY      - MAPSECS_KANTO] = {0x04, 0x08},
    [MAPSEC_PEWTER_CITY        - MAPSECS_KANTO] = {0x04, 0x04},
    [MAPSEC_CERULEAN_CITY      - MAPSECS_KANTO] = {0x0e, 0x03},
    [MAPSEC_LAVENDER_TOWN      - MAPSECS_KANTO] = {0x12, 0x06},
    [MAPSEC_VERMILION_CITY     - MAPSECS_KANTO] = {0x0e, 0x09},
    [MAPSEC_CELADON_CITY       - MAPSECS_KANTO] = {0x0b, 0x06},
    [MAPSEC_FUCHSIA_CITY       - MAPSECS_KANTO] = {0x0c, 0x0c},
    [MAPSEC_CINNABAR_ISLAND    - MAPSECS_KANTO] = {0x04, 0x0e},
    [MAPSEC_INDIGO_PLATEAU     - MAPSECS_KANTO] = {0x02, 0x03},
    [MAPSEC_SAFFRON_CITY       - MAPSECS_KANTO] = {0x0e, 0x06},
    [MAPSEC_ROUTE_4_FLYDUP     - MAPSECS_KANTO] = {0x08, 0x03},
    [MAPSEC_ROUTE_10_FLYDUP    - MAPSECS_KANTO] = {0x12, 0x03},
    [MAPSEC_ROUTE_1            - MAPSECS_KANTO] = {0x04, 0x09},
    [MAPSEC_ROUTE_2            - MAPSECS_KANTO] = {0x04, 0x05},
    [MAPSEC_ROUTE_3            - MAPSECS_KANTO] = {0x05, 0x04},
    [MAPSEC_ROUTE_4            - MAPSECS_KANTO] = {0x08, 0x03},
    [MAPSEC_ROUTE_5            - MAPSECS_KANTO] = {0x0e, 0x04},
    [MAPSEC_ROUTE_6            - MAPSECS_KANTO] = {0x0e, 0x07},
    [MAPSEC_ROUTE_7            - MAPSECS_KANTO] = {0x0c, 0x06},
    [MAPSEC_ROUTE_8            - MAPSECS_KANTO] = {0x0f, 0x06},
    [MAPSEC_ROUTE_9            - MAPSECS_KANTO] = {0x0f, 0x03},
    [MAPSEC_ROUTE_10           - MAPSECS_KANTO] = {0x12, 0x03},
    [MAPSEC_ROUTE_11           - MAPSECS_KANTO] = {0x0f, 0x09},
    [MAPSEC_ROUTE_12           - MAPSECS_KANTO] = {0x12, 0x07},
    [MAPSEC_ROUTE_13           - MAPSECS_KANTO] = {0x10, 0x0b},
    [MAPSEC_ROUTE_14           - MAPSECS_KANTO] = {0x0f, 0x0b},
    [MAPSEC_ROUTE_15           - MAPSECS_KANTO] = {0x0d, 0x0c},
    [MAPSEC_ROUTE_16           - MAPSECS_KANTO] = {0x07, 0x06},
    [MAPSEC_ROUTE_17           - MAPSECS_KANTO] = {0x07, 0x07},
    [MAPSEC_ROUTE_18           - MAPSECS_KANTO] = {0x07, 0x0c},
    [MAPSEC_ROUTE_19           - MAPSECS_KANTO] = {0x0c, 0x0d},
    [MAPSEC_ROUTE_20           - MAPSECS_KANTO] = {0x05, 0x0e},
    [MAPSEC_ROUTE_21           - MAPSECS_KANTO] = {0x04, 0x0c},
    [MAPSEC_ROUTE_22           - MAPSECS_KANTO] = {0x02, 0x08},
    [MAPSEC_ROUTE_23           - MAPSECS_KANTO] = {0x02, 0x04},
    [MAPSEC_ROUTE_24           - MAPSECS_KANTO] = {0x0e, 0x01},
    [MAPSEC_ROUTE_25           - MAPSECS_KANTO] = {0x0f, 0x01},
    [MAPSEC_ONE_ISLAND         - MAPSECS_KANTO] = {0x01, 0x08},
    [MAPSEC_TWO_ISLAND         - MAPSECS_KANTO] = {0x09, 0x09},
    [MAPSEC_THREE_ISLAND       - MAPSECS_KANTO] = {0x12, 0x0c},
    [MAPSEC_FOUR_ISLAND        - MAPSECS_KANTO] = {0x03, 0x04},
    [MAPSEC_FIVE_ISLAND        - MAPSECS_KANTO] = {0x10, 0x0b},
    [MAPSEC_SEVEN_ISLAND       - MAPSECS_KANTO] = {0x05, 0x08},
    [MAPSEC_SIX_ISLAND         - MAPSECS_KANTO] = {0x11, 0x05},
    [MAPSEC_KINDLE_ROAD        - MAPSECS_KANTO] = {0x02, 0x03},
    [MAPSEC_TREASURE_BEACH     - MAPSECS_KANTO] = {0x01, 0x09},
    [MAPSEC_CAPE_BRINK         - MAPSECS_KANTO] = {0x09, 0x07},
    [MAPSEC_BOND_BRIDGE        - MAPSECS_KANTO] = {0x0d, 0x0c},
    [MAPSEC_THREE_ISLE_PORT    - MAPSECS_KANTO] = {0x12, 0x0d},
    [MAPSEC_SEVII_ISLE_6       - MAPSECS_KANTO] = {0x04, 0x03},
    [MAPSEC_SEVII_ISLE_7       - MAPSECS_KANTO] = {0x05, 0x04},
    [MAPSEC_SEVII_ISLE_8       - MAPSECS_KANTO] = {0x01, 0x04},
    [MAPSEC_SEVII_ISLE_9       - MAPSECS_KANTO] = {0x04, 0x05},
    [MAPSEC_RESORT_GORGEOUS    - MAPSECS_KANTO] = {0x10, 0x09},
    [MAPSEC_WATER_LABYRINTH    - MAPSECS_KANTO] = {0x0e, 0x0a},
    [MAPSEC_FIVE_ISLE_MEADOW   - MAPSECS_KANTO] = {0x11, 0x0a},
    [MAPSEC_MEMORIAL_PILLAR    - MAPSECS_KANTO] = {0x12, 0x0c},
    [MAPSEC_OUTCAST_ISLAND     - MAPSECS_KANTO] = {0x0f, 0x00},
    [MAPSEC_GREEN_PATH         - MAPSECS_KANTO] = {0x0f, 0x03},
    [MAPSEC_WATER_PATH         - MAPSECS_KANTO] = {0x12, 0x03},
    [MAPSEC_RUIN_VALLEY        - MAPSECS_KANTO] = {0x10, 0x07},
    [MAPSEC_TRAINER_TOWER      - MAPSECS_KANTO] = {0x05, 0x06},
    [MAPSEC_CANYON_ENTRANCE    - MAPSECS_KANTO] = {0x05, 0x09},
    [MAPSEC_SEVAULT_CANYON     - MAPSECS_KANTO] = {0x06, 0x09},
    [MAPSEC_TANOBY_RUINS       - MAPSECS_KANTO] = {0x03, 0x0c},
    [MAPSEC_SEVII_ISLE_22      - MAPSECS_KANTO] = {0x09, 0x0c},
    [MAPSEC_SEVII_ISLE_23      - MAPSECS_KANTO] = {0x03, 0x0e},
    [MAPSEC_SEVII_ISLE_24      - MAPSECS_KANTO] = {0x02, 0x0c},
    [MAPSEC_NAVEL_ROCK         - MAPSECS_KANTO] = {0x0a, 0x08},
    [MAPSEC_BIRTH_ISLAND       - MAPSECS_KANTO] = {0x12, 0x0d},
};

static const u16 sMapSectionDimensions[0xC6][2] = {
    [MAPSEC_PALLET_TOWN        - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_VIRIDIAN_CITY      - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_PEWTER_CITY        - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_CERULEAN_CITY      - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_LAVENDER_TOWN      - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_VERMILION_CITY     - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_CELADON_CITY       - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_FUCHSIA_CITY       - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_CINNABAR_ISLAND    - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_INDIGO_PLATEAU     - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_SAFFRON_CITY       - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_ROUTE_4_FLYDUP     - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_ROUTE_10_FLYDUP    - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_ROUTE_1            - MAPSECS_KANTO] = {0x01, 0x02},
    [MAPSEC_ROUTE_2            - MAPSECS_KANTO] = {0x01, 0x03},
    [MAPSEC_ROUTE_3            - MAPSECS_KANTO] = {0x04, 0x01},
    [MAPSEC_ROUTE_4            - MAPSECS_KANTO] = {0x06, 0x01},
    [MAPSEC_ROUTE_5            - MAPSECS_KANTO] = {0x01, 0x02},
    [MAPSEC_ROUTE_6            - MAPSECS_KANTO] = {0x01, 0x02},
    [MAPSEC_ROUTE_7            - MAPSECS_KANTO] = {0x02, 0x01},
    [MAPSEC_ROUTE_8            - MAPSECS_KANTO] = {0x03, 0x01},
    [MAPSEC_ROUTE_9            - MAPSECS_KANTO] = {0x03, 0x01},
    [MAPSEC_ROUTE_10           - MAPSECS_KANTO] = {0x01, 0x03},
    [MAPSEC_ROUTE_11           - MAPSECS_KANTO] = {0x03, 0x01},
    [MAPSEC_ROUTE_12           - MAPSECS_KANTO] = {0x01, 0x05},
    [MAPSEC_ROUTE_13           - MAPSECS_KANTO] = {0x02, 0x01},
    [MAPSEC_ROUTE_14           - MAPSECS_KANTO] = {0x01, 0x02},
    [MAPSEC_ROUTE_15           - MAPSECS_KANTO] = {0x02, 0x01},
    [MAPSEC_ROUTE_16           - MAPSECS_KANTO] = {0x04, 0x01},
    [MAPSEC_ROUTE_17           - MAPSECS_KANTO] = {0x01, 0x05},
    [MAPSEC_ROUTE_18           - MAPSECS_KANTO] = {0x05, 0x01},
    [MAPSEC_ROUTE_19           - MAPSECS_KANTO] = {0x01, 0x02},
    [MAPSEC_ROUTE_20           - MAPSECS_KANTO] = {0x07, 0x01},
    [MAPSEC_ROUTE_21           - MAPSECS_KANTO] = {0x01, 0x02},
    [MAPSEC_ROUTE_22           - MAPSECS_KANTO] = {0x02, 0x01},
    [MAPSEC_ROUTE_23           - MAPSECS_KANTO] = {0x01, 0x04},
    [MAPSEC_ROUTE_24           - MAPSECS_KANTO] = {0x01, 0x02},
    [MAPSEC_ROUTE_25           - MAPSECS_KANTO] = {0x02, 0x01},
    [MAPSEC_VIRIDIAN_FOREST    - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_MT_MOON            - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_S_S_ANNE           - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_UNDERGROUND_PATH   - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_UNDERGROUND_PATH_2 - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_DIGLETTS_CAVE      - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_KANTO_VICTORY_ROAD - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_ROCKET_HIDEOUT     - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_SILPH_CO           - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_POKEMON_MANSION    - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_KANTO_SAFARI_ZONE  - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_POKEMON_LEAGUE     - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_ROCK_TUNNEL        - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_SEAFOAM_ISLANDS    - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_POKEMON_TOWER      - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_CERULEAN_CAVE      - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_POWER_PLANT        - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_ONE_ISLAND         - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_TWO_ISLAND         - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_THREE_ISLAND       - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_FOUR_ISLAND        - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_FIVE_ISLAND        - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_SEVEN_ISLAND       - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_SIX_ISLAND         - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_KINDLE_ROAD        - MAPSECS_KANTO] = {0x01, 0x06},
    [MAPSEC_TREASURE_BEACH     - MAPSECS_KANTO] = {0x01, 0x02},
    [MAPSEC_CAPE_BRINK         - MAPSECS_KANTO] = {0x01, 0x02},
    [MAPSEC_BOND_BRIDGE        - MAPSECS_KANTO] = {0x04, 0x01},
    [MAPSEC_THREE_ISLE_PORT    - MAPSECS_KANTO] = {0x02, 0x01},
    [MAPSEC_SEVII_ISLE_6       - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_SEVII_ISLE_7       - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_SEVII_ISLE_8       - MAPSECS_KANTO] = {0x03, 0x01},
    [MAPSEC_SEVII_ISLE_9       - MAPSECS_KANTO] = {0x01, 0x02},
    [MAPSEC_RESORT_GORGEOUS    - MAPSECS_KANTO] = {0x03, 0x01},
    [MAPSEC_WATER_LABYRINTH    - MAPSECS_KANTO] = {0x03, 0x01},
    [MAPSEC_FIVE_ISLE_MEADOW   - MAPSECS_KANTO] = {0x01, 0x03},
    [MAPSEC_MEMORIAL_PILLAR    - MAPSECS_KANTO] = {0x01, 0x03},
    [MAPSEC_OUTCAST_ISLAND     - MAPSECS_KANTO] = {0x01, 0x03},
    [MAPSEC_GREEN_PATH         - MAPSECS_KANTO] = {0x03, 0x01},
    [MAPSEC_WATER_PATH         - MAPSECS_KANTO] = {0x01, 0x05},
    [MAPSEC_RUIN_VALLEY        - MAPSECS_KANTO] = {0x02, 0x02},
    [MAPSEC_TRAINER_TOWER      - MAPSECS_KANTO] = {0x01, 0x02},
    [MAPSEC_CANYON_ENTRANCE    - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_SEVAULT_CANYON     - MAPSECS_KANTO] = {0x01, 0x03},
    [MAPSEC_TANOBY_RUINS       - MAPSECS_KANTO] = {0x07, 0x01},
    [MAPSEC_SEVII_ISLE_22      - MAPSECS_KANTO] = {0x01, 0x03},
    [MAPSEC_SEVII_ISLE_23      - MAPSECS_KANTO] = {0x06, 0x01},
    [MAPSEC_SEVII_ISLE_24      - MAPSECS_KANTO] = {0x01, 0x03},
    [MAPSEC_NAVEL_ROCK         - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_MT_EMBER           - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_BERRY_FOREST       - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_ICEFALL_CAVE       - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_ROCKET_WAREHOUSE   - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_TRAINER_TOWER_2    - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_DOTTED_HOLE        - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_LOST_CAVE          - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_PATTERN_BUSH       - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_ALTERING_CAVE      - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_TANOBY_CHAMBERS    - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_THREE_ISLE_PATH    - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_TANOBY_KEY         - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_BIRTH_ISLAND       - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_MONEAN_CHAMBER     - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_LIPTOO_CHAMBER     - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_WEEPTH_CHAMBER     - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_DILFORD_CHAMBER    - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_SCUFIB_CHAMBER     - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_RIXY_CHAMBER       - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_VIAPOIS_CHAMBER    - MAPSECS_KANTO] = {0x01, 0x01},
    [MAPSEC_EMBER_SPA          - MAPSECS_KANTO] = {0x01, 0x01}
};

static const u8 sRegionMapSections_Kanto[][15][22] = {
    {
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE,
         MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE,
         MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE,
         MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ROUTE_24, MAPSEC_ROUTE_25,
         MAPSEC_ROUTE_25, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE,
         MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ROUTE_24, MAPSEC_NONE,
         MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_INDIGO_PLATEAU, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE,
         MAPSEC_NONE, MAPSEC_ROUTE_4_FLYDUP, MAPSEC_ROUTE_4, MAPSEC_ROUTE_4, MAPSEC_ROUTE_4, MAPSEC_ROUTE_4,
         MAPSEC_ROUTE_4, MAPSEC_CERULEAN_CITY, MAPSEC_ROUTE_9, MAPSEC_ROUTE_9, MAPSEC_ROUTE_9, MAPSEC_ROUTE_10_FLYDUP,
         MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ROUTE_23, MAPSEC_NONE, MAPSEC_PEWTER_CITY, MAPSEC_ROUTE_3, MAPSEC_ROUTE_3,
         MAPSEC_ROUTE_3, MAPSEC_ROUTE_3, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE,
         MAPSEC_ROUTE_5, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ROUTE_10, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ROUTE_23, MAPSEC_NONE, MAPSEC_ROUTE_2, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE,
         MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ROUTE_5, MAPSEC_NONE,
         MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ROUTE_10, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ROUTE_23, MAPSEC_NONE, MAPSEC_ROUTE_2, MAPSEC_NONE, MAPSEC_NONE,
         MAPSEC_ROUTE_16, MAPSEC_ROUTE_16, MAPSEC_ROUTE_16, MAPSEC_ROUTE_16, MAPSEC_CELADON_CITY, MAPSEC_ROUTE_7,
         MAPSEC_ROUTE_7, MAPSEC_SAFFRON_CITY, MAPSEC_ROUTE_8, MAPSEC_ROUTE_8, MAPSEC_ROUTE_8, MAPSEC_LAVENDER_TOWN,
         MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ROUTE_23, MAPSEC_NONE, MAPSEC_ROUTE_2, MAPSEC_NONE, MAPSEC_NONE,
         MAPSEC_ROUTE_17, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ROUTE_6,
         MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ROUTE_12, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ROUTE_22, MAPSEC_ROUTE_22, MAPSEC_VIRIDIAN_CITY, MAPSEC_NONE, MAPSEC_NONE,
         MAPSEC_ROUTE_17, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ROUTE_6,
         MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ROUTE_12, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ROUTE_1, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ROUTE_17,
         MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_VERMILION_CITY,
         MAPSEC_ROUTE_11, MAPSEC_ROUTE_11, MAPSEC_ROUTE_11, MAPSEC_ROUTE_12, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ROUTE_1, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ROUTE_17,
         MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE,
         MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ROUTE_12, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_PALLET_TOWN, MAPSEC_NONE, MAPSEC_NONE,
         MAPSEC_ROUTE_17, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE,
         MAPSEC_ROUTE_14, MAPSEC_ROUTE_13, MAPSEC_ROUTE_13, MAPSEC_ROUTE_12, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ROUTE_21, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ROUTE_18,
         MAPSEC_ROUTE_18, MAPSEC_ROUTE_18, MAPSEC_ROUTE_18, MAPSEC_ROUTE_18, MAPSEC_FUCHSIA_CITY, MAPSEC_ROUTE_15,
         MAPSEC_ROUTE_15, MAPSEC_ROUTE_14, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE,
         MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ROUTE_21, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE,
         MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ROUTE_19, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE,
         MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_CINNABAR_ISLAND, MAPSEC_ROUTE_20, MAPSEC_ROUTE_20,
         MAPSEC_ROUTE_20, MAPSEC_ROUTE_20, MAPSEC_ROUTE_20, MAPSEC_ROUTE_20, MAPSEC_ROUTE_20, MAPSEC_ROUTE_19,
         MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE,
         MAPSEC_NONE}
    }, {
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_MT_MOON, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_CERULEAN_CAVE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ROCK_TUNNEL, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_KANTO_VICTORY_ROAD, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_POWER_PLANT, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_DIGLETTS_CAVE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_VIRIDIAN_FOREST, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_POKEMON_TOWER, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_DIGLETTS_CAVE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_KANTO_SAFARI_ZONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_POKEMON_MANSION, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_SEAFOAM_ISLANDS, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE}
    }
};

static const u8 sRegionMapSections_Sevii123[][15][22] = {
    {
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_KINDLE_ROAD, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_KINDLE_ROAD, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_KINDLE_ROAD, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_KINDLE_ROAD, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_KINDLE_ROAD, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_CAPE_BRINK, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_ONE_ISLAND, MAPSEC_KINDLE_ROAD, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_CAPE_BRINK, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_TREASURE_BEACH, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_TWO_ISLAND, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_TREASURE_BEACH, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_BOND_BRIDGE, MAPSEC_BOND_BRIDGE, MAPSEC_BOND_BRIDGE, MAPSEC_BOND_BRIDGE, MAPSEC_THREE_ISLAND, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_THREE_ISLE_PORT, MAPSEC_THREE_ISLE_PORT, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE}
    }, {
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_MT_EMBER, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_BERRY_FOREST, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE}
    }
};

static const u8 sRegionMapSections_Sevii45[][15][22] = {
    {
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_FOUR_ISLAND, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NAVEL_ROCK, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_RESORT_GORGEOUS, MAPSEC_RESORT_GORGEOUS, MAPSEC_RESORT_GORGEOUS, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_WATER_LABYRINTH, MAPSEC_WATER_LABYRINTH, MAPSEC_WATER_LABYRINTH, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_FIVE_ISLAND, MAPSEC_FIVE_ISLE_MEADOW, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_FIVE_ISLE_MEADOW, MAPSEC_MEMORIAL_PILLAR, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_MEMORIAL_PILLAR, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_MEMORIAL_PILLAR, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE}
    }, {
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ICEFALL_CAVE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_LOST_CAVE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE}
    }
};

static const u8 sRegionMapSections_Sevii67[][15][22] = {
    {
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_OUTCAST_ISLAND, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_OUTCAST_ISLAND, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_OUTCAST_ISLAND, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_GREEN_PATH, MAPSEC_GREEN_PATH, MAPSEC_GREEN_PATH, MAPSEC_WATER_PATH, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_WATER_PATH, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_SIX_ISLAND, MAPSEC_WATER_PATH, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_TRAINER_TOWER, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_WATER_PATH, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_TRAINER_TOWER, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_RUIN_VALLEY, MAPSEC_RUIN_VALLEY, MAPSEC_WATER_PATH, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_SEVEN_ISLAND, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_RUIN_VALLEY, MAPSEC_RUIN_VALLEY, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_CANYON_ENTRANCE, MAPSEC_SEVAULT_CANYON, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_SEVAULT_CANYON, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_SEVAULT_CANYON, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_TANOBY_RUINS, MAPSEC_TANOBY_RUINS, MAPSEC_TANOBY_RUINS, MAPSEC_TANOBY_RUINS, MAPSEC_TANOBY_RUINS, MAPSEC_TANOBY_RUINS, MAPSEC_TANOBY_RUINS, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_BIRTH_ISLAND, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE}
    }, {
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_ALTERING_CAVE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_PATTERN_BUSH, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_DOTTED_HOLE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_TANOBY_CHAMBERS, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE},
        {MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE, MAPSEC_NONE}
    }
};

static const u8 sMapsecToSpawn[][3] = {
    [MAPSEC_PALLET_TOWN        - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), SPAWN_PALLET_TOWN},
    [MAPSEC_VIRIDIAN_CITY      - MAPSECS_KANTO] = {MAP_GROUP(VIRIDIAN_CITY), MAP_NUM(VIRIDIAN_CITY), SPAWN_VIRIDIAN_CITY},
    [MAPSEC_PEWTER_CITY        - MAPSECS_KANTO] = {MAP_GROUP(PEWTER_CITY), MAP_NUM(PEWTER_CITY), SPAWN_PEWTER_CITY},
    [MAPSEC_CERULEAN_CITY      - MAPSECS_KANTO] = {MAP_GROUP(CERULEAN_CITY), MAP_NUM(CERULEAN_CITY), SPAWN_CERULEAN_CITY},
    [MAPSEC_LAVENDER_TOWN      - MAPSECS_KANTO] = {MAP_GROUP(LAVENDER_TOWN), MAP_NUM(LAVENDER_TOWN), SPAWN_LAVENDER_TOWN},
    [MAPSEC_VERMILION_CITY     - MAPSECS_KANTO] = {MAP_GROUP(VERMILION_CITY), MAP_NUM(VERMILION_CITY), SPAWN_VERMILION_CITY},
    [MAPSEC_CELADON_CITY       - MAPSECS_KANTO] = {MAP_GROUP(CELADON_CITY), MAP_NUM(CELADON_CITY), SPAWN_CELADON_CITY},
    [MAPSEC_FUCHSIA_CITY       - MAPSECS_KANTO] = {MAP_GROUP(FUCHSIA_CITY), MAP_NUM(FUCHSIA_CITY), SPAWN_FUCHSIA_CITY},
    [MAPSEC_CINNABAR_ISLAND    - MAPSECS_KANTO] = {MAP_GROUP(CINNABAR_ISLAND), MAP_NUM(CINNABAR_ISLAND), SPAWN_CINNABAR_ISLAND},
    [MAPSEC_INDIGO_PLATEAU     - MAPSECS_KANTO] = {MAP_GROUP(INDIGO_PLATEAU_EXTERIOR), MAP_NUM(INDIGO_PLATEAU_EXTERIOR), SPAWN_INDIGO_PLATEAU},
    [MAPSEC_SAFFRON_CITY       - MAPSECS_KANTO] = {MAP_GROUP(SAFFRON_CITY), MAP_NUM(SAFFRON_CITY), SPAWN_SAFFRON_CITY},
    [MAPSEC_ROUTE_4_FLYDUP     - MAPSECS_KANTO] = {MAP_GROUP(ROUTE4), MAP_NUM(ROUTE4), SPAWN_ROUTE4},
    [MAPSEC_ROUTE_10_FLYDUP    - MAPSECS_KANTO] = {MAP_GROUP(ROUTE10), MAP_NUM(ROUTE10), SPAWN_ROUTE10},
    [MAPSEC_ROUTE_1            - MAPSECS_KANTO] = {MAP_GROUP(ROUTE1), MAP_NUM(ROUTE1), 0},
    [MAPSEC_ROUTE_2            - MAPSECS_KANTO] = {MAP_GROUP(ROUTE2), MAP_NUM(ROUTE2), 0},
    [MAPSEC_ROUTE_3            - MAPSECS_KANTO] = {MAP_GROUP(ROUTE3), MAP_NUM(ROUTE3), 0},
    [MAPSEC_ROUTE_4            - MAPSECS_KANTO] = {MAP_GROUP(ROUTE4), MAP_NUM(ROUTE4), 0},
    [MAPSEC_ROUTE_5            - MAPSECS_KANTO] = {MAP_GROUP(ROUTE5), MAP_NUM(ROUTE5), 0},
    [MAPSEC_ROUTE_6            - MAPSECS_KANTO] = {MAP_GROUP(ROUTE6), MAP_NUM(ROUTE6), 0},
    [MAPSEC_ROUTE_7            - MAPSECS_KANTO] = {MAP_GROUP(ROUTE7), MAP_NUM(ROUTE7), 0},
    [MAPSEC_ROUTE_8            - MAPSECS_KANTO] = {MAP_GROUP(ROUTE8), MAP_NUM(ROUTE8), 0},
    [MAPSEC_ROUTE_9            - MAPSECS_KANTO] = {MAP_GROUP(ROUTE9), MAP_NUM(ROUTE9), 0},
    [MAPSEC_ROUTE_10           - MAPSECS_KANTO] = {MAP_GROUP(ROUTE10), MAP_NUM(ROUTE10), 0},
    [MAPSEC_ROUTE_11           - MAPSECS_KANTO] = {MAP_GROUP(ROUTE11), MAP_NUM(ROUTE11), 0},
    [MAPSEC_ROUTE_12           - MAPSECS_KANTO] = {MAP_GROUP(ROUTE12), MAP_NUM(ROUTE12), 0},
    [MAPSEC_ROUTE_13           - MAPSECS_KANTO] = {MAP_GROUP(ROUTE13), MAP_NUM(ROUTE13), 0},
    [MAPSEC_ROUTE_14           - MAPSECS_KANTO] = {MAP_GROUP(ROUTE14), MAP_NUM(ROUTE14), 0},
    [MAPSEC_ROUTE_15           - MAPSECS_KANTO] = {MAP_GROUP(ROUTE15), MAP_NUM(ROUTE15), 0},
    [MAPSEC_ROUTE_16           - MAPSECS_KANTO] = {MAP_GROUP(ROUTE16), MAP_NUM(ROUTE16), 0},
    [MAPSEC_ROUTE_17           - MAPSECS_KANTO] = {MAP_GROUP(ROUTE17), MAP_NUM(ROUTE17), 0},
    [MAPSEC_ROUTE_18           - MAPSECS_KANTO] = {MAP_GROUP(ROUTE18), MAP_NUM(ROUTE18), 0},
    [MAPSEC_ROUTE_19           - MAPSECS_KANTO] = {MAP_GROUP(ROUTE19), MAP_NUM(ROUTE19), 0},
    [MAPSEC_ROUTE_20           - MAPSECS_KANTO] = {MAP_GROUP(ROUTE20), MAP_NUM(ROUTE20), 0},
    [MAPSEC_ROUTE_21           - MAPSECS_KANTO] = {MAP_GROUP(ROUTE21_NORTH), MAP_NUM(ROUTE21_NORTH), 0},
    [MAPSEC_ROUTE_22           - MAPSECS_KANTO] = {MAP_GROUP(ROUTE22), MAP_NUM(ROUTE22), 0},
    [MAPSEC_ROUTE_23           - MAPSECS_KANTO] = {MAP_GROUP(ROUTE23), MAP_NUM(ROUTE23), 0},
    [MAPSEC_ROUTE_24           - MAPSECS_KANTO] = {MAP_GROUP(ROUTE24), MAP_NUM(ROUTE24), 0},
    [MAPSEC_ROUTE_25           - MAPSECS_KANTO] = {MAP_GROUP(ROUTE25), MAP_NUM(ROUTE25), 0},
    [MAPSEC_VIRIDIAN_FOREST    - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_MT_MOON            - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_S_S_ANNE           - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_UNDERGROUND_PATH   - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_UNDERGROUND_PATH_2 - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_DIGLETTS_CAVE      - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_KANTO_VICTORY_ROAD - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_ROCKET_HIDEOUT     - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_SILPH_CO           - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_POKEMON_MANSION    - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_KANTO_SAFARI_ZONE  - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_POKEMON_LEAGUE     - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_ROCK_TUNNEL        - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_SEAFOAM_ISLANDS    - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_POKEMON_TOWER      - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_CERULEAN_CAVE      - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_POWER_PLANT        - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_ONE_ISLAND         - MAPSECS_KANTO] = {MAP_GROUP(ONE_ISLAND), MAP_NUM(ONE_ISLAND), SPAWN_ONE_ISLAND},
    [MAPSEC_TWO_ISLAND         - MAPSECS_KANTO] = {MAP_GROUP(TWO_ISLAND), MAP_NUM(TWO_ISLAND), SPAWN_TWO_ISLAND},
    [MAPSEC_THREE_ISLAND       - MAPSECS_KANTO] = {MAP_GROUP(THREE_ISLAND), MAP_NUM(THREE_ISLAND), SPAWN_THREE_ISLAND},
    [MAPSEC_FOUR_ISLAND        - MAPSECS_KANTO] = {MAP_GROUP(FOUR_ISLAND), MAP_NUM(FOUR_ISLAND), SPAWN_FOUR_ISLAND},
    [MAPSEC_FIVE_ISLAND        - MAPSECS_KANTO] = {MAP_GROUP(FIVE_ISLAND), MAP_NUM(FIVE_ISLAND), SPAWN_FIVE_ISLAND},
    [MAPSEC_SEVEN_ISLAND       - MAPSECS_KANTO] = {MAP_GROUP(SEVEN_ISLAND), MAP_NUM(SEVEN_ISLAND), SPAWN_SEVEN_ISLAND},
    [MAPSEC_SIX_ISLAND         - MAPSECS_KANTO] = {MAP_GROUP(SIX_ISLAND), MAP_NUM(SIX_ISLAND), SPAWN_SIX_ISLAND},
    [MAPSEC_KINDLE_ROAD        - MAPSECS_KANTO] = {MAP_GROUP(ONE_ISLAND_KINDLE_ROAD), MAP_NUM(ONE_ISLAND_KINDLE_ROAD), 0},
    [MAPSEC_TREASURE_BEACH     - MAPSECS_KANTO] = {MAP_GROUP(ONE_ISLAND_TREASURE_BEACH), MAP_NUM(ONE_ISLAND_TREASURE_BEACH), 0},
    [MAPSEC_CAPE_BRINK         - MAPSECS_KANTO] = {MAP_GROUP(TWO_ISLAND_CAPE_BRINK), MAP_NUM(TWO_ISLAND_CAPE_BRINK), 0},
    [MAPSEC_BOND_BRIDGE        - MAPSECS_KANTO] = {MAP_GROUP(THREE_ISLAND_BOND_BRIDGE), MAP_NUM(THREE_ISLAND_BOND_BRIDGE), 0},
    [MAPSEC_THREE_ISLE_PORT    - MAPSECS_KANTO] = {MAP_GROUP(THREE_ISLAND_PORT), MAP_NUM(THREE_ISLAND_PORT), 0},
    [MAPSEC_SEVII_ISLE_6       - MAPSECS_KANTO] = {MAP_GROUP(PROTOTYPE_SEVII_ISLE_6), MAP_NUM(PROTOTYPE_SEVII_ISLE_6), 0},
    [MAPSEC_SEVII_ISLE_7       - MAPSECS_KANTO] = {MAP_GROUP(PROTOTYPE_SEVII_ISLE_7), MAP_NUM(PROTOTYPE_SEVII_ISLE_7), 0},
    [MAPSEC_SEVII_ISLE_8       - MAPSECS_KANTO] = {MAP_GROUP(PROTOTYPE_SEVII_ISLE_8), MAP_NUM(PROTOTYPE_SEVII_ISLE_8), 0},
    [MAPSEC_SEVII_ISLE_9       - MAPSECS_KANTO] = {MAP_GROUP(PROTOTYPE_SEVII_ISLE_9), MAP_NUM(PROTOTYPE_SEVII_ISLE_9), 0},
    [MAPSEC_RESORT_GORGEOUS    - MAPSECS_KANTO] = {MAP_GROUP(FIVE_ISLAND_RESORT_GORGEOUS), MAP_NUM(FIVE_ISLAND_RESORT_GORGEOUS), 0},
    [MAPSEC_WATER_LABYRINTH    - MAPSECS_KANTO] = {MAP_GROUP(FIVE_ISLAND_WATER_LABYRINTH), MAP_NUM(FIVE_ISLAND_WATER_LABYRINTH), 0},
    [MAPSEC_FIVE_ISLE_MEADOW   - MAPSECS_KANTO] = {MAP_GROUP(FIVE_ISLAND_MEADOW), MAP_NUM(FIVE_ISLAND_MEADOW), 0},
    [MAPSEC_MEMORIAL_PILLAR    - MAPSECS_KANTO] = {MAP_GROUP(FIVE_ISLAND_MEMORIAL_PILLAR), MAP_NUM(FIVE_ISLAND_MEMORIAL_PILLAR), 0},
    [MAPSEC_OUTCAST_ISLAND     - MAPSECS_KANTO] = {MAP_GROUP(SIX_ISLAND_OUTCAST_ISLAND), MAP_NUM(SIX_ISLAND_OUTCAST_ISLAND), 0},
    [MAPSEC_GREEN_PATH         - MAPSECS_KANTO] = {MAP_GROUP(SIX_ISLAND_GREEN_PATH), MAP_NUM(SIX_ISLAND_GREEN_PATH), 0},
    [MAPSEC_WATER_PATH         - MAPSECS_KANTO] = {MAP_GROUP(SIX_ISLAND_WATER_PATH), MAP_NUM(SIX_ISLAND_WATER_PATH), 0},
    [MAPSEC_RUIN_VALLEY        - MAPSECS_KANTO] = {MAP_GROUP(SIX_ISLAND_RUIN_VALLEY), MAP_NUM(SIX_ISLAND_RUIN_VALLEY), 0},
    [MAPSEC_TRAINER_TOWER      - MAPSECS_KANTO] = {MAP_GROUP(SEVEN_ISLAND_TRAINER_TOWER), MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER), 0},
    [MAPSEC_CANYON_ENTRANCE    - MAPSECS_KANTO] = {MAP_GROUP(SEVEN_ISLAND_SEVAULT_CANYON_ENTRANCE), MAP_NUM(SEVEN_ISLAND_SEVAULT_CANYON_ENTRANCE), 0},
    [MAPSEC_SEVAULT_CANYON     - MAPSECS_KANTO] = {MAP_GROUP(SEVEN_ISLAND_SEVAULT_CANYON), MAP_NUM(SEVEN_ISLAND_SEVAULT_CANYON), 0},
    [MAPSEC_TANOBY_RUINS       - MAPSECS_KANTO] = {MAP_GROUP(SEVEN_ISLAND_TANOBY_RUINS), MAP_NUM(SEVEN_ISLAND_TANOBY_RUINS), 0},
    [MAPSEC_SEVII_ISLE_22      - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_SEVII_ISLE_23      - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_SEVII_ISLE_24      - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_NAVEL_ROCK         - MAPSECS_KANTO] = {MAP_GROUP(NAVEL_ROCK_EXTERIOR), MAP_NUM(NAVEL_ROCK_EXTERIOR), 0},
    [MAPSEC_MT_EMBER           - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_BERRY_FOREST       - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_ICEFALL_CAVE       - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_ROCKET_WAREHOUSE   - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_TRAINER_TOWER_2    - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_DOTTED_HOLE        - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_LOST_CAVE          - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_PATTERN_BUSH       - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_ALTERING_CAVE      - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_TANOBY_CHAMBERS    - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_THREE_ISLE_PATH    - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_TANOBY_KEY         - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_BIRTH_ISLAND       - MAPSECS_KANTO] = {MAP_GROUP(BIRTH_ISLAND_EXTERIOR), MAP_NUM(BIRTH_ISLAND_EXTERIOR), 0},
    [MAPSEC_MONEAN_CHAMBER     - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_LIPTOO_CHAMBER     - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_WEEPTH_CHAMBER     - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_DILFORD_CHAMBER    - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_SCUFIB_CHAMBER     - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_RIXY_CHAMBER       - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_VIAPOIS_CHAMBER    - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
    [MAPSEC_EMBER_SPA          - MAPSECS_KANTO] = {MAP_GROUP(PALLET_TOWN), MAP_NUM(PALLET_TOWN), 0},
};

static void RegionMap_DarkenPalette(u16 *pal, u16 size, u16 tint)
{
    int i;
    int r, g, b;

    for (i = 0; i < size; i++)
    {
        r = (*pal) & 0x1F;
        g = ((*pal) >> 5) & 0x1F;
        b = ((*pal) >> 10) & 0x1F;

        r = (((r << 8) / 100) * tint) >> 8;
        g = (((g << 8) / 100) * tint) >> 8;
        b = (((b << 8) / 100) * tint) >> 8;

        *pal = RGB2(r, g, b);
        pal++;
    }
}

static void sub_80BFEA0(void)
{
    u16 pal[16];
    CpuCopy16(&gUnknown_83EF2DC[0x20], pal, sizeof(pal));
    RegionMap_DarkenPalette(pal, NELEMS(pal), 95);
    LoadPalette(pal, 0x20, 0x20);
    LoadPalette(&gUnknown_83EF2DC[0x2F], 0x2F, sizeof(u16));
}

static void sub_80BFEDC(u8 kind)
{
    gUnknown_20399D4 = AllocZeroed(sizeof(struct UnkStruct_20399D4));
    if (gUnknown_20399D4 == NULL)
    {
        SetMainCallback2(CB2_ReturnToField);
    }
    else
    {
        gUnknown_2031DE0 = TRUE;
        gUnknown_20399D4->mapType = kind;
        gUnknown_20399D4->field_47A0 = 0;
        gUnknown_20399D4->field_47A4 = 0;
        gUnknown_20399D4->field_47A8 = 0;
        sub_80BFFD0();
        SetMainCallback2(CB2_OpenRegionMap);
    }
}

void sub_80BFF50(u8 kind, MainCallback cb)
{
    gUnknown_20399D4 = AllocZeroed(sizeof(struct UnkStruct_20399D4));
    if (gUnknown_20399D4 == NULL)
    {
        SetMainCallback2(CB2_ReturnToField);
    }
    else
    {
        gUnknown_2031DE0 = TRUE;
        gUnknown_20399D4->mapType = kind;
        gUnknown_20399D4->field_47A0 = 0;
        gUnknown_20399D4->field_47A4 = 0;
        gUnknown_20399D4->field_47A8 = 0;
        gUnknown_20399D4->savedCallback = cb;
        sub_80BFFD0();
        SetMainCallback2(CB2_OpenRegionMap);
    }
}

static void sub_80BFFD0(void)
{
    u8 i;
    u8 j;
    u8 r7;

    switch (gUnknown_20399D4->mapType)
    {
    default:
    case 0:
    case 1:
        gUnknown_20399D4->field_47B8 = sub_80C04E4;
        break;
    case 2:
        gUnknown_20399D4->field_47B8 = sub_80C4F08;
        break;
    }
    for (i = 0; i < 4; i++)
    {
        gUnknown_20399D4->regionMapPermissions[i] = sRegionMapPermissions[gUnknown_20399D4->mapType][i];
    }
    if (!FlagGet(FLAG_SYS_SEVII_MAP_123))
        gUnknown_20399D4->regionMapPermissions[MAPPERM_0] = FALSE;
    r7 = 0;
    j = 0;
    if (gMapHeader.regionMapSectionId >= MAPSECS_SEVII_123)
    {
        while (r7 == 0)
        {
            for (i = 0; sSeviiMapsecs[j][i] != MAPSEC_NONE; i++)
            {
                if (gMapHeader.regionMapSectionId == sSeviiMapsecs[j][i])
                {
                    r7 = j + 1;
                    break;
                }
            }
            j++;
        }
    }
    gUnknown_20399D4->field_479B = r7;
    gUnknown_20399D4->field_479C = r7;
}

static void CB2_OpenRegionMap(void)
{
    switch (gUnknown_20399D4->field_47A4)
    {
    case 0:
        NullVBlankHBlankCallbacks();
        break;
    case 1:
        ResetGpu();
        break;
    case 2:
        ResetOamForRegionMap();
        break;
    case 3:
        if (!HandleLoadRegionMapGfx())
            return;
        break;
    case 4:
        FillBgTilemapBufferRect_Palette0(1, 0x000, 0, 0, 30, 20);
        CopyBgTilemapBufferToVram(1);
        break;
    case 5:
        sub_80C0CC8(0, gUnknown_20399D4->layouts[gUnknown_20399D4->field_479B]);
        CopyBgTilemapBufferToVram(0);
        if (gUnknown_20399D4->mapType != 0)
        {
            sub_80C0CC8(1, gUnknown_20399D4->layouts[4]);
            CopyBgTilemapBufferToVram(1);
        }
        break;
    case 6:
        sub_80C0B18();
        PutWindowTilemap(0);
        break;
    case 7:
        sub_80C0BB0();
        PutWindowTilemap(1);
        break;
    case 8:
        if (GetRegionMapPermission(MAPPERM_2) == TRUE)
            SetBg0andBg3Visibility(1);
        break;
    default:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        sub_80C03E8();
        sub_80C08F4();
        break;
    }
    gUnknown_20399D4->field_47A4++;
}

static bool8 HandleLoadRegionMapGfx(void)
{
    switch (gUnknown_20399D4->field_47A8)
    {
    case 0:
        LoadPalette(gUnknown_83EF23C, 0xC0, 0x20);
        break;
    case 1:
        LoadPalette(gUnknown_83EF2DC, 0x00, 0xA0);
        sub_80BFEA0();
        if (gUnknown_20399D4->mapType != 0)
        {
            LoadPalette(&gUnknown_83EF23C[15], 0x00, 0x02);
            LoadPalette(&gUnknown_83EF23C[15], 0x10, 0x02);
            LoadPalette(&gUnknown_83EF23C[15], 0x20, 0x02);
            LoadPalette(&gUnknown_83EF23C[15], 0x30, 0x02);
            LoadPalette(&gUnknown_83EF23C[15], 0x40, 0x02);
        }
        break;
    case 2:
        ResetTempTileDataBuffers();
        break;
    case 3:
        DecompressAndCopyTileDataToVram(0, gUnknown_83EF61C, 0, 0, 0);
        if (gUnknown_20399D4->mapType != 0)
        {
            DecompressAndCopyTileDataToVram(1, gUnknown_83F1978, 0, 0, 0);
        }
        break;
    case 4:
        if (FreeTempTileDataBuffersIfPossible() == TRUE)
            return FALSE;
        break;
    case 5:
        LZ77UnCompWram(sRegionMapLayout_Kanto, gUnknown_20399D4->layouts[0]);
        break;
    case 6:
        LZ77UnCompWram(sRegionMapLayout_Sevii123, gUnknown_20399D4->layouts[1]);
        break;
    case 7:
        LZ77UnCompWram(sRegionMapLayout_Sevii45, gUnknown_20399D4->layouts[2]);
        break;
    case 8:
        LZ77UnCompWram(sRegionMapLayout_Sevii67, gUnknown_20399D4->layouts[3]);
        break;
    default:
        LZ77UnCompWram(gUnknown_83F19A0, gUnknown_20399D4->layouts[4]);
        return TRUE;
    }
    gUnknown_20399D4->field_47A8++;
    return FALSE;
}

static void sub_80C03E8(void)
{
    CreateTask(gUnknown_20399D4->field_47B8, 0);
    SetMainCallback2(sub_80C08B4);
}

static bool32 sub_80C0410(void)
{
    if (GetSelectedMapSection(GetWhichRegionMap(), 0, GetMapCursorY(), GetMapCursorX()) == 99)
        return FALSE;
    else
        return TRUE;
}

static void sub_80C0450(void)
{
    if (sub_80C0410())
    {
        if ((sub_80C3AC8(0) != 1 && sub_80C3AC8(0) != 0) || (sub_80C3AC8(1) != 1 && sub_80C3AC8(1) != 0))
            PlaySE(SE_Z_SCROLL);
        if (GetMapCursorX() == 21 && GetMapCursorY() == 11 && GetRegionMapPermission(MAPPERM_0) == TRUE)
            PlaySE(SE_W255);
        else if (GetMapCursorX() == 21 && GetMapCursorY() == 13)
            PlaySE(SE_W255);
    }
}

static void sub_80C04E4(u8 taskId)
{
    switch (gUnknown_20399D4->field_47A0)
    {
    case 0:
        sub_80C4398(GetWhichRegionMap(), taskId, gUnknown_20399D4->field_47B8);
        sub_80C3008(0, 0);
        sub_80C41D8(1, 1);
        gUnknown_20399D4->field_47A0++;
        break;
    case 1:
        if (gUnknown_20399D4->regionMapPermissions[MAPPERM_2] == TRUE)
        {
            sub_80C2208(taskId, gUnknown_20399D4->field_47B8);
        }
        else
        {
            ShowBg(0);
            ShowBg(3);
            ShowBg(1);
            sub_80C4E18(gText_RegionMap_DPadMove);
            sub_80C4E74(gText_RegionMap_Space);
            sub_80C4ED0(FALSE);
            sub_80C4324(FALSE);
            sub_80C3154(FALSE);
            sub_80C48BC(GetWhichRegionMap(), 25, FALSE);
            sub_80C4960(GetWhichRegionMap(), 25, FALSE);
        }
        gUnknown_20399D4->field_47A0++;
        break;
    case 2:
        if (!gPaletteFade.active && !IsDma3ManagerBusyWithBgCopy())
        {
            sub_80C0B18();
            PutWindowTilemap(0);
            sub_80C0BB0();
            PutWindowTilemap(1);
            gUnknown_20399D4->field_47A0++;
        }
        break;
    case 3:
        switch (sub_80C3400())
        {
        case 1:
            sub_80C3178();
            break;
        case 2:
            break;
        case 3:
            sub_80C0B18();
            sub_80C0BB0();
            sub_80C0B9C();
            sub_80C0450();
            if (GetMapSecUnderCursor() != MAPSEC_NONE)
            {
                if (GetRegionMapPermission(MAPPERM_1) == TRUE)
                {
                    if (sub_80C3AC8(1) == 2)
                    {
                        sub_80C4E74(gText_RegionMap_AButtonGuide);
                    }
                    else
                    {
                        sub_80C4E74(gText_RegionMap_Space);
                    }
                }
            }
            else
            {
                if (GetMapCursorX() == 21 && GetMapCursorY() == 11 && GetRegionMapPermission(MAPPERM_0) == TRUE)
                {
                    sub_80C4E74(gText_RegionMap_AButtonSwitch);
                }
                else if (GetMapCursorX() == 21 && GetMapCursorY() == 13)
                {
                    sub_80C4E74(gText_RegionMap_AButtonCancel);
                }
                else
                {
                    sub_80C4E74(gText_RegionMap_Space);
                }
            }
            break;
        case 4:
            if (sub_80C3AC8(1) == 2 && gUnknown_20399D4->regionMapPermissions[MAPPERM_1] == TRUE)
            {
                RegionMapCreateDungeonMapPreview(0, taskId, sub_80C07F8);
            }
            break;
        case 5:
            sub_80C0E70(gUnknown_20399D4->field_479B, taskId, sub_80C07F8);
            break;
        case 6:
            gUnknown_20399D4->field_47A0++;
            break;
        }
        break;
    case 4:
        if (GetRegionMapPermission(MAPPERM_2) == 1)
        {
            sub_80C2C1C(taskId);
            // FIXME: goto required to match
            // gUnknown_20399D4->field_47A0++;
            goto _080C0798;
        }
        else
        {
            gUnknown_20399D4->field_47A0++;
        }
        break;
    case 5:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
    _080C0798:
        gUnknown_20399D4->field_47A0++;
        break;
    default:
        if (!gPaletteFade.active)
        {
            sub_80C0820(taskId);
        }
        break;
    }
}

static void sub_80C07D0(TaskFunc taskFunc)
{
    gUnknown_20399D4->field_47B8 = taskFunc;
}

TaskFunc sub_80C07E4(void)
{
    return gUnknown_20399D4->field_47B8;
}

static void sub_80C07F8(u8 taskId)
{
    gTasks[taskId].func = gUnknown_20399D4->field_47B8;
}

static void sub_80C0820(u8 taskId)
{
    if (GetRegionMapPermission(MAPPERM_2) == TRUE)
        sub_80C25BC();
    sub_80C4A04();
    sub_80C3188();
    sub_80C4348();
    sub_80C4D30();
    DestroyTask(taskId);
    FreeAllWindowBuffers();
    if (gUnknown_20399D4->savedCallback == NULL)
        SetMainCallback2(gMain.savedCallback);
    else
        SetMainCallback2(gUnknown_20399D4->savedCallback);
    FREE_IF_NOT_NULL(gUnknown_20399D4);
}

static void sub_80C0898(void)
{
    FREE_IF_NOT_NULL(gUnknown_20399D4);
}

static void sub_80C08B4(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_80C08CC(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void NullVBlankHBlankCallbacks(void)
{
    SetVBlankCallback(NULL);
    SetHBlankCallback(NULL);
}

static void sub_80C08F4(void)
{
    SetVBlankCallback(sub_80C08CC);
}

static void ResetGpu(void)
{
    DmaFillLarge16(3, 0, (void *)VRAM, VRAM_SIZE, 0x1000);
    DmaFill32Defvars(3, 0, (void *)OAM, OAM_SIZE);
    DmaFill16Defvars(3, 0, (void *)PLTT, PLTT_SIZE);
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, gUnknown_83F1A50, NELEMS(gUnknown_83F1A50));
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
    InitWindows(gUnknown_83F1A60);
    DeactivateAllTextPrinters();
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_WIN0_ON | DISPCNT_WIN1_ON);
    SetBgTilemapBuffers();
    sub_80C0AB8();
}

static void SetBgTilemapBuffers(void)
{
    SetBgTilemapBuffer(0, gUnknown_20399D4->bgTilemapBuffers[0]);
    SetBgTilemapBuffer(1, gUnknown_20399D4->bgTilemapBuffers[1]);
    SetBgTilemapBuffer(2, gUnknown_20399D4->bgTilemapBuffers[2]);
}

static void ResetOamForRegionMap(void)
{
    ResetSpriteData();
    ResetPaletteFade();
    FreeAllSpritePalettes();
    ResetTasks();
    ScanlineEffect_Stop();
}

static void SetBg0andBg3Visibility(u8 mode)
{
    switch (mode)
    {
    case 0:
        ShowBg(0);
        ShowBg(3);
        break;
    case 1:
        HideBg(0);
        HideBg(3);
        break;
    }
}

static void sub_80C0AB8(void)
{
    sub_80C4BE4();
    sub_80C4C2C(0, 0x11, 0xc0);
    sub_80C4C48(6);
    sub_80C4C74(0x39, 0x39);
    sub_80C4C88(0x1b);
    SetGpuWindowDims(0, &sStdWindowDims[0]);
    SetGpuWindowDims(1, &sStdWindowDims[1]);
    sub_80C4C9C(0, 0);
    if (GetMapSecUnderCursor() != MAPSEC_NONE)
        sub_80C4C9C(1, 0);
}

static void sub_80C0B18(void)
{
    ClearWindowTilemap(0);
    FillWindowPixelBuffer(0, PIXEL_FILL(0));
    if (sub_80C3520() == MAPSEC_NONE)
    {
        SetGpuWindowDims(0, &sStdWindowDims[2]);
    }
    else
    {
        GetMapName(gUnknown_20399D4->field_0000, sub_80C3520(), 0);
        AddTextPrinterParameterized3(0, 2, 2, 2, sTextColor_White, 0, gUnknown_20399D4->field_0000);
        PutWindowTilemap(0);
        CopyWindowToVram(0, 2);
        SetGpuWindowDims(0, &sStdWindowDims[0]);
    }
}

static void sub_80C0B9C(void)
{
    SetGpuWindowDims(1, &sStdWindowDims[1]);
}

static void sub_80C0BB0(void)
{
    u16 mapsecId;
    u16 descOffset;
    gUnknown_20399D4->field_47AC = 0;
    gUnknown_20399D4->field_47AE = 24;
    gUnknown_20399D4->field_47B0 = 32;
    sub_80C4C9C(1, 1);
    ClearWindowTilemap(1);
    mapsecId = GetMapSecUnderCursor();
    if (mapsecId != MAPSEC_NONE)
    {
         descOffset = mapsecId - MAPSECS_KANTO;
         sub_80C4C9C(1, 0);
         gUnknown_20399D4->field_47AC = 1;
         gUnknown_20399D4->field_47AA = StringLength(sMapNames[descOffset]);
         gUnknown_20399D4->field_47AE = gUnknown_20399D4->field_47AA * 10 + 50;
         gUnknown_20399D4->field_47B0 = 48;
         FillWindowPixelBuffer(1, PIXEL_FILL(0));
         StringCopy(gUnknown_20399D4->field_0013, sMapNames[descOffset]);
         AddTextPrinterParameterized3(1, 2, 12, 2, gUnknown_83F1A9C[sub_80C3AC8(1) - 2], 0, gUnknown_20399D4->field_0013);
         PutWindowTilemap(1);
         CopyWindowToVram(1, 3);
    }
}

static void sub_80C0CA0(void)
{
    FillWindowPixelBuffer(0, PIXEL_FILL(0));
    CopyWindowToVram(0, 3);
    FillWindowPixelBuffer(1, PIXEL_FILL(0));
    CopyWindowToVram(1, 3);
}

static void sub_80C0CC8(u8 bg, u16 *map)
{
    s16 i;
    s16 j;
    u8 r4;
    u16 *buffer = gUnknown_20399D4->bgTilemapBuffers[bg];
    for (i = 0; i < 20; i++)
    {
        for (j = 0; j < 32; j++)
        {
            if (j < 30)
                buffer[32 * i + j] = map[30 * i + j];
            else
                buffer[32 * i + j] = map[0];
        }
    }
    if (gUnknown_20399D4->regionMapPermissions[MAPPERM_0] == TRUE)
    {
        WriteSequenceToBgTilemapBuffer(0, 0x0F0, 0x18, 0x0E, 3, 1, 0x3, 0x001);
        WriteSequenceToBgTilemapBuffer(0, 0x100, 0x18, 0x0F, 3, 1, 0x3, 0x001);
        WriteSequenceToBgTilemapBuffer(0, 0x110, 0x18, 0x10, 3, 1, 0x3, 0x001);
    }
    if (gUnknown_20399D8 != NULL)
        r4 = gUnknown_20399D8->field_1CCA;
    else
        r4 = gUnknown_20399D4->field_479B;
    if (r4 == REGIONMAP_SEVII45 && !FlagGet(FLAG_WORLD_MAP_NAVEL_ROCK_EXTERIOR))
        FillBgTilemapBufferRect_Palette0(0, 0x003, 13, 11, 3, 2);
    if (r4 == REGIONMAP_SEVII67 && !FlagGet(FLAG_WORLD_MAP_BIRTH_ISLAND_EXTERIOR))
        FillBgTilemapBufferRect_Palette0(0, 0x003, 21, 16, 3, 3);
}

static bool8 GetRegionMapPermission(u8 attr)
{
    return gUnknown_20399D4->regionMapPermissions[attr];
}

static u8 GetWhichRegionMap(void)
{
    return gUnknown_20399D4->field_479B;
}

static u8 sub_80C0E34(void)
{
    return gUnknown_20399D4->field_479C;
}

static void SetWhichRegionMap(u8 a0)
{
    gUnknown_20399D4->field_479B = a0;
}

static void sub_80C0E5C(u8 a0)
{
    gUnknown_20399D4->field_479C = a0;
}

static void sub_80C0E70(u8 a0, u8 taskId, TaskFunc taskFunc)
{
    gUnknown_20399D8 = AllocZeroed(sizeof(struct UnkStruct_20399D8));
    if (FlagGet(FLAG_SYS_SEVII_MAP_4567))
        gUnknown_20399D8->field_1CCC = 3;
    else if (FlagGet(FLAG_SYS_SEVII_MAP_123))
        gUnknown_20399D8->field_1CCC = 1;
    else
        gUnknown_20399D8->field_1CCC = 0;
    gUnknown_20399D8->selectionCursorSubspriteData[0].xCoord = 0x58;
    gUnknown_20399D8->selectionCursorSubspriteData[1].xCoord = 0x98;
    switch (gUnknown_20399D8->field_1CCC)
    {
    case 1:
        LZ77UnCompWram(gUnknown_83F1084, gUnknown_20399D8->tileMap);
        gUnknown_20399D8->field_1CCE = 6;
        break;
    case 2: // never reached
        LZ77UnCompWram(gUnknown_83F1190, gUnknown_20399D8->tileMap);
        gUnknown_20399D8->field_1CCE = 4;
        break;
    case 3:
    default:
        gUnknown_20399D8->field_1CCE = 3;
        LZ77UnCompWram(gUnknown_83F0F1C, gUnknown_20399D8->tileMap);
        break;
    }
    LZ77UnCompWram(gUnknown_83F0580, gUnknown_20399D8->bgTiles);
    gUnknown_20399D8->field_1CC8 = 0;
    gUnknown_20399D8->field_1CCA = a0;
    gUnknown_20399D8->field_1CD0 = taskFunc;
    gUnknown_20399D8->field_1CCB = sub_80C0E34();
    sub_80C4AAC(0);
    sub_80C4E74(gText_RegionMap_AButtonOK);
    gTasks[taskId].func = sub_80C1098;
}

static void sub_80C0FE0(void)
{
    sub_80C4BE4();
    sub_80C4C2C(27, 4, 64);
    sub_80C4C5C(16 - gUnknown_20399D8->field_1CCD, gUnknown_20399D8->field_1CCD);
}

static bool8 sub_80C1014(void)
{
    if (gUnknown_20399D8->field_1CCD < 16)
    {
        sub_80C4C5C(16 - gUnknown_20399D8->field_1CCD, gUnknown_20399D8->field_1CCD);
        gUnknown_20399D8->field_1CCD += 2;
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

static bool8 sub_80C1058(void)
{
    if (gUnknown_20399D8->field_1CCD >= 2)
    {
        gUnknown_20399D8->field_1CCD -= 2;
        sub_80C4C5C(16 - gUnknown_20399D8->field_1CCD, gUnknown_20399D8->field_1CCD);
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

static void sub_80C1098(u8 taskId)
{
    switch (gUnknown_20399D8->field_1CC8)
    {
    case 0:
        NullVBlankHBlankCallbacks();
        sub_80C4E18(gText_RegionMap_UpDownPick);
        gUnknown_20399D8->field_1CC8++;
        break;
    case 1:
        LoadBgTiles(2, gUnknown_20399D8->bgTiles, 0x1000, 0x000);
        gUnknown_20399D8->field_1CC8++;
        break;
    case 2:
        sub_80C1324(2, gUnknown_20399D8->tileMap);
        CopyBgTilemapBufferToVram(2);
        gUnknown_20399D8->field_1CC8++;
        break;
    case 3:
        sub_80C0CA0();
        gUnknown_20399D8->field_1CC8++;
        break;
    case 4:
        sub_80C0FE0();
        ShowBg(2);
        gUnknown_20399D8->field_1CC8++;
        break;
    case 5:
        sub_80C08F4();
        gUnknown_20399D8->field_1CC8++;
        break;
    case 6:
        if (sub_80C1014() == TRUE)
        {
            sub_80C1390();
            gUnknown_20399D8->field_1CC8++;
        }
        break;
    case 7:
        if (sub_80C144C() == TRUE)
        {
            gUnknown_20399D8->field_1CC8++;
        }
        break;
    case 8:
        if (LoadAndCreateSelectionCursorSpriteGfx() == TRUE)
        {
            gUnknown_20399D8->field_1CC8++;
        }
        break;
    case 9:
        if (sub_80C1478() == TRUE)
        {
            SetWhichRegionMap(gUnknown_20399D8->field_1CCA);
            if (sub_80C0E34() == gUnknown_20399D8->field_1CCA)
            {
                sub_80C4324(FALSE);
                sub_80C48BC(gUnknown_20399D8->field_1CCA, 25, FALSE);
                sub_80C4960(gUnknown_20399D8->field_1CCA, 25, FALSE);
            }
            gUnknown_20399D8->field_1CC8++;
        }
        break;
    case 10:
        if (sub_80C12EC() == TRUE)
        {
            DestroySelectionCursorSprites();
            sub_80C0FE0();
            gUnknown_20399D8->field_1CC8++;
        }
        break;
    case 11:
        if (sub_80C1058() == TRUE)
        {
            gUnknown_20399D8->field_1CC8++;
        }
        break;
    case 12:
        sub_80C3154(FALSE);
        gUnknown_20399D8->field_1CC8++;
        break;
    default:
        sub_80C1280(taskId);
        break;
    }
}

static void sub_80C1280(u8 taskId)
{
    gTasks[taskId].func = gUnknown_20399D8->field_1CD0;
    HideBg(2);
    sub_80C4E18(gText_RegionMap_DPadMove);
    sub_80C4E74(gText_RegionMap_AButtonSwitch);
    sub_80C0AB8();
    sub_80C0B9C();
    SetGpuWindowDims(0, &sStdWindowDims[2]);
    FREE_IF_NOT_NULL(gUnknown_20399D8);
}

static bool8 sub_80C12EC(void)
{
    if (gUnknown_20399D8->field_1CDC != 0)
    {
        gUnknown_20399D8->field_1CDC--;
        SetGpuReg(REG_OFFSET_BLDY, gUnknown_20399D8->field_1CDC);
        return FALSE;
    }
    else
    {
        SetGpuReg(REG_OFFSET_BLDY, 0);
        return TRUE;
    }
}

static void sub_80C1324(u8 bg, u16 *map)
{
    s16 i;
    s16 j;
    u16 *buffer = gUnknown_20399D4->bgTilemapBuffers[bg];
    for (i = 0; i < 20; i++)
    {
        for (j = 0; j < 32; j++)
        {
            if (j < 30)
                buffer[32 * i + j] = map[30 * i + j];
            else
                buffer[32 * i + j] = map[0];
        }
    }
}

static void sub_80C1390(void)
{
    struct GpuWindowParams data;
    data.v0 = gUnknown_20399D8->field_1CD4[0] = 0x48;
    data.v2 = gUnknown_20399D8->field_1CD4[1] = 8 * (gUnknown_20399D8->field_1CCE + 4 * gUnknown_20399D8->field_1CCA);
    data.v4 = gUnknown_20399D8->field_1CD4[2] = 0xA8;
    data.v6 = gUnknown_20399D8->field_1CD4[3] = gUnknown_20399D8->field_1CD4[1] + 32;
    sub_80C4BE4();
    sub_80C4C2C(0, 0x15, 0xc0);
    sub_80C4C74(0x1f, 0x15);
    sub_80C4C88(0x3f);
    sub_80C4C9C(1, 0);
    SetGpuWindowDims(1, &data);
}

static bool8 sub_80C144C(void)
{
    if (gUnknown_20399D8->field_1CDC < 6)
    {
        gUnknown_20399D8->field_1CDC++;
        sub_80C4C48(gUnknown_20399D8->field_1CDC);
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

static bool8 sub_80C1478(void)
{
    bool8 r6 = FALSE;
    struct GpuWindowParams data;
    data.v0 = gUnknown_20399D8->field_1CD4[0] = 0x48;
    data.v2 = gUnknown_20399D8->field_1CD4[1] = 8 * (gUnknown_20399D8->field_1CCE + 4 * gUnknown_20399D8->field_1CCA);
    data.v4 = gUnknown_20399D8->field_1CD4[2] = 0xA8;
    data.v6 = gUnknown_20399D8->field_1CD4[3] = gUnknown_20399D8->field_1CD4[1] + 32;
    if (JOY_NEW(DPAD_UP) && gUnknown_20399D8->field_1CCA != 0)
    {
        PlaySE(SE_BAG1);
        gUnknown_20399D8->field_1CCA--;
        r6 = TRUE;
    }
    if (JOY_NEW(DPAD_DOWN) && gUnknown_20399D8->field_1CCA < gUnknown_20399D8->field_1CCC)
    {
        PlaySE(SE_BAG1);
        gUnknown_20399D8->field_1CCA++;
        r6 = TRUE;
    }
    if (JOY_NEW(A_BUTTON) && gUnknown_20399D8->field_1CDC == 6)
    {
        PlaySE(SE_W129);
        gUnknown_20399D8->field_1CCB = gUnknown_20399D8->field_1CCA;
        return TRUE;
    }
    if (JOY_NEW(B_BUTTON))
    {
        gUnknown_20399D8->field_1CCA = gUnknown_20399D8->field_1CCB;
        sub_80C0CC8(0, gUnknown_20399D4->layouts[gUnknown_20399D8->field_1CCA]);
        CopyBgTilemapBufferToVram(0);
        sub_80C48BC(255, 25, TRUE);
        sub_80C4960(255, 25, TRUE);
        return TRUE;
    }
    if (r6)
    {
        sub_80C0CC8(0, gUnknown_20399D4->layouts[gUnknown_20399D8->field_1CCA]);
        sub_80C4E74(gText_RegionMap_AButtonOK);
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(3);
        sub_80C48BC(255, 25, TRUE);
        sub_80C4960(255, 25, TRUE);
        sub_80C48BC(gUnknown_20399D8->field_1CCA, 25, FALSE);
        sub_80C4960(gUnknown_20399D8->field_1CCA, 25, FALSE);
    }
    if (gUnknown_20399D8->field_1CCA != sub_80C0E34())
        sub_80C4324(TRUE);
    else
        sub_80C4324(FALSE);
    SetGpuWindowDims(1, &data);
    return FALSE;
}

static void SpriteCB_SelectionCursor(struct Sprite * sprite)
{
    sprite->pos1.y = gUnknown_20399D8->field_1CD4[1] + 16;
}

static bool8 LoadAndCreateSelectionCursorSpriteGfx(void)
{
    switch (gUnknown_20399D8->selectionCursorLoadState)
    {
    case 0:
        LZ77UnCompWram(sSelectionCursorLeftTiles, gUnknown_20399D8->selectionCursorSubspriteData[0].tiles);
        break;
    case 1:
        LZ77UnCompWram(sSelectionCursorRightTiles, gUnknown_20399D8->selectionCursorSubspriteData[1].tiles);
        break;
    case 2:
        CreateSelectionCursorSubsprite(0, 2, 2);
        CreateSelectionCursorSubsprite(1, 3, 3);
        break;
    default:
        return TRUE;
    }
    gUnknown_20399D8->selectionCursorLoadState++;
    return FALSE;
}

static void CreateSelectionCursorSubsprite(u8 whichSprite, u16 tileTag, u16 paletteTag)
{
    RealCreateSelectionCursorSubsprite(whichSprite, tileTag, paletteTag);
}

static void RealCreateSelectionCursorSubsprite(u8 whichSprite, u16 tileTag, u16 paletteTag)
{
    u8 spriteId;

    struct SpriteSheet spriteSheet = {
        .data = gUnknown_20399D8->selectionCursorSubspriteData[whichSprite].tiles,
        .size = 0x400,
        .tag = tileTag
    };
    struct SpritePalette spritePalette = {
        .data = sSelectionCursorPals,
        .tag = paletteTag
    };
    struct SpriteTemplate template = {
        .tileTag = tileTag,
        .paletteTag = paletteTag,
        .oam = &sSelectionCursorOam,
        .anims = sSelectionCursorAnims,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_SelectionCursor
    };

    gUnknown_20399D8->selectionCursorSubspriteData[whichSprite].tileTag = tileTag;
    gUnknown_20399D8->selectionCursorSubspriteData[whichSprite].paletteTag = paletteTag;

    LoadSpriteSheet(&spriteSheet);
    LoadSpritePalette(&spritePalette);

    spriteId = CreateSprite(&template, gUnknown_20399D8->selectionCursorSubspriteData[whichSprite].xCoord, 8 * (gUnknown_20399D8->field_1CCE + 4 * gUnknown_20399D8->field_1CCA), 0);
    gUnknown_20399D8->selectionCursorSubspriteData[whichSprite].sprite = &gSprites[spriteId];
    gSprites[spriteId].invisible = FALSE;
}

static void DestroySelectionCursorSprites(void)
{
    u8 i;
    for (i = 0; i < 2; i++)
    {
        if (gUnknown_20399D8->selectionCursorSubspriteData[i].sprite != NULL)
        {
            DestroySprite(gUnknown_20399D8->selectionCursorSubspriteData[i].sprite);
            FreeSpriteTilesByTag(gUnknown_20399D8->selectionCursorSubspriteData[i].tileTag);
            FreeSpritePaletteByTag(gUnknown_20399D8->selectionCursorSubspriteData[i].paletteTag);
        }
    }
}

static const u8 *GetDungeonFlavorText(u16 mapsec)
{
    u8 i;
    for (i = 0; i < NELEMS(sDungeonHighlights); i++)
    {
        if (sDungeonHighlights[i].id == mapsec)
            return sDungeonHighlights[i].desc;
    }
    return gText_RegionMap_NoData;
}

static const u8 *GetDungeonName(u16 mapsec)
{
    u8 i;
    for (i = 0; i < NELEMS(sDungeonHighlights); i++)
    {
        if (sDungeonHighlights[i].id == mapsec)
            return sDungeonHighlights[i].name;
    }
    return gText_RegionMap_NoData;
}

static void RegionMapCreateDungeonMapPreview(u8 a0, u8 taskId, TaskFunc taskFunc)
{
    u8 r0;
    sDungeonMapPreviewManager = AllocZeroed(sizeof(struct DungeonMapPreviewManagerStruct));
    r0 = GetMapSecUnderCursor();
    if (r0 == MAPSEC_TANOBY_CHAMBERS)
        r0 = MAPSEC_MONEAN_CHAMBER;
    sDungeonMapPreviewManager->mapPreviewInfo = GetDungeonMapPreviewScreenInfo(r0);
    if (sDungeonMapPreviewManager->mapPreviewInfo == NULL)
        sDungeonMapPreviewManager->mapPreviewInfo = GetDungeonMapPreviewScreenInfo(MAPSEC_ROCK_TUNNEL);
    sDungeonMapPreviewManager->dungeonMapPreviewPrepState = 0;
    sDungeonMapPreviewManager->field_3D4A = 0;
    sDungeonMapPreviewManager->savedTask = taskFunc;
    sDungeonMapPreviewManager->field_3E14 = 0;
    sub_80C4AAC(0);
    sub_80C4BE4();
    sub_80C0CA0();
    gTasks[taskId].func = Task_PrepDungeonMapPreviewAndFlavorText;
}

static bool8 HandleLoadMapPreviewScreenGfx(void)
{
    switch (sDungeonMapPreviewManager->field_3D4A)
    {
    case 0:
        LZ77UnCompWram(sDungeonMapPreviewManager->mapPreviewInfo->tilesptr, sDungeonMapPreviewManager->tiles);
        break;
    case 1:
        LZ77UnCompWram(sDungeonMapPreviewManager->mapPreviewInfo->tilemapptr, sDungeonMapPreviewManager->tilemap);
        break;
    case 2:
        LoadBgTiles(2, sDungeonMapPreviewManager->tiles, 0x3840, 0x000);
        break;
    case 3:
        LoadPalette(sDungeonMapPreviewManager->mapPreviewInfo->palptr, 0xD0, 0x60);
        break;
    default:
        return TRUE;
    }
    sDungeonMapPreviewManager->field_3D4A++;
    return FALSE;
}

static void Task_PrepDungeonMapPreviewAndFlavorText(u8 taskId)
{
    switch (sDungeonMapPreviewManager->dungeonMapPreviewPrepState)
    {
    case 0:
        NullVBlankHBlankCallbacks();
        sDungeonMapPreviewManager->dungeonMapPreviewPrepState++;
        break;
    case 1:
        if (HandleLoadMapPreviewScreenGfx() == TRUE)
            sDungeonMapPreviewManager->dungeonMapPreviewPrepState++;
        break;
    case 2:
        sub_80C1E94();
        sub_80C4E74(gText_RegionMap_AButtonCancel2);
        sDungeonMapPreviewManager->dungeonMapPreviewPrepState++;
        break;
    case 3:
        CopyMapPreviewTilemapToBgTilemapBuffer(2, sDungeonMapPreviewManager->tilemap);
        CopyBgTilemapBufferToVram(2);
        sDungeonMapPreviewManager->dungeonMapPreviewPrepState++;
        break;
    case 4:
        ShowBg(2);
        sDungeonMapPreviewManager->dungeonMapPreviewPrepState++;
        break;
    case 5:
        sub_80C08F4();
        sDungeonMapPreviewManager->dungeonMapPreviewPrepState++;
        break;
    case 6:
        if (sub_80C1F80(FALSE) == TRUE)
            sDungeonMapPreviewManager->dungeonMapPreviewPrepState++;
        break;
    case 7:
        gTasks[taskId].func = Task_DrawDungeonMapPreviewAndFlavorText;
        break;
    case 8:
        if (sub_80C1F80(TRUE) == TRUE)
        {
            sDungeonMapPreviewManager->dungeonMapPreviewPrepState++;
        }
        break;
    case 9:
        DestroyMapPreviewAssets(taskId);
        sDungeonMapPreviewManager->dungeonMapPreviewPrepState++;
        break;
    }
}

static void Task_DrawDungeonMapPreviewAndFlavorText(u8 taskId)
{
    switch (sDungeonMapPreviewManager->dungeonMapPreviewDrawState)
    {
    case 0:
        sDungeonMapPreviewManager->field_3E0E = 0x0133;
        sDungeonMapPreviewManager->field_3E10 = 0x0100;
        sDungeonMapPreviewManager->field_3E12 = 0x00F0;
        sDungeonMapPreviewManager->dungeonMapPreviewDrawState++;
        break;
    case 1:
        if (sDungeonMapPreviewManager->field_3D4C++ > 40)
        {
            sDungeonMapPreviewManager->field_3D4C = 0;
            sDungeonMapPreviewManager->dungeonMapPreviewDrawState++;
        }
        break;
    case 2:
        FillWindowPixelBuffer(2, PIXEL_FILL(0));
        CopyWindowToVram(2, 3);
        PutWindowTilemap(2);
        sDungeonMapPreviewManager->dungeonMapPreviewDrawState++;
        break;
    case 3:
        if (sDungeonMapPreviewManager->field_3D4C > 25)
        {
            AddTextPrinterParameterized3(2, 2, 4, 0, sTextColor_Green, -1, GetDungeonName(GetMapSecUnderCursor()));
            AddTextPrinterParameterized3(2, 2, 2, 14, sTextColor_White, -1, GetDungeonFlavorText(GetMapSecUnderCursor()));
            CopyWindowToVram(2, 3);
            sDungeonMapPreviewManager->dungeonMapPreviewDrawState++;
        }
        else if (sDungeonMapPreviewManager->field_3D4C > 20)
        {
            sDungeonMapPreviewManager->field_3E0E -= 6;
            sDungeonMapPreviewManager->field_3E10 -= 5;
            sDungeonMapPreviewManager->field_3E12 -= 5;
            CpuCopy16(sDungeonMapPreviewManager->mapPreviewInfo->palptr, sDungeonMapPreviewManager->field_3D4E, 0x60);
            TintPalette_CustomTone(sDungeonMapPreviewManager->field_3D4E, 0x30, sDungeonMapPreviewManager->field_3E0E, sDungeonMapPreviewManager->field_3E10, sDungeonMapPreviewManager->field_3E12);
            LoadPalette(sDungeonMapPreviewManager->field_3D4E, 0xD0, 0x60);
        }
        sDungeonMapPreviewManager->field_3D4C++;
        break;
    case 4:
        if (JOY_NEW(B_BUTTON) || JOY_NEW(A_BUTTON))
        {
            FillWindowPixelBuffer(2, PIXEL_FILL(0));
            CopyWindowToVram(2, 3);
            sDungeonMapPreviewManager->dungeonMapPreviewPrepState++;
            sDungeonMapPreviewManager->dungeonMapPreviewDrawState++;
        }
        break;
    default:
        gTasks[taskId].func = Task_PrepDungeonMapPreviewAndFlavorText;
        break;
    }
}

static void DestroyMapPreviewAssets(u8 taskId)
{
    gTasks[taskId].func = sDungeonMapPreviewManager->savedTask;
    HideBg(2);
    sub_80C4B30(0);
    sub_80C0B18();
    sub_80C0BB0();
    sub_80C0AB8();
    sub_80C0B9C();
    sub_80C4E74(gText_RegionMap_AButtonGuide);
    FREE_IF_NOT_NULL(sDungeonMapPreviewManager);
}

static void CopyMapPreviewTilemapToBgTilemapBuffer(u8 bgId, const u16 * tilemap)
{
    CopyToBgTilemapBufferRect(2, tilemap, 0, 0, 32, 20);
}

static void sub_80C1E94(void)
{
    u16 r4;
    u16 r0;
    sub_80C4BE4();
    sub_80C4C2C(0, 17, 192);
    sub_80C4C48(sDungeonMapPreviewManager->field_3E14);
    sub_80C4C74(0, 13);
    sub_80C4C88(59);
    sub_80C4C9C(1, 0);
    r4 = GetMapCursorX();
    r0 = GetMapCursorY();
    sDungeonMapPreviewManager->field_3E16 = 8 * r4 + 32;
    sDungeonMapPreviewManager->field_3E18 = 8 * r0 + 24;
    sDungeonMapPreviewManager->field_3E1A = sDungeonMapPreviewManager->field_3E16 + 8;
    sDungeonMapPreviewManager->field_3E1C = sDungeonMapPreviewManager->field_3E18 + 8;
    sDungeonMapPreviewManager->field_3E1E = (0x10 - sDungeonMapPreviewManager->field_3E16) / 8;
    sDungeonMapPreviewManager->field_3E20 = (0x20 - sDungeonMapPreviewManager->field_3E18) / 8;
    sDungeonMapPreviewManager->field_3E22 = (0xE0 - sDungeonMapPreviewManager->field_3E1A) / 8;
    sDungeonMapPreviewManager->field_3E24 = (0x88 - sDungeonMapPreviewManager->field_3E1C) / 8;
}

static bool8 sub_80C1F80(bool8 a0)
{
    struct GpuWindowParams data;

    if (!a0)
    {
        if (sDungeonMapPreviewManager->field_3D4B < 8)
        {
            sDungeonMapPreviewManager->field_3E16 += sDungeonMapPreviewManager->field_3E1E;
            sDungeonMapPreviewManager->field_3E18 += sDungeonMapPreviewManager->field_3E20;
            sDungeonMapPreviewManager->field_3E1A += sDungeonMapPreviewManager->field_3E22;
            sDungeonMapPreviewManager->field_3E1C += sDungeonMapPreviewManager->field_3E24;
            sDungeonMapPreviewManager->field_3D4B++;
            if (sDungeonMapPreviewManager->field_3E14 < 6)
                sDungeonMapPreviewManager->field_3E14++;
        }
        else
        {
            return TRUE;
        }
    }
    else
    {
        if (sDungeonMapPreviewManager->field_3D4B == 0)
        {
            return TRUE;
        }
        else
        {
            sDungeonMapPreviewManager->field_3E16 -= sDungeonMapPreviewManager->field_3E1E;
            sDungeonMapPreviewManager->field_3E18 -= sDungeonMapPreviewManager->field_3E20;
            sDungeonMapPreviewManager->field_3E1A -= sDungeonMapPreviewManager->field_3E22;
            sDungeonMapPreviewManager->field_3E1C -= sDungeonMapPreviewManager->field_3E24;
            sDungeonMapPreviewManager->field_3D4B--;
            if (sDungeonMapPreviewManager->field_3E14 > 0)
                sDungeonMapPreviewManager->field_3E14--;
        }
    }
    data.v0 = sDungeonMapPreviewManager->field_3E16;
    data.v2 = sDungeonMapPreviewManager->field_3E18;
    data.v4 = sDungeonMapPreviewManager->field_3E1A;
    data.v6 = sDungeonMapPreviewManager->field_3E1C;
    SetGpuWindowDims(1, &data);
    sub_80C4C48(sDungeonMapPreviewManager->field_3E14);
    return FALSE;
}

static void nullsub_63(struct Sprite * sprite)
{

}

static void sub_80C210C(u8 a0, u8 a1, u8 a2)
{
    u8 spriteId;
    struct SpriteSheet spriteSheet = {
        .data = gUnknown_20399E0->field_000[a0],
        .size = 0x400,
        .tag = a1
    };
    struct SpritePalette spritePalette = {
        .data = gUnknown_83EF3A4,
        .tag = a2
    };
    struct SpriteTemplate template = {
        .tileTag = a1,
        .paletteTag = a2,
        .oam = &gUnknown_83F1C20,
        .anims = gUnknown_83F1C30,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = nullsub_63
    };

    gUnknown_20399E0->field_000[a0]->field_408 = a1;
    gUnknown_20399E0->field_000[a0]->field_40A = a2;
    LoadSpriteSheet(&spriteSheet);
    LoadSpritePalette(&spritePalette);
    spriteId = CreateSprite(&template, gUnknown_20399E0->field_000[a0]->field_404, gUnknown_20399E0->field_000[a0]->field_406, 0);
    gUnknown_20399E0->field_000[a0]->field_400 = &gSprites[spriteId];
    gSprites[spriteId].invisible = TRUE;
}

static void sub_80C2208(u8 taskId, TaskFunc taskFunc)
{
    u8 i;

    gUnknown_20399E0 = AllocZeroed(sizeof(struct UnkStruct_20399E0));
    for (i = 0; i < 6; i++)
    {
        gUnknown_20399E0->field_000[i] = AllocZeroed(sizeof(struct UnkStruct_20399E0_000));
        gUnknown_20399E0->field_000[i]->field_404 = 32 * (i / 3) + 0x68;
        gUnknown_20399E0->field_000[i]->field_406 = 64 * (i % 3) + 0x28;
    }
    sub_80C4AAC(0);
    sub_80C4BE4();
    sub_80C24BC();
    SetBg0andBg3Visibility(1);
    gUnknown_20399E0->field_CC8 = taskFunc;
    gTasks[taskId].func = sub_80C267C;
}

static void sub_80C22C4(u8 a0, bool8 a1)
{
    u8 i;
    if (a0 == 6)
    {
        for (i = 0; i < 6; i++)
        {
            gUnknown_20399E0->field_000[i]->field_400->invisible = a1;
        }
    }
    else
    {
        gUnknown_20399E0->field_000[a0]->field_400->invisible = a1;
    }
}

static bool8 sub_80C2344(void)
{
    switch (gUnknown_20399E0->field_CCD)
    {
    case 0:
        LZ77UnCompWram(gUnknown_83F12CC, gUnknown_20399E0->field_000[0]->field_000);
        sub_80C210C(0, 4, 4);
        break;
    case 1:
        LZ77UnCompWram(gUnknown_83F1550, gUnknown_20399E0->field_000[1]->field_000);
        sub_80C210C(1, 5, 5);
        break;
    case 2:
        LZ77UnCompWram(gUnknown_83F1738, gUnknown_20399E0->field_000[2]->field_000);
        sub_80C210C(2, 6, 6);
        break;
    case 3:
        LZ77UnCompWram(gUnknown_83F13EC, gUnknown_20399E0->field_000[3]->field_000);
        sub_80C210C(3, 7, 7);
        break;
    case 4:
        LZ77UnCompWram(gUnknown_83F1640, gUnknown_20399E0->field_000[4]->field_000);
        sub_80C210C(4, 8, 8);
        break;
    case 5:
        LZ77UnCompWram(gUnknown_83F1804, gUnknown_20399E0->field_000[5]->field_000);
        sub_80C210C(5, 9, 9);
        break;
    case 6:
        LZ77UnCompWram(gUnknown_83F0330, gUnknown_20399E0->field_018);
        break;
    case 7:
        LZ77UnCompWram(gUnknown_83F0E0C, gUnknown_20399E0->field_818);
        break;
    case 8:
        LoadBgTiles(1, gUnknown_20399E0->field_018, BG_SCREEN_SIZE, 0x000);
        break;
    default:
        return TRUE;
    }
    gUnknown_20399E0->field_CCD++;
    return FALSE;
}

static void sub_80C24BC(void)
{
    struct GpuWindowParams data;
    data.v0 = gUnknown_20399E0->field_000[0]->field_404 + 8;
    data.v2 = 0x10;
    data.v4 = gUnknown_20399E0->field_000[3]->field_404 - 8;
    data.v6 = 0xA0;
    sub_80C4C2C(0, 2, 0);
    sub_80C4C74(18, 0);
    sub_80C4C88(16);
    SetGpuWindowDims(0, &data);
    sub_80C4C9C(0, 0);
}

static void sub_80C253C(void)
{
    struct GpuWindowParams data = gUnknown_83F1C34;
    sub_80C4BE4();
    sub_80C4C2C(2, 41, 128);
    sub_80C4C48(gUnknown_20399E0->field_CD0);
    sub_80C4C74(55, 0);
    sub_80C4C88(18);
    SetGpuWindowDims(0, &data);
    sub_80C4C9C(0, 0);
}

static void sub_80C2594(u8 taskId)
{
    gTasks[taskId].func = gUnknown_20399E0->field_CC8;
}

static void sub_80C25BC(void)
{
    u8 i;
    sub_80C2604();
    for (i = 0; i < 6; i++)
    {
        FREE_IF_NOT_NULL(gUnknown_20399E0->field_000[i]);
    }
    FREE_IF_NOT_NULL(gUnknown_20399E0);
}

static void sub_80C2604(void)
{
    u8 i;
    for (i = 0; i < 6; i++)
    {
        gUnknown_20399E0->field_000[i]->field_404 = gUnknown_20399E0->field_000[i]->field_400->pos1.x;
        gUnknown_20399E0->field_000[i]->field_406 = gUnknown_20399E0->field_000[i]->field_400->pos1.y;
        if (gUnknown_20399E0->field_000[i]->field_400 != NULL)
        {
            DestroySprite(gUnknown_20399E0->field_000[i]->field_400);
            FreeSpriteTilesByTag(gUnknown_20399E0->field_000[i]->field_408);
            FreeSpritePaletteByTag(gUnknown_20399E0->field_000[i]->field_40A);
        }
    }
}

static void sub_80C267C(u8 taskId)
{
    switch (gUnknown_20399E0->field_CCC)
    {
    case 0:
        NullVBlankHBlankCallbacks();
        gUnknown_20399E0->field_CCC++;
        break;
    case 1:
        if (sub_80C2344() == TRUE)
            gUnknown_20399E0->field_CCC++;
        break;
    case 2:
        CopyToBgTilemapBufferRect(1, gUnknown_20399E0->field_818, 0, 0, 30, 20);
        gUnknown_20399E0->field_CCC++;
        break;
    case 3:
        CopyBgTilemapBufferToVram(1);
        BlendPalettes(0xFFFFFFFF, 0x10, RGB_BLACK);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        sub_80C08F4();
        gUnknown_20399E0->field_CCC++;
        break;
    case 4:
        ShowBg(0);
        ShowBg(3);
        ShowBg(1);
        sub_80C22C4(6, FALSE);
        sub_80C2B48();
        gUnknown_20399E0->field_CCC++;
        break;
    case 5:
        if (!gPaletteFade.active)
        {
            gUnknown_20399E0->field_CCC++;
            PlaySE(SE_CARD3);
        }
        break;
    case 6:
        if (sub_80C29A4() == TRUE)
            gUnknown_20399E0->field_CCC++;
        break;
    case 7:
        sub_80C4324(FALSE);
        sub_80C3154(FALSE);
        gUnknown_20399E0->field_CCC++;
        break;
    case 8:
        gUnknown_20399E0->field_CD0 = 15;
        sub_80C253C();
        SetBg0andBg3Visibility(0);
        sub_80C48BC(GetWhichRegionMap(), 25, FALSE);
        sub_80C4960(GetWhichRegionMap(), 25, FALSE);
        gUnknown_20399E0->field_CCC++;
        break;
    case 9:
        sub_80C4E18(gText_RegionMap_DPadMove);
        if (sub_80C3AC8(1) != 2)
            sub_80C4E74(gText_RegionMap_Space);
        else
            sub_80C4E74(gText_RegionMap_AButtonGuide);
        sub_80C4ED0(FALSE);
        gUnknown_20399E0->field_CCC++;
        break;
    case 10:
        LoadPalette(&gUnknown_83EF23C[15], 0x00, 2);
        LoadPalette(&gUnknown_83EF23C[15], 0x10, 2);
        LoadPalette(&gUnknown_83EF23C[15], 0x20, 2);
        LoadPalette(&gUnknown_83EF23C[15], 0x30, 2);
        LoadPalette(&gUnknown_83EF23C[15], 0x40, 2);
        gUnknown_20399E0->field_CCC++;
        break;
    case 11:
        FillBgTilemapBufferRect(1, 0x002, 0, 1, 1, 1, 0x2);
        FillBgTilemapBufferRect(1, 0x003, 1, 1, 1, 1, 0x2);
        FillBgTilemapBufferRect(1, 0x03E, 28, 1, 1, 1, 0x2);
        FillBgTilemapBufferRect(1, 0x03F, 29, 1, 1, 1, 0x2);
        FillBgTilemapBufferRect(1, 0x03D, 2, 1, 26, 1, 0x2);
        CopyBgTilemapBufferToVram(1);
        m4aSongNumStop(SE_CARD3);
        PlaySE(SE_HI_TURUN);
        gUnknown_20399E0->field_CCC++;
        break;
    case 12:
        if (gUnknown_20399E0->field_CD0 == 2)
        {
            sub_80C22C4(6, TRUE);
            gUnknown_20399E0->field_CCC++;
            sub_80C4C48(0);
        }
        else
        {
            gUnknown_20399E0->field_CD0--;
            sub_80C4C48(gUnknown_20399E0->field_CD0);
        }
        break;
    case 13:
        sub_80C4B30(0);
        sub_80C0BB0();
        gUnknown_20399E0->field_CCC++;
        break;
    default:
        sub_80C2604();
        sub_80C2594(taskId);
        break;
    }
}

static bool8 sub_80C29A4(void)
{
    sub_80C2B48();
    if (gUnknown_20399E0->field_000[0]->field_400->pos1.x == 0)
    {
        return TRUE;
    }
    else if (gUnknown_20399E0->field_CCE > 17)
    {
        gUnknown_20399E0->field_000[0]->field_400->pos1.x -= 1;
        gUnknown_20399E0->field_000[1]->field_400->pos1.x -= 1;
        gUnknown_20399E0->field_000[2]->field_400->pos1.x -= 1;
        gUnknown_20399E0->field_000[3]->field_400->pos1.x += 1;
        gUnknown_20399E0->field_000[4]->field_400->pos1.x += 1;
        gUnknown_20399E0->field_000[5]->field_400->pos1.x += 1;
    }
    else if (gUnknown_20399E0->field_CCE > 14)
    {
        gUnknown_20399E0->field_000[0]->field_400->pos1.x -= 2;
        gUnknown_20399E0->field_000[1]->field_400->pos1.x -= 2;
        gUnknown_20399E0->field_000[2]->field_400->pos1.x -= 2;
        gUnknown_20399E0->field_000[3]->field_400->pos1.x += 2;
        gUnknown_20399E0->field_000[4]->field_400->pos1.x += 2;
        gUnknown_20399E0->field_000[5]->field_400->pos1.x += 2;
    }
    else if (gUnknown_20399E0->field_CCE > 10)
    {
        gUnknown_20399E0->field_000[0]->field_400->pos1.x -= 3;
        gUnknown_20399E0->field_000[1]->field_400->pos1.x -= 3;
        gUnknown_20399E0->field_000[2]->field_400->pos1.x -= 3;
        gUnknown_20399E0->field_000[3]->field_400->pos1.x += 3;
        gUnknown_20399E0->field_000[4]->field_400->pos1.x += 3;
        gUnknown_20399E0->field_000[5]->field_400->pos1.x += 3;
    }
    else if (gUnknown_20399E0->field_CCE > 6)
    {
        gUnknown_20399E0->field_000[0]->field_400->pos1.x -= 5;
        gUnknown_20399E0->field_000[1]->field_400->pos1.x -= 5;
        gUnknown_20399E0->field_000[2]->field_400->pos1.x -= 5;
        gUnknown_20399E0->field_000[3]->field_400->pos1.x += 5;
        gUnknown_20399E0->field_000[4]->field_400->pos1.x += 5;
        gUnknown_20399E0->field_000[5]->field_400->pos1.x += 5;
    }
    else
    {
        gUnknown_20399E0->field_000[0]->field_400->pos1.x -= 8;
        gUnknown_20399E0->field_000[1]->field_400->pos1.x -= 8;
        gUnknown_20399E0->field_000[2]->field_400->pos1.x -= 8;
        gUnknown_20399E0->field_000[3]->field_400->pos1.x += 8;
        gUnknown_20399E0->field_000[4]->field_400->pos1.x += 8;
        gUnknown_20399E0->field_000[5]->field_400->pos1.x += 8;
    }
    gUnknown_20399E0->field_CCE++;
    return FALSE;
}

static void sub_80C2B48(void)
{
    struct GpuWindowParams data;
    data.v0 = gUnknown_20399E0->field_000[0]->field_400->pos1.x;
    data.v2 = 0x10;
    data.v4 = gUnknown_20399E0->field_000[3]->field_400->pos1.x;
    data.v6 = 0xA0;
    SetGpuWindowDims(0, &data);
}

static void sub_80C2B9C(void)
{
    struct GpuWindowParams data;
    data.v0 = gUnknown_20399E0->field_000[0]->field_404 + 16;
    data.v2 = 0x10;
    data.v4 = gUnknown_20399E0->field_000[3]->field_404 - 16;
    data.v6 = 0xA0;
    sub_80C4C2C(0, 2, 0);
    sub_80C4C74(18, 0);
    sub_80C4C88(16);
    SetGpuWindowDims(0, &data);
    sub_80C4C9C(0, 0);
}

static void sub_80C2C1C(u8 taskId)
{
    gTasks[taskId].func = sub_80C2C7C;
}

static void sub_80C2C38(void)
{
    sub_80C210C(0, 4, 4);
    sub_80C210C(1, 5, 5);
    sub_80C210C(2, 6, 6);
    sub_80C210C(3, 7, 7);
    sub_80C210C(4, 8, 8);
    sub_80C210C(5, 9, 9);
}

static void sub_80C2C7C(u8 taskId)
{
    switch (gUnknown_20399E0->field_CCF)
    {
    case 0:
        sub_80C4ED0(TRUE);
        CopyWindowToVram(3, 3);
        CopyWindowToVram(4, 3);
        gUnknown_20399E0->field_CCF++;
        break;
    case 1:
        sub_80C2C38();
        gUnknown_20399E0->field_CCF++;
        break;
    case 2:
        LoadPalette(gUnknown_83EF2DC, 0x00, 0xA0);
        gUnknown_20399E0->field_CCF++;
        break;
    case 3:
        sub_80C22C4(6, FALSE);
        sub_80C4324(TRUE);
        sub_80C3154(TRUE);
        sub_80C4960(255, 25, TRUE);
        sub_80C48BC(255, 25, TRUE);
        gUnknown_20399E0->field_CCE = 0;
        gUnknown_20399E0->field_CD0 = 0;
        gUnknown_20399E0->field_CCF++;
        break;
    case 4:
        sub_80C253C();
        gUnknown_20399E0->field_CCF++;
        break;
    case 5:
        if (gUnknown_20399E0->field_CD0 == 15)
        {
            sub_80C4C48(gUnknown_20399E0->field_CD0);
            gUnknown_20399E0->field_CCF++;
        }
        else
        {
            gUnknown_20399E0->field_CD0++;
            sub_80C4C48(gUnknown_20399E0->field_CD0);
        }
        break;
    case 6:
        sub_80C2B9C();
        sub_80C2B48();
        PlaySE(SE_CARD2);
        gUnknown_20399E0->field_CCF++;
        break;
    case 7:
        if (sub_80C2E1C() == TRUE)
            gUnknown_20399E0->field_CCF++;
        break;
    default:
        gTasks[taskId].func = gUnknown_20399E0->field_CC8;
        break;
    }
}


static bool8 sub_80C2E1C(void)
{
    sub_80C2B48();
    if (gUnknown_20399E0->field_000[0]->field_400->pos1.x == 104)
    {
        return TRUE;
    }
    else if (gUnknown_20399E0->field_CCE > 17)
    {
        gUnknown_20399E0->field_000[0]->field_400->pos1.x += 1;
        gUnknown_20399E0->field_000[1]->field_400->pos1.x += 1;
        gUnknown_20399E0->field_000[2]->field_400->pos1.x += 1;
        gUnknown_20399E0->field_000[3]->field_400->pos1.x -= 1;
        gUnknown_20399E0->field_000[4]->field_400->pos1.x -= 1;
        gUnknown_20399E0->field_000[5]->field_400->pos1.x -= 1;
    }
    else if (gUnknown_20399E0->field_CCE > 14)
    {
        gUnknown_20399E0->field_000[0]->field_400->pos1.x += 2;
        gUnknown_20399E0->field_000[1]->field_400->pos1.x += 2;
        gUnknown_20399E0->field_000[2]->field_400->pos1.x += 2;
        gUnknown_20399E0->field_000[3]->field_400->pos1.x -= 2;
        gUnknown_20399E0->field_000[4]->field_400->pos1.x -= 2;
        gUnknown_20399E0->field_000[5]->field_400->pos1.x -= 2;
    }
    else if (gUnknown_20399E0->field_CCE > 10)
    {
        gUnknown_20399E0->field_000[0]->field_400->pos1.x += 3;
        gUnknown_20399E0->field_000[1]->field_400->pos1.x += 3;
        gUnknown_20399E0->field_000[2]->field_400->pos1.x += 3;
        gUnknown_20399E0->field_000[3]->field_400->pos1.x -= 3;
        gUnknown_20399E0->field_000[4]->field_400->pos1.x -= 3;
        gUnknown_20399E0->field_000[5]->field_400->pos1.x -= 3;
    }
    else if (gUnknown_20399E0->field_CCE > 6)
    {
        gUnknown_20399E0->field_000[0]->field_400->pos1.x += 5;
        gUnknown_20399E0->field_000[1]->field_400->pos1.x += 5;
        gUnknown_20399E0->field_000[2]->field_400->pos1.x += 5;
        gUnknown_20399E0->field_000[3]->field_400->pos1.x -= 5;
        gUnknown_20399E0->field_000[4]->field_400->pos1.x -= 5;
        gUnknown_20399E0->field_000[5]->field_400->pos1.x -= 5;
    }
    else
    {
        gUnknown_20399E0->field_000[0]->field_400->pos1.x += 8;
        gUnknown_20399E0->field_000[1]->field_400->pos1.x += 8;
        gUnknown_20399E0->field_000[2]->field_400->pos1.x += 8;
        gUnknown_20399E0->field_000[3]->field_400->pos1.x -= 8;
        gUnknown_20399E0->field_000[4]->field_400->pos1.x -= 8;
        gUnknown_20399E0->field_000[5]->field_400->pos1.x -= 8;
    }
    gUnknown_20399E0->field_CCE++;
    return FALSE;
}

static void sub_80C2FC0(struct Sprite * sprite)
{
    if (gUnknown_20399E4->field_00C != 0)
    {
        sprite->pos1.x += gUnknown_20399E4->field_008;
        sprite->pos1.y += gUnknown_20399E4->field_00A;
        gUnknown_20399E4->field_00C--;
    }
    else
    {
        gUnknown_20399E4->field_01C->pos1.x = 8 * gUnknown_20399E4->field_000 + 36;
        gUnknown_20399E4->field_01C->pos1.y = 8 * gUnknown_20399E4->field_002 + 36;
    }
}

static void sub_80C3008(u16 a0, u16 a1)
{
    gUnknown_20399E4 = AllocZeroed(sizeof(struct UnkStruct_20399E4));
    LZ77UnCompWram(gUnknown_83EF4E0, gUnknown_20399E4->field_024);
    gUnknown_20399E4->field_020 = a0;
    gUnknown_20399E4->field_022 = a1;
    GetPlayerPositionOnRegionMap_HandleOverrides();
    gUnknown_20399E4->field_004 = 8 * gUnknown_20399E4->field_000 + 36;
    gUnknown_20399E4->field_006 = 8 * gUnknown_20399E4->field_002 + 36;
    gUnknown_20399E4->field_010 = sub_80C31C0;
    gUnknown_20399E4->field_016 = sub_80C35DC(gUnknown_20399E4->field_014);
    gUnknown_20399E4->field_018 = sub_80C3878(GetSelectedMapSection(GetWhichRegionMap(), 1, gUnknown_20399E4->field_002, gUnknown_20399E4->field_000));
    sub_80C309C();
}

static void sub_80C309C(void)
{
    u8 spriteId;
    struct SpriteSheet spriteSheet = {
        .data = gUnknown_20399E4->field_024,
        .size = 0x100,
        .tag = gUnknown_20399E4->field_020
    };
    struct SpritePalette spritePalette = {
        .data = gUnknown_83EF25C,
        .tag = gUnknown_20399E4->field_022
    };
    struct SpriteTemplate template = {
        .tileTag = gUnknown_20399E4->field_020,
        .paletteTag = gUnknown_20399E4->field_022,
        .oam = &gUnknown_83F1C3C,
        .anims = gUnknown_83F1C50,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = sub_80C2FC0
    };

    LoadSpriteSheet(&spriteSheet);
    LoadSpritePalette(&spritePalette);
    spriteId = CreateSprite(&template, gUnknown_20399E4->field_004, gUnknown_20399E4->field_006, 0);
    gUnknown_20399E4->field_01C = &gSprites[spriteId];
    sub_80C3154(TRUE);
}

static void sub_80C3154(bool8 a0)
{
    gUnknown_20399E4->field_01C->invisible = a0;
}

static void sub_80C3178(void)
{
    gUnknown_20399E4->field_00E = 0;
}

static void sub_80C3188(void)
{
    if (gUnknown_20399E4->field_01C != NULL)
    {
        DestroySprite(gUnknown_20399E4->field_01C);
        FreeSpriteTilesByTag(gUnknown_20399E4->field_020);
        FreeSpritePaletteByTag(gUnknown_20399E4->field_022);
    }
    FREE_IF_NOT_NULL(gUnknown_20399E4);
}

static u8 sub_80C31C0(void)
{
    u8 ret = 0;
    gUnknown_20399E4->field_008 = 0;
    gUnknown_20399E4->field_00A = 0;

    if (JOY_HELD(DPAD_UP))
    {
        if (gUnknown_20399E4->field_002 > 0)
        {
            gUnknown_20399E4->field_00A = -2;
            ret = 1;
        }
    }
    if (JOY_HELD(DPAD_DOWN))
    {
        if (gUnknown_20399E4->field_002 < 14)
        {
            gUnknown_20399E4->field_00A = 2;
            ret = 1;
        }
    }
    if (JOY_HELD(DPAD_RIGHT))
    {
        if (gUnknown_20399E4->field_000 < 21)
        {
            gUnknown_20399E4->field_008 = 2;
            ret = 1;
        }
    }
    if (JOY_HELD(DPAD_LEFT))
    {
        if (gUnknown_20399E4->field_000 > 0)
        {
            gUnknown_20399E4->field_008 = -2;
            ret = 1;
        }
    }
    if (JOY_NEW(A_BUTTON))
    {
        ret = 4;
        if (gUnknown_20399E4->field_000 == 21 && gUnknown_20399E4->field_002 == 13)
        {
            PlaySE(SE_W063B);
            ret = 6;
        }
        if (gUnknown_20399E4->field_000 == 21 && gUnknown_20399E4->field_002 == 11)
        {
            if (GetRegionMapPermission(MAPPERM_0) == TRUE)
            {
                PlaySE(SE_W063B);
                ret = 5;
            }
        }
    }
    else if (!JOY_NEW(B_BUTTON))
    {
        if (JOY_REPT(START_BUTTON))
        {
            sub_80C3418();
            gUnknown_20399E4->field_014 = GetSelectedMapSection(GetWhichRegionMap(), 0, gUnknown_20399E4->field_002, gUnknown_20399E4->field_000);
            gUnknown_20399E4->field_016 = sub_80C35DC(gUnknown_20399E4->field_014);
            gUnknown_20399E4->field_018 = sub_80C3878(GetSelectedMapSection(GetWhichRegionMap(), 1, gUnknown_20399E4->field_002, gUnknown_20399E4->field_000));
            return 3;
        }
        else if (JOY_NEW(SELECT_BUTTON) && gUnknown_20399D4->savedCallback == CB2_ReturnToField)
        {
            ret = 6;
        }
    }
    else
    {
        ret = 6;
    }
    if (ret == 1)
    {
        gUnknown_20399E4->field_00C = 4;
        gUnknown_20399E4->field_010 = sub_80C3348;
    }
    return ret;
}

static u8 sub_80C3348(void)
{
    if (gUnknown_20399E4->field_00C != 0)
        return 2;
    if (gUnknown_20399E4->field_008 > 0)
        gUnknown_20399E4->field_000++;
    if (gUnknown_20399E4->field_008 < 0)
        gUnknown_20399E4->field_000--;
    if (gUnknown_20399E4->field_00A > 0)
        gUnknown_20399E4->field_002++;
    if (gUnknown_20399E4->field_00A < 0)
        gUnknown_20399E4->field_002--;
    gUnknown_20399E4->field_014 = GetSelectedMapSection(GetWhichRegionMap(), 0, gUnknown_20399E4->field_002, gUnknown_20399E4->field_000);
    gUnknown_20399E4->field_016 = sub_80C35DC(gUnknown_20399E4->field_014);
    gUnknown_20399E4->field_018 = sub_80C3878(GetSelectedMapSection(GetWhichRegionMap(), 1, gUnknown_20399E4->field_002, gUnknown_20399E4->field_000));
    gUnknown_20399E4->field_010 = sub_80C31C0;
    return 3;
}

static u8 sub_80C3400(void)
{
    return gUnknown_20399E4->field_010();
}

static void sub_80C3418(void)
{
    if (GetRegionMapPermission(MAPPERM_0) == 1)
    {
        gUnknown_20399E4->field_00E++;
        gUnknown_20399E4->field_00E %= 3;
        if (gUnknown_20399E4->field_00E == 0 && GetWhichRegionMap() != sub_80C0E34())
        {
            gUnknown_20399E4->field_00E++;
        }
        switch (gUnknown_20399E4->field_00E)
        {
        case 0:
        default:
            gUnknown_20399E4->field_000 = sub_80C4380();
            gUnknown_20399E4->field_002 = sub_80C438C();
            break;
        case 1:
            gUnknown_20399E4->field_000 = 21;
            gUnknown_20399E4->field_002 = 11;
            break;
        case 2:
            gUnknown_20399E4->field_002 = 13;
            gUnknown_20399E4->field_000 = 21;
            break;
        }
    }
    else
    {
        gUnknown_20399E4->field_00E++;
        gUnknown_20399E4->field_00E %= 2;
        switch (gUnknown_20399E4->field_00E)
        {
        case 0:
        default:
            gUnknown_20399E4->field_000 = sub_80C4380();
            gUnknown_20399E4->field_002 = sub_80C438C();
            break;
        case 1:
            gUnknown_20399E4->field_002 = 13;
            gUnknown_20399E4->field_000 = 21;
            break;
        }
    }
    gUnknown_20399E4->field_01C->pos1.x = 8 * gUnknown_20399E4->field_000 + 36;
    gUnknown_20399E4->field_01C->pos1.y = 8 * gUnknown_20399E4->field_002 + 36;
    gUnknown_20399E4->field_014 = GetSelectedMapSection(GetWhichRegionMap(), 0, gUnknown_20399E4->field_002, gUnknown_20399E4->field_000);
}

static u16 GetMapCursorX(void)
{
    return gUnknown_20399E4->field_000;
}

static u16 GetMapCursorY(void)
{
    return gUnknown_20399E4->field_002;
}

static u16 sub_80C3520(void)
{
    u8 ret;
    if (gUnknown_20399E4->field_002 < 0
     || gUnknown_20399E4->field_002 > 14
     || gUnknown_20399E4->field_000 < 0
     || gUnknown_20399E4->field_000 > 21)
        return MAPSEC_NONE;

    ret = GetSelectedMapSection(GetWhichRegionMap(), 0, gUnknown_20399E4->field_002, gUnknown_20399E4->field_000);
    if ((ret == MAPSEC_NAVEL_ROCK || ret == MAPSEC_BIRTH_ISLAND) && !FlagGet(FLAG_WORLD_MAP_NAVEL_ROCK_EXTERIOR))
        ret = MAPSEC_NONE;
    return ret;
}

static u16 GetMapSecUnderCursor(void)
{
    u8 ret;
    if (gUnknown_20399E4->field_002 < 0
     || gUnknown_20399E4->field_002 > 14
     || gUnknown_20399E4->field_000 < 0
     || gUnknown_20399E4->field_000 > 21)
        return MAPSEC_NONE;

    ret = GetSelectedMapSection(GetWhichRegionMap(), 1, gUnknown_20399E4->field_002, gUnknown_20399E4->field_000);
    if (ret == MAPSEC_CERULEAN_CAVE && !FlagGet(FLAG_SYS_CAN_LINK_WITH_RS))
        ret = MAPSEC_NONE;
    return ret;
}

static u8 sub_80C35DC(u8 mapsec)
{
    switch (mapsec)
    {
    case MAPSEC_PALLET_TOWN:
        return FlagGet(FLAG_WORLD_MAP_PALLET_TOWN) ? 2 : 3;
    case MAPSEC_VIRIDIAN_CITY:
        return FlagGet(FLAG_WORLD_MAP_VIRIDIAN_CITY) ? 2 : 3;
    case MAPSEC_PEWTER_CITY:
        return FlagGet(FLAG_WORLD_MAP_PEWTER_CITY) ? 2 : 3;
    case MAPSEC_CERULEAN_CITY:
        return FlagGet(FLAG_WORLD_MAP_CERULEAN_CITY) ? 2 : 3;
    case MAPSEC_LAVENDER_TOWN:
        return FlagGet(FLAG_WORLD_MAP_LAVENDER_TOWN) ? 2 : 3;
    case MAPSEC_VERMILION_CITY:
        return FlagGet(FLAG_WORLD_MAP_VERMILION_CITY) ? 2 : 3;
    case MAPSEC_CELADON_CITY:
        return FlagGet(FLAG_WORLD_MAP_CELADON_CITY) ? 2 : 3;
    case MAPSEC_FUCHSIA_CITY:
        return FlagGet(FLAG_WORLD_MAP_FUCHSIA_CITY) ? 2 : 3;
    case MAPSEC_CINNABAR_ISLAND:
        return FlagGet(FLAG_WORLD_MAP_CINNABAR_ISLAND) ? 2 : 3;
    case MAPSEC_INDIGO_PLATEAU:
        return FlagGet(FLAG_WORLD_MAP_INDIGO_PLATEAU_EXTERIOR) ? 2 : 3;
    case MAPSEC_SAFFRON_CITY:
        return FlagGet(FLAG_WORLD_MAP_SAFFRON_CITY) ? 2 : 3;
    case MAPSEC_ONE_ISLAND:
        return FlagGet(FLAG_WORLD_MAP_ONE_ISLAND) ? 2 : 3;
    case MAPSEC_TWO_ISLAND:
        return FlagGet(FLAG_WORLD_MAP_TWO_ISLAND) ? 2 : 3;
    case MAPSEC_THREE_ISLAND:
        return FlagGet(FLAG_WORLD_MAP_THREE_ISLAND) ? 2 : 3;
    case MAPSEC_FOUR_ISLAND:
        return FlagGet(FLAG_WORLD_MAP_FOUR_ISLAND) ? 2 : 3;
    case MAPSEC_FIVE_ISLAND:
        return FlagGet(FLAG_WORLD_MAP_FIVE_ISLAND) ? 2 : 3;
    case MAPSEC_SEVEN_ISLAND:
        return FlagGet(FLAG_WORLD_MAP_SEVEN_ISLAND) ? 2 : 3;
    case MAPSEC_SIX_ISLAND:
        return FlagGet(FLAG_WORLD_MAP_SIX_ISLAND) ? 2 : 3;
    case MAPSEC_ROUTE_4_FLYDUP:
        if (!GetRegionMapPermission(MAPPERM_3))
            return 0;
        return FlagGet(FLAG_WORLD_MAP_ROUTE4_POKEMON_CENTER_1F) ? 2 : 3;
    case MAPSEC_ROUTE_10_FLYDUP:
        return FlagGet(FLAG_WORLD_MAP_ROUTE10_POKEMON_CENTER_1F) ? 2 : 3;
    case MAPSEC_NONE:
        return 0;
    default:
        return 1;
    }
}

static u8 sub_80C3878(u8 mapsec)
{
    switch (mapsec)
    {
    case MAPSEC_NONE:
        return 0;
    case MAPSEC_VIRIDIAN_FOREST:
        return FlagGet(FLAG_WORLD_MAP_VIRIDIAN_FOREST) ? 2 : 3;
    case MAPSEC_MT_MOON:
        return FlagGet(FLAG_WORLD_MAP_MT_MOON_1F) ? 2 : 3;
    case MAPSEC_S_S_ANNE:
        return FlagGet(FLAG_WORLD_MAP_SSANNE_EXTERIOR) ? 2 : 3;
    case MAPSEC_UNDERGROUND_PATH:
        return FlagGet(FLAG_WORLD_MAP_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL) ? 2 : 3;
    case MAPSEC_UNDERGROUND_PATH_2:
        return FlagGet(FLAG_WORLD_MAP_UNDERGROUND_PATH_EAST_WEST_TUNNEL) ? 2 : 3;
    case MAPSEC_DIGLETTS_CAVE:
        return FlagGet(FLAG_WORLD_MAP_DIGLETTS_CAVE_B1F) ? 2 : 3;
    case MAPSEC_KANTO_VICTORY_ROAD:
        return FlagGet(FLAG_WORLD_MAP_VICTORY_ROAD_1F) ? 2 : 3;
    case MAPSEC_ROCKET_HIDEOUT:
        return FlagGet(FLAG_WORLD_MAP_ROCKET_HIDEOUT_B1F) ? 2 : 3;
    case MAPSEC_SILPH_CO:
        return FlagGet(FLAG_WORLD_MAP_SILPH_CO_1F) ? 2 : 3;
    case MAPSEC_POKEMON_MANSION:
        return FlagGet(FLAG_WORLD_MAP_POKEMON_MANSION_1F) ? 2 : 3;
    case MAPSEC_KANTO_SAFARI_ZONE:
        return FlagGet(FLAG_WORLD_MAP_SAFARI_ZONE_CENTER) ? 2 : 3;
    case MAPSEC_POKEMON_LEAGUE:
        return FlagGet(FLAG_WORLD_MAP_POKEMON_LEAGUE_LORELEIS_ROOM) ? 2 : 3;
    case MAPSEC_ROCK_TUNNEL:
        return FlagGet(FLAG_WORLD_MAP_ROCK_TUNNEL_1F) ? 2 : 3;
    case MAPSEC_SEAFOAM_ISLANDS:
        return FlagGet(FLAG_WORLD_MAP_SEAFOAM_ISLANDS_1F) ? 2 : 3;
    case MAPSEC_POKEMON_TOWER:
        return FlagGet(FLAG_WORLD_MAP_POKEMON_TOWER_1F) ? 2 : 3;
    case MAPSEC_CERULEAN_CAVE:
        return FlagGet(FLAG_WORLD_MAP_CERULEAN_CAVE_1F) ? 2 : 3;
    case MAPSEC_POWER_PLANT:
        return FlagGet(FLAG_WORLD_MAP_POWER_PLANT) ? 2 : 3;
    case MAPSEC_NAVEL_ROCK:
        return FlagGet(FLAG_WORLD_MAP_NAVEL_ROCK_EXTERIOR) ? 2 : 3;
    case MAPSEC_MT_EMBER:
        return FlagGet(FLAG_WORLD_MAP_MT_EMBER_EXTERIOR) ? 2 : 3;
    case MAPSEC_BERRY_FOREST:
        return FlagGet(FLAG_WORLD_MAP_THREE_ISLAND_BERRY_FOREST) ? 2 : 3;
    case MAPSEC_ICEFALL_CAVE:
        return FlagGet(FLAG_WORLD_MAP_FOUR_ISLAND_ICEFALL_CAVE_ENTRANCE) ? 2 : 3;
    case MAPSEC_ROCKET_WAREHOUSE:
        return FlagGet(FLAG_WORLD_MAP_FIVE_ISLAND_ROCKET_WAREHOUSE) ? 2 : 3;
    case MAPSEC_TRAINER_TOWER_2:
        return FlagGet(FLAG_WORLD_MAP_TRAINER_TOWER_LOBBY) ? 2 : 3;
    case MAPSEC_DOTTED_HOLE:
        return FlagGet(FLAG_WORLD_MAP_SIX_ISLAND_DOTTED_HOLE_1F) ? 2 : 3;
    case MAPSEC_LOST_CAVE:
        return FlagGet(FLAG_WORLD_MAP_FIVE_ISLAND_LOST_CAVE_ENTRANCE) ? 2 : 3;
    case MAPSEC_PATTERN_BUSH:
        return FlagGet(FLAG_WORLD_MAP_SIX_ISLAND_PATTERN_BUSH) ? 2 : 3;
    case MAPSEC_ALTERING_CAVE:
        return FlagGet(FLAG_WORLD_MAP_SIX_ISLAND_ALTERING_CAVE) ? 2 : 3;
    case MAPSEC_TANOBY_CHAMBERS:
        return FlagGet(FLAG_WORLD_MAP_SEVEN_ISLAND_TANOBY_RUINS_MONEAN_CHAMBER) ? 2 : 3;
    case MAPSEC_THREE_ISLE_PATH:
        return FlagGet(FLAG_WORLD_MAP_THREE_ISLAND_DUNSPARCE_TUNNEL) ? 2 : 3;
    case MAPSEC_TANOBY_KEY:
        return FlagGet(FLAG_WORLD_MAP_SEVEN_ISLAND_SEVAULT_CANYON_TANOBY_KEY) ? 2 : 3;
    case MAPSEC_BIRTH_ISLAND:
        return FlagGet(FLAG_WORLD_MAP_BIRTH_ISLAND_EXTERIOR) ? 2 : 3;
    default:
        return 1;
    }
}

static u8 sub_80C3AC8(u8 a0)
{
    switch (a0)
    {
    default:
        return gUnknown_20399E4->field_016;
    case 0:
        return gUnknown_20399E4->field_016;
    case 1:
        return gUnknown_20399E4->field_018;
    }
}

static u16 GetPlayerCurrentMapSectionId(void)
{
    return Overworld_GetMapHeaderByGroupAndId(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum)->regionMapSectionId;
}

static void GetPlayerPositionOnRegionMap(void)
{
    u16 width;
    u32 divisor;
    u16 height;
    u16 x;
    u16 y;
    u32 r6;
    const struct MapHeader * mapHeader;
    struct WarpData * warp;

    switch (get_map_light_level_by_bank_and_number(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum))
    {
    default:
    case 1:
    case 2:
    case 3:
    case 5:
    case 6:
        gUnknown_20399E4->field_014 = gMapHeader.regionMapSectionId;
        width = gMapHeader.mapLayout->width;
        height = gMapHeader.mapLayout->height;
        x = gSaveBlock1Ptr->pos.x;
        y = gSaveBlock1Ptr->pos.y;
        break;
    case 4:
    case 7:
        mapHeader = Overworld_GetMapHeaderByGroupAndId(gSaveBlock1Ptr->escapeWarp.mapGroup, gSaveBlock1Ptr->escapeWarp.mapNum);
        gUnknown_20399E4->field_014 = mapHeader->regionMapSectionId;
        width = mapHeader->mapLayout->width;
        height = mapHeader->mapLayout->height;
        x = gSaveBlock1Ptr->escapeWarp.x;
        y = gSaveBlock1Ptr->escapeWarp.y;
        break;
    case 9:
        mapHeader = Overworld_GetMapHeaderByGroupAndId(gSaveBlock1Ptr->warp2.mapGroup, gSaveBlock1Ptr->warp2.mapNum);
        gUnknown_20399E4->field_014 = mapHeader->regionMapSectionId;
        width = mapHeader->mapLayout->width;
        height = mapHeader->mapLayout->height;
        x = gSaveBlock1Ptr->warp2.x;
        y = gSaveBlock1Ptr->warp2.y;
        break;
    case 8:
        if ((gUnknown_20399E4->field_014 = gMapHeader.regionMapSectionId) != MAPSEC_SPECIAL_AREA)
        {
            warp = &gSaveBlock1Ptr->escapeWarp;
            mapHeader = Overworld_GetMapHeaderByGroupAndId(warp->mapGroup, warp->mapNum);
        }
        else
        {
            warp = &gSaveBlock1Ptr->warp2;
            mapHeader = Overworld_GetMapHeaderByGroupAndId(warp->mapGroup, warp->mapNum);
            gUnknown_20399E4->field_014 = mapHeader->regionMapSectionId;
        }
        width = mapHeader->mapLayout->width;
        height = mapHeader->mapLayout->height;
        x = warp->x;
        y = warp->y;
        break;
    }

    gUnknown_20399E4->field_014 -= MAPSECS_KANTO;
    divisor = width / sMapSectionDimensions[gUnknown_20399E4->field_014][0];
    if (divisor == 0)
        divisor = 1;
    x /= divisor;
    if (x >= sMapSectionDimensions[gUnknown_20399E4->field_014][0])
        x = sMapSectionDimensions[gUnknown_20399E4->field_014][0] - 1;
    divisor = height / sMapSectionDimensions[gUnknown_20399E4->field_014][1];
    if (divisor == 0)
        divisor = 1;
    y /= divisor;
    if (y >= sMapSectionDimensions[gUnknown_20399E4->field_014][1])
        y = sMapSectionDimensions[gUnknown_20399E4->field_014][1] - 1;
    gUnknown_20399E4->field_000 = x + sMapSectionTopLeftCorners[gUnknown_20399E4->field_014][0];
    gUnknown_20399E4->field_002 = y + sMapSectionTopLeftCorners[gUnknown_20399E4->field_014][1];
}

static void GetPlayerPositionOnRegionMap_HandleOverrides(void)
{
    switch (GetPlayerCurrentMapSectionId())
    {
    case MAPSEC_KANTO_SAFARI_ZONE:
        gUnknown_20399E4->field_000 = 12;
        gUnknown_20399E4->field_002 = 12;
        break;
    case MAPSEC_SILPH_CO:
        gUnknown_20399E4->field_000 = 14;
        gUnknown_20399E4->field_002 = 6;
        break;
    case MAPSEC_POKEMON_MANSION:
        gUnknown_20399E4->field_000 = 4;
        gUnknown_20399E4->field_002 = 14;
        break;
    case MAPSEC_POKEMON_TOWER:
        gUnknown_20399E4->field_000 = 18;
        gUnknown_20399E4->field_002 = 6;
        break;
    case MAPSEC_POWER_PLANT:
        gUnknown_20399E4->field_000 = 18;
        gUnknown_20399E4->field_002 = 4;
        break;
    case MAPSEC_S_S_ANNE:
        gUnknown_20399E4->field_000 = 14;
        gUnknown_20399E4->field_002 = 9;
        break;
    case MAPSEC_POKEMON_LEAGUE:
        gUnknown_20399E4->field_000 = 2;
        gUnknown_20399E4->field_002 = 3;
        break;
    case MAPSEC_ROCKET_HIDEOUT:
        gUnknown_20399E4->field_000 = 11;
        gUnknown_20399E4->field_002 = 6;
        break;
    case MAPSEC_UNDERGROUND_PATH:
        gUnknown_20399E4->field_000 = 14;
        gUnknown_20399E4->field_002 = 7;
        if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(UNDERGROUND_PATH_NORTH_ENTRANCE))
        {
            gUnknown_20399E4->field_000 = 14; // optimized out but required to match
            gUnknown_20399E4->field_002 = 5;
        }
        break;
    case MAPSEC_UNDERGROUND_PATH_2:
        gUnknown_20399E4->field_000 = 12;
        gUnknown_20399E4->field_002 = 6;
        if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(UNDERGROUND_PATH_EAST_ENTRANCE))
        {
            gUnknown_20399E4->field_000 = 15;
            gUnknown_20399E4->field_002 = 6; // optimized out but required to match
        }
        break;
    case MAPSEC_BIRTH_ISLAND:
        gUnknown_20399E4->field_000 = 18;
        gUnknown_20399E4->field_002 = 13;
        break;
    case MAPSEC_NAVEL_ROCK:
        gUnknown_20399E4->field_000 = 10;
        gUnknown_20399E4->field_002 = 8;
        break;
    case MAPSEC_TRAINER_TOWER_2:
        gUnknown_20399E4->field_000 = 5;
        gUnknown_20399E4->field_002 = 6;
        break;
    case MAPSEC_MT_EMBER:
        gUnknown_20399E4->field_000 = 2;
        gUnknown_20399E4->field_002 = 3;
        break;
    case MAPSEC_BERRY_FOREST:
        gUnknown_20399E4->field_000 = 14;
        gUnknown_20399E4->field_002 = 12;
        break;
    case MAPSEC_PATTERN_BUSH:
        gUnknown_20399E4->field_000 = 17;
        gUnknown_20399E4->field_002 = 3;
        break;
    case MAPSEC_ROCKET_WAREHOUSE:
        gUnknown_20399E4->field_000 = 17;
        gUnknown_20399E4->field_002 = 11;
        break;
    case MAPSEC_DILFORD_CHAMBER:
    case MAPSEC_LIPTOO_CHAMBER:
    case MAPSEC_MONEAN_CHAMBER:
    case MAPSEC_RIXY_CHAMBER:
    case MAPSEC_SCUFIB_CHAMBER:
    case MAPSEC_TANOBY_CHAMBERS:
    case MAPSEC_VIAPOIS_CHAMBER:
    case MAPSEC_WEEPTH_CHAMBER:
        gUnknown_20399E4->field_000 = 9;
        gUnknown_20399E4->field_002 = 12;
        break;
    case MAPSEC_DOTTED_HOLE:
        gUnknown_20399E4->field_000 = 16;
        gUnknown_20399E4->field_002 = 8;
        break;
    case MAPSEC_VIRIDIAN_FOREST:
        gUnknown_20399E4->field_000 = 4;
        gUnknown_20399E4->field_002 = 6;
        break;
    case MAPSEC_ROUTE_2:
        if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(PALLET_TOWN))
        {
            gUnknown_20399E4->field_000 = 4;
            gUnknown_20399E4->field_002 = 7;
        }
        else if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(CERULEAN_CITY))
        {
            gUnknown_20399E4->field_000 = 4;
            gUnknown_20399E4->field_002 = 5;
        }
        else
        {
            GetPlayerPositionOnRegionMap();
        }
        break;
    case MAPSEC_ROUTE_21:
        if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(ROUTE21_NORTH))
        {
            gUnknown_20399E4->field_000 = 4;
            gUnknown_20399E4->field_002 = 12;
        }
        else if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(ROUTE21_SOUTH))
        {
            gUnknown_20399E4->field_000 = 4;
            gUnknown_20399E4->field_002 = 13;
        }
        break;
    case MAPSEC_ROUTE_5:
        if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(VIRIDIAN_CITY))
        {
            gUnknown_20399E4->field_000 = 14;
            gUnknown_20399E4->field_002 = 5;
        }
        else
        {
            GetPlayerPositionOnRegionMap();
        }
        break;
    case MAPSEC_ROUTE_6:
        if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(PALLET_TOWN))
        {
            gUnknown_20399E4->field_000 = 14;
            gUnknown_20399E4->field_002 = 7;
        }
        else
        {
            GetPlayerPositionOnRegionMap();
        }
        break;
    case MAPSEC_ROUTE_7:
        if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(PALLET_TOWN))
        {
            gUnknown_20399E4->field_000 = 13;
            gUnknown_20399E4->field_002 = 6;
        }
        else
        {
            GetPlayerPositionOnRegionMap();
        }
        break;
    case MAPSEC_ROUTE_8:
        if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(PALLET_TOWN))
        {
            gUnknown_20399E4->field_000 = 15;
            gUnknown_20399E4->field_002 = 6;
        }
        else
        {
            GetPlayerPositionOnRegionMap();
        }
        break;
    default:
        GetPlayerPositionOnRegionMap();
        break;
    }
    gUnknown_20399E4->field_014 = GetSelectedMapSection(GetWhichRegionMap(), 0, gUnknown_20399E4->field_002, gUnknown_20399E4->field_000);
}

static u8 GetSelectedMapSection(u8 whichMap, u8 layer, s16 y, s16 x)
{
    switch (whichMap)
    {
    case 0:
        return sRegionMapSections_Kanto[layer][y][x];
    case 1:
        return sRegionMapSections_Sevii123[layer][y][x];
    case 2:
        return sRegionMapSections_Sevii45[layer][y][x];
    case 3:
        return sRegionMapSections_Sevii67[layer][y][x];
    default:
        return MAPSEC_NONE;
    }
}

static void sub_80C41D8(u16 a0, u16 a1)
{
    gUnknown_20399E8 = AllocZeroed(sizeof(struct UnkStruct_20399E8));
    if (gSaveBlock2Ptr->playerGender == FEMALE)
        LZ77UnCompWram(gUnknown_83EF59C, gUnknown_20399E8->field_0C);
    else
        LZ77UnCompWram(gUnknown_83EF524, gUnknown_20399E8->field_0C);
    gUnknown_20399E8->field_08 = a0;
    gUnknown_20399E8->field_0A = a1;
    gUnknown_20399E8->field_00 = GetMapCursorX();
    gUnknown_20399E8->field_02 = GetMapCursorY();
    sub_80C4244();
}

static void sub_80C4244(void)
{
    u8 spriteId;
    struct SpriteSheet spriteSheet = {
        .data = gUnknown_20399E8->field_0C,
        .size = 0x80,
        .tag = gUnknown_20399E8->field_08
    };
    struct SpritePalette spritePalette = {
        .data = gUnknown_83EF27C,
        .tag = gUnknown_20399E8->field_0A
    };
    struct SpriteTemplate template = {
        .tileTag = gUnknown_20399E8->field_08,
        .paletteTag = gUnknown_20399E8->field_0A,
        .oam = &gUnknown_83F1C54,
        .anims = gUnknown_83F1C64,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy
    };

    if (gSaveBlock2Ptr->playerGender == FEMALE)
        spritePalette.data = gUnknown_83EF29C;

    LoadSpriteSheet(&spriteSheet);
    LoadSpritePalette(&spritePalette);
    spriteId = CreateSprite(&template, 8 * gUnknown_20399E8->field_00 + 36, 8 * gUnknown_20399E8->field_02 + 36, 2);
    gUnknown_20399E8->field_04 = &gSprites[spriteId];
    sub_80C4324(TRUE);
}

static void sub_80C4324(bool8 a0)
{
    gUnknown_20399E8->field_04->invisible = a0;
}

static void sub_80C4348(void)
{
    if (gUnknown_20399E8->field_04 != NULL)
    {
        DestroySprite(gUnknown_20399E8->field_04);
        FreeSpriteTilesByTag(gUnknown_20399E8->field_08);
        FreeSpritePaletteByTag(gUnknown_20399E8->field_0A);
    }
    FREE_IF_NOT_NULL(gUnknown_20399E8);
}

static u16 sub_80C4380(void)
{
    return gUnknown_20399E8->field_00;
}

static u16 sub_80C438C(void)
{
    return gUnknown_20399E8->field_02;
}

static void sub_80C4398(u8 a0, u8 taskId, TaskFunc taskFunc)
{
    gUnknown_20399EC = AllocZeroed(sizeof(struct UnkStruct_20399EC));
    gUnknown_20399EC->field_468 = taskFunc;
    gUnknown_20399EC->field_460 = a0;
    LZ77UnCompWram(gUnknown_83F18D8, gUnknown_20399EC->field_000);
    LZ77UnCompWram(gUnknown_83F1908, gUnknown_20399EC->field_040);
    gTasks[taskId].func = sub_80C440C;
}

static void sub_80C440C(u8 taskId)
{
    switch (gUnknown_20399EC->field_463)
    {
    case 0:
        NullVBlankHBlankCallbacks();
        gUnknown_20399EC->field_463++;
        break;
    case 1:
        sub_80C47F0();
        gUnknown_20399EC->field_463++;
        break;
    case 2:
        sub_80C4750();
        gUnknown_20399EC->field_463++;
        break;
    case 3:
        BlendPalettes(0xFFFFFFFF, 16, RGB_BLACK);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        gUnknown_20399EC->field_463++;
        break;
    case 4:
        sub_80C08F4();
        gUnknown_20399EC->field_463++;
        break;
    default:
        SetGpuReg(REG_OFFSET_DISPCNT, GetGpuReg(REG_OFFSET_DISPCNT) | DISPCNT_OBJ_ON);
        sub_80C44E4(taskId);
        break;
    }
}

static void sub_80C44E4(u8 taskId)
{
    gTasks[taskId].func = gUnknown_20399EC->field_468;
}

static void sub_80C450C(u8 a0, u8 a1, u16 a2, u16 a3, u8 a4, u8 a5)
{
    u8 spriteId;
    struct SpriteSheet spriteSheet = {
        .data = gUnknown_20399EC->field_040,
        .size = 0x100,
        .tag = a4
    };
    struct SpritePalette spritePalette = {
        .data = gUnknown_83EF2BC,
        .tag = a5
    };
    struct SpriteTemplate template = {
        .tileTag = a4,
        .paletteTag = a5,
        .oam = &gUnknown_83F1C68,
        .anims = gUnknown_83F1C94,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy
    };

    LoadSpriteSheet(&spriteSheet);
    LoadSpritePalette(&spritePalette);
    spriteId = CreateSprite(&template, 8 * a2 + 36, 8 * a3 + 36, 1);
    gUnknown_20399EC->field_2D0[a1].field_8 = &gSprites[spriteId];
    gSprites[spriteId].invisible = TRUE;
    gUnknown_20399EC->field_2D0[a1].field_4 = a0;
}

static void sub_80C4614(u8 a0, u8 a1, u16 a2, u16 a3, u8 a4, u8 a5)
{
    u8 spriteId;
    u8 r4;
    s16 r7 = 0;
    struct SpriteSheet spriteSheet = {
        .data = gUnknown_20399EC->field_000,
        .size = 0x40,
        .tag = a4
    };
    struct SpritePalette spritePalette = {
        .data = gUnknown_83EF2BC,
        .tag = a5
    };
    struct SpriteTemplate template = {
        .tileTag = a4,
        .paletteTag = a5,
        .oam = &gUnknown_83F1C70,
        .anims = gUnknown_83F1C98,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy
    };

    LoadSpriteSheet(&spriteSheet);
    LoadSpritePalette(&spritePalette);
    r4 = GetSelectedMapSection(a0, 0, a3, a2);
    if ((sub_80C35DC(r4) == 2 || sub_80C35DC(r4) == 3) && r4 != MAPSEC_ROUTE_10_FLYDUP)
        r7 = 2;
    spriteId = CreateSprite(&template, 8 * a2 + 36 + r7, 8 * a3 + 36 + r7, 3);
    gUnknown_20399EC->field_140[a1].field_8 = &gSprites[spriteId];
    gSprites[spriteId].invisible = TRUE;
    gUnknown_20399EC->field_140[a1].field_4 = a0;
}

static void sub_80C4750(void)
{
    u16 i, j, k;
    u8 r7 = 0;
    if (GetRegionMapPermission(MAPPERM_3))
    {
        for (i = 0; i < 4; i++)
        {
            for (j = 0; j < 15; j++)
            {
                for (k = 0; k < 22; k++)
                {
                    if (sub_80C35DC(GetSelectedMapSection(i, 0, j, k)) == 2)
                    {
                        sub_80C450C(i, r7, k, j, r7 + 10, 10);
                        r7++;
                    }
                }
            }
        }
    }
}

static void sub_80C47F0(void)
{
    u16 i, j, k;
    u8 r6 = 0;
    u8 mapsec;
    for (i = 0; i < 4; i++)
    {
        for (j = 0; j < 15; j++)
        {
            for (k = 0; k < 22; k++)
            {
                mapsec = GetSelectedMapSection(i, 1, j, k);
                if (mapsec == MAPSEC_NONE)
                    continue;
                if (mapsec == MAPSEC_CERULEAN_CAVE && !FlagGet(FLAG_SYS_CAN_LINK_WITH_RS))
                    continue;
                sub_80C4614(i, r6, k, j, r6 + 35, 10);
                if (sub_80C3878(mapsec) != 2)
                {
                    StartSpriteAnim(gUnknown_20399EC->field_140[r6].field_8, 1);
                }
                r6++;
            }
        }
    }
}

static void sub_80C48BC(u8 a0, u8 a1, bool8 a2)
{
    u8 i;
    if (a1 == 25)
    {
        for (i = 0; i < 25; i++)
        {
            if (gUnknown_20399EC->field_2D0[i].field_4 == a0 || a0 == 0xFF)
                gUnknown_20399EC->field_2D0[i].field_8->invisible = a2;
        }
    }
    else
    {
        if (gUnknown_20399EC->field_2D0[a1].field_4 == a0)
            gUnknown_20399EC->field_2D0[a1].field_8->invisible = a2;
    }
}

static void sub_80C4960(u8 a0, u8 a1, bool8 a2)
{
    u8 i;
    if (a1 == 25)
    {
        for (i = 0; i < 25; i++)
        {
            if (gUnknown_20399EC->field_140[i].field_4 == a0 || a0 == 0xFF)
                gUnknown_20399EC->field_140[i].field_8->invisible = a2;
        }
    }
    else
    {
        if (gUnknown_20399EC->field_140[a1].field_4 != a0)
            gUnknown_20399EC->field_140[a1].field_8->invisible = a2;
    }
}

static void sub_80C4A04(void)
{
    u8 i;
    for (i = 0; i < 25; i++)
    {
        if (gUnknown_20399EC->field_2D0[i].field_8 != NULL)
        {
            DestroySprite(gUnknown_20399EC->field_2D0[i].field_8);
            FreeSpriteTilesByTag(gUnknown_20399EC->field_2D0[i].field_C);
            FreeSpritePaletteByTag(gUnknown_20399EC->field_2D0[i].field_E);
        }
    }
    for (i = 0; i < 25; i++)
    {
        if (gUnknown_20399EC->field_140[i].field_8 != NULL)
        {
            DestroySprite(gUnknown_20399EC->field_140[i].field_8);
            FreeSpriteTilesByTag(gUnknown_20399EC->field_140[i].field_C);
            FreeSpritePaletteByTag(gUnknown_20399EC->field_140[i].field_E);
        }
    }
    FREE_IF_NOT_NULL(gUnknown_20399EC);
}

static bool8 sub_80C4AAC(u8 a0)
{
    if (gUnknown_20399F0[a0] != NULL)
        return FALSE;
    gUnknown_20399F0[a0] = AllocZeroed(sizeof(struct UnkStruct_20399F0));
    gUnknown_20399F0[a0]->bldcnt = GetGpuReg(REG_OFFSET_BLDCNT);
    gUnknown_20399F0[a0]->bldy = GetGpuReg(REG_OFFSET_BLDY);
    gUnknown_20399F0[a0]->bldalpha = GetGpuReg(REG_OFFSET_BLDALPHA);
    gUnknown_20399F0[a0]->winin = GetGpuReg(REG_OFFSET_WININ);
    gUnknown_20399F0[a0]->winout = GetGpuReg(REG_OFFSET_WINOUT);
    gUnknown_20399F0[a0]->win0h = GetGpuReg(REG_OFFSET_WIN0H);
    gUnknown_20399F0[a0]->win1h = GetGpuReg(REG_OFFSET_WIN1H);
    gUnknown_20399F0[a0]->win0v = GetGpuReg(REG_OFFSET_WIN0V);
    gUnknown_20399F0[a0]->win1v = GetGpuReg(REG_OFFSET_WIN1V);
    return TRUE;
}

static bool8 sub_80C4B30(u8 a0)
{
    if (gUnknown_20399F0[a0] == NULL)
        return FALSE;
    SetGpuReg(REG_OFFSET_BLDCNT, gUnknown_20399F0[a0]->bldcnt);
    SetGpuReg(REG_OFFSET_BLDY, gUnknown_20399F0[a0]->bldy);
    SetGpuReg(REG_OFFSET_BLDALPHA, gUnknown_20399F0[a0]->bldalpha);
    SetGpuReg(REG_OFFSET_WININ, gUnknown_20399F0[a0]->winin);
    SetGpuReg(REG_OFFSET_WINOUT, gUnknown_20399F0[a0]->winout);
    SetGpuReg(REG_OFFSET_WIN0H, gUnknown_20399F0[a0]->win0h);
    SetGpuReg(REG_OFFSET_WIN1H, gUnknown_20399F0[a0]->win1h);
    SetGpuReg(REG_OFFSET_WIN0V, gUnknown_20399F0[a0]->win0v);
    SetGpuReg(REG_OFFSET_WIN1V, gUnknown_20399F0[a0]->win1v);
    FREE_IF_NOT_NULL(gUnknown_20399F0[a0]);
    return TRUE;
}

static void sub_80C4BB8(void)
{
    u8 i;
    for (i = 0; i < 3; i++)
    {
        FREE_IF_NOT_NULL(gUnknown_20399F0[i]);
    }
}

static void sub_80C4BE4(void)
{
    struct GpuWindowParams data = {};
    sub_80C4C2C(0, 0, 0);
    sub_80C4C48(0);
    SetGpuWindowDims(0, &data);
    SetGpuWindowDims(1, &data);
    sub_80C4C74(0, 0);
    sub_80C4C9C(0, 1);
    sub_80C4C9C(1, 1);
}

static void sub_80C4C2C(u8 a0, u16 a1, u16 a2)
{
    u16 regval = a0 << 8;
    regval |= a1;
    regval |= a2;
    SetGpuReg(REG_OFFSET_BLDCNT, regval);
}

static void sub_80C4C48(u16 a0)
{
    SetGpuReg(REG_OFFSET_BLDY, a0);
}

static void sub_80C4C5C(u16 a0, u16 a1)
{
    u16 regval = a0 << 8;
    regval |= a1;
    SetGpuReg(REG_OFFSET_BLDALPHA, regval);
}

static void sub_80C4C74(u16 a0, u16 a1)
{
    u16 regval = a1 << 8;
    regval |= a0;
    SetGpuReg(REG_OFFSET_WININ, regval);
}

static void sub_80C4C88(u16 a0)
{
    SetGpuReg(REG_OFFSET_WINOUT, a0);
}

static void sub_80C4C9C(u8 a0, u8 a1)
{
    u16 data[2];
    memcpy(data, sWinFlags, 4);
    switch (a1)
    {
    case 0:
        SetGpuReg(REG_OFFSET_DISPCNT, GetGpuReg(REG_OFFSET_DISPCNT) | data[a0]);
        break;
    case 1:
        ClearGpuRegBits(REG_OFFSET_DISPCNT, data[a0]);
        break;
    }
}

static void SetGpuWindowDims(u8 winIdx, const struct GpuWindowParams *data)
{
    SetGpuReg(sWinRegs[winIdx][0], (data->v2 << 8) | data->v6);
    SetGpuReg(sWinRegs[winIdx][1], (data->v0 << 8) | data->v4);
}

static void sub_80C4D30(void)
{
    sub_80C4BB8();
    sub_80C4BE4();
}

static bool32 sub_80C4D40(u16 a0)
{
    if (gUnknown_20399D4 != NULL)
        return FALSE;
    if (a0 != MAPSEC_CELADON_CITY)
        return FALSE;
    if (gSaveBlock1Ptr->location.mapGroup != MAP_GROUP(CELADON_CITY_DEPARTMENT_STORE_1F))
        return FALSE;
    if (gSaveBlock1Ptr->location.mapNum != MAP_NUM(CELADON_CITY_DEPARTMENT_STORE_1F)
     && gSaveBlock1Ptr->location.mapNum != MAP_NUM(CELADON_CITY_DEPARTMENT_STORE_2F)
     && gSaveBlock1Ptr->location.mapNum != MAP_NUM(CELADON_CITY_DEPARTMENT_STORE_3F)
     && gSaveBlock1Ptr->location.mapNum != MAP_NUM(CELADON_CITY_DEPARTMENT_STORE_4F)
     && gSaveBlock1Ptr->location.mapNum != MAP_NUM(CELADON_CITY_DEPARTMENT_STORE_5F)
     && gSaveBlock1Ptr->location.mapNum != MAP_NUM(CELADON_CITY_DEPARTMENT_STORE_ROOF)
     && gSaveBlock1Ptr->location.mapNum != MAP_NUM(CELADON_CITY_DEPARTMENT_STORE_ELEVATOR))
        return FALSE;
    return TRUE;
}

u8 *GetMapName(u8 *dst0, u16 mapsec, u16 fill)
{
    u8 *dst;
    u16 i;
    u16 idx;;
    if ((idx = mapsec - MAPSECS_KANTO) <= MAPSEC_SPECIAL_AREA - MAPSECS_KANTO)
    {
        if (sub_80C4D40(mapsec) == TRUE)
            dst = StringCopy(dst0, gMapSecName_CeladonDept);
        else
            dst = StringCopy(dst0, sMapNames[idx]);
    }
    else
    {
        if (fill == 0)
            fill = 18;
        return StringFill(dst0, CHAR_SPACE, fill);
    }
    if (fill != 0)
    {
        for (i = dst - dst0; i < fill; i++)
            *dst++ = CHAR_SPACE;
        *dst = EOS;
    }
    return dst;
}

u8 *GetMapNameGeneric(u8 *dest, u16 mapsec)
{
    return GetMapName(dest, mapsec, 0);
}

u8 *sub_80C4E08(u8 *dest, u16 mapsec)
{
    return GetMapNameGeneric(dest, mapsec);
}

static void sub_80C4E18(const u8 *str)
{
    if (gUnknown_20399D4->regionMapPermissions[MAPPERM_2] == TRUE)
        FillWindowPixelBuffer(3, PIXEL_FILL(0));
    else
        FillWindowPixelBuffer(3, PIXEL_FILL(15));
    AddTextPrinterParameterized3(3, 0, 0, 0, gUnknown_83F1CA8, 0, str);
    CopyWindowToVram(3, 2);
}

static void sub_80C4E74(const u8 *str)
{
    if (gUnknown_20399D4->regionMapPermissions[MAPPERM_2] == TRUE)
        FillWindowPixelBuffer(4, PIXEL_FILL(0));
    else
        FillWindowPixelBuffer(4, PIXEL_FILL(15));
    AddTextPrinterParameterized3(4, 0, 0, 0, gUnknown_83F1CA8, 0, str);
    CopyWindowToVram(4, 3);
}

static void sub_80C4ED0(bool8 mode)
{
    if (!mode)
    {
        PutWindowTilemap(3);
        PutWindowTilemap(4);
    }
    else
    {
        ClearWindowTilemap(3);
        ClearWindowTilemap(4);
    }
}

void MCB2_FlyMap(void)
{
    sub_80C51E8();
    sub_80BFEDC(2);
}

static void sub_80C4F08(u8 taskId)
{
    switch (gUnknown_20399FC->field_0)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
        sub_80C4398(GetWhichRegionMap(), taskId, sub_80C07E4());
        sub_80C3008(0, 0);
        sub_80C41D8(1, 1);
        sub_80C3154(FALSE);
        sub_80C4324(FALSE);
        gUnknown_20399FC->field_0++;
        break;
    case 1:
        if (GetRegionMapPermission(MAPPERM_2) == TRUE)
        {
            sub_80C2208(taskId, sub_80C07E4());
        }
        else
        {
            ShowBg(0);
            ShowBg(3);
            ShowBg(1);
            sub_80C4E18(gText_RegionMap_DPadMove);
            sub_80C48BC(GetWhichRegionMap(), 25, FALSE);
            sub_80C4960(GetWhichRegionMap(), 25, FALSE);
        }
        gUnknown_20399FC->field_0++;
        break;
    case 2:
        sub_80C4E74(gText_RegionMap_AButtonOK);
        sub_80C4ED0(FALSE);
        gUnknown_20399FC->field_0++;
        break;
    case 3:
        if (!gPaletteFade.active)
        {
            sub_80C0B18();
            PutWindowTilemap(0);
            sub_80C0BB0();
            PutWindowTilemap(1);
            gUnknown_20399FC->field_0++;
        }
        break;
    case 4:
        switch (sub_80C3400())
        {
        case 1:
        case 2:
            break;
        case 6:
            gUnknown_20399FC->field_0 = 6;
            break;
        case 3:
            if (sub_80C3AC8(0) == 2)
                PlaySE(SE_Z_PAGE);
            else
                sub_80C0450();
            sub_80C3178();
            sub_80C0B18();
            sub_80C0BB0();
            sub_80C0B9C();
            if (GetMapCursorX() == 21 && GetMapCursorY() == 13)
            {
                PlaySE(SE_W255);
                sub_80C4E74(gText_RegionMap_AButtonCancel);
            }
            else if (sub_80C3AC8(0) == 2 || sub_80C3AC8(0) == 4)
            {
                sub_80C4E74(gText_RegionMap_AButtonOK);
            }
            else
            {
                sub_80C4E74(gText_RegionMap_Space);
            }
            break;
        case 4:
            if ((sub_80C3AC8(0) == 2 || sub_80C3AC8(0) == 4) && GetRegionMapPermission(MAPPERM_3) == TRUE)
            {
                switch (get_map_light_level_by_bank_and_number(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum))
                {
                case 4:
                case 8:
                    gUnknown_20399FC->field_2 = FALSE;
                    gUnknown_20399FC->field_0++;
                    break;
                default:
                    PlaySE(SE_KAIFUKU);
                    gUnknown_20399FC->field_2 = TRUE;
                    gUnknown_20399FC->field_0++;
                    break;
                }
            }
            break;
        case 5:
            sub_80C0E70(GetWhichRegionMap(), taskId, sub_80C07F8);
            break;
        }
        break;
    case 5:
        if (GetRegionMapPermission(MAPPERM_2) == TRUE)
            sub_80C2C1C(taskId);
        gUnknown_20399FC->field_0++;
        break;
    case 6:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
        gUnknown_20399FC->field_0++;
        break;
    default:
        if (!gPaletteFade.active)
        {
            if (gUnknown_20399FC->field_2 == TRUE)
                sub_80C527C(sub_80C3520());
            sub_80C5208(taskId);
        }
        break;
    }
}

static void sub_80C51E8(void)
{
    gUnknown_20399FC = AllocZeroed(sizeof(struct UnkStruct_20399FC));
    gUnknown_20399FC->field_0 = 0;
    gUnknown_20399FC->field_1 = 0;
}

static void sub_80C5208(u8 taskId)
{
    if (GetRegionMapPermission(MAPPERM_2) == TRUE)
        sub_80C25BC();
    sub_80C4A04();
    sub_80C3188();
    sub_80C4348();
    sub_80C4D30();
    sub_80C0898();
    DestroyTask(taskId);
    FreeAllWindowBuffers();
    if (gUnknown_20399FC->field_2 == TRUE)
        SetMainCallback2(CB2_ReturnToField);
    else
        SetMainCallback2(CB2_ReturnToPartyMenuFromFlyMap);
    FREE_IF_NOT_NULL(gUnknown_20399FC);
}

static void sub_80C527C(u16 mapsec)
{
    u16 idx = mapsec - MAPSECS_KANTO;
    if (sMapsecToSpawn[idx][2])
    {
        sub_805546C(sMapsecToSpawn[idx][2]);
        SetUsedFlyQuestLogEvent(sMapsecToSpawn[idx]);
    }
    else
    {
        warp1_set_2(sMapsecToSpawn[idx][0], sMapsecToSpawn[idx][1], -1);
    }
    ReturnToFieldFromFlyMapSelect();
}
