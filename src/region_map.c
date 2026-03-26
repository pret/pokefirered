#include "global.h"
#include "gflib.h"
#include "scanline_effect.h"
#include "task.h"
#include "m4a.h"
#include "overworld.h"
#include "event_data.h"
#include "region_map.h"
#include "party_menu.h"
#include "field_effect.h"
#include "new_menu_helpers.h"
#include "menu.h"
#include "strings.h"
#include "map_preview_screen.h"
#include "constants/songs.h"
#include "constants/region_map_sections.h"
#include "constants/heal_locations.h"
#include "constants/maps.h"

#define MAP_WIDTH 22
#define MAP_HEIGHT 15

#define CANCEL_BUTTON_X 21
#define CANCEL_BUTTON_Y 13

#define SWITCH_BUTTON_X 21
#define SWITCH_BUTTON_Y 11

enum {
    REGIONMAP_KANTO,
    REGIONMAP_SEVII123,
    REGIONMAP_SEVII45,
    REGIONMAP_SEVII67,
    REGIONMAP_COUNT
};

enum {
    MAPSECTYPE_NONE,
    MAPSECTYPE_ROUTE,
    MAPSECTYPE_VISITED,
    MAPSECTYPE_NOT_VISITED,
    MAPSECTYPE_UNKNOWN, // Checked but never used
};

enum {
    LAYER_MAP,
    LAYER_DUNGEON,
    LAYER_COUNT
};

enum {
    WIN_MAP_NAME,
    WIN_DUNGEON_NAME,
    WIN_MAP_PREVIEW,
    WIN_TOPBAR_LEFT,
    WIN_TOPBAR_RIGHT,
};

#define CLEAR_NAME 2

enum {
    MAP_INPUT_NONE,
    MAP_INPUT_MOVE_START,
    MAP_INPUT_MOVE_CONT,
    MAP_INPUT_MOVE_END,
    MAP_INPUT_A_BUTTON,
    MAP_INPUT_SWITCH,
    MAP_INPUT_CANCEL
};

enum {
    MAPPERM_HAS_SWITCH_BUTTON,
    MAPPERM_HAS_MAP_PREVIEW,
    MAPPERM_HAS_OPEN_ANIM,
    MAPPERM_HAS_FLY_DESTINATIONS,
    MAPPERM_COUNT
};

enum {
    MAPEDGE_TOP_LEFT,
    MAPEDGE_MID_LEFT,
    MAPEDGE_BOT_LEFT,
    MAPEDGE_TOP_RIGHT,
    MAPEDGE_MID_RIGHT,
    MAPEDGE_BOT_RIGHT,
};

#define FREE_IF_NOT_NULL(ptr) ({ \
    if (ptr) {                   \
        FREE_AND_SET_NULL(ptr);  \
    }                            \
})

struct RegionMap
{
    u8 mapName[19];
    u8 dungeonName[19];
    u16 layouts[REGIONMAP_COUNT + 1][600];
    // Inefficiency: these should be u8 or have half the elements each
    u16 bgTilemapBuffers[3][BG_SCREEN_SIZE];
    u8 type; // REGIONMAP_TYPE_*
    bool8 permissions[MAPPERM_COUNT];
    u8 selectedRegion; // REGIONMAP_KANTO, REGIONMAP_SEVII*
    u8 playersRegion;
    u8 ALIGNED(4) mainState;
    u8 ALIGNED(4) openState;
    u8 ALIGNED(4) loadGfxState;
    u16 dungeonWinLeft;   // Used by a field that's never read
    u16 dungeonWinTop;    // Never read
    u16 dungeonWinRight;  // Never read
    u16 dungeonWinBottom; // Never read
    u8 filler[6]; 
    TaskFunc mainTask;
    MainCallback savedCallback;
}; // size = 0x47C0

struct GpuWindowParams
{
    u16 left;
    u16 top;
    u16 right;
    u16 bottom;
};

struct SwitchMapMenuCursorSubsprite
{
    u8 tiles[0x400];
    struct Sprite *sprite;
    u16 tileTag;
    u16 palTag;
    s16 x;
};

struct SwitchMapMenu
{
    u8 switchMapTiles[0x1000];
    u16 switchMapTilemap[600];
    struct SwitchMapMenuCursorSubsprite cursorSubsprite[2];
    u8 mainState;
    u8 cursorLoadState;
    u8 currentSelection;
    u8 chosenRegion;
    u8 maxSelection;
    u8 alpha;
    u16 yOffset;
    TaskFunc exitTask;
    struct GpuWindowParams highlight;
    u16 blendY;
}; // size = 0x1CE0

struct DungeonMapInfo
{
    u16 id;
    const u8 *name;
    const u8 *desc;
};

struct DungeonMapPreview
{
    u16 tiles[7200];
    u16 tilemap[640];
    const struct MapPreviewScreen * mapPreviewInfo;
    TaskFunc savedTask;
    u8 mainState;
    u8 drawState;
    u8 loadState;
    u8 updateCounter;
    u8 timer;
    u16 palette[0x30];
    u8 filler[0x60];
    u16 red;
    u16 green;
    u16 blue;
    u16 blendY;
    u16 left;
    u16 top;
    u16 right;
    u16 bottom;
    u16 leftIncrement;
    u16 topIncrement;
    u16 rightIncrement;
    u16 bottomIncrement;
}; // size = 0x3E28

struct MapEdge
{
    u16 tiles[0x200];
    struct Sprite *sprite;
    s16 x;
    s16 y;
    u16 tileTag;
    u16 palTag;
};

struct MapOpenCloseAnim
{
    struct MapEdge * mapEdges[6];
    u16 tiles[0x400];
    u16 tilemap[600];
    TaskFunc exitTask;
    u8 openState;
    u8 loadGfxState;
    u8 moveState;
    u8 closeState;
    u8 blendY;
}; // size = 0xCD4

struct MapCursor
{
    s16 x;
    s16 y;
    u16 spriteX;
    u16 spriteY;
    s16 horizontalMove;
    s16 verticalMove;
    u16 moveCounter;
    u8 snapId;
    u8 (*inputHandler)(void);
    u16 selectedMapsec;
    u16 selectedMapsecType;
    u16 selectedDungeonType;
    struct Sprite *sprite;
    u16 tileTag;
    u16 palTag;
    u16 tiles[0x80];
}; // size = 0x124

struct PlayerIcon
{
    s16 x;
    s16 y;
    struct Sprite *sprite;
    u16 tileTag;
    u16 palTag;
    u16 tiles[0x40];
}; // size = 0x8C

struct MapIconSprite
{
    u32 unused;
    u8 region;
    struct Sprite *sprite;
    u16 tileTag;
    u16 palTag;
};

struct MapIcons
{
    u8 dungeonIconTiles[0x40];
    u8 flyIconTiles[0x100];
    struct MapIconSprite dungeonIcons[25];
    struct MapIconSprite flyIcons[25];
    u8 region; // Never read
    u8 unused_1[2];
    u8 state;
    u32 unused_2;
    TaskFunc exitTask;
}; // size = 0x46C

struct RegionMapGpuRegs
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

struct FlyMap
{
    u8 state;
    u8 unused; // Never read
    bool8 selectedDestination;
};

static EWRAM_DATA struct RegionMap * sRegionMap = NULL;
static EWRAM_DATA struct SwitchMapMenu * sSwitchMapMenu = NULL;
static EWRAM_DATA struct DungeonMapPreview * sDungeonMapPreview = NULL;
static EWRAM_DATA struct MapOpenCloseAnim * sMapOpenCloseAnim = NULL;
static EWRAM_DATA struct MapCursor * sMapCursor = NULL;
static EWRAM_DATA struct PlayerIcon * sPlayerIcon = NULL;
static EWRAM_DATA struct MapIcons * sMapIcons = NULL;
static EWRAM_DATA struct RegionMapGpuRegs * sRegionMapGpuRegs[3] = {};
static EWRAM_DATA struct FlyMap * sFlyMap = NULL;

static void InitRegionMapType(void);
static void CB2_OpenRegionMap(void);
static bool8 LoadRegionMapGfx(void);
static void CreateMainMapTask(void);
static void Task_RegionMap(u8);
static void SaveMainMapTask(u8);
static void FreeRegionMap(u8);
static void CB2_RegionMap(void);
static void NullVBlankHBlankCallbacks(void);
static void SetRegionMapVBlankCB(void);
static void InitRegionMapBgs(void);
static void SetBgTilemapBuffers(void);
static void ResetOamForRegionMap(void);
static void SetBg0andBg3Hidden(bool8);
static void UpdateMapsecNameBox(void);
static void DisplayCurrentMapName(void);
static void DrawDungeonNameBox(void);
static void DisplayCurrentDungeonName(void);
static void BufferRegionMapBg(u8, u16 *);
static bool8 GetRegionMapPermission(u8);
static u8 GetSelectedRegionMap(void);
static void InitSwitchMapMenu(u8, u8, TaskFunc);
static void Task_SwitchMapMenu(u8);
static void FreeSwitchMapMenu(u8);
static bool8 BrightenScreenForSwitchMapMenu(void);
static void LoadSwitchMapTilemap(u8, u16 *);
static void SetGpuRegsToDimScreen(void);
static bool8 DimScreenForSwitchMapMenu(void);
static bool8 HandleSwitchMapInput(void);
static bool8 CreateSwitchMapCursor(void);
static void CreateSwitchMapCursorSubsprite(u8, u16, u16);
static void CreateSwitchMapCursorSubsprite_(u8, u16, u16);
static void FreeSwitchMapCursor(void);
static void InitDungeonMapPreview(u8, u8, TaskFunc);
static void Task_DungeonMapPreview(u8);
static void Task_DrawDungeonMapPreviewFlavorText(u8);
static void FreeDungeonMapPreview(u8);
static void InitScreenForDungeonMapPreview(void);
static void CopyMapPreviewTilemapToBgTilemapBuffer(u8, const u16 *);
static bool8 UpdateDungeonMapPreview(bool8);
static void InitMapOpenAnim(u8, TaskFunc);
static void InitScreenForMapOpenAnim(void);
static void Task_MapOpenAnim(u8);
static void FreeMapOpenCloseAnim(void);
static void FreeMapEdgeSprites(void);
static bool8 MoveMapEdgesOutward(void);
static void SetGpuWindowDimsToMapEdges(void);
static void DoMapCloseAnim(u8);
static void Task_MapCloseAnim(u8);
static bool8 MoveMapEdgesInward(void);
static void CreateMapCursor(u16, u16);
static void CreateMapCursorSprite(void);
static void SetMapCursorInvisibility(bool8);
static void ResetCursorSnap(void);
static void FreeMapCursor(void);
static u8 HandleRegionMapInput(void);
static u8 MoveMapCursor(void);
static u8 GetRegionMapInput(void);
static void SnapToIconOrButton(void);
static u16 GetMapCursorX(void);
static u16 GetMapCursorY(void);
static u16 GetMapsecUnderCursor(void);
static u16 GetDungeonMapsecUnderCursor(void);
static u8 GetMapsecType(u8);
static u8 GetDungeonMapsecType(u8);
static u8 GetSelectedMapsecType(u8);
static void GetPlayerPositionOnRegionMap_HandleOverrides(void);
static u8 GetSelectedMapSection(u8, u8, s16, s16);
static void CreatePlayerIcon(u16, u16);
static void CreatePlayerIconSprite(void);
static void SetPlayerIconInvisibility(bool8);
static void FreePlayerIcon(void);
static u16 GetPlayerIconX(void);
static u16 GetPlayerIconY(void);
static void InitMapIcons(u8, u8, TaskFunc);
static void LoadMapIcons(u8);
static void FinishMapIconLoad(u8);
static void CreateFlyIcons(void);
static void CreateDungeonIcons(void);
static void SetFlyIconInvisibility(u8, u8, bool8);
static void SetDungeonIconInvisibility(u8, u8, bool8);
static void FreeMapIcons(void);
static bool8 SaveRegionMapGpuRegs(u8);
static bool8 SetRegionMapGpuRegs(u8);
static void ResetGpuRegs(void);
static void SetBldCnt(u8, u16, u16);
static void SetBldY(u16);
static void SetBldAlpha(u16, u16);
static void SetWinIn(u16, u16);
static void SetWinOut(u16);
static void SetDispCnt(u8, bool8);
static void SetGpuWindowDims(u8, const struct GpuWindowParams *);
static void FreeAndResetGpuRegs(void);
static void PrintTopBarTextLeft(const u8 *);
static void PrintTopBarTextRight(const u8 *);
static void ClearOrDrawTopBar(bool8);
static void Task_FlyMap(u8);
static void InitFlyMap(void);
static void FreeFlyMap(u8);
static void SetFlyWarpDestination(u16);

#include "data/region_map/region_map_entry_strings.h"

static const u16 sTopBar_Pal[] = INCBIN_U16("graphics/region_map/top_bar.gbapal"); // Palette for the top bar and dynamic text color
static const u16 sMapCursor_Pal[] = INCBIN_U16("graphics/region_map/cursor.gbapal");
static const u16 sPlayerIcon_RedPal[] = INCBIN_U16("graphics/region_map/player_icon_red.gbapal");
static const u16 sPlayerIcon_LeafPal[] = INCBIN_U16("graphics/region_map/player_icon_leaf.gbapal");
static const u16 sMiscIcon_Pal[] = INCBIN_U16("graphics/region_map/misc_icon.gbapal"); // For dungeon and fly icons
static const u16 sRegionMap_Pal[] = INCBIN_U16("graphics/region_map/region_map.gbapal");
static const u16 sUnusedPalette[] = { RGB(0, 0, 31), RGB(0, 12, 31), RGB_WHITE, RGB_WHITE };
static const u16 sSwitchMapCursor_Pal[] = INCBIN_U16("graphics/region_map/switch_map_cursor.gbapal");
static const u16 sMapEdge_Pal[] = INCBIN_U16("graphics/region_map/map_edge.gbapal");
static const u32 sSwitchMapCursorLeft_Gfx[] = INCBIN_U32("graphics/region_map/switch_map_cursor_left.4bpp.lz");
static const u32 sSwitchMapCursorRight_Gfx[] = INCBIN_U32("graphics/region_map/switch_map_cursor_right.4bpp.lz");
static const u32 sMapCursor_Gfx[] = INCBIN_U32("graphics/region_map/cursor.4bpp.lz");
static const u32 sPlayerIcon_Red[] = INCBIN_U32("graphics/region_map/player_icon_red.4bpp.lz");
static const u32 sPlayerIcon_Leaf[] = INCBIN_U32("graphics/region_map/player_icon_leaf.4bpp.lz");
static const u32 sRegionMap_Gfx[] = INCBIN_U32("graphics/region_map/region_map.4bpp.lz");
static const u32 sMapEdge_Gfx[] = INCBIN_U32("graphics/region_map/map_edge.4bpp.lz");
static const u32 sSwitchMapMenu_Gfx[] = INCBIN_U32("graphics/region_map/switch_map_menu.4bpp.lz");
static const u32 sKanto_Tilemap[] = INCBIN_U32("graphics/region_map/kanto.bin.lz");
static const u32 sSevii123_Tilemap[] = INCBIN_U32("graphics/region_map/sevii_123.bin.lz");
static const u32 sSevii45_Tilemap[] = INCBIN_U32("graphics/region_map/sevii_45.bin.lz");
static const u32 sSevii67_Tilemap[] = INCBIN_U32("graphics/region_map/sevii_67.bin.lz");
static const u32 sMapEdge_Tilemap[] = INCBIN_U32("graphics/region_map/map_edge.bin.lz");
static const u32 sSwitchMap_KantoSeviiAll_Tilemap[] = INCBIN_U32("graphics/region_map/switch_map_kanto_sevii_all.bin.lz");
static const u32 sSwitchMap_KantoSevii123_Tilemap[] = INCBIN_U32("graphics/region_map/switch_map_kanto_sevii_123.bin.lz");
static const u32 sSwitchMap_KantoSeviiAll2_Tilemap[] = INCBIN_U32("graphics/region_map/switch_map_kanto_sevii_all2.bin.lz");
static const u32 sMapEdge_TopLeft[] = INCBIN_U32("graphics/region_map/map_edge_top_left.4bpp.lz");
static const u32 sMapEdge_TopRight[] = INCBIN_U32("graphics/region_map/map_edge_top_right.4bpp.lz");
static const u32 sMapEdge_MidLeft[] = INCBIN_U32("graphics/region_map/map_edge_mid_left.4bpp.lz");
static const u32 sMapEdge_MidRight[] = INCBIN_U32("graphics/region_map/map_edge_mid_right.4bpp.lz");
static const u32 sMapEdge_BottomLeft[] = INCBIN_U32("graphics/region_map/map_edge_bottom_left.4bpp.lz");
static const u32 sMapEdge_BottomRight[] = INCBIN_U32("graphics/region_map/map_edge_bottom_right.4bpp.lz");
static const u32 sDungeonIcon[] = INCBIN_U32("graphics/region_map/dungeon_icon.4bpp.lz");
static const u32 sFlyIcon[] = INCBIN_U32("graphics/region_map/fly_icon.4bpp.lz");
static const u32 sBackground_Gfx[] = INCBIN_U32("graphics/region_map/background.4bpp.lz");
static const u32 sBackground_Tilemap[] = INCBIN_U32("graphics/region_map/background.bin.lz");

static const struct BgTemplate sRegionMapBgTemplates[] = {
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

static const struct WindowTemplate sRegionMapWindowTemplates[] = {
    [WIN_MAP_NAME] = 
    {
        .bg = 3,
        .tilemapLeft = 3,
        .tilemapTop = 2,
        .width = 15,
        .height = 2,
        .paletteNum = 12,
        .baseBlock = 0x001
    }, 
    [WIN_DUNGEON_NAME] =
    {
        .bg = 3,
        .tilemapLeft = 3,
        .tilemapTop = 4,
        .width = 15,
        .height = 2,
        .paletteNum = 12,
        .baseBlock = 0x01f
    }, 
    [WIN_MAP_PREVIEW] =
    {
        .bg = 3,
        .tilemapLeft = 3,
        .tilemapTop = 6,
        .width = 25,
        .height = 11,
        .paletteNum = 12,
        .baseBlock = 0x03d
    },
    [WIN_TOPBAR_LEFT] =
    {
        .bg = 3,
        .tilemapLeft = 18,
        .tilemapTop = 0,
        .width = 5,
        .height = 2,
        .paletteNum = 12,
        .baseBlock = 0x150
    }, 
    [WIN_TOPBAR_RIGHT] =
    {
        .bg = 3,
        .tilemapLeft = 24,
        .tilemapTop = 0,
        .width = 5,
        .height = 2,
        .paletteNum = 12,
        .baseBlock = 0x15a
    }, DUMMY_WIN_TEMPLATE
};

ALIGNED(4) const u8 sTextColor_White[] = {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_WHITE,       TEXT_COLOR_DARK_GRAY};
ALIGNED(4) const u8 sTextColor_Green[] = {TEXT_COLOR_TRANSPARENT, TEXT_COLOR_LIGHT_GREEN, TEXT_COLOR_DARK_GRAY};
ALIGNED(4) const u8 sTextColor_Red[]   = {TEXT_COLOR_TRANSPARENT, TEXT_DYNAMIC_COLOR_1,   TEXT_COLOR_DARK_GRAY};

static const u8 *const sTextColorTable[] = {
    [MAPSECTYPE_VISITED - 2]     = sTextColor_Green,
    [MAPSECTYPE_NOT_VISITED - 2] = sTextColor_Red
};

static const u8 sSeviiMapsecs[3][30] = {
    [REGIONMAP_SEVII123 - 1] =
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
    }, 
    [REGIONMAP_SEVII45 - 1] =
    {
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
    }, 
    [REGIONMAP_SEVII67 - 1] = 
    {
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

ALIGNED(4) static const bool8 sRegionMapPermissions[REGIONMAP_TYPE_COUNT][MAPPERM_COUNT] = {
    [REGIONMAP_TYPE_NORMAL] = 
    {
        [MAPPERM_HAS_SWITCH_BUTTON]    = TRUE, 
        [MAPPERM_HAS_MAP_PREVIEW]      = TRUE, 
        [MAPPERM_HAS_OPEN_ANIM]        = TRUE, 
        [MAPPERM_HAS_FLY_DESTINATIONS] = FALSE
    },
    [REGIONMAP_TYPE_WALL] = 
    {
        [MAPPERM_HAS_SWITCH_BUTTON]    = FALSE, 
        [MAPPERM_HAS_MAP_PREVIEW]      = FALSE, 
        [MAPPERM_HAS_OPEN_ANIM]        = FALSE, 
        [MAPPERM_HAS_FLY_DESTINATIONS] = FALSE
    },
    [REGIONMAP_TYPE_FLY] = 
    {
        [MAPPERM_HAS_SWITCH_BUTTON]    = FALSE, 
        [MAPPERM_HAS_MAP_PREVIEW]      = FALSE, 
        [MAPPERM_HAS_OPEN_ANIM]        = FALSE, 
        [MAPPERM_HAS_FLY_DESTINATIONS] = TRUE 
    }
};

static const struct GpuWindowParams sMapsecNameWindowDims[3] = {
    [WIN_MAP_NAME]     = {.left = 24, .top = 16, .right = 144, .bottom = 32},
    [WIN_DUNGEON_NAME] = {.left = 24, .top = 32, .right = 144, .bottom = 48},
    [CLEAR_NAME]       = {.left =  0, .top =  0, .right =   0, .bottom =  0}
};

static const struct OamData sOamData_SwitchMapCursor = {
    .shape = SPRITE_SHAPE(32x32),
    .size = SPRITE_SIZE(32x32)
};

static const union AnimCmd sAnim_SwitchMapCursor[] = {
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_FRAME(16, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const sAnims_SwitchMapCursor[] = {
    sAnim_SwitchMapCursor
};

static const struct DungeonMapInfo sDungeonInfo[] = {
    {
        .id = MAPSEC_VIRIDIAN_FOREST,
        .name = sMapsecName_VIRIDIAN_FOREST,
        .desc = gText_RegionMap_AreaDesc_ViridianForest
    }, {
        .id = MAPSEC_MT_MOON,
        .name = sMapsecName_MT__MOON,
        .desc = gText_RegionMap_AreaDesc_MtMoon
    }, {
        .id = MAPSEC_DIGLETTS_CAVE,
        .name = sMapsecName_DIGLETT_S_CAVE,
        .desc = gText_RegionMap_AreaDesc_DiglettsCave
    }, {
        .id = MAPSEC_KANTO_VICTORY_ROAD,
        .name = sMapsecName_VICTORY_ROAD,
        .desc = gText_RegionMap_AreaDesc_VictoryRoad
    }, {
        .id = MAPSEC_POKEMON_MANSION,
        .name = sMapsecName_POK__MON_MANSION,
        .desc = gText_RegionMap_AreaDesc_PokemonMansion
    }, {
        .id = MAPSEC_KANTO_SAFARI_ZONE,
        .name = sMapsecName_SAFARI_ZONE,
        .desc = gText_RegionMap_AreaDesc_SafariZone
    }, {
        .id = MAPSEC_ROCK_TUNNEL,
        .name = sMapsecName_ROCK_TUNNEL,
        .desc = gText_RegionMap_AreaDesc_RockTunnel
    }, {
        .id = MAPSEC_SEAFOAM_ISLANDS,
        .name = sMapsecName_SEAFOAM_ISLANDS,
        .desc = gText_RegionMap_AreaDesc_SeafoamIslands
    }, {
        .id = MAPSEC_POKEMON_TOWER,
        .name = sMapsecName_POK__MON_TOWER,
        .desc = gText_RegionMap_AreaDesc_PokemonTower
    }, {
        .id = MAPSEC_CERULEAN_CAVE,
        .name = sMapsecName_CERULEAN_CAVE,
        .desc = gText_RegionMap_AreaDesc_CeruleanCave
    }, {
        .id = MAPSEC_POWER_PLANT,
        .name = sMapsecName_POWER_PLANT,
        .desc = gText_RegionMap_AreaDesc_PowerPlant
    }, {
        .id = MAPSEC_MT_EMBER,
        .name = sMapsecName_MT__EMBER,
        .desc = gText_RegionMap_AreaDesc_MtEmber
    }, {
        .id = MAPSEC_BERRY_FOREST,
        .name = sMapsecName_BERRY_FOREST,
        .desc = gText_RegionMap_AreaDesc_BerryForest
    }, {
        .id = MAPSEC_ICEFALL_CAVE,
        .name = sMapsecName_ICEFALL_CAVE,
        .desc = gText_RegionMap_AreaDesc_IcefallCave
    }, {
        .id = MAPSEC_LOST_CAVE,
        .name = sMapsecName_LOST_CAVE,
        .desc = gText_RegionMap_AreaDesc_LostCave
    }, {
        .id = MAPSEC_TANOBY_CHAMBERS,
        .name = sMapsecName_TANOBY_CHAMBERS,
        .desc = gText_RegionMap_AreaDesc_TanobyRuins
    }, {
        .id = MAPSEC_ALTERING_CAVE,
        .name = sMapsecName_ALTERING_CAVE,
        .desc = gText_RegionMap_AreaDesc_AlteringCave
    }, {
        .id = MAPSEC_PATTERN_BUSH,
        .name = sMapsecName_PATTERN_BUSH,
        .desc = gText_RegionMap_AreaDesc_PatternBush
    }, {
        .id = MAPSEC_DOTTED_HOLE,
        .name = sMapsecName_DOTTED_HOLE,
        .desc = gText_RegionMap_AreaDesc_DottedHole
    }
};

static const struct OamData sOamData_MapEdge = {
    .shape = SPRITE_SHAPE(32x64),
    .size = SPRITE_SIZE(32x64)
};

static const union AnimCmd sAnim_MapEdge[] = {
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const sAnims_MapEdge[] = {
    sAnim_MapEdge
};

static const struct GpuWindowParams sMapWindowDim = {
    .left = 24, 
    .top = 16, 
    .right = 216, 
    .bottom = 160
};

static const struct OamData sOamData_MapCursor = {
    .shape = SPRITE_SHAPE(16x16),
    .size = SPRITE_SIZE(16x16),
    .priority = 2
};

static const union AnimCmd sAnim_MapCursor[] = {
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_FRAME(4, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const sAnims_MapCursor[] = {
    sAnim_MapCursor
};

static const struct OamData sOamData_PlayerIcon = {
    .shape = SPRITE_SHAPE(16x16),
    .size = SPRITE_SIZE(16x16),
    .priority = 2
};

static const union AnimCmd sAnim_PlayerIcon[] = {
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

static const union AnimCmd *const sAnims_PlayerIcon[] = {
    sAnim_PlayerIcon
};

static const struct OamData sOamData_FlyIcon = {
    .shape = SPRITE_SHAPE(16x16),
    .size = SPRITE_SIZE(16x16),
    .priority = 2
};

static const struct OamData sOamData_DungeonIcon = {
    .shape = SPRITE_SHAPE(8x8),
    .size = SPRITE_SIZE(8x8),
    .priority = 2
};

static const union AnimCmd sAnim_FlyIcon[] = {
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_FRAME(4, 60),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sAnim_DungeonIconVisited[] = {
    ANIMCMD_FRAME(1, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd sAnim_DungeonIconNotVisited[] = {
    ANIMCMD_FRAME(0, 20),
    ANIMCMD_JUMP(0)
};

static const union AnimCmd *const sAnims_FlyIcon[] = {
    sAnim_FlyIcon
};

static const union AnimCmd *const sAnims_DungeonIcon[] = {
    sAnim_DungeonIconVisited,
    sAnim_DungeonIconNotVisited
};

static const u16 sWinFlags[] = {
    DISPCNT_WIN0_ON,
    DISPCNT_WIN1_ON
};

static const u8 sWinRegs[][2] = {
    {REG_OFFSET_WIN0V, REG_OFFSET_WIN0H},
    {REG_OFFSET_WIN1V, REG_OFFSET_WIN1H}
};

static const u8 sTextColors[] = {TEXT_DYNAMIC_COLOR_6, TEXT_COLOR_WHITE, TEXT_COLOR_DARK_GRAY};

#include "data/region_map/region_map_entries.h"

#include "data/region_map/region_map_layout_kanto.h"
#include "data/region_map/region_map_layout_sevii_123.h"
#include "data/region_map/region_map_layout_sevii_45.h"
#include "data/region_map/region_map_layout_sevii_67.h"

static const u8 sMapFlyDestinations[][3] = {
    [MAPSEC_PALLET_TOWN         - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           SPAWN_PALLET_TOWN},
    [MAPSEC_VIRIDIAN_CITY       - MAPSECS_KANTO] = {MAP(VIRIDIAN_CITY),                         SPAWN_VIRIDIAN_CITY},
    [MAPSEC_PEWTER_CITY         - MAPSECS_KANTO] = {MAP(PEWTER_CITY),                           SPAWN_PEWTER_CITY},
    [MAPSEC_CERULEAN_CITY       - MAPSECS_KANTO] = {MAP(CERULEAN_CITY),                         SPAWN_CERULEAN_CITY},
    [MAPSEC_LAVENDER_TOWN       - MAPSECS_KANTO] = {MAP(LAVENDER_TOWN),                         SPAWN_LAVENDER_TOWN},
    [MAPSEC_VERMILION_CITY      - MAPSECS_KANTO] = {MAP(VERMILION_CITY),                        SPAWN_VERMILION_CITY},
    [MAPSEC_CELADON_CITY        - MAPSECS_KANTO] = {MAP(CELADON_CITY),                          SPAWN_CELADON_CITY},
    [MAPSEC_FUCHSIA_CITY        - MAPSECS_KANTO] = {MAP(FUCHSIA_CITY),                          SPAWN_FUCHSIA_CITY},
    [MAPSEC_CINNABAR_ISLAND     - MAPSECS_KANTO] = {MAP(CINNABAR_ISLAND),                       SPAWN_CINNABAR_ISLAND},
    [MAPSEC_INDIGO_PLATEAU      - MAPSECS_KANTO] = {MAP(INDIGO_PLATEAU_EXTERIOR),               SPAWN_INDIGO_PLATEAU},
    [MAPSEC_SAFFRON_CITY        - MAPSECS_KANTO] = {MAP(SAFFRON_CITY),                          SPAWN_SAFFRON_CITY},
    [MAPSEC_ROUTE_4_POKECENTER  - MAPSECS_KANTO] = {MAP(ROUTE4),                                SPAWN_ROUTE4},
    [MAPSEC_ROUTE_10_POKECENTER - MAPSECS_KANTO] = {MAP(ROUTE10),                               SPAWN_ROUTE10},
    [MAPSEC_ROUTE_1             - MAPSECS_KANTO] = {MAP(ROUTE1),                                0},
    [MAPSEC_ROUTE_2             - MAPSECS_KANTO] = {MAP(ROUTE2),                                0},
    [MAPSEC_ROUTE_3             - MAPSECS_KANTO] = {MAP(ROUTE3),                                0},
    [MAPSEC_ROUTE_4             - MAPSECS_KANTO] = {MAP(ROUTE4),                                0},
    [MAPSEC_ROUTE_5             - MAPSECS_KANTO] = {MAP(ROUTE5),                                0},
    [MAPSEC_ROUTE_6             - MAPSECS_KANTO] = {MAP(ROUTE6),                                0},
    [MAPSEC_ROUTE_7             - MAPSECS_KANTO] = {MAP(ROUTE7),                                0},
    [MAPSEC_ROUTE_8             - MAPSECS_KANTO] = {MAP(ROUTE8),                                0},
    [MAPSEC_ROUTE_9             - MAPSECS_KANTO] = {MAP(ROUTE9),                                0},
    [MAPSEC_ROUTE_10            - MAPSECS_KANTO] = {MAP(ROUTE10),                               0},
    [MAPSEC_ROUTE_11            - MAPSECS_KANTO] = {MAP(ROUTE11),                               0},
    [MAPSEC_ROUTE_12            - MAPSECS_KANTO] = {MAP(ROUTE12),                               0},
    [MAPSEC_ROUTE_13            - MAPSECS_KANTO] = {MAP(ROUTE13),                               0},
    [MAPSEC_ROUTE_14            - MAPSECS_KANTO] = {MAP(ROUTE14),                               0},
    [MAPSEC_ROUTE_15            - MAPSECS_KANTO] = {MAP(ROUTE15),                               0},
    [MAPSEC_ROUTE_16            - MAPSECS_KANTO] = {MAP(ROUTE16),                               0},
    [MAPSEC_ROUTE_17            - MAPSECS_KANTO] = {MAP(ROUTE17),                               0},
    [MAPSEC_ROUTE_18            - MAPSECS_KANTO] = {MAP(ROUTE18),                               0},
    [MAPSEC_ROUTE_19            - MAPSECS_KANTO] = {MAP(ROUTE19),                               0},
    [MAPSEC_ROUTE_20            - MAPSECS_KANTO] = {MAP(ROUTE20),                               0},
    [MAPSEC_ROUTE_21            - MAPSECS_KANTO] = {MAP(ROUTE21_NORTH),                         0},
    [MAPSEC_ROUTE_22            - MAPSECS_KANTO] = {MAP(ROUTE22),                               0},
    [MAPSEC_ROUTE_23            - MAPSECS_KANTO] = {MAP(ROUTE23),                               0},
    [MAPSEC_ROUTE_24            - MAPSECS_KANTO] = {MAP(ROUTE24),                               0},
    [MAPSEC_ROUTE_25            - MAPSECS_KANTO] = {MAP(ROUTE25),                               0},
    [MAPSEC_VIRIDIAN_FOREST     - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_MT_MOON             - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_S_S_ANNE            - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_UNDERGROUND_PATH    - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_UNDERGROUND_PATH_2  - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_DIGLETTS_CAVE       - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_KANTO_VICTORY_ROAD  - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_ROCKET_HIDEOUT      - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_SILPH_CO            - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_POKEMON_MANSION     - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_KANTO_SAFARI_ZONE   - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_POKEMON_LEAGUE      - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_ROCK_TUNNEL         - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_SEAFOAM_ISLANDS     - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_POKEMON_TOWER       - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_CERULEAN_CAVE       - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_POWER_PLANT         - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_ONE_ISLAND          - MAPSECS_KANTO] = {MAP(ONE_ISLAND),                            SPAWN_ONE_ISLAND},
    [MAPSEC_TWO_ISLAND          - MAPSECS_KANTO] = {MAP(TWO_ISLAND),                            SPAWN_TWO_ISLAND},
    [MAPSEC_THREE_ISLAND        - MAPSECS_KANTO] = {MAP(THREE_ISLAND),                          SPAWN_THREE_ISLAND},
    [MAPSEC_FOUR_ISLAND         - MAPSECS_KANTO] = {MAP(FOUR_ISLAND),                           SPAWN_FOUR_ISLAND},
    [MAPSEC_FIVE_ISLAND         - MAPSECS_KANTO] = {MAP(FIVE_ISLAND),                           SPAWN_FIVE_ISLAND},
    [MAPSEC_SEVEN_ISLAND        - MAPSECS_KANTO] = {MAP(SEVEN_ISLAND),                          SPAWN_SEVEN_ISLAND},
    [MAPSEC_SIX_ISLAND          - MAPSECS_KANTO] = {MAP(SIX_ISLAND),                            SPAWN_SIX_ISLAND},
    [MAPSEC_KINDLE_ROAD         - MAPSECS_KANTO] = {MAP(ONE_ISLAND_KINDLE_ROAD),                0},
    [MAPSEC_TREASURE_BEACH      - MAPSECS_KANTO] = {MAP(ONE_ISLAND_TREASURE_BEACH),             0},
    [MAPSEC_CAPE_BRINK          - MAPSECS_KANTO] = {MAP(TWO_ISLAND_CAPE_BRINK),                 0},
    [MAPSEC_BOND_BRIDGE         - MAPSECS_KANTO] = {MAP(THREE_ISLAND_BOND_BRIDGE),              0},
    [MAPSEC_THREE_ISLE_PORT     - MAPSECS_KANTO] = {MAP(THREE_ISLAND_PORT),                     0},
    [MAPSEC_SEVII_ISLE_6        - MAPSECS_KANTO] = {MAP(PROTOTYPE_SEVII_ISLE_6),                0},
    [MAPSEC_SEVII_ISLE_7        - MAPSECS_KANTO] = {MAP(PROTOTYPE_SEVII_ISLE_7),                0},
    [MAPSEC_SEVII_ISLE_8        - MAPSECS_KANTO] = {MAP(PROTOTYPE_SEVII_ISLE_8),                0},
    [MAPSEC_SEVII_ISLE_9        - MAPSECS_KANTO] = {MAP(PROTOTYPE_SEVII_ISLE_9),                0},
    [MAPSEC_RESORT_GORGEOUS     - MAPSECS_KANTO] = {MAP(FIVE_ISLAND_RESORT_GORGEOUS),           0},
    [MAPSEC_WATER_LABYRINTH     - MAPSECS_KANTO] = {MAP(FIVE_ISLAND_WATER_LABYRINTH),           0},
    [MAPSEC_FIVE_ISLE_MEADOW    - MAPSECS_KANTO] = {MAP(FIVE_ISLAND_MEADOW),                    0},
    [MAPSEC_MEMORIAL_PILLAR     - MAPSECS_KANTO] = {MAP(FIVE_ISLAND_MEMORIAL_PILLAR),           0},
    [MAPSEC_OUTCAST_ISLAND      - MAPSECS_KANTO] = {MAP(SIX_ISLAND_OUTCAST_ISLAND),             0},
    [MAPSEC_GREEN_PATH          - MAPSECS_KANTO] = {MAP(SIX_ISLAND_GREEN_PATH),                 0},
    [MAPSEC_WATER_PATH          - MAPSECS_KANTO] = {MAP(SIX_ISLAND_WATER_PATH),                 0},
    [MAPSEC_RUIN_VALLEY         - MAPSECS_KANTO] = {MAP(SIX_ISLAND_RUIN_VALLEY),                0},
    [MAPSEC_TRAINER_TOWER       - MAPSECS_KANTO] = {MAP(SEVEN_ISLAND_TRAINER_TOWER),            0},
    [MAPSEC_CANYON_ENTRANCE     - MAPSECS_KANTO] = {MAP(SEVEN_ISLAND_SEVAULT_CANYON_ENTRANCE),  0},
    [MAPSEC_SEVAULT_CANYON      - MAPSECS_KANTO] = {MAP(SEVEN_ISLAND_SEVAULT_CANYON),           0},
    [MAPSEC_TANOBY_RUINS        - MAPSECS_KANTO] = {MAP(SEVEN_ISLAND_TANOBY_RUINS),             0},
    [MAPSEC_SEVII_ISLE_22       - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_SEVII_ISLE_23       - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_SEVII_ISLE_24       - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_NAVEL_ROCK          - MAPSECS_KANTO] = {MAP(NAVEL_ROCK_EXTERIOR),                   0},
    [MAPSEC_MT_EMBER            - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_BERRY_FOREST        - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_ICEFALL_CAVE        - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_ROCKET_WAREHOUSE    - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_TRAINER_TOWER_2     - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_DOTTED_HOLE         - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_LOST_CAVE           - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_PATTERN_BUSH        - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_ALTERING_CAVE       - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_TANOBY_CHAMBERS     - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_THREE_ISLE_PATH     - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_TANOBY_KEY          - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_BIRTH_ISLAND        - MAPSECS_KANTO] = {MAP(BIRTH_ISLAND_EXTERIOR),                 0},
    [MAPSEC_MONEAN_CHAMBER      - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_LIPTOO_CHAMBER      - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_WEEPTH_CHAMBER      - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_DILFORD_CHAMBER     - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_SCUFIB_CHAMBER      - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_RIXY_CHAMBER        - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_VIAPOIS_CHAMBER     - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
    [MAPSEC_EMBER_SPA           - MAPSECS_KANTO] = {MAP(PALLET_TOWN),                           0},
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

static void TintMapEdgesPalette(void)
{
    u16 mapEdgesPal[16];
    CpuCopy16(&sRegionMap_Pal[0x20], mapEdgesPal, sizeof(mapEdgesPal));
    RegionMap_DarkenPalette(mapEdgesPal, NELEMS(mapEdgesPal), 95);
    LoadPalette(mapEdgesPal, BG_PLTT_ID(2), sizeof(mapEdgesPal));
    LoadPalette(&sRegionMap_Pal[0x2F], BG_PLTT_ID(2) + 15, PLTT_SIZEOF(1));
}

static void InitRegionMap(u8 type)
{
    sRegionMap = AllocZeroed(sizeof(struct RegionMap));
    if (sRegionMap == NULL)
    {
        SetMainCallback2(CB2_ReturnToField);
    }
    else
    {
        gExitStairsMovementDisabled = TRUE;
        sRegionMap->type = type;
        sRegionMap->mainState = 0;
        sRegionMap->openState = 0;
        sRegionMap->loadGfxState = 0;
        InitRegionMapType();
        SetMainCallback2(CB2_OpenRegionMap);
    }
}

void InitRegionMapWithExitCB(u8 type, MainCallback cb)
{
    sRegionMap = AllocZeroed(sizeof(struct RegionMap));
    if (sRegionMap == NULL)
    {
        SetMainCallback2(CB2_ReturnToField);
    }
    else
    {
        gExitStairsMovementDisabled = TRUE;
        sRegionMap->type = type;
        sRegionMap->mainState = 0;
        sRegionMap->openState = 0;
        sRegionMap->loadGfxState = 0;
        sRegionMap->savedCallback = cb;
        InitRegionMapType();
        SetMainCallback2(CB2_OpenRegionMap);
    }
}

static void InitRegionMapType(void)
{
    u8 i;
    u8 j;
    u8 region;

    switch (sRegionMap->type)
    {
    default:
    case REGIONMAP_TYPE_NORMAL:
    case REGIONMAP_TYPE_WALL:
        sRegionMap->mainTask = Task_RegionMap;
        break;
    case REGIONMAP_TYPE_FLY:
        sRegionMap->mainTask = Task_FlyMap;
        break;
    }
    for (i = 0; i < MAPPERM_COUNT; i++)
    {
        sRegionMap->permissions[i] = sRegionMapPermissions[sRegionMap->type][i];
    }
    if (!FlagGet(FLAG_SYS_SEVII_MAP_123))
        sRegionMap->permissions[MAPPERM_HAS_SWITCH_BUTTON] = FALSE;
    region = REGIONMAP_KANTO;
    j = REGIONMAP_KANTO;
    if (gMapHeader.regionMapSectionId >= MAPSECS_SEVII_123)
    {
        // Mapsec is in Sevii Islands, determine which map to use
        while (region == REGIONMAP_KANTO)
        {
            for (i = 0; sSeviiMapsecs[j][i] != MAPSEC_NONE; i++)
            {
                if (gMapHeader.regionMapSectionId == sSeviiMapsecs[j][i])
                {
                    region = j + 1;
                    break;
                }
            }
            j++;
        }
    }
    sRegionMap->selectedRegion = region;
    sRegionMap->playersRegion = region;
}

static void CB2_OpenRegionMap(void)
{
    switch (sRegionMap->openState)
    {
    case 0:
        NullVBlankHBlankCallbacks();
        break;
    case 1:
        InitRegionMapBgs();
        break;
    case 2:
        ResetOamForRegionMap();
        break;
    case 3:
        if (!LoadRegionMapGfx())
            return;
        break;
    case 4:
        FillBgTilemapBufferRect_Palette0(1, 0, 0, 0, 30, 20);
        CopyBgTilemapBufferToVram(1);
        break;
    case 5:
        BufferRegionMapBg(0, sRegionMap->layouts[sRegionMap->selectedRegion]);
        CopyBgTilemapBufferToVram(0);
        if (sRegionMap->type != REGIONMAP_TYPE_NORMAL)
        {
            BufferRegionMapBg(1, sRegionMap->layouts[REGIONMAP_COUNT]);
            CopyBgTilemapBufferToVram(1);
        }
        break;
    case 6:
        DisplayCurrentMapName();
        PutWindowTilemap(WIN_MAP_NAME);
        break;
    case 7:
        DisplayCurrentDungeonName();
        PutWindowTilemap(WIN_DUNGEON_NAME);
        break;
    case 8:
        if (GetRegionMapPermission(MAPPERM_HAS_OPEN_ANIM) == TRUE)
            SetBg0andBg3Hidden(TRUE);
        break;
    default:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        CreateMainMapTask();
        SetRegionMapVBlankCB();
        break;
    }
    sRegionMap->openState++;
}

static bool8 LoadRegionMapGfx(void)
{
    switch (sRegionMap->loadGfxState)
    {
    case 0:
        LoadPalette(sTopBar_Pal, BG_PLTT_ID(12), sizeof(sTopBar_Pal));
        break;
    case 1:
        LoadPalette(sRegionMap_Pal, 0, sizeof(sRegionMap_Pal));
        TintMapEdgesPalette();
        if (sRegionMap->type != REGIONMAP_TYPE_NORMAL)
        {
            LoadPalette(&sTopBar_Pal[15], BG_PLTT_ID(0), sizeof(sTopBar_Pal[15]));
            LoadPalette(&sTopBar_Pal[15], BG_PLTT_ID(1), sizeof(sTopBar_Pal[15]));
            LoadPalette(&sTopBar_Pal[15], BG_PLTT_ID(2), sizeof(sTopBar_Pal[15]));
            LoadPalette(&sTopBar_Pal[15], BG_PLTT_ID(3), sizeof(sTopBar_Pal[15]));
            LoadPalette(&sTopBar_Pal[15], BG_PLTT_ID(4), sizeof(sTopBar_Pal[15]));
        }
        break;
    case 2:
        ResetTempTileDataBuffers();
        break;
    case 3:
        DecompressAndCopyTileDataToVram(0, sRegionMap_Gfx, 0, 0, 0);
        if (sRegionMap->type != REGIONMAP_TYPE_NORMAL)
            DecompressAndCopyTileDataToVram(1, sBackground_Gfx, 0, 0, 0);
        break;
    case 4:
        if (FreeTempTileDataBuffersIfPossible() == TRUE)
            return FALSE;
        break;
    case 5:
        LZ77UnCompWram(sKanto_Tilemap, sRegionMap->layouts[REGIONMAP_KANTO]);
        break;
    case 6:
        LZ77UnCompWram(sSevii123_Tilemap, sRegionMap->layouts[REGIONMAP_SEVII123]);
        break;
    case 7:
        LZ77UnCompWram(sSevii45_Tilemap, sRegionMap->layouts[REGIONMAP_SEVII45]);
        break;
    case 8:
        LZ77UnCompWram(sSevii67_Tilemap, sRegionMap->layouts[REGIONMAP_SEVII67]);
        break;
    default:
        LZ77UnCompWram(sBackground_Tilemap, sRegionMap->layouts[REGIONMAP_COUNT]);
        return TRUE;
    }
    sRegionMap->loadGfxState++;
    return FALSE;
}

static void CreateMainMapTask(void)
{
    CreateTask(sRegionMap->mainTask, 0);
    SetMainCallback2(CB2_RegionMap);
}

static bool32 SelectedMapsecSEEnabled(void)
{
    if (GetSelectedMapSection(GetSelectedRegionMap(), LAYER_MAP, GetMapCursorY(), GetMapCursorX()) == MAPSEC_ROUTE_4_POKECENTER)
        return FALSE;
    else
        return TRUE;
}

static void PlaySEForSelectedMapsec(void)
{
    if (SelectedMapsecSEEnabled())
    {
        if ((GetSelectedMapsecType(LAYER_MAP) != MAPSECTYPE_ROUTE && GetSelectedMapsecType(LAYER_MAP) != MAPSECTYPE_NONE) 
         || (GetSelectedMapsecType(LAYER_DUNGEON) != MAPSECTYPE_ROUTE && GetSelectedMapsecType(LAYER_DUNGEON) != MAPSECTYPE_NONE))
            PlaySE(SE_DEX_SCROLL);
        if (GetMapCursorX() == SWITCH_BUTTON_X && GetMapCursorY() == SWITCH_BUTTON_Y && GetRegionMapPermission(MAPPERM_HAS_SWITCH_BUTTON) == TRUE)
            PlaySE(SE_M_SPIT_UP);
        else if (GetMapCursorX() == CANCEL_BUTTON_X && GetMapCursorY() == CANCEL_BUTTON_Y)
            PlaySE(SE_M_SPIT_UP);
    }
}

static void Task_RegionMap(u8 taskId)
{
    switch (sRegionMap->mainState)
    {
    case 0:
        InitMapIcons(GetSelectedRegionMap(), taskId, sRegionMap->mainTask);
        CreateMapCursor(0, 0);
        CreatePlayerIcon(1, 1);
        sRegionMap->mainState++;
        break;
    case 1:
        if (sRegionMap->permissions[MAPPERM_HAS_OPEN_ANIM] == TRUE)
        {
            InitMapOpenAnim(taskId, sRegionMap->mainTask);
        }
        else
        {
            ShowBg(0);
            ShowBg(3);
            ShowBg(1);
            PrintTopBarTextLeft(gText_RegionMap_DPadMove);
            PrintTopBarTextRight(gText_RegionMap_Space);
            ClearOrDrawTopBar(FALSE);
            SetPlayerIconInvisibility(FALSE);
            SetMapCursorInvisibility(FALSE);
            SetFlyIconInvisibility(GetSelectedRegionMap(), NELEMS(sMapIcons->flyIcons), FALSE);
            SetDungeonIconInvisibility(GetSelectedRegionMap(), NELEMS(sMapIcons->dungeonIcons), FALSE);
        }
        sRegionMap->mainState++;
        break;
    case 2:
        if (!gPaletteFade.active && !IsDma3ManagerBusyWithBgCopy())
        {
            DisplayCurrentMapName();
            PutWindowTilemap(WIN_MAP_NAME);
            DisplayCurrentDungeonName();
            PutWindowTilemap(WIN_DUNGEON_NAME);
            sRegionMap->mainState++;
        }
        break;
    case 3:
        switch (GetRegionMapInput())
        {
        case MAP_INPUT_MOVE_START:
            ResetCursorSnap();
            break;
        case MAP_INPUT_MOVE_CONT:
            break;
        case MAP_INPUT_MOVE_END:
            DisplayCurrentMapName();
            DisplayCurrentDungeonName();
            DrawDungeonNameBox();
            PlaySEForSelectedMapsec();
            if (GetDungeonMapsecUnderCursor() != MAPSEC_NONE)
            {
                if (GetRegionMapPermission(MAPPERM_HAS_MAP_PREVIEW) == TRUE)
                {
                    if (GetSelectedMapsecType(LAYER_DUNGEON) == MAPSECTYPE_VISITED)
                    {
                        PrintTopBarTextRight(gText_RegionMap_AButtonGuide);
                    }
                    else
                    {
                        PrintTopBarTextRight(gText_RegionMap_Space);
                    }
                }
            }
            else
            {
                if (GetMapCursorX() == SWITCH_BUTTON_X && GetMapCursorY() == SWITCH_BUTTON_Y && GetRegionMapPermission(MAPPERM_HAS_SWITCH_BUTTON) == TRUE)
                {
                    PrintTopBarTextRight(gText_RegionMap_AButtonSwitch);
                }
                else if (GetMapCursorX() == CANCEL_BUTTON_X && GetMapCursorY() == CANCEL_BUTTON_Y)
                {
                    PrintTopBarTextRight(gText_RegionMap_AButtonCancel);
                }
                else
                {
                    PrintTopBarTextRight(gText_RegionMap_Space);
                }
            }
            break;
        case MAP_INPUT_A_BUTTON:
            if (GetSelectedMapsecType(LAYER_DUNGEON) == MAPSECTYPE_VISITED && sRegionMap->permissions[MAPPERM_HAS_MAP_PREVIEW] == TRUE)
                InitDungeonMapPreview(0, taskId, SaveMainMapTask);
            break;
        case MAP_INPUT_SWITCH:
            InitSwitchMapMenu(sRegionMap->selectedRegion, taskId, SaveMainMapTask);
            break;
        case MAP_INPUT_CANCEL:
            sRegionMap->mainState++;
            break;
        }
        break;
    case 4:
        if (GetRegionMapPermission(MAPPERM_HAS_OPEN_ANIM) == TRUE)
        {
            DoMapCloseAnim(taskId);
            // FIXME: goto required to match
            // sRegionMap->mainState++;
            goto INCREMENT_MAIN_STATE_AND_BREAK;
        }
        else
        {
            sRegionMap->mainState++;
        }
        break;
    case 5:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
    INCREMENT_MAIN_STATE_AND_BREAK:
        sRegionMap->mainState++;
        break;
    default:
        if (!gPaletteFade.active)
        {
            FreeRegionMap(taskId);
        }
        break;
    }
}

// Unused
static void SetMainMapTask(TaskFunc taskFunc)
{
    sRegionMap->mainTask = taskFunc;
}

static TaskFunc GetMainMapTask(void)
{
    return sRegionMap->mainTask;
}

static void SaveMainMapTask(u8 taskId)
{
    gTasks[taskId].func = sRegionMap->mainTask;
}

static void FreeRegionMap(u8 taskId)
{
    if (GetRegionMapPermission(MAPPERM_HAS_OPEN_ANIM) == TRUE)
        FreeMapOpenCloseAnim();
    FreeMapIcons();
    FreeMapCursor();
    FreePlayerIcon();
    FreeAndResetGpuRegs();
    DestroyTask(taskId);
    FreeAllWindowBuffers();
    if (sRegionMap->savedCallback == NULL)
        SetMainCallback2(gMain.savedCallback);
    else
        SetMainCallback2(sRegionMap->savedCallback);
    FREE_IF_NOT_NULL(sRegionMap);
}

static void FreeRegionMapForFlyMap(void)
{
    FREE_IF_NOT_NULL(sRegionMap);
}

static void CB2_RegionMap(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void VBlankCB_RegionMap(void)
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

static void SetRegionMapVBlankCB(void)
{
    SetVBlankCallback(VBlankCB_RegionMap);
}

static void InitRegionMapBgs(void)
{
    DmaFillLarge16(3, 0, (void *)VRAM, VRAM_SIZE, 0x1000);
    DmaFill32Defvars(3, 0, (void *)OAM, OAM_SIZE);
    DmaFill16Defvars(3, 0, (void *)PLTT, PLTT_SIZE);
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, sRegionMapBgTemplates, NELEMS(sRegionMapBgTemplates));
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
    InitWindows(sRegionMapWindowTemplates);
    DeactivateAllTextPrinters();
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_WIN0_ON | DISPCNT_WIN1_ON);
    SetBgTilemapBuffers();
    UpdateMapsecNameBox();
}

static void SetBgTilemapBuffers(void)
{
    SetBgTilemapBuffer(0, sRegionMap->bgTilemapBuffers[0]);
    SetBgTilemapBuffer(1, sRegionMap->bgTilemapBuffers[1]);
    SetBgTilemapBuffer(2, sRegionMap->bgTilemapBuffers[2]);
}

static void ResetOamForRegionMap(void)
{
    ResetSpriteData();
    ResetPaletteFade();
    FreeAllSpritePalettes();
    ResetTasks();
    ScanlineEffect_Stop();
}

static void SetBg0andBg3Hidden(bool8 hide)
{
    switch (hide)
    {
    case FALSE:
        ShowBg(0);
        ShowBg(3);
        break;
    case TRUE:
        HideBg(0);
        HideBg(3);
        break;
    }
}

static void UpdateMapsecNameBox(void)
{
    ResetGpuRegs();
    SetBldCnt(0, BLDCNT_TGT1_BG0 | BLDCNT_TGT1_OBJ, BLDCNT_EFFECT_DARKEN);
    SetBldY(BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2);
    SetWinIn(
        (WININ_WIN0_BG0 | WININ_WIN0_BG3 | WININ_WIN0_OBJ | WININ_WIN0_CLR),
        (WININ_WIN1_BG0 | WININ_WIN1_BG3 | WININ_WIN1_OBJ | WININ_WIN1_CLR) >> 8);
    SetWinOut(WINOUT_WIN01_BG0 | WINOUT_WIN01_BG1 | WINOUT_WIN01_BG3 | WINOUT_WIN01_OBJ);
    SetGpuWindowDims(0, &sMapsecNameWindowDims[WIN_MAP_NAME]);
    SetGpuWindowDims(1, &sMapsecNameWindowDims[WIN_DUNGEON_NAME]);
    SetDispCnt(0, FALSE);
    if (GetDungeonMapsecUnderCursor() != MAPSEC_NONE)
        SetDispCnt(1, FALSE);
}

static void DisplayCurrentMapName(void)
{
    ClearWindowTilemap(WIN_MAP_NAME);
    FillWindowPixelBuffer(WIN_MAP_NAME, PIXEL_FILL(0));
    if (GetMapsecUnderCursor() == MAPSEC_NONE)
    {
        SetGpuWindowDims(0, &sMapsecNameWindowDims[CLEAR_NAME]);
    }
    else
    {
        GetMapName(sRegionMap->mapName, GetMapsecUnderCursor(), 0);
        AddTextPrinterParameterized3(WIN_MAP_NAME, FONT_NORMAL, 2, 2, sTextColor_White, 0, sRegionMap->mapName);
        PutWindowTilemap(WIN_MAP_NAME);
        CopyWindowToVram(WIN_MAP_NAME, COPYWIN_GFX);
        SetGpuWindowDims(0, &sMapsecNameWindowDims[WIN_MAP_NAME]);
    }
}

static void DrawDungeonNameBox(void)
{
    SetGpuWindowDims(1, &sMapsecNameWindowDims[WIN_DUNGEON_NAME]);
}

static void DisplayCurrentDungeonName(void)
{
    u16 mapsecId;
    u16 descOffset;
    sRegionMap->dungeonWinTop = FALSE;
    sRegionMap->dungeonWinRight = 24;
    sRegionMap->dungeonWinBottom = 32;
    SetDispCnt(1, TRUE);
    ClearWindowTilemap(WIN_DUNGEON_NAME);
    mapsecId = GetDungeonMapsecUnderCursor();
    if (mapsecId != MAPSEC_NONE)
    {
         descOffset = mapsecId - MAPSECS_KANTO;
         SetDispCnt(1, FALSE);
         sRegionMap->dungeonWinTop = TRUE;
         sRegionMap->dungeonWinLeft = StringLength(sMapNames[descOffset]);
         sRegionMap->dungeonWinRight = sRegionMap->dungeonWinLeft * 10 + 50;
         sRegionMap->dungeonWinBottom = 48;
         FillWindowPixelBuffer(WIN_DUNGEON_NAME, PIXEL_FILL(0));
         StringCopy(sRegionMap->dungeonName, sMapNames[descOffset]);
         AddTextPrinterParameterized3(WIN_DUNGEON_NAME, FONT_NORMAL, 12, 2, sTextColorTable[GetSelectedMapsecType(LAYER_DUNGEON) - 2], 0, sRegionMap->dungeonName);
         PutWindowTilemap(WIN_DUNGEON_NAME);
         CopyWindowToVram(WIN_DUNGEON_NAME, COPYWIN_FULL);
    }
}

static void ClearMapsecNameText(void)
{
    FillWindowPixelBuffer(WIN_MAP_NAME, PIXEL_FILL(0));
    CopyWindowToVram(WIN_MAP_NAME, COPYWIN_FULL);
    FillWindowPixelBuffer(WIN_DUNGEON_NAME, PIXEL_FILL(0));
    CopyWindowToVram(WIN_DUNGEON_NAME, COPYWIN_FULL);
}

static void BufferRegionMapBg(u8 bg, u16 *map)
{
    s16 i;
    s16 j;
    u8 whichMap;
    u16 *buffer = sRegionMap->bgTilemapBuffers[bg];
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
    if (sRegionMap->permissions[MAPPERM_HAS_SWITCH_BUTTON] == TRUE)
    {
        WriteSequenceToBgTilemapBuffer(0, 0x0F0, 0x18, 14, 3, 1, 0x3, 0x001);
        WriteSequenceToBgTilemapBuffer(0, 0x100, 0x18, 15, 3, 1, 0x3, 0x001);
        WriteSequenceToBgTilemapBuffer(0, 0x110, 0x18, 16, 3, 1, 0x3, 0x001);
    }
    if (sSwitchMapMenu != NULL)
        whichMap = sSwitchMapMenu->currentSelection;
    else
        whichMap = sRegionMap->selectedRegion;
    if (whichMap == REGIONMAP_SEVII45 && !FlagGet(FLAG_WORLD_MAP_NAVEL_ROCK_EXTERIOR))
        FillBgTilemapBufferRect_Palette0(0, 0x003, 13, 11, 3, 2);
    if (whichMap == REGIONMAP_SEVII67 && !FlagGet(FLAG_WORLD_MAP_BIRTH_ISLAND_EXTERIOR))
        FillBgTilemapBufferRect_Palette0(0, 0x003, 21, 16, 3, 3);
}

static bool8 GetRegionMapPermission(u8 attr)
{
    return sRegionMap->permissions[attr];
}

static u8 GetSelectedRegionMap(void)
{
    return sRegionMap->selectedRegion;
}

static u8 GetRegionMapPlayerIsOn(void)
{
    return sRegionMap->playersRegion;
}

static void SetSelectedRegionMap(u8 region)
{
    sRegionMap->selectedRegion = region;
}

// Unused
static void SetRegionMapPlayerIsOn(u8 region)
{
    sRegionMap->playersRegion = region;
}

static void InitSwitchMapMenu(u8 whichMap, u8 taskId, TaskFunc taskFunc)
{
    sSwitchMapMenu = AllocZeroed(sizeof(struct SwitchMapMenu));
    if (FlagGet(FLAG_SYS_SEVII_MAP_4567))
        sSwitchMapMenu->maxSelection = 3;
    else if (FlagGet(FLAG_SYS_SEVII_MAP_123))
        sSwitchMapMenu->maxSelection = 1;
    else
        sSwitchMapMenu->maxSelection = 0;
    sSwitchMapMenu->cursorSubsprite[0].x = 88;
    sSwitchMapMenu->cursorSubsprite[1].x = 152;

    switch (sSwitchMapMenu->maxSelection)
    {
    case 1:
        LZ77UnCompWram(sSwitchMap_KantoSevii123_Tilemap, sSwitchMapMenu->switchMapTilemap);
        sSwitchMapMenu->yOffset = 6;
        break;
    case 2: // never reached
        LZ77UnCompWram(sSwitchMap_KantoSeviiAll2_Tilemap, sSwitchMapMenu->switchMapTilemap);
        sSwitchMapMenu->yOffset = 4;
        break;
    case 3:
    default:
        sSwitchMapMenu->yOffset = 3;
        LZ77UnCompWram(sSwitchMap_KantoSeviiAll_Tilemap, sSwitchMapMenu->switchMapTilemap);
        break;
    }
    LZ77UnCompWram(sSwitchMapMenu_Gfx, sSwitchMapMenu->switchMapTiles);
    sSwitchMapMenu->mainState = 0;
    sSwitchMapMenu->currentSelection = whichMap;
    sSwitchMapMenu->exitTask = taskFunc;
    sSwitchMapMenu->chosenRegion = GetRegionMapPlayerIsOn();
    SaveRegionMapGpuRegs(0);
    PrintTopBarTextRight(gText_RegionMap_AButtonOK);
    gTasks[taskId].func = Task_SwitchMapMenu;
}

static void ResetGpuRegsForSwitchMapMenu(void)
{
    ResetGpuRegs();
    SetBldCnt((BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ) >> 8, BLDCNT_TGT1_BG2, BLDCNT_EFFECT_BLEND);
    SetBldAlpha(16 - sSwitchMapMenu->alpha, sSwitchMapMenu->alpha);
}

static bool8 FadeSwitchMapMenuIn(void)
{
    if (sSwitchMapMenu->alpha < 16)
    {
        SetBldAlpha(16 - sSwitchMapMenu->alpha, sSwitchMapMenu->alpha);
        sSwitchMapMenu->alpha += 2;
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

static bool8 FadeSwitchMapMenuOut(void)
{
    if (sSwitchMapMenu->alpha >= 2)
    {
        sSwitchMapMenu->alpha -= 2;
        SetBldAlpha(16 - sSwitchMapMenu->alpha, sSwitchMapMenu->alpha);
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

static void Task_SwitchMapMenu(u8 taskId)
{
    switch (sSwitchMapMenu->mainState)
    {
    case 0:
        NullVBlankHBlankCallbacks();
        PrintTopBarTextLeft(gText_RegionMap_UpDownPick);
        sSwitchMapMenu->mainState++;
        break;
    case 1:
        LoadBgTiles(2, sSwitchMapMenu->switchMapTiles, sizeof(sSwitchMapMenu->switchMapTiles), 0);
        sSwitchMapMenu->mainState++;
        break;
    case 2:
        LoadSwitchMapTilemap(2, sSwitchMapMenu->switchMapTilemap);
        CopyBgTilemapBufferToVram(2);
        sSwitchMapMenu->mainState++;
        break;
    case 3:
        ClearMapsecNameText();
        sSwitchMapMenu->mainState++;
        break;
    case 4:
        ResetGpuRegsForSwitchMapMenu();
        ShowBg(2);
        sSwitchMapMenu->mainState++;
        break;
    case 5:
        SetRegionMapVBlankCB();
        sSwitchMapMenu->mainState++;
        break;
    case 6:
        if (FadeSwitchMapMenuIn() == TRUE)
        {
            SetGpuRegsToDimScreen();
            sSwitchMapMenu->mainState++;
        }
        break;
    case 7:
        if (DimScreenForSwitchMapMenu() == TRUE)
        {
            sSwitchMapMenu->mainState++;
        }
        break;
    case 8:
        if (CreateSwitchMapCursor() == TRUE)
        {
            sSwitchMapMenu->mainState++;
        }
        break;
    case 9:
        if (HandleSwitchMapInput() == TRUE)
        {
            SetSelectedRegionMap(sSwitchMapMenu->currentSelection);
            if (GetRegionMapPlayerIsOn() == sSwitchMapMenu->currentSelection)
            {
                SetPlayerIconInvisibility(FALSE);
                SetFlyIconInvisibility(sSwitchMapMenu->currentSelection, NELEMS(sMapIcons->flyIcons), FALSE);
                SetDungeonIconInvisibility(sSwitchMapMenu->currentSelection, NELEMS(sMapIcons->dungeonIcons), FALSE);
            }
            sSwitchMapMenu->mainState++;
        }
        break;
    case 10:
        if (BrightenScreenForSwitchMapMenu() == TRUE)
        {
            FreeSwitchMapCursor();
            ResetGpuRegsForSwitchMapMenu();
            sSwitchMapMenu->mainState++;
        }
        break;
    case 11:
        if (FadeSwitchMapMenuOut() == TRUE)
        {
            sSwitchMapMenu->mainState++;
        }
        break;
    case 12:
        SetMapCursorInvisibility(FALSE);
        sSwitchMapMenu->mainState++;
        break;
    default:
        FreeSwitchMapMenu(taskId);
        break;
    }
}

static void FreeSwitchMapMenu(u8 taskId)
{
    gTasks[taskId].func = sSwitchMapMenu->exitTask;
    HideBg(2);
    PrintTopBarTextLeft(gText_RegionMap_DPadMove);
    PrintTopBarTextRight(gText_RegionMap_AButtonSwitch);
    UpdateMapsecNameBox();
    DrawDungeonNameBox();
    SetGpuWindowDims(0, &sMapsecNameWindowDims[CLEAR_NAME]);
    FREE_IF_NOT_NULL(sSwitchMapMenu);
}

static bool8 BrightenScreenForSwitchMapMenu(void)
{
    if (sSwitchMapMenu->blendY != 0)
    {
        sSwitchMapMenu->blendY--;
        SetGpuReg(REG_OFFSET_BLDY, sSwitchMapMenu->blendY);
        return FALSE;
    }
    else
    {
        SetGpuReg(REG_OFFSET_BLDY, 0);
        return TRUE;
    }
}

static void LoadSwitchMapTilemap(u8 bg, u16 *map)
{
    s16 i;
    s16 j;
    u16 *buffer = sRegionMap->bgTilemapBuffers[bg];
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

static void SetGpuRegsToDimScreen(void)
{
    struct GpuWindowParams data;
    data.left = sSwitchMapMenu->highlight.left = 72;
    data.top = sSwitchMapMenu->highlight.top = 8 * (sSwitchMapMenu->yOffset + 4 * sSwitchMapMenu->currentSelection);
    data.right = sSwitchMapMenu->highlight.right = 168;
    data.bottom = sSwitchMapMenu->highlight.bottom = sSwitchMapMenu->highlight.top + 32;
    ResetGpuRegs();
    SetBldCnt(0, (BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_OBJ), BLDCNT_EFFECT_DARKEN);
    SetWinIn((WININ_WIN0_BG_ALL | WININ_WIN0_OBJ), (WININ_WIN1_BG0 | WININ_WIN1_BG2 | WININ_WIN1_OBJ) >> 8);
    SetWinOut(WINOUT_WIN01_BG_ALL | WINOUT_WIN01_OBJ | WINOUT_WIN01_CLR);
    SetDispCnt(1, FALSE);
    SetGpuWindowDims(1, &data);
}

static bool8 DimScreenForSwitchMapMenu(void)
{
    if (sSwitchMapMenu->blendY < 6)
    {
        sSwitchMapMenu->blendY++;
        SetBldY(sSwitchMapMenu->blendY);
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

static bool8 HandleSwitchMapInput(void)
{
    bool8 changedSelection = FALSE;
    struct GpuWindowParams data;
    data.left = sSwitchMapMenu->highlight.left = 72;
    data.top = sSwitchMapMenu->highlight.top = 8 * (sSwitchMapMenu->yOffset + 4 * sSwitchMapMenu->currentSelection);
    data.right = sSwitchMapMenu->highlight.right = 168;
    data.bottom = sSwitchMapMenu->highlight.bottom = sSwitchMapMenu->highlight.top + 32;
    if (JOY_NEW(DPAD_UP) && sSwitchMapMenu->currentSelection != 0)
    {
        PlaySE(SE_BAG_CURSOR);
        sSwitchMapMenu->currentSelection--;
        changedSelection = TRUE;
    }
    if (JOY_NEW(DPAD_DOWN) && sSwitchMapMenu->currentSelection < sSwitchMapMenu->maxSelection)
    {
        PlaySE(SE_BAG_CURSOR);
        sSwitchMapMenu->currentSelection++;
        changedSelection = TRUE;
    }
    if (JOY_NEW(A_BUTTON) && sSwitchMapMenu->blendY == 6)
    {
        PlaySE(SE_M_SWIFT);
        sSwitchMapMenu->chosenRegion = sSwitchMapMenu->currentSelection;
        return TRUE;
    }
    if (JOY_NEW(B_BUTTON))
    {
        sSwitchMapMenu->currentSelection = sSwitchMapMenu->chosenRegion;
        BufferRegionMapBg(0, sRegionMap->layouts[sSwitchMapMenu->currentSelection]);
        CopyBgTilemapBufferToVram(0);
        SetFlyIconInvisibility(0xFF, NELEMS(sMapIcons->flyIcons), TRUE);
        SetDungeonIconInvisibility(0xFF, NELEMS(sMapIcons->dungeonIcons), TRUE);
        return TRUE;
    }
    if (changedSelection)
    {
        BufferRegionMapBg(0, sRegionMap->layouts[sSwitchMapMenu->currentSelection]);
        PrintTopBarTextRight(gText_RegionMap_AButtonOK);
        CopyBgTilemapBufferToVram(0);
        CopyBgTilemapBufferToVram(3);
        SetFlyIconInvisibility(0xFF, NELEMS(sMapIcons->flyIcons), TRUE);
        SetDungeonIconInvisibility(0xFF, NELEMS(sMapIcons->dungeonIcons), TRUE);
        SetFlyIconInvisibility(sSwitchMapMenu->currentSelection, NELEMS(sMapIcons->flyIcons), FALSE);
        SetDungeonIconInvisibility(sSwitchMapMenu->currentSelection, NELEMS(sMapIcons->dungeonIcons), FALSE);
    }
    if (sSwitchMapMenu->currentSelection != GetRegionMapPlayerIsOn())
        SetPlayerIconInvisibility(TRUE);
    else
        SetPlayerIconInvisibility(FALSE);
    SetGpuWindowDims(1, &data);
    return FALSE;
}

static void SpriteCB_SwitchMapCursor(struct Sprite *sprite)
{
    sprite->y = sSwitchMapMenu->highlight.top + 16;
}

static bool8 CreateSwitchMapCursor(void)
{
    switch (sSwitchMapMenu->cursorLoadState)
    {
    case 0:
        LZ77UnCompWram(sSwitchMapCursorLeft_Gfx, sSwitchMapMenu->cursorSubsprite[0].tiles);
        break;
    case 1:
        LZ77UnCompWram(sSwitchMapCursorRight_Gfx, sSwitchMapMenu->cursorSubsprite[1].tiles);
        break;
    case 2:
        CreateSwitchMapCursorSubsprite(0, 2, 2);
        CreateSwitchMapCursorSubsprite(1, 3, 3);
        break;
    default:
        return TRUE;
    }
    sSwitchMapMenu->cursorLoadState++;
    return FALSE;
}

static void CreateSwitchMapCursorSubsprite(u8 whichSprite, u16 tileTag, u16 palTag)
{
    CreateSwitchMapCursorSubsprite_(whichSprite, tileTag, palTag);
}

static void CreateSwitchMapCursorSubsprite_(u8 whichSprite, u16 tileTag, u16 palTag)
{
    u8 spriteId;

    struct SpriteSheet spriteSheet = {
        .data = sSwitchMapMenu->cursorSubsprite[whichSprite].tiles,
        .size = sizeof(sSwitchMapMenu->cursorSubsprite[whichSprite].tiles),
        .tag = tileTag
    };
    struct SpritePalette spritePalette = {
        .data = sSwitchMapCursor_Pal,
        .tag = palTag
    };
    struct SpriteTemplate template = {
        .tileTag = tileTag,
        .paletteTag = palTag,
        .oam = &sOamData_SwitchMapCursor,
        .anims = sAnims_SwitchMapCursor,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_SwitchMapCursor
    };

    sSwitchMapMenu->cursorSubsprite[whichSprite].tileTag = tileTag;
    sSwitchMapMenu->cursorSubsprite[whichSprite].palTag = palTag;

    LoadSpriteSheet(&spriteSheet);
    LoadSpritePalette(&spritePalette);

    spriteId = CreateSprite(&template, sSwitchMapMenu->cursorSubsprite[whichSprite].x, 8 * (sSwitchMapMenu->yOffset + 4 * sSwitchMapMenu->currentSelection), 0);
    sSwitchMapMenu->cursorSubsprite[whichSprite].sprite = &gSprites[spriteId];
    gSprites[spriteId].invisible = FALSE;
}

static void FreeSwitchMapCursor(void)
{
    u8 i;
    for (i = 0; i < NELEMS(sSwitchMapMenu->cursorSubsprite); i++)
    {
        if (sSwitchMapMenu->cursorSubsprite[i].sprite != NULL)
        {
            DestroySprite(sSwitchMapMenu->cursorSubsprite[i].sprite);
            FreeSpriteTilesByTag(sSwitchMapMenu->cursorSubsprite[i].tileTag);
            FreeSpritePaletteByTag(sSwitchMapMenu->cursorSubsprite[i].palTag);
        }
    }
}

static const u8 *GetDungeonFlavorText(u16 mapsec)
{
    u8 i;
    for (i = 0; i < NELEMS(sDungeonInfo); i++)
    {
        if (sDungeonInfo[i].id == mapsec)
            return sDungeonInfo[i].desc;
    }
    return gText_RegionMap_NoData;
}

static const u8 *GetDungeonName(u16 mapsec)
{
    u8 i;
    for (i = 0; i < NELEMS(sDungeonInfo); i++)
    {
        if (sDungeonInfo[i].id == mapsec)
            return sDungeonInfo[i].name;
    }
    return gText_RegionMap_NoData;
}

static void InitDungeonMapPreview(u8 unused, u8 taskId, TaskFunc taskFunc)
{
    u8 mapsec;
    sDungeonMapPreview = AllocZeroed(sizeof(struct DungeonMapPreview));
    mapsec = GetDungeonMapsecUnderCursor();
    if (mapsec == MAPSEC_TANOBY_CHAMBERS)
        mapsec = MAPSEC_MONEAN_CHAMBER;
    sDungeonMapPreview->mapPreviewInfo = GetDungeonMapPreviewScreenInfo(mapsec);
    if (sDungeonMapPreview->mapPreviewInfo == NULL)
        sDungeonMapPreview->mapPreviewInfo = GetDungeonMapPreviewScreenInfo(MAPSEC_ROCK_TUNNEL);
    sDungeonMapPreview->mainState = 0;
    sDungeonMapPreview->loadState = 0;
    sDungeonMapPreview->savedTask = taskFunc;
    sDungeonMapPreview->blendY = 0;
    SaveRegionMapGpuRegs(0);
    ResetGpuRegs();
    ClearMapsecNameText();
    gTasks[taskId].func = Task_DungeonMapPreview;
}

static bool8 LoadMapPreviewGfx(void)
{
    switch (sDungeonMapPreview->loadState)
    {
    case 0:
        LZ77UnCompWram(sDungeonMapPreview->mapPreviewInfo->tilesptr, sDungeonMapPreview->tiles);
        break;
    case 1:
        LZ77UnCompWram(sDungeonMapPreview->mapPreviewInfo->tilemapptr, sDungeonMapPreview->tilemap);
        break;
    case 2:
        LoadBgTiles(2, sDungeonMapPreview->tiles, sizeof(sDungeonMapPreview->tiles), 0);
        break;
    case 3:
        LoadPalette(sDungeonMapPreview->mapPreviewInfo->palptr, BG_PLTT_ID(13), 3 * PLTT_SIZE_4BPP);
        break;
    default:
        return TRUE;
    }
    sDungeonMapPreview->loadState++;
    return FALSE;
}

static void Task_DungeonMapPreview(u8 taskId)
{
    switch (sDungeonMapPreview->mainState)
    {
    case 0:
        NullVBlankHBlankCallbacks();
        sDungeonMapPreview->mainState++;
        break;
    case 1:
        if (LoadMapPreviewGfx() == TRUE)
            sDungeonMapPreview->mainState++;
        break;
    case 2:
        InitScreenForDungeonMapPreview();
        PrintTopBarTextRight(gText_RegionMap_AButtonCancel2);
        sDungeonMapPreview->mainState++;
        break;
    case 3:
        CopyMapPreviewTilemapToBgTilemapBuffer(2, sDungeonMapPreview->tilemap);
        CopyBgTilemapBufferToVram(2);
        sDungeonMapPreview->mainState++;
        break;
    case 4:
        ShowBg(2);
        sDungeonMapPreview->mainState++;
        break;
    case 5:
        SetRegionMapVBlankCB();
        sDungeonMapPreview->mainState++;
        break;
    case 6:
        if (UpdateDungeonMapPreview(FALSE) == TRUE)
            sDungeonMapPreview->mainState++;
        break;
    case 7:
        gTasks[taskId].func = Task_DrawDungeonMapPreviewFlavorText;
        break;
    case 8:
        if (UpdateDungeonMapPreview(TRUE) == TRUE)
        {
            sDungeonMapPreview->mainState++;
        }
        break;
    case 9:
        FreeDungeonMapPreview(taskId);
        sDungeonMapPreview->mainState++;
        break;
    }
}

// Tints the dungeon preview image in the background and overlays the name and description of the dungeon
static void Task_DrawDungeonMapPreviewFlavorText(u8 taskId)
{
    switch (sDungeonMapPreview->drawState)
    {
    case 0:
        sDungeonMapPreview->red = 0x0133;
        sDungeonMapPreview->green = 0x0100;
        sDungeonMapPreview->blue = 0x00F0;
        sDungeonMapPreview->drawState++;
        break;
    case 1:
        // Delay
        if (sDungeonMapPreview->timer++ > 40)
        {
            sDungeonMapPreview->timer = 0;
            sDungeonMapPreview->drawState++;
        }
        break;
    case 2:
        FillWindowPixelBuffer(WIN_MAP_PREVIEW, PIXEL_FILL(0));
        CopyWindowToVram(WIN_MAP_PREVIEW, COPYWIN_FULL);
        PutWindowTilemap(WIN_MAP_PREVIEW);
        sDungeonMapPreview->drawState++;
        break;
    case 3:
        // Draw text
        if (sDungeonMapPreview->timer > 25)
        {
            AddTextPrinterParameterized3(WIN_MAP_PREVIEW, FONT_NORMAL, 4, 0, sTextColor_Green, -1, GetDungeonName(GetDungeonMapsecUnderCursor()));
            AddTextPrinterParameterized3(WIN_MAP_PREVIEW, FONT_NORMAL, 2, 14, sTextColor_White, -1, GetDungeonFlavorText(GetDungeonMapsecUnderCursor()));
            CopyWindowToVram(WIN_MAP_PREVIEW, COPYWIN_FULL);
            sDungeonMapPreview->drawState++;
        }
        // Tint image
        else if (sDungeonMapPreview->timer > 20)
        {
            sDungeonMapPreview->red -= 6;
            sDungeonMapPreview->green -= 5;
            sDungeonMapPreview->blue -= 5;
            CpuCopy16(sDungeonMapPreview->mapPreviewInfo->palptr, sDungeonMapPreview->palette, 0x60);
            TintPalette_CustomTone(sDungeonMapPreview->palette, 48, sDungeonMapPreview->red, sDungeonMapPreview->green, sDungeonMapPreview->blue);
            LoadPalette(sDungeonMapPreview->palette, BG_PLTT_ID(13), sizeof(sDungeonMapPreview->palette));
        }
        sDungeonMapPreview->timer++;
        break;
    case 4:
        if (JOY_NEW(B_BUTTON) || JOY_NEW(A_BUTTON))
        {
            FillWindowPixelBuffer(WIN_MAP_PREVIEW, PIXEL_FILL(0));
            CopyWindowToVram(WIN_MAP_PREVIEW, COPYWIN_FULL);
            sDungeonMapPreview->mainState++;
            sDungeonMapPreview->drawState++;
        }
        break;
    default:
        gTasks[taskId].func = Task_DungeonMapPreview;
        break;
    }
}

static void FreeDungeonMapPreview(u8 taskId)
{
    gTasks[taskId].func = sDungeonMapPreview->savedTask;
    HideBg(2);
    SetRegionMapGpuRegs(0);
    DisplayCurrentMapName();
    DisplayCurrentDungeonName();
    UpdateMapsecNameBox();
    DrawDungeonNameBox();
    PrintTopBarTextRight(gText_RegionMap_AButtonGuide);
    FREE_IF_NOT_NULL(sDungeonMapPreview);
}

static void CopyMapPreviewTilemapToBgTilemapBuffer(u8 bgId, const u16 * tilemap)
{
    CopyToBgTilemapBufferRect(2, tilemap, 0, 0, 32, 20);
}

static void InitScreenForDungeonMapPreview(void)
{
    u16 x;
    u16 y;
    ResetGpuRegs();
    SetBldCnt(0, BLDCNT_TGT1_BG0 | BLDCNT_TGT1_OBJ, BLDCNT_EFFECT_DARKEN);
    SetBldY(sDungeonMapPreview->blendY);
    SetWinIn(0, (WININ_WIN1_BG0 | WININ_WIN1_BG2 | WININ_WIN1_BG3) >> 8);
    SetWinOut(WINOUT_WIN01_BG0 | WINOUT_WIN01_BG1 | WINOUT_WIN01_BG3 | WINOUT_WIN01_OBJ | WINOUT_WIN01_CLR);
    SetDispCnt(1, FALSE);
    x = GetMapCursorX();
    y = GetMapCursorY();
    sDungeonMapPreview->left = 8 * x + 32;
    sDungeonMapPreview->top = 8 * y + 24;
    sDungeonMapPreview->right = sDungeonMapPreview->left + 8;
    sDungeonMapPreview->bottom = sDungeonMapPreview->top + 8;
    sDungeonMapPreview->leftIncrement = (16 - sDungeonMapPreview->left) / 8;
    sDungeonMapPreview->topIncrement = (32 - sDungeonMapPreview->top) / 8;
    sDungeonMapPreview->rightIncrement = (224 - sDungeonMapPreview->right) / 8;
    sDungeonMapPreview->bottomIncrement = (136 - sDungeonMapPreview->bottom) / 8;
}

static bool8 UpdateDungeonMapPreview(bool8 closing)
{
    struct GpuWindowParams data;

    if (!closing)
    {
        if (sDungeonMapPreview->updateCounter < 8)
        {
            sDungeonMapPreview->left += sDungeonMapPreview->leftIncrement;
            sDungeonMapPreview->top += sDungeonMapPreview->topIncrement;
            sDungeonMapPreview->right += sDungeonMapPreview->rightIncrement;
            sDungeonMapPreview->bottom += sDungeonMapPreview->bottomIncrement;
            sDungeonMapPreview->updateCounter++;
            if (sDungeonMapPreview->blendY < 6)
                sDungeonMapPreview->blendY++;
        }
        else
        {
            return TRUE;
        }
    }
    else
    {
        if (sDungeonMapPreview->updateCounter == 0)
        {
            return TRUE;
        }
        else
        {
            sDungeonMapPreview->left -= sDungeonMapPreview->leftIncrement;
            sDungeonMapPreview->top -= sDungeonMapPreview->topIncrement;
            sDungeonMapPreview->right -= sDungeonMapPreview->rightIncrement;
            sDungeonMapPreview->bottom -= sDungeonMapPreview->bottomIncrement;
            sDungeonMapPreview->updateCounter--;
            if (sDungeonMapPreview->blendY > 0)
                sDungeonMapPreview->blendY--;
        }
    }
    data.left = sDungeonMapPreview->left;
    data.top = sDungeonMapPreview->top;
    data.right = sDungeonMapPreview->right;
    data.bottom = sDungeonMapPreview->bottom;
    SetGpuWindowDims(1, &data);
    SetBldY(sDungeonMapPreview->blendY);
    return FALSE;
}

static void SpriteCB_MapEdge(struct Sprite *sprite)
{
}

static void CreateMapEdgeSprite(u8 mapEdgeNum, u8 tileTag, u8 palTag)
{
    u8 spriteId;
    struct SpriteSheet spriteSheet = {
        .data = sMapOpenCloseAnim->mapEdges[mapEdgeNum],
        .size = 0x400,
        .tag = tileTag
    };
    struct SpritePalette spritePalette = {
        .data = sMapEdge_Pal,
        .tag = palTag
    };
    struct SpriteTemplate template = {
        .tileTag = tileTag,
        .paletteTag = palTag,
        .oam = &sOamData_MapEdge,
        .anims = sAnims_MapEdge,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_MapEdge
    };

    sMapOpenCloseAnim->mapEdges[mapEdgeNum]->tileTag = tileTag;
    sMapOpenCloseAnim->mapEdges[mapEdgeNum]->palTag = palTag;
    LoadSpriteSheet(&spriteSheet);
    LoadSpritePalette(&spritePalette);
    spriteId = CreateSprite(&template, sMapOpenCloseAnim->mapEdges[mapEdgeNum]->x, sMapOpenCloseAnim->mapEdges[mapEdgeNum]->y, 0);
    sMapOpenCloseAnim->mapEdges[mapEdgeNum]->sprite = &gSprites[spriteId];
    gSprites[spriteId].invisible = TRUE;
}

static void InitMapOpenAnim(u8 taskId, TaskFunc taskFunc)
{
    u8 i;

    sMapOpenCloseAnim = AllocZeroed(sizeof(struct MapOpenCloseAnim));
    for (i = 0; i < NELEMS(sMapOpenCloseAnim->mapEdges); i++)
    {
        sMapOpenCloseAnim->mapEdges[i] = AllocZeroed(sizeof(struct MapEdge));
        sMapOpenCloseAnim->mapEdges[i]->x = 32 * (i / 3) + 104;
        sMapOpenCloseAnim->mapEdges[i]->y = 64 * (i % 3) + 40;
    }
    SaveRegionMapGpuRegs(0);
    ResetGpuRegs();
    InitScreenForMapOpenAnim();
    SetBg0andBg3Hidden(TRUE);
    sMapOpenCloseAnim->exitTask = taskFunc;
    gTasks[taskId].func = Task_MapOpenAnim;
}

static void SetMapEdgeInvisibility(u8 mapEdgeNum, bool8 invisible)
{
    u8 i;
    if (mapEdgeNum == NELEMS(sMapOpenCloseAnim->mapEdges))
    {
        for (i = 0; i < NELEMS(sMapOpenCloseAnim->mapEdges); i++)
        {
            sMapOpenCloseAnim->mapEdges[i]->sprite->invisible = invisible;
        }
    }
    else
    {
        sMapOpenCloseAnim->mapEdges[mapEdgeNum]->sprite->invisible = invisible;
    }
}

static bool8 LoadMapEdgeGfx(void)
{
    switch (sMapOpenCloseAnim->loadGfxState)
    {
    case 0:
        LZ77UnCompWram(sMapEdge_TopLeft, sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_LEFT]->tiles);
        CreateMapEdgeSprite(MAPEDGE_TOP_LEFT, 4, 4);
        break;
    case 1:
        LZ77UnCompWram(sMapEdge_MidLeft, sMapOpenCloseAnim->mapEdges[MAPEDGE_MID_LEFT]->tiles);
        CreateMapEdgeSprite(MAPEDGE_MID_LEFT, 5, 5);
        break;
    case 2:
        LZ77UnCompWram(sMapEdge_BottomLeft, sMapOpenCloseAnim->mapEdges[MAPEDGE_BOT_LEFT]->tiles);
        CreateMapEdgeSprite(MAPEDGE_BOT_LEFT, 6, 6);
        break;
    case 3:
        LZ77UnCompWram(sMapEdge_TopRight, sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_RIGHT]->tiles);
        CreateMapEdgeSprite(MAPEDGE_TOP_RIGHT, 7, 7);
        break;
    case 4:
        LZ77UnCompWram(sMapEdge_MidRight, sMapOpenCloseAnim->mapEdges[MAPEDGE_MID_RIGHT]->tiles);
        CreateMapEdgeSprite(MAPEDGE_MID_RIGHT, 8, 8);
        break;
    case 5:
        LZ77UnCompWram(sMapEdge_BottomRight, sMapOpenCloseAnim->mapEdges[MAPEDGE_BOT_RIGHT]->tiles);
        CreateMapEdgeSprite(MAPEDGE_BOT_RIGHT, 9, 9);
        break;
    case 6:
        LZ77UnCompWram(sMapEdge_Gfx, sMapOpenCloseAnim->tiles);
        break;
    case 7:
        LZ77UnCompWram(sMapEdge_Tilemap, sMapOpenCloseAnim->tilemap);
        break;
    case 8:
        LoadBgTiles(1, sMapOpenCloseAnim->tiles, BG_SCREEN_SIZE, 0);
        break;
    default:
        return TRUE;
    }
    sMapOpenCloseAnim->loadGfxState++;
    return FALSE;
}

static void InitScreenForMapOpenAnim(void)
{
    struct GpuWindowParams data;
    data.left = sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_LEFT]->x + 8;
    data.top = 16;
    data.right = sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_RIGHT]->x - 8;
    data.bottom = 160;
    SetBldCnt(0, BLDCNT_TGT1_BG1, BLDCNT_EFFECT_NONE);
    SetWinIn((WININ_WIN0_BG1 | WININ_WIN0_OBJ), 0);
    SetWinOut(WINOUT_WIN01_OBJ);
    SetGpuWindowDims(0, &data);
    SetDispCnt(0, FALSE);
}

static void SetGpuRegsToFadeMapToWhite(void)
{
    struct GpuWindowParams data = sMapWindowDim;
    ResetGpuRegs();
    SetBldCnt(BLDCNT_TGT2_BG1 >> 8, (BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG3 | BLDCNT_TGT1_BD), BLDCNT_EFFECT_LIGHTEN);
    SetBldY(sMapOpenCloseAnim->blendY);
    SetWinIn((WININ_WIN0_ALL & ~WININ_WIN0_BG3), 0);
    SetWinOut(WINOUT_WIN01_BG1 | WINOUT_WIN01_OBJ);
    SetGpuWindowDims(0, &data);
    SetDispCnt(0, FALSE);
}

static void FinishMapOpenAnim(u8 taskId)
{
    gTasks[taskId].func = sMapOpenCloseAnim->exitTask;
}

static void FreeMapOpenCloseAnim(void)
{
    u8 i;
    FreeMapEdgeSprites();
    for (i = 0; i < NELEMS(sMapOpenCloseAnim->mapEdges); i++)
    {
        FREE_IF_NOT_NULL(sMapOpenCloseAnim->mapEdges[i]);
    }
    FREE_IF_NOT_NULL(sMapOpenCloseAnim);
}

static void FreeMapEdgeSprites(void)
{
    u8 i;
    for (i = 0; i < NELEMS(sMapOpenCloseAnim->mapEdges); i++)
    {
        sMapOpenCloseAnim->mapEdges[i]->x = sMapOpenCloseAnim->mapEdges[i]->sprite->x;
        sMapOpenCloseAnim->mapEdges[i]->y = sMapOpenCloseAnim->mapEdges[i]->sprite->y;
        if (sMapOpenCloseAnim->mapEdges[i]->sprite != NULL)
        {
            DestroySprite(sMapOpenCloseAnim->mapEdges[i]->sprite);
            FreeSpriteTilesByTag(sMapOpenCloseAnim->mapEdges[i]->tileTag);
            FreeSpritePaletteByTag(sMapOpenCloseAnim->mapEdges[i]->palTag);
        }
    }
}

static void Task_MapOpenAnim(u8 taskId)
{
    switch (sMapOpenCloseAnim->openState)
    {
    case 0:
        NullVBlankHBlankCallbacks();
        sMapOpenCloseAnim->openState++;
        break;
    case 1:
        if (LoadMapEdgeGfx() == TRUE)
            sMapOpenCloseAnim->openState++;
        break;
    case 2:
        CopyToBgTilemapBufferRect(1, sMapOpenCloseAnim->tilemap, 0, 0, 30, 20);
        sMapOpenCloseAnim->openState++;
        break;
    case 3:
        CopyBgTilemapBufferToVram(1);
        BlendPalettes(PALETTES_ALL, 16, RGB_BLACK);
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        SetRegionMapVBlankCB();
        sMapOpenCloseAnim->openState++;
        break;
    case 4:
        ShowBg(0);
        ShowBg(3);
        ShowBg(1);
        SetMapEdgeInvisibility(NELEMS(sMapOpenCloseAnim->mapEdges), FALSE);
        SetGpuWindowDimsToMapEdges();
        sMapOpenCloseAnim->openState++;
        break;
    case 5:
        if (!gPaletteFade.active)
        {
            sMapOpenCloseAnim->openState++;
            PlaySE(SE_CARD_OPEN);
        }
        break;
    case 6:
        if (MoveMapEdgesOutward() == TRUE)
            sMapOpenCloseAnim->openState++;
        break;
    case 7:
        SetPlayerIconInvisibility(FALSE);
        SetMapCursorInvisibility(FALSE);
        sMapOpenCloseAnim->openState++;
        break;
    case 8:
        sMapOpenCloseAnim->blendY = 15;
        SetGpuRegsToFadeMapToWhite();
        SetBg0andBg3Hidden(FALSE);
        SetFlyIconInvisibility(GetSelectedRegionMap(), NELEMS(sMapIcons->flyIcons), FALSE);
        SetDungeonIconInvisibility(GetSelectedRegionMap(), NELEMS(sMapIcons->dungeonIcons), FALSE);
        sMapOpenCloseAnim->openState++;
        break;
    case 9:
        PrintTopBarTextLeft(gText_RegionMap_DPadMove);
        if (GetSelectedMapsecType(LAYER_DUNGEON) != MAPSECTYPE_VISITED)
            PrintTopBarTextRight(gText_RegionMap_Space);
        else
            PrintTopBarTextRight(gText_RegionMap_AButtonGuide);
        ClearOrDrawTopBar(FALSE);
        sMapOpenCloseAnim->openState++;
        break;
    case 10:
        LoadPalette(&sTopBar_Pal[15], BG_PLTT_ID(0), sizeof(sTopBar_Pal[15]));
        LoadPalette(&sTopBar_Pal[15], BG_PLTT_ID(1), sizeof(sTopBar_Pal[15]));
        LoadPalette(&sTopBar_Pal[15], BG_PLTT_ID(2), sizeof(sTopBar_Pal[15]));
        LoadPalette(&sTopBar_Pal[15], BG_PLTT_ID(3), sizeof(sTopBar_Pal[15]));
        LoadPalette(&sTopBar_Pal[15], BG_PLTT_ID(4), sizeof(sTopBar_Pal[15]));
        sMapOpenCloseAnim->openState++;
        break;
    case 11:
        FillBgTilemapBufferRect(1, 0x002, 0, 1, 1, 1, 2);
        FillBgTilemapBufferRect(1, 0x003, 1, 1, 1, 1, 2);
        FillBgTilemapBufferRect(1, 0x03E, 28, 1, 1, 1, 2);
        FillBgTilemapBufferRect(1, 0x03F, 29, 1, 1, 1, 2);
        FillBgTilemapBufferRect(1, 0x03D, 2, 1, 26, 1, 2);
        CopyBgTilemapBufferToVram(1);
        m4aSongNumStop(SE_CARD_OPEN);
        PlaySE(SE_ROTATING_GATE);
        sMapOpenCloseAnim->openState++;
        break;
    case 12:
        if (sMapOpenCloseAnim->blendY == 2)
        {
            SetMapEdgeInvisibility(NELEMS(sMapOpenCloseAnim->mapEdges), TRUE);
            sMapOpenCloseAnim->openState++;
            SetBldY(0);
        }
        else
        {
            sMapOpenCloseAnim->blendY--;
            SetBldY(sMapOpenCloseAnim->blendY);
        }
        break;
    case 13:
        SetRegionMapGpuRegs(0);
        DisplayCurrentDungeonName();
        sMapOpenCloseAnim->openState++;
        break;
    default:
        FreeMapEdgeSprites();
        FinishMapOpenAnim(taskId);
        break;
    }
}

static bool8 MoveMapEdgesOutward(void)
{
    SetGpuWindowDimsToMapEdges();
    if (sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_LEFT]->sprite->x == 0)
    {
        return TRUE;
    }
    else if (sMapOpenCloseAnim->moveState > 17)
    {
        sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_LEFT]->sprite->x -= 1;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_MID_LEFT]->sprite->x -= 1;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_BOT_LEFT]->sprite->x -= 1;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_RIGHT]->sprite->x += 1;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_MID_RIGHT]->sprite->x += 1;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_BOT_RIGHT]->sprite->x += 1;
    }
    else if (sMapOpenCloseAnim->moveState > 14)
    {
        sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_LEFT]->sprite->x -= 2;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_MID_LEFT]->sprite->x -= 2;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_BOT_LEFT]->sprite->x -= 2;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_RIGHT]->sprite->x += 2;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_MID_RIGHT]->sprite->x += 2;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_BOT_RIGHT]->sprite->x += 2;
    }
    else if (sMapOpenCloseAnim->moveState > 10)
    {
        sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_LEFT]->sprite->x -= 3;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_MID_LEFT]->sprite->x -= 3;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_BOT_LEFT]->sprite->x -= 3;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_RIGHT]->sprite->x += 3;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_MID_RIGHT]->sprite->x += 3;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_BOT_RIGHT]->sprite->x += 3;
    }
    else if (sMapOpenCloseAnim->moveState > 6)
    {
        sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_LEFT]->sprite->x -= 5;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_MID_LEFT]->sprite->x -= 5;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_BOT_LEFT]->sprite->x -= 5;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_RIGHT]->sprite->x += 5;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_MID_RIGHT]->sprite->x += 5;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_BOT_RIGHT]->sprite->x += 5;
    }
    else
    {
        sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_LEFT]->sprite->x -= 8;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_MID_LEFT]->sprite->x -= 8;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_BOT_LEFT]->sprite->x -= 8;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_RIGHT]->sprite->x += 8;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_MID_RIGHT]->sprite->x += 8;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_BOT_RIGHT]->sprite->x += 8;
    }
    sMapOpenCloseAnim->moveState++;
    return FALSE;
}

static void SetGpuWindowDimsToMapEdges(void)
{
    struct GpuWindowParams data;
    data.left = sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_LEFT]->sprite->x;
    data.top = 16;
    data.right = sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_RIGHT]->sprite->x;
    data.bottom = 160;
    SetGpuWindowDims(0, &data);
}

static void InitScreenForMapCloseAnim(void)
{
    struct GpuWindowParams data;
    data.left = sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_LEFT]->x + 16;
    data.top = 16;
    data.right = sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_RIGHT]->x - 16;
    data.bottom = 160;
    SetBldCnt(0, BLDCNT_TGT1_BG1, BLDCNT_EFFECT_NONE);
    SetWinIn((WININ_WIN0_BG1 | WININ_WIN0_OBJ), 0);
    SetWinOut(WINOUT_WIN01_OBJ);
    SetGpuWindowDims(0, &data);
    SetDispCnt(0, FALSE);
}

static void DoMapCloseAnim(u8 taskId)
{
    gTasks[taskId].func = Task_MapCloseAnim;
}

static void CreateMapEdgeSprites(void)
{
    CreateMapEdgeSprite(0, 4, 4);
    CreateMapEdgeSprite(1, 5, 5);
    CreateMapEdgeSprite(2, 6, 6);
    CreateMapEdgeSprite(3, 7, 7);
    CreateMapEdgeSprite(4, 8, 8);
    CreateMapEdgeSprite(5, 9, 9);
}

static void Task_MapCloseAnim(u8 taskId)
{
    switch (sMapOpenCloseAnim->closeState)
    {
    case 0:
        ClearOrDrawTopBar(TRUE);
        CopyWindowToVram(WIN_TOPBAR_LEFT, COPYWIN_FULL);
        CopyWindowToVram(WIN_TOPBAR_RIGHT, COPYWIN_FULL);
        sMapOpenCloseAnim->closeState++;
        break;
    case 1:
        CreateMapEdgeSprites();
        sMapOpenCloseAnim->closeState++;
        break;
    case 2:
        LoadPalette(sRegionMap_Pal, BG_PLTT_ID(0), sizeof(sRegionMap_Pal));
        sMapOpenCloseAnim->closeState++;
        break;
    case 3:
        SetMapEdgeInvisibility(NELEMS(sMapOpenCloseAnim->mapEdges), FALSE);
        SetPlayerIconInvisibility(TRUE);
        SetMapCursorInvisibility(TRUE);
        SetDungeonIconInvisibility(0xFF, NELEMS(sMapIcons->dungeonIcons), TRUE);
        SetFlyIconInvisibility(0xFF, NELEMS(sMapIcons->flyIcons), TRUE);
        sMapOpenCloseAnim->moveState = 0;
        sMapOpenCloseAnim->blendY = 0;
        sMapOpenCloseAnim->closeState++;
        break;
    case 4:
        SetGpuRegsToFadeMapToWhite();
        sMapOpenCloseAnim->closeState++;
        break;
    case 5:
        if (sMapOpenCloseAnim->blendY == 15)
        {
            SetBldY(sMapOpenCloseAnim->blendY);
            sMapOpenCloseAnim->closeState++;
        }
        else
        {
            sMapOpenCloseAnim->blendY++;
            SetBldY(sMapOpenCloseAnim->blendY);
        }
        break;
    case 6:
        InitScreenForMapCloseAnim();
        SetGpuWindowDimsToMapEdges();
        PlaySE(SE_CARD_FLIPPING);
        sMapOpenCloseAnim->closeState++;
        break;
    case 7:
        if (MoveMapEdgesInward() == TRUE)
            sMapOpenCloseAnim->closeState++;
        break;
    default:
        gTasks[taskId].func = sMapOpenCloseAnim->exitTask;
        break;
    }
}


static bool8 MoveMapEdgesInward(void)
{
    SetGpuWindowDimsToMapEdges();
    if (sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_LEFT]->sprite->x == 104)
    {
        return TRUE;
    }
    else if (sMapOpenCloseAnim->moveState > 17)
    {
        sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_LEFT]->sprite->x += 1;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_MID_LEFT]->sprite->x += 1;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_BOT_LEFT]->sprite->x += 1;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_RIGHT]->sprite->x -= 1;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_MID_RIGHT]->sprite->x -= 1;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_BOT_RIGHT]->sprite->x -= 1;
    }
    else if (sMapOpenCloseAnim->moveState > 14)
    {
        sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_LEFT]->sprite->x += 2;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_MID_LEFT]->sprite->x += 2;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_BOT_LEFT]->sprite->x += 2;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_RIGHT]->sprite->x -= 2;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_MID_RIGHT]->sprite->x -= 2;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_BOT_RIGHT]->sprite->x -= 2;
    }
    else if (sMapOpenCloseAnim->moveState > 10)
    {
        sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_LEFT]->sprite->x += 3;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_MID_LEFT]->sprite->x += 3;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_BOT_LEFT]->sprite->x += 3;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_RIGHT]->sprite->x -= 3;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_MID_RIGHT]->sprite->x -= 3;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_BOT_RIGHT]->sprite->x -= 3;
    }
    else if (sMapOpenCloseAnim->moveState > 6)
    {
        sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_LEFT]->sprite->x += 5;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_MID_LEFT]->sprite->x += 5;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_BOT_LEFT]->sprite->x += 5;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_RIGHT]->sprite->x -= 5;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_MID_RIGHT]->sprite->x -= 5;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_BOT_RIGHT]->sprite->x -= 5;
    }
    else
    {
        sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_LEFT]->sprite->x += 8;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_MID_LEFT]->sprite->x += 8;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_BOT_LEFT]->sprite->x += 8;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_TOP_RIGHT]->sprite->x -= 8;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_MID_RIGHT]->sprite->x -= 8;
        sMapOpenCloseAnim->mapEdges[MAPEDGE_BOT_RIGHT]->sprite->x -= 8;
    }
    sMapOpenCloseAnim->moveState++;
    return FALSE;
}

static void SpriteCB_MapCursor(struct Sprite *sprite)
{
    if (sMapCursor->moveCounter != 0)
    {
        sprite->x += sMapCursor->horizontalMove;
        sprite->y += sMapCursor->verticalMove;
        sMapCursor->moveCounter--;
    }
    else
    {
        sMapCursor->sprite->x = 8 * sMapCursor->x + 36;
        sMapCursor->sprite->y = 8 * sMapCursor->y + 36;
    }
}

static void CreateMapCursor(u16 tileTag, u16 palTag)
{
    sMapCursor = AllocZeroed(sizeof(struct MapCursor));
    LZ77UnCompWram(sMapCursor_Gfx, sMapCursor->tiles);
    sMapCursor->tileTag = tileTag;
    sMapCursor->palTag = palTag;
    GetPlayerPositionOnRegionMap_HandleOverrides();
    sMapCursor->spriteX = 8 * sMapCursor->x + 36;
    sMapCursor->spriteY = 8 * sMapCursor->y + 36;
    sMapCursor->inputHandler = HandleRegionMapInput;
    sMapCursor->selectedMapsecType = GetMapsecType(sMapCursor->selectedMapsec);
    sMapCursor->selectedDungeonType = GetDungeonMapsecType(GetSelectedMapSection(GetSelectedRegionMap(), LAYER_DUNGEON, sMapCursor->y, sMapCursor->x));
    CreateMapCursorSprite();
}

static void CreateMapCursorSprite(void)
{
    u8 spriteId;
    struct SpriteSheet spriteSheet = {
        .data = sMapCursor->tiles,
        .size = sizeof(sMapCursor->tiles),
        .tag = sMapCursor->tileTag
    };
    struct SpritePalette spritePalette = {
        .data = sMapCursor_Pal,
        .tag = sMapCursor->palTag
    };
    struct SpriteTemplate template = {
        .tileTag = sMapCursor->tileTag,
        .paletteTag = sMapCursor->palTag,
        .oam = &sOamData_MapCursor,
        .anims = sAnims_MapCursor,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCB_MapCursor
    };

    LoadSpriteSheet(&spriteSheet);
    LoadSpritePalette(&spritePalette);
    spriteId = CreateSprite(&template, sMapCursor->spriteX, sMapCursor->spriteY, 0);
    sMapCursor->sprite = &gSprites[spriteId];
    SetMapCursorInvisibility(TRUE);
}

static void SetMapCursorInvisibility(bool8 invisibile)
{
    sMapCursor->sprite->invisible = invisibile;
}

static void ResetCursorSnap(void)
{
    sMapCursor->snapId = 0;
}

static void FreeMapCursor(void)
{
    if (sMapCursor->sprite != NULL)
    {
        DestroySprite(sMapCursor->sprite);
        FreeSpriteTilesByTag(sMapCursor->tileTag);
        FreeSpritePaletteByTag(sMapCursor->palTag);
    }
    FREE_IF_NOT_NULL(sMapCursor);
}

static u8 HandleRegionMapInput(void)
{
    u8 input = MAP_INPUT_NONE;
    sMapCursor->horizontalMove = 0;
    sMapCursor->verticalMove = 0;

    if (JOY_HELD(DPAD_UP))
    {
        if (sMapCursor->y > 0)
        {
            sMapCursor->verticalMove = -2;
            input = MAP_INPUT_MOVE_START;
        }
    }
    if (JOY_HELD(DPAD_DOWN))
    {
        if (sMapCursor->y < MAP_HEIGHT - 1)
        {
            sMapCursor->verticalMove = 2;
            input = MAP_INPUT_MOVE_START;
        }
    }
    if (JOY_HELD(DPAD_RIGHT))
    {
        if (sMapCursor->x < MAP_WIDTH - 1)
        {
            sMapCursor->horizontalMove = 2;
            input = MAP_INPUT_MOVE_START;
        }
    }
    if (JOY_HELD(DPAD_LEFT))
    {
        if (sMapCursor->x > 0)
        {
            sMapCursor->horizontalMove = -2;
            input = MAP_INPUT_MOVE_START;
        }
    }
    if (JOY_NEW(A_BUTTON))
    {
        input = MAP_INPUT_A_BUTTON;
        if (sMapCursor->x == CANCEL_BUTTON_X 
         && sMapCursor->y == CANCEL_BUTTON_Y)
        {
            PlaySE(SE_M_HYPER_BEAM2);
            input = MAP_INPUT_CANCEL;
        }
        if (sMapCursor->x == SWITCH_BUTTON_X 
         && sMapCursor->y == SWITCH_BUTTON_Y 
         && GetRegionMapPermission(MAPPERM_HAS_SWITCH_BUTTON) == TRUE)
        {
            PlaySE(SE_M_HYPER_BEAM2);
            input = MAP_INPUT_SWITCH;
        }
    }
    else if (!JOY_NEW(B_BUTTON))
    {
        if (JOY_REPT(START_BUTTON))
        {
            SnapToIconOrButton();
            sMapCursor->selectedMapsec = GetSelectedMapSection(GetSelectedRegionMap(), LAYER_MAP, sMapCursor->y, sMapCursor->x);
            sMapCursor->selectedMapsecType = GetMapsecType(sMapCursor->selectedMapsec);
            sMapCursor->selectedDungeonType = GetDungeonMapsecType(GetSelectedMapSection(GetSelectedRegionMap(), LAYER_DUNGEON, sMapCursor->y, sMapCursor->x));
            return MAP_INPUT_MOVE_END;
        }
        else if (JOY_NEW(SELECT_BUTTON) && sRegionMap->savedCallback == CB2_ReturnToField)
        {
            input = MAP_INPUT_CANCEL;
        }
    }
    else
    {
        input = MAP_INPUT_CANCEL;
    }
    if (input == MAP_INPUT_MOVE_START)
    {
        sMapCursor->moveCounter = 4;
        sMapCursor->inputHandler = MoveMapCursor;
    }
    return input;
}

static u8 MoveMapCursor(void)
{
    if (sMapCursor->moveCounter != 0)
        return MAP_INPUT_MOVE_CONT;
    if (sMapCursor->horizontalMove > 0)
        sMapCursor->x++;
    if (sMapCursor->horizontalMove < 0)
        sMapCursor->x--;
    if (sMapCursor->verticalMove > 0)
        sMapCursor->y++;
    if (sMapCursor->verticalMove < 0)
        sMapCursor->y--;
    sMapCursor->selectedMapsec = GetSelectedMapSection(GetSelectedRegionMap(), LAYER_MAP, sMapCursor->y, sMapCursor->x);
    sMapCursor->selectedMapsecType = GetMapsecType(sMapCursor->selectedMapsec);
    sMapCursor->selectedDungeonType = GetDungeonMapsecType(GetSelectedMapSection(GetSelectedRegionMap(), LAYER_DUNGEON, sMapCursor->y, sMapCursor->x));
    sMapCursor->inputHandler = HandleRegionMapInput;
    return MAP_INPUT_MOVE_END;
}

static u8 GetRegionMapInput(void)
{
    return sMapCursor->inputHandler();
}

// Pressing Start on the map snaps the cursor to the Buttons / Player Icon
// Pressing repeatedly cycles between them
static void SnapToIconOrButton(void)
{
    if (GetRegionMapPermission(MAPPERM_HAS_SWITCH_BUTTON) == TRUE)
    {
        sMapCursor->snapId++;
        sMapCursor->snapId %= 3;
        if (sMapCursor->snapId == 0 && GetSelectedRegionMap() != GetRegionMapPlayerIsOn())
        {
            // Player icon not present on this map, skip it
            sMapCursor->snapId++;
        }
        switch (sMapCursor->snapId)
        {
        case 0:
        default:
            sMapCursor->x = GetPlayerIconX();
            sMapCursor->y = GetPlayerIconY();
            break;
        case 1:
            sMapCursor->x = SWITCH_BUTTON_X;
            sMapCursor->y = SWITCH_BUTTON_Y;
            break;
        case 2:
            sMapCursor->y = CANCEL_BUTTON_Y;
            sMapCursor->x = CANCEL_BUTTON_X;
            break;
        }
    }
    else
    {
        sMapCursor->snapId++;
        sMapCursor->snapId %= 2;
        switch (sMapCursor->snapId)
        {
        case 0:
        default:
            sMapCursor->x = GetPlayerIconX();
            sMapCursor->y = GetPlayerIconY();
            break;
        case 1:
            sMapCursor->y = CANCEL_BUTTON_Y;
            sMapCursor->x = CANCEL_BUTTON_X;
            break;
        }
    }
    sMapCursor->sprite->x = 8 * sMapCursor->x + 36;
    sMapCursor->sprite->y = 8 * sMapCursor->y + 36;
    sMapCursor->selectedMapsec = GetSelectedMapSection(GetSelectedRegionMap(), LAYER_MAP, sMapCursor->y, sMapCursor->x);
}

static u16 GetMapCursorX(void)
{
    return sMapCursor->x;
}

static u16 GetMapCursorY(void)
{
    return sMapCursor->y;
}

static u16 GetMapsecUnderCursor(void)
{
    u8 mapsec;
    if (sMapCursor->y < 0
     || sMapCursor->y >= MAP_HEIGHT
     || sMapCursor->x < 0
     || sMapCursor->x >= MAP_WIDTH)
        return MAPSEC_NONE;

    mapsec = GetSelectedMapSection(GetSelectedRegionMap(), LAYER_MAP, sMapCursor->y, sMapCursor->x);
    if ((mapsec == MAPSEC_NAVEL_ROCK || mapsec == MAPSEC_BIRTH_ISLAND) && !FlagGet(FLAG_WORLD_MAP_NAVEL_ROCK_EXTERIOR))
        mapsec = MAPSEC_NONE;
    return mapsec;
}

static u16 GetDungeonMapsecUnderCursor(void)
{
    u8 mapsec;
    if (sMapCursor->y < 0
     || sMapCursor->y >= MAP_HEIGHT
     || sMapCursor->x < 0
     || sMapCursor->x >= MAP_WIDTH)
        return MAPSEC_NONE;

    mapsec = GetSelectedMapSection(GetSelectedRegionMap(), LAYER_DUNGEON, sMapCursor->y, sMapCursor->x);
    if (mapsec == MAPSEC_CERULEAN_CAVE && !FlagGet(FLAG_SYS_CAN_LINK_WITH_RS))
        mapsec = MAPSEC_NONE;
    return mapsec;
}

static u8 GetMapsecType(u8 mapsec)
{
    switch (mapsec)
    {
    case MAPSEC_PALLET_TOWN:
        return FlagGet(FLAG_WORLD_MAP_PALLET_TOWN) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_VIRIDIAN_CITY:
        return FlagGet(FLAG_WORLD_MAP_VIRIDIAN_CITY) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_PEWTER_CITY:
        return FlagGet(FLAG_WORLD_MAP_PEWTER_CITY) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_CERULEAN_CITY:
        return FlagGet(FLAG_WORLD_MAP_CERULEAN_CITY) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_LAVENDER_TOWN:
        return FlagGet(FLAG_WORLD_MAP_LAVENDER_TOWN) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_VERMILION_CITY:
        return FlagGet(FLAG_WORLD_MAP_VERMILION_CITY) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_CELADON_CITY:
        return FlagGet(FLAG_WORLD_MAP_CELADON_CITY) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_FUCHSIA_CITY:
        return FlagGet(FLAG_WORLD_MAP_FUCHSIA_CITY) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_CINNABAR_ISLAND:
        return FlagGet(FLAG_WORLD_MAP_CINNABAR_ISLAND) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_INDIGO_PLATEAU:
        return FlagGet(FLAG_WORLD_MAP_INDIGO_PLATEAU_EXTERIOR) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_SAFFRON_CITY:
        return FlagGet(FLAG_WORLD_MAP_SAFFRON_CITY) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_ONE_ISLAND:
        return FlagGet(FLAG_WORLD_MAP_ONE_ISLAND) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_TWO_ISLAND:
        return FlagGet(FLAG_WORLD_MAP_TWO_ISLAND) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_THREE_ISLAND:
        return FlagGet(FLAG_WORLD_MAP_THREE_ISLAND) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_FOUR_ISLAND:
        return FlagGet(FLAG_WORLD_MAP_FOUR_ISLAND) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_FIVE_ISLAND:
        return FlagGet(FLAG_WORLD_MAP_FIVE_ISLAND) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_SEVEN_ISLAND:
        return FlagGet(FLAG_WORLD_MAP_SEVEN_ISLAND) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_SIX_ISLAND:
        return FlagGet(FLAG_WORLD_MAP_SIX_ISLAND) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_ROUTE_4_POKECENTER:
        if (!GetRegionMapPermission(MAPPERM_HAS_FLY_DESTINATIONS))
            return MAPSECTYPE_NONE;
        return FlagGet(FLAG_WORLD_MAP_ROUTE4_POKEMON_CENTER_1F) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_ROUTE_10_POKECENTER:
        return FlagGet(FLAG_WORLD_MAP_ROUTE10_POKEMON_CENTER_1F) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_NONE:
        return MAPSECTYPE_NONE;
    default:
        return MAPSECTYPE_ROUTE;
    }
}

static u8 GetDungeonMapsecType(u8 mapsec)
{
    switch (mapsec)
    {
    case MAPSEC_NONE:
        return MAPSECTYPE_NONE;
    case MAPSEC_VIRIDIAN_FOREST:
        return FlagGet(FLAG_WORLD_MAP_VIRIDIAN_FOREST) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_MT_MOON:
        return FlagGet(FLAG_WORLD_MAP_MT_MOON_1F) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_S_S_ANNE:
        return FlagGet(FLAG_WORLD_MAP_SSANNE_EXTERIOR) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_UNDERGROUND_PATH:
        return FlagGet(FLAG_WORLD_MAP_UNDERGROUND_PATH_NORTH_SOUTH_TUNNEL) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_UNDERGROUND_PATH_2:
        return FlagGet(FLAG_WORLD_MAP_UNDERGROUND_PATH_EAST_WEST_TUNNEL) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_DIGLETTS_CAVE:
        return FlagGet(FLAG_WORLD_MAP_DIGLETTS_CAVE_B1F) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_KANTO_VICTORY_ROAD:
        return FlagGet(FLAG_WORLD_MAP_VICTORY_ROAD_1F) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_ROCKET_HIDEOUT:
        return FlagGet(FLAG_WORLD_MAP_ROCKET_HIDEOUT_B1F) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_SILPH_CO:
        return FlagGet(FLAG_WORLD_MAP_SILPH_CO_1F) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_POKEMON_MANSION:
        return FlagGet(FLAG_WORLD_MAP_POKEMON_MANSION_1F) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_KANTO_SAFARI_ZONE:
        return FlagGet(FLAG_WORLD_MAP_SAFARI_ZONE_CENTER) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_POKEMON_LEAGUE:
        return FlagGet(FLAG_WORLD_MAP_POKEMON_LEAGUE_LORELEIS_ROOM) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_ROCK_TUNNEL:
        return FlagGet(FLAG_WORLD_MAP_ROCK_TUNNEL_1F) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_SEAFOAM_ISLANDS:
        return FlagGet(FLAG_WORLD_MAP_SEAFOAM_ISLANDS_1F) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_POKEMON_TOWER:
        return FlagGet(FLAG_WORLD_MAP_POKEMON_TOWER_1F) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_CERULEAN_CAVE:
        return FlagGet(FLAG_WORLD_MAP_CERULEAN_CAVE_1F) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_POWER_PLANT:
        return FlagGet(FLAG_WORLD_MAP_POWER_PLANT) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_NAVEL_ROCK:
        return FlagGet(FLAG_WORLD_MAP_NAVEL_ROCK_EXTERIOR) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_MT_EMBER:
        return FlagGet(FLAG_WORLD_MAP_MT_EMBER_EXTERIOR) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_BERRY_FOREST:
        return FlagGet(FLAG_WORLD_MAP_THREE_ISLAND_BERRY_FOREST) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_ICEFALL_CAVE:
        return FlagGet(FLAG_WORLD_MAP_FOUR_ISLAND_ICEFALL_CAVE_ENTRANCE) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_ROCKET_WAREHOUSE:
        return FlagGet(FLAG_WORLD_MAP_FIVE_ISLAND_ROCKET_WAREHOUSE) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_TRAINER_TOWER_2:
        return FlagGet(FLAG_WORLD_MAP_TRAINER_TOWER_LOBBY) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_DOTTED_HOLE:
        return FlagGet(FLAG_WORLD_MAP_SIX_ISLAND_DOTTED_HOLE_1F) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_LOST_CAVE:
        return FlagGet(FLAG_WORLD_MAP_FIVE_ISLAND_LOST_CAVE_ENTRANCE) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_PATTERN_BUSH:
        return FlagGet(FLAG_WORLD_MAP_SIX_ISLAND_PATTERN_BUSH) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_ALTERING_CAVE:
        return FlagGet(FLAG_WORLD_MAP_SIX_ISLAND_ALTERING_CAVE) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_TANOBY_CHAMBERS:
        return FlagGet(FLAG_WORLD_MAP_SEVEN_ISLAND_TANOBY_RUINS_MONEAN_CHAMBER) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_THREE_ISLE_PATH:
        return FlagGet(FLAG_WORLD_MAP_THREE_ISLAND_DUNSPARCE_TUNNEL) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_TANOBY_KEY:
        return FlagGet(FLAG_WORLD_MAP_SEVEN_ISLAND_SEVAULT_CANYON_TANOBY_KEY) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    case MAPSEC_BIRTH_ISLAND:
        return FlagGet(FLAG_WORLD_MAP_BIRTH_ISLAND_EXTERIOR) ? MAPSECTYPE_VISITED : MAPSECTYPE_NOT_VISITED;
    default:
        return MAPSECTYPE_ROUTE;
    }
}

static u8 GetSelectedMapsecType(u8 layer)
{
    switch (layer)
    {
    default:
        return sMapCursor->selectedMapsecType;
    case LAYER_MAP:
        return sMapCursor->selectedMapsecType;
    case LAYER_DUNGEON:
        return sMapCursor->selectedDungeonType;
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

    const struct MapHeader * mapHeader;
    struct WarpData * warp;

    switch (GetMapTypeByGroupAndId(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum))
    {
    default:
    case MAP_TYPE_TOWN:
    case MAP_TYPE_CITY:
    case MAP_TYPE_ROUTE:
    case MAP_TYPE_UNDERWATER:
    case MAP_TYPE_OCEAN_ROUTE:
        sMapCursor->selectedMapsec = gMapHeader.regionMapSectionId;
        width = gMapHeader.mapLayout->width;
        height = gMapHeader.mapLayout->height;
        x = gSaveBlock1Ptr->pos.x;
        y = gSaveBlock1Ptr->pos.y;
        break;
    case MAP_TYPE_UNDERGROUND:
    case MAP_TYPE_UNKNOWN:
        mapHeader = Overworld_GetMapHeaderByGroupAndId(gSaveBlock1Ptr->escapeWarp.mapGroup, gSaveBlock1Ptr->escapeWarp.mapNum);
        sMapCursor->selectedMapsec = mapHeader->regionMapSectionId;
        width = mapHeader->mapLayout->width;
        height = mapHeader->mapLayout->height;
        x = gSaveBlock1Ptr->escapeWarp.x;
        y = gSaveBlock1Ptr->escapeWarp.y;
        break;
    case MAP_TYPE_SECRET_BASE:
        mapHeader = Overworld_GetMapHeaderByGroupAndId(gSaveBlock1Ptr->dynamicWarp.mapGroup, gSaveBlock1Ptr->dynamicWarp.mapNum);
        sMapCursor->selectedMapsec = mapHeader->regionMapSectionId;
        width = mapHeader->mapLayout->width;
        height = mapHeader->mapLayout->height;
        x = gSaveBlock1Ptr->dynamicWarp.x;
        y = gSaveBlock1Ptr->dynamicWarp.y;
        break;
    case MAP_TYPE_INDOOR:
        if ((sMapCursor->selectedMapsec = gMapHeader.regionMapSectionId) != MAPSEC_SPECIAL_AREA)
        {
            warp = &gSaveBlock1Ptr->escapeWarp;
            mapHeader = Overworld_GetMapHeaderByGroupAndId(warp->mapGroup, warp->mapNum);
        }
        else
        {
            warp = &gSaveBlock1Ptr->dynamicWarp;
            mapHeader = Overworld_GetMapHeaderByGroupAndId(warp->mapGroup, warp->mapNum);
            sMapCursor->selectedMapsec = mapHeader->regionMapSectionId;
        }
        width = mapHeader->mapLayout->width;
        height = mapHeader->mapLayout->height;
        x = warp->x;
        y = warp->y;
        break;
    }

    sMapCursor->selectedMapsec -= MAPSECS_KANTO;
    divisor = width / sMapSectionDimensions[sMapCursor->selectedMapsec][0];
    if (divisor == 0)
        divisor = 1;
    x /= divisor;
    if (x >= sMapSectionDimensions[sMapCursor->selectedMapsec][0])
        x = sMapSectionDimensions[sMapCursor->selectedMapsec][0] - 1;
    divisor = height / sMapSectionDimensions[sMapCursor->selectedMapsec][1];
    if (divisor == 0)
        divisor = 1;
    y /= divisor;
    if (y >= sMapSectionDimensions[sMapCursor->selectedMapsec][1])
        y = sMapSectionDimensions[sMapCursor->selectedMapsec][1] - 1;
    sMapCursor->x = x + sMapSectionTopLeftCorners[sMapCursor->selectedMapsec][0];
    sMapCursor->y = y + sMapSectionTopLeftCorners[sMapCursor->selectedMapsec][1];
}

static void GetPlayerPositionOnRegionMap_HandleOverrides(void)
{
    switch (GetPlayerCurrentMapSectionId())
    {
    case MAPSEC_KANTO_SAFARI_ZONE:
        sMapCursor->x = 12;
        sMapCursor->y = 12;
        break;
    case MAPSEC_SILPH_CO:
        sMapCursor->x = 14;
        sMapCursor->y = 6;
        break;
    case MAPSEC_POKEMON_MANSION:
        sMapCursor->x = 4;
        sMapCursor->y = 14;
        break;
    case MAPSEC_POKEMON_TOWER:
        sMapCursor->x = 18;
        sMapCursor->y = 6;
        break;
    case MAPSEC_POWER_PLANT:
        sMapCursor->x = 18;
        sMapCursor->y = 4;
        break;
    case MAPSEC_S_S_ANNE:
        sMapCursor->x = 14;
        sMapCursor->y = 9;
        break;
    case MAPSEC_POKEMON_LEAGUE:
        sMapCursor->x = 2;
        sMapCursor->y = 3;
        break;
    case MAPSEC_ROCKET_HIDEOUT:
        sMapCursor->x = 11;
        sMapCursor->y = 6;
        break;
    case MAPSEC_UNDERGROUND_PATH:
        sMapCursor->x = 14;
        sMapCursor->y = 7;
        if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(UNDERGROUND_PATH_NORTH_ENTRANCE))
        {
            sMapCursor->x = 14; // optimized out but required to match
            sMapCursor->y = 5;
        }
        break;
    case MAPSEC_UNDERGROUND_PATH_2:
        sMapCursor->x = 12;
        sMapCursor->y = 6;
        if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(UNDERGROUND_PATH_EAST_ENTRANCE))
        {
            sMapCursor->x = 15;
            sMapCursor->y = 6; // optimized out but required to match
        }
        break;
    case MAPSEC_BIRTH_ISLAND:
        sMapCursor->x = 18;
        sMapCursor->y = 13;
        break;
    case MAPSEC_NAVEL_ROCK:
        sMapCursor->x = 10;
        sMapCursor->y = 8;
        break;
    case MAPSEC_TRAINER_TOWER_2:
        sMapCursor->x = 5;
        sMapCursor->y = 6;
        break;
    case MAPSEC_MT_EMBER:
        sMapCursor->x = 2;
        sMapCursor->y = 3;
        break;
    case MAPSEC_BERRY_FOREST:
        sMapCursor->x = 14;
        sMapCursor->y = 12;
        break;
    case MAPSEC_PATTERN_BUSH:
        sMapCursor->x = 17;
        sMapCursor->y = 3;
        break;
    case MAPSEC_ROCKET_WAREHOUSE:
        sMapCursor->x = 17;
        sMapCursor->y = 11;
        break;
    case MAPSEC_DILFORD_CHAMBER:
    case MAPSEC_LIPTOO_CHAMBER:
    case MAPSEC_MONEAN_CHAMBER:
    case MAPSEC_RIXY_CHAMBER:
    case MAPSEC_SCUFIB_CHAMBER:
    case MAPSEC_TANOBY_CHAMBERS:
    case MAPSEC_VIAPOIS_CHAMBER:
    case MAPSEC_WEEPTH_CHAMBER:
        sMapCursor->x = 9;
        sMapCursor->y = 12;
        break;
    case MAPSEC_DOTTED_HOLE:
        sMapCursor->x = 16;
        sMapCursor->y = 8;
        break;
    case MAPSEC_VIRIDIAN_FOREST:
        sMapCursor->x = 4;
        sMapCursor->y = 6;
        break;
    case MAPSEC_ROUTE_2:
        if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(PALLET_TOWN))
        {
            sMapCursor->x = 4;
            sMapCursor->y = 7;
        }
        else if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(CERULEAN_CITY))
        {
            sMapCursor->x = 4;
            sMapCursor->y = 5;
        }
        else
        {
            GetPlayerPositionOnRegionMap();
        }
        break;
    case MAPSEC_ROUTE_21:
        if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(ROUTE21_NORTH))
        {
            sMapCursor->x = 4;
            sMapCursor->y = 12;
        }
        else if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(ROUTE21_SOUTH))
        {
            sMapCursor->x = 4;
            sMapCursor->y = 13;
        }
        break;
    case MAPSEC_ROUTE_5:
        if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(VIRIDIAN_CITY))
        {
            sMapCursor->x = 14;
            sMapCursor->y = 5;
        }
        else
        {
            GetPlayerPositionOnRegionMap();
        }
        break;
    case MAPSEC_ROUTE_6:
        if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(PALLET_TOWN))
        {
            sMapCursor->x = 14;
            sMapCursor->y = 7;
        }
        else
        {
            GetPlayerPositionOnRegionMap();
        }
        break;
    case MAPSEC_ROUTE_7:
        if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(PALLET_TOWN))
        {
            sMapCursor->x = 13;
            sMapCursor->y = 6;
        }
        else
        {
            GetPlayerPositionOnRegionMap();
        }
        break;
    case MAPSEC_ROUTE_8:
        if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(PALLET_TOWN))
        {
            sMapCursor->x = 15;
            sMapCursor->y = 6;
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
    sMapCursor->selectedMapsec = GetSelectedMapSection(GetSelectedRegionMap(), LAYER_MAP, sMapCursor->y, sMapCursor->x);
}

static u8 GetSelectedMapSection(u8 whichMap, u8 layer, s16 y, s16 x)
{
    switch (whichMap)
    {
    case REGIONMAP_KANTO:
        return sRegionMapSections_Kanto[layer][y][x];
    case REGIONMAP_SEVII123:
        return sRegionMapSections_Sevii123[layer][y][x];
    case REGIONMAP_SEVII45:
        return sRegionMapSections_Sevii45[layer][y][x];
    case REGIONMAP_SEVII67:
        return sRegionMapSections_Sevii67[layer][y][x];
    default:
        return MAPSEC_NONE;
    }
}

static void CreatePlayerIcon(u16 tileTag, u16 palTag)
{
    sPlayerIcon = AllocZeroed(sizeof(struct PlayerIcon));
    if (gSaveBlock2Ptr->playerGender == FEMALE)
        LZ77UnCompWram(sPlayerIcon_Leaf, sPlayerIcon->tiles);
    else
        LZ77UnCompWram(sPlayerIcon_Red, sPlayerIcon->tiles);
    sPlayerIcon->tileTag = tileTag;
    sPlayerIcon->palTag = palTag;
    sPlayerIcon->x = GetMapCursorX();
    sPlayerIcon->y = GetMapCursorY();
    CreatePlayerIconSprite();
}

static void CreatePlayerIconSprite(void)
{
    u8 spriteId;
    struct SpriteSheet spriteSheet = {
        .data = sPlayerIcon->tiles,
        .size = sizeof(sPlayerIcon->tiles),
        .tag = sPlayerIcon->tileTag
    };
    struct SpritePalette spritePalette = {
        .data = sPlayerIcon_RedPal,
        .tag = sPlayerIcon->palTag
    };
    struct SpriteTemplate template = {
        .tileTag = sPlayerIcon->tileTag,
        .paletteTag = sPlayerIcon->palTag,
        .oam = &sOamData_PlayerIcon,
        .anims = sAnims_PlayerIcon,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy
    };

    if (gSaveBlock2Ptr->playerGender == FEMALE)
        spritePalette.data = sPlayerIcon_LeafPal;

    LoadSpriteSheet(&spriteSheet);
    LoadSpritePalette(&spritePalette);
    spriteId = CreateSprite(&template, 8 * sPlayerIcon->x + 36, 8 * sPlayerIcon->y + 36, 2);
    sPlayerIcon->sprite = &gSprites[spriteId];
    SetPlayerIconInvisibility(TRUE);
}

static void SetPlayerIconInvisibility(bool8 invisible)
{
    sPlayerIcon->sprite->invisible = invisible;
}

static void FreePlayerIcon(void)
{
    if (sPlayerIcon->sprite != NULL)
    {
        DestroySprite(sPlayerIcon->sprite);
        FreeSpriteTilesByTag(sPlayerIcon->tileTag);
        FreeSpritePaletteByTag(sPlayerIcon->palTag);
    }
    FREE_IF_NOT_NULL(sPlayerIcon);
}

static u16 GetPlayerIconX(void)
{
    return sPlayerIcon->x;
}

static u16 GetPlayerIconY(void)
{
    return sPlayerIcon->y;
}

static void InitMapIcons(u8 whichMap, u8 taskId, TaskFunc taskFunc)
{
    sMapIcons = AllocZeroed(sizeof(struct MapIcons));
    sMapIcons->exitTask = taskFunc;
    sMapIcons->region = whichMap;
    LZ77UnCompWram(sDungeonIcon, sMapIcons->dungeonIconTiles);
    LZ77UnCompWram(sFlyIcon, sMapIcons->flyIconTiles);
    gTasks[taskId].func = LoadMapIcons;
}

static void LoadMapIcons(u8 taskId)
{
    switch (sMapIcons->state)
    {
    case 0:
        NullVBlankHBlankCallbacks();
        sMapIcons->state++;
        break;
    case 1:
        CreateDungeonIcons();
        sMapIcons->state++;
        break;
    case 2:
        CreateFlyIcons();
        sMapIcons->state++;
        break;
    case 3:
        BlendPalettes(PALETTES_ALL, 16, RGB_BLACK);
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        sMapIcons->state++;
        break;
    case 4:
        SetRegionMapVBlankCB();
        sMapIcons->state++;
        break;
    default:
        SetGpuReg(REG_OFFSET_DISPCNT, GetGpuReg(REG_OFFSET_DISPCNT) | DISPCNT_OBJ_ON);
        FinishMapIconLoad(taskId);
        break;
    }
}

static void FinishMapIconLoad(u8 taskId)
{
    gTasks[taskId].func = sMapIcons->exitTask;
}

static void CreateFlyIconSprite(u8 whichMap, u8 numIcons, u16 x, u16 y, u8 tileTag, u8 palTag)
{
    u8 spriteId;
    struct SpriteSheet spriteSheet = {
        .data = sMapIcons->flyIconTiles,
        .size = sizeof(sMapIcons->flyIconTiles),
        .tag = tileTag
    };
    struct SpritePalette spritePalette = {
        .data = sMiscIcon_Pal,
        .tag = palTag
    };
    struct SpriteTemplate template = {
        .tileTag = tileTag,
        .paletteTag = palTag,
        .oam = &sOamData_FlyIcon,
        .anims = sAnims_FlyIcon,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy
    };

    LoadSpriteSheet(&spriteSheet);
    LoadSpritePalette(&spritePalette);
    spriteId = CreateSprite(&template, 8 * x + 36, 8 * y + 36, 1);
    sMapIcons->flyIcons[numIcons].sprite = &gSprites[spriteId];
    gSprites[spriteId].invisible = TRUE;
    sMapIcons->flyIcons[numIcons].region = whichMap;
}

static void CreateDungeonIconSprite(u8 whichMap, u8 numIcons, u16 x, u16 y, u8 tileTag, u8 palTag)
{
    u8 spriteId;
    u8 mapsec;
    s16 offset = 0;
    struct SpriteSheet spriteSheet = {
        .data = sMapIcons->dungeonIconTiles,
        .size = sizeof(sMapIcons->dungeonIconTiles),
        .tag = tileTag
    };
    struct SpritePalette spritePalette = {
        .data = sMiscIcon_Pal,
        .tag = palTag
    };
    struct SpriteTemplate template = {
        .tileTag = tileTag,
        .paletteTag = palTag,
        .oam = &sOamData_DungeonIcon,
        .anims = sAnims_DungeonIcon,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy
    };

    LoadSpriteSheet(&spriteSheet);
    LoadSpritePalette(&spritePalette);
    mapsec = GetSelectedMapSection(whichMap, LAYER_MAP, y, x);

    // If mapsec has a town, push dungeon icon to bottom right corner
    if ((GetMapsecType(mapsec) == MAPSECTYPE_VISITED || GetMapsecType(mapsec) == MAPSECTYPE_NOT_VISITED) && mapsec != MAPSEC_ROUTE_10_POKECENTER)
        offset = 2;

    spriteId = CreateSprite(&template, 8 * x + 36 + offset, 8 * y + 36 + offset, 3);
    sMapIcons->dungeonIcons[numIcons].sprite = &gSprites[spriteId];
    gSprites[spriteId].invisible = TRUE;
    sMapIcons->dungeonIcons[numIcons].region = whichMap;
}

static void CreateFlyIcons(void)
{
    u16 i, y, x;
    u8 numIcons = 0;
    if (GetRegionMapPermission(MAPPERM_HAS_FLY_DESTINATIONS))
    {
        for (i = 0; i < REGIONMAP_COUNT; i++)
        {
            for (y = 0; y < MAP_HEIGHT; y++)
            {
                for (x = 0; x < MAP_WIDTH; x++)
                {
                    if (GetMapsecType(GetSelectedMapSection(i, LAYER_MAP, y, x)) == MAPSECTYPE_VISITED)
                    {
                        CreateFlyIconSprite(i, numIcons, x, y, numIcons + 10, 10);
                        numIcons++;
                    }
                }
            }
        }
    }
}

static void CreateDungeonIcons(void)
{
    u16 i, y, x;
    u8 numIcons = 0;
    u8 mapsec;
    for (i = 0; i < REGIONMAP_COUNT; i++)
    {
        for (y = 0; y < MAP_HEIGHT; y++)
        {
            for (x = 0; x < MAP_WIDTH; x++)
            {
                mapsec = GetSelectedMapSection(i, LAYER_DUNGEON, y, x);
                if (mapsec == MAPSEC_NONE)
                    continue;
                if (mapsec == MAPSEC_CERULEAN_CAVE && !FlagGet(FLAG_SYS_CAN_LINK_WITH_RS))
                    continue;
                CreateDungeonIconSprite(i, numIcons, x, y, numIcons + 35, 10);
                if (GetDungeonMapsecType(mapsec) != 2)
                {
                    StartSpriteAnim(sMapIcons->dungeonIcons[numIcons].sprite, 1);
                }
                numIcons++;
            }
        }
    }
}

static void SetFlyIconInvisibility(u8 whichMap, u8 iconNum, bool8 invisible)
{
    u8 i;
    if (iconNum == NELEMS(sMapIcons->flyIcons))
    {
        // Set for all fly icons
        for (i = 0; i < NELEMS(sMapIcons->flyIcons); i++)
        {
            if (sMapIcons->flyIcons[i].region == whichMap || whichMap == 0xFF)
                sMapIcons->flyIcons[i].sprite->invisible = invisible;
        }
    }
    else
    {
        if (sMapIcons->flyIcons[iconNum].region == whichMap)
            sMapIcons->flyIcons[iconNum].sprite->invisible = invisible;
    }
}

static void SetDungeonIconInvisibility(u8 whichMap, u8 iconNum, bool8 invisible)
{
    u8 i;
    if (iconNum == NELEMS(sMapIcons->dungeonIcons))
    {
        // Set for all dungeon icons
        for (i = 0; i < NELEMS(sMapIcons->dungeonIcons); i++)
        {
            if (sMapIcons->dungeonIcons[i].region == whichMap || whichMap == 0xFF)
                sMapIcons->dungeonIcons[i].sprite->invisible = invisible;
        }
    }
    else
    {
        if (sMapIcons->dungeonIcons[iconNum].region != whichMap)
            sMapIcons->dungeonIcons[iconNum].sprite->invisible = invisible;
    }
}

static void FreeMapIcons(void)
{
    u8 i;
    for (i = 0; i < NELEMS(sMapIcons->flyIcons); i++)
    {
        if (sMapIcons->flyIcons[i].sprite != NULL)
        {
            DestroySprite(sMapIcons->flyIcons[i].sprite);
            FreeSpriteTilesByTag(sMapIcons->flyIcons[i].tileTag);
            FreeSpritePaletteByTag(sMapIcons->flyIcons[i].palTag);
        }
    }
    for (i = 0; i < NELEMS(sMapIcons->dungeonIcons); i++)
    {
        if (sMapIcons->dungeonIcons[i].sprite != NULL)
        {
            DestroySprite(sMapIcons->dungeonIcons[i].sprite);
            FreeSpriteTilesByTag(sMapIcons->dungeonIcons[i].tileTag);
            FreeSpritePaletteByTag(sMapIcons->dungeonIcons[i].palTag);
        }
    }
    FREE_IF_NOT_NULL(sMapIcons);
}

static bool8 SaveRegionMapGpuRegs(u8 idx)
{
    if (sRegionMapGpuRegs[idx] != NULL)
        return FALSE;
    sRegionMapGpuRegs[idx] = AllocZeroed(sizeof(struct RegionMapGpuRegs));
    sRegionMapGpuRegs[idx]->bldcnt = GetGpuReg(REG_OFFSET_BLDCNT);
    sRegionMapGpuRegs[idx]->bldy = GetGpuReg(REG_OFFSET_BLDY);
    sRegionMapGpuRegs[idx]->bldalpha = GetGpuReg(REG_OFFSET_BLDALPHA);
    sRegionMapGpuRegs[idx]->winin = GetGpuReg(REG_OFFSET_WININ);
    sRegionMapGpuRegs[idx]->winout = GetGpuReg(REG_OFFSET_WINOUT);
    sRegionMapGpuRegs[idx]->win0h = GetGpuReg(REG_OFFSET_WIN0H);
    sRegionMapGpuRegs[idx]->win1h = GetGpuReg(REG_OFFSET_WIN1H);
    sRegionMapGpuRegs[idx]->win0v = GetGpuReg(REG_OFFSET_WIN0V);
    sRegionMapGpuRegs[idx]->win1v = GetGpuReg(REG_OFFSET_WIN1V);
    return TRUE;
}

static bool8 SetRegionMapGpuRegs(u8 idx)
{
    if (sRegionMapGpuRegs[idx] == NULL)
        return FALSE;
    SetGpuReg(REG_OFFSET_BLDCNT, sRegionMapGpuRegs[idx]->bldcnt);
    SetGpuReg(REG_OFFSET_BLDY, sRegionMapGpuRegs[idx]->bldy);
    SetGpuReg(REG_OFFSET_BLDALPHA, sRegionMapGpuRegs[idx]->bldalpha);
    SetGpuReg(REG_OFFSET_WININ, sRegionMapGpuRegs[idx]->winin);
    SetGpuReg(REG_OFFSET_WINOUT, sRegionMapGpuRegs[idx]->winout);
    SetGpuReg(REG_OFFSET_WIN0H, sRegionMapGpuRegs[idx]->win0h);
    SetGpuReg(REG_OFFSET_WIN1H, sRegionMapGpuRegs[idx]->win1h);
    SetGpuReg(REG_OFFSET_WIN0V, sRegionMapGpuRegs[idx]->win0v);
    SetGpuReg(REG_OFFSET_WIN1V, sRegionMapGpuRegs[idx]->win1v);
    FREE_IF_NOT_NULL(sRegionMapGpuRegs[idx]);
    return TRUE;
}

static void FreeRegionMapGpuRegs(void)
{
    u8 i;
    for (i = 0; i < NELEMS(sRegionMapGpuRegs); i++)
        FREE_IF_NOT_NULL(sRegionMapGpuRegs[i]);
}

static void ResetGpuRegs(void)
{
    struct GpuWindowParams data = {};
    SetBldCnt(0, 0, BLDCNT_EFFECT_NONE);
    SetBldY(0);
    SetGpuWindowDims(0, &data);
    SetGpuWindowDims(1, &data);
    SetWinIn(0, 0);
    SetDispCnt(0, TRUE);
    SetDispCnt(1, TRUE);
}

static void SetBldCnt(u8 tgt2, u16 tgt1, u16 effect)
{
    u16 regval = tgt2 << 8;
    regval |= tgt1;
    regval |= effect;
    SetGpuReg(REG_OFFSET_BLDCNT, regval);
}

static void SetBldY(u16 tgt)
{
    SetGpuReg(REG_OFFSET_BLDY, tgt);
}

static void SetBldAlpha(u16 tgt2, u16 tgt1)
{
    u16 regval = tgt2 << 8;
    regval |= tgt1;
    SetGpuReg(REG_OFFSET_BLDALPHA, regval);
}

static void SetWinIn(u16 b, u16 a)
{
    u16 regval = a << 8;
    regval |= b;
    SetGpuReg(REG_OFFSET_WININ, regval);
}

static void SetWinOut(u16 regval)
{
    SetGpuReg(REG_OFFSET_WINOUT, regval);
}

static void SetDispCnt(u8 idx, bool8 clear)
{
    u16 data[sizeof(sWinFlags) / 2];
    memcpy(data, sWinFlags, sizeof(sWinFlags));
    switch (clear)
    {
    case FALSE:
        SetGpuReg(REG_OFFSET_DISPCNT, GetGpuReg(REG_OFFSET_DISPCNT) | data[idx]);
        break;
    case TRUE:
        ClearGpuRegBits(REG_OFFSET_DISPCNT, data[idx]);
        break;
    }
}

static void SetGpuWindowDims(u8 winIdx, const struct GpuWindowParams *data)
{
    SetGpuReg(sWinRegs[winIdx][0], WIN_RANGE(data->top, data->bottom));
    SetGpuReg(sWinRegs[winIdx][1], WIN_RANGE(data->left, data->right));
}

static void FreeAndResetGpuRegs(void)
{
    FreeRegionMapGpuRegs();
    ResetGpuRegs();
}

static bool32 IsCeladonDeptStoreMapsec(u16 mapsec)
{
    if (sRegionMap != NULL)
        return FALSE;
    if (mapsec != MAPSEC_CELADON_CITY)
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
    u16 idx;
    if ((idx = mapsec - MAPSECS_KANTO) <= MAPSEC_SPECIAL_AREA - MAPSECS_KANTO)
    {
        if (IsCeladonDeptStoreMapsec(mapsec) == TRUE)
            dst = StringCopy(dst0, sMapsecName_CELADON_DEPT_);
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

// Unclear why this function is used over GetMapNameGeneric
u8 *GetMapNameGeneric_(u8 *dest, u16 mapsec)
{
    return GetMapNameGeneric(dest, mapsec);
}

static void PrintTopBarTextLeft(const u8 *str)
{
    if (sRegionMap->permissions[MAPPERM_HAS_OPEN_ANIM] == TRUE)
        FillWindowPixelBuffer(WIN_TOPBAR_LEFT, PIXEL_FILL(0));
    else
        FillWindowPixelBuffer(WIN_TOPBAR_LEFT, PIXEL_FILL(15));
    AddTextPrinterParameterized3(WIN_TOPBAR_LEFT, FONT_SMALL, 0, 0, sTextColors, 0, str);
    CopyWindowToVram(WIN_TOPBAR_LEFT, COPYWIN_GFX);
}

static void PrintTopBarTextRight(const u8 *str)
{
    if (sRegionMap->permissions[MAPPERM_HAS_OPEN_ANIM] == TRUE)
        FillWindowPixelBuffer(WIN_TOPBAR_RIGHT, PIXEL_FILL(0));
    else
        FillWindowPixelBuffer(WIN_TOPBAR_RIGHT, PIXEL_FILL(15));
    AddTextPrinterParameterized3(WIN_TOPBAR_RIGHT, FONT_SMALL, 0, 0, sTextColors, 0, str);
    CopyWindowToVram(WIN_TOPBAR_RIGHT, COPYWIN_FULL);
}

static void ClearOrDrawTopBar(bool8 clear)
{
    if (!clear)
    {
        PutWindowTilemap(WIN_TOPBAR_LEFT);
        PutWindowTilemap(WIN_TOPBAR_RIGHT);
    }
    else
    {
        ClearWindowTilemap(WIN_TOPBAR_LEFT);
        ClearWindowTilemap(WIN_TOPBAR_RIGHT);
    }
}

void CB2_OpenFlyMap(void)
{
    InitFlyMap();
    InitRegionMap(REGIONMAP_TYPE_FLY);
}

static void Task_FlyMap(u8 taskId)
{
    switch (sFlyMap->state)
    {
    case 0:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 16, 0, RGB_BLACK);
        InitMapIcons(GetSelectedRegionMap(), taskId, GetMainMapTask());
        CreateMapCursor(0, 0);
        CreatePlayerIcon(1, 1);
        SetMapCursorInvisibility(FALSE);
        SetPlayerIconInvisibility(FALSE);
        sFlyMap->state++;
        break;
    case 1:
        if (GetRegionMapPermission(MAPPERM_HAS_OPEN_ANIM) == TRUE)
        {
            InitMapOpenAnim(taskId, GetMainMapTask());
        }
        else
        {
            ShowBg(0);
            ShowBg(3);
            ShowBg(1);
            PrintTopBarTextLeft(gText_RegionMap_DPadMove);
            SetFlyIconInvisibility(GetSelectedRegionMap(), NELEMS(sMapIcons->flyIcons), FALSE);
            SetDungeonIconInvisibility(GetSelectedRegionMap(), NELEMS(sMapIcons->dungeonIcons), FALSE);
        }
        sFlyMap->state++;
        break;
    case 2:
        PrintTopBarTextRight(gText_RegionMap_AButtonOK);
        ClearOrDrawTopBar(FALSE);
        sFlyMap->state++;
        break;
    case 3:
        if (!gPaletteFade.active)
        {
            DisplayCurrentMapName();
            PutWindowTilemap(WIN_MAP_NAME);
            DisplayCurrentDungeonName();
            PutWindowTilemap(WIN_DUNGEON_NAME);
            sFlyMap->state++;
        }
        break;
    case 4:
        switch (GetRegionMapInput())
        {
        case MAP_INPUT_MOVE_START:
        case MAP_INPUT_MOVE_CONT:
            break;
        case MAP_INPUT_CANCEL:
            sFlyMap->state = 6;
            break;
        case MAP_INPUT_MOVE_END:
            if (GetSelectedMapsecType(LAYER_MAP) == MAPSECTYPE_VISITED)
                PlaySE(SE_DEX_PAGE);
            else
                PlaySEForSelectedMapsec();
            ResetCursorSnap();
            DisplayCurrentMapName();
            DisplayCurrentDungeonName();
            DrawDungeonNameBox();
            if (GetMapCursorX() == CANCEL_BUTTON_X && GetMapCursorY() == CANCEL_BUTTON_Y)
            {
                PlaySE(SE_M_SPIT_UP);
                PrintTopBarTextRight(gText_RegionMap_AButtonCancel);
            }
            else if (GetSelectedMapsecType(LAYER_MAP) == MAPSECTYPE_VISITED || GetSelectedMapsecType(LAYER_MAP) == MAPSECTYPE_UNKNOWN)
            {
                PrintTopBarTextRight(gText_RegionMap_AButtonOK);
            }
            else
            {
                PrintTopBarTextRight(gText_RegionMap_Space);
            }
            break;
        case MAP_INPUT_A_BUTTON:
            if ((GetSelectedMapsecType(LAYER_MAP) == MAPSECTYPE_VISITED || GetSelectedMapsecType(LAYER_MAP) == MAPSECTYPE_UNKNOWN) && GetRegionMapPermission(MAPPERM_HAS_FLY_DESTINATIONS) == TRUE)
            {
                switch (GetMapTypeByGroupAndId(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum))
                {
                case MAP_TYPE_UNDERGROUND:
                case MAP_TYPE_INDOOR:
                    sFlyMap->selectedDestination = FALSE;
                    sFlyMap->state++;
                    break;
                default:
                    PlaySE(SE_USE_ITEM);
                    sFlyMap->selectedDestination = TRUE;
                    sFlyMap->state++;
                    break;
                }
            }
            break;
        case MAP_INPUT_SWITCH:
            InitSwitchMapMenu(GetSelectedRegionMap(), taskId, SaveMainMapTask);
            break;
        }
        break;
    case 5:
        if (GetRegionMapPermission(MAPPERM_HAS_OPEN_ANIM) == TRUE)
            DoMapCloseAnim(taskId);
        sFlyMap->state++;
        break;
    case 6:
        BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
        sFlyMap->state++;
        break;
    default:
        if (!gPaletteFade.active)
        {
            if (sFlyMap->selectedDestination == TRUE)
                SetFlyWarpDestination(GetMapsecUnderCursor());
            FreeFlyMap(taskId);
        }
        break;
    }
}

static void InitFlyMap(void)
{
    sFlyMap = AllocZeroed(sizeof(struct FlyMap));
    sFlyMap->state = 0;
    sFlyMap->unused = 0;
}

static void FreeFlyMap(u8 taskId)
{
    if (GetRegionMapPermission(MAPPERM_HAS_OPEN_ANIM) == TRUE)
        FreeMapOpenCloseAnim();
    FreeMapIcons();
    FreeMapCursor();
    FreePlayerIcon();
    FreeAndResetGpuRegs();
    FreeRegionMapForFlyMap();
    DestroyTask(taskId);
    FreeAllWindowBuffers();
    if (sFlyMap->selectedDestination == TRUE)
        SetMainCallback2(CB2_ReturnToField);
    else
        SetMainCallback2(CB2_ReturnToPartyMenuFromFlyMap);
    FREE_IF_NOT_NULL(sFlyMap);
}

static void SetFlyWarpDestination(u16 mapsec)
{
    u16 idx = mapsec - MAPSECS_KANTO;
    if (sMapFlyDestinations[idx][2])
    {
        SetWarpDestinationToHealLocation(sMapFlyDestinations[idx][2]);
        SetUsedFlyQuestLogEvent(sMapFlyDestinations[idx]);
    }
    else
    {
        SetWarpDestinationToMapWarp(sMapFlyDestinations[idx][0], sMapFlyDestinations[idx][1], -1);
    }
    ReturnToFieldFromFlyMapSelect();
}
