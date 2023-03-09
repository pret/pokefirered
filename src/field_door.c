#include "global.h"
#include "field_camera.h"
#include "task.h"
#include "fieldmap.h"
#include "metatile_behavior.h"
#include "constants/songs.h"
#include "constants/metatile_labels.h"

enum {
    DOOR_SOUND_NORMAL,
    DOOR_SOUND_SLIDING,
};

enum {
    DOOR_SIZE_1x1,
    DOOR_SIZE_1x2,
};

struct DoorAnimFrame
{
    u8 duration;
    u16 tileOffset;
};

struct DoorGraphics
{
    u16 metatileId;
    u8 sound;
    u8 size;
    const u8 *tiles;
    const u8 *paletteNums;
};

static void DrawClosedDoorTiles(const struct DoorGraphics *gfx, int x, int y);
static void CopyDoorTilesToVram(const u8 *tiles);
static void DrawCurrentDoorAnimFrame(const struct DoorGraphics *gfx, int x, int y, const u8 *paletteNums);
static void BuildDoorTiles(u16 *tiles, u16 tileNum, const u8 *paletteNums);
static bool32 AnimateDoorFrame(const struct DoorGraphics *gfx, const struct DoorAnimFrame *frames, s16 *data);
static const struct DoorAnimFrame *GetLastDoorAnimFrame(const struct DoorAnimFrame *frames);
static s8 GetDoorSoundType(const struct DoorGraphics *gfx, int x, int y);

static const u8 sDoorAnimTiles_General[] = INCBIN_U8("graphics/door_anims/general.4bpp");
static const u16 sDoorNullPalette1[16] = {};
static const u8 sDoorAnimTiles_SlidingSingle[] = INCBIN_U8("graphics/door_anims/sliding_single.4bpp");
static const u16 sDoorNullPalette2[16] = {};
static const u8 sDoorAnimTiles_SlidingDouble[] = INCBIN_U8("graphics/door_anims/sliding_double.4bpp");
static const u16 sDoorNullPalette3[16] = {};
static const u8 sDoorAnimTiles_Pallet[] = INCBIN_U8("graphics/door_anims/pallet.4bpp");
static const u16 sDoorNullPalette4[16] = {};
static const u8 sDoorAnimTiles_OaksLab[] = INCBIN_U8("graphics/door_anims/oaks_lab.4bpp");
static const u16 sDoorNullPalette5[16] = {};
static const u8 sDoorAnimTiles_Viridian[] = INCBIN_U8("graphics/door_anims/viridian.4bpp");
static const u16 sDoorNullPalette6[16] = {};
static const u8 sDoorAnimTiles_Pewter[] = INCBIN_U8("graphics/door_anims/pewter.4bpp");
static const u16 sDoorNullPalette7[16] = {};
static const u8 sDoorAnimTiles_Saffron[] = INCBIN_U8("graphics/door_anims/saffron.4bpp");
static const u16 sDoorNullPalette8[16] = {};
static const u8 sDoorAnimTiles_SilphCo[] = INCBIN_U8("graphics/door_anims/silph_co.4bpp");
static const u16 sDoorNullPalette9[16] = {};
static const u8 sDoorAnimTiles_Cerulean[] = INCBIN_U8("graphics/door_anims/cerulean.4bpp");
static const u16 sDoorNullPalette10[16] = {};
static const u8 sDoorAnimTiles_Lavender[] = INCBIN_U8("graphics/door_anims/lavender.4bpp");
static const u16 sDoorNullPalette11[16] = {};
static const u8 sDoorAnimTiles_Vermilion[] = INCBIN_U8("graphics/door_anims/vermilion.4bpp");
static const u16 sDoorNullPalette12[16] = {};
static const u8 sDoorAnimTiles_PokemonFanClub[] = INCBIN_U8("graphics/door_anims/pokemon_fan_club.4bpp");
static const u16 sDoorNullPalette13[16] = {};
static const u8 sDoorAnimTiles_DeptStore[] = INCBIN_U8("graphics/door_anims/dept_store.4bpp");
static const u16 sDoorNullPalette14[16] = {};
static const u8 sDoorAnimTiles_Fuchsia[] = INCBIN_U8("graphics/door_anims/fuchsia.4bpp");
static const u16 sDoorNullPalette15[16] = {};
static const u8 sDoorAnimTiles_SafariZone[] = INCBIN_U8("graphics/door_anims/safari_zone.4bpp");
static const u16 sDoorNullPalette16[16] = {};
static const u8 sDoorAnimTiles_CinnabarLab[] = INCBIN_U8("graphics/door_anims/cinnabar_lab.4bpp");
static const u16 sDoorNullPalette17[16] = {};
static const u8 sDoorAnimTiles_DeptStoreElevator[] = INCBIN_U8("graphics/door_anims/dept_store_elevator.4bpp");
static const u16 sDoorNullPalette18[16] = {};
static const u8 sDoorAnimTiles_CableClub[] = INCBIN_U8("graphics/door_anims/cable_club.4bpp");
static const u16 sDoorNullPalette19[16] = {};
static const u8 sDoorAnimTiles_HideoutElevator[] = INCBIN_U8("graphics/door_anims/hideout_elevator.4bpp");
static const u16 sDoorNullPalette20[16] = {};
static const u8 sDoorAnimTiles_SSAnne[] = INCBIN_U8("graphics/door_anims/ss_anne.4bpp");
static const u16 sDoorNullPalette21[16] = {};

// Doors from R/S dummied below
static const u8 sDoorAnimTiles_Empty1[256 * 3] = {};
static const u16 sDoorNullPalette22[16] = {};
static const u8 sDoorAnimTiles_Empty2[256 * 3] = {};
static const u16 sDoorNullPalette23[16] = {};
static const u8 sDoorAnimTiles_Empty3[256 * 3] = {};
static const u16 sDoorNullPalette24[16] = {};
static const u8 sDoorAnimTiles_Empty4[256 * 3] = {};
static const u16 sDoorNullPalette25[16] = {};
static const u8 sDoorAnimTiles_Empty5[256 * 3] = {};
static const u16 sDoorNullPalette26[16] = {};
static const u8 sDoorAnimTiles_Empty6[256 * 3] = {};
static const u16 sDoorNullPalette27[16] = {};
static const u8 sDoorAnimTiles_Empty7[256 * 3] = {};
static const u16 sDoorNullPalette28[16] = {};
static const u8 sDoorAnimTiles_Empty8[128 * 3] = {};
static const u16 sDoorNullPalette29[16] = {};
static const u8 sDoorAnimTiles_Empty9[128 * 3] = {};
static const u16 sDoorNullPalette30[16] = {};
static const u8 sDoorAnimTiles_Empty10[128 * 3] = {};
static const u16 sDoorNullPalette31[16] = {};
static const u8 sDoorAnimTiles_Empty11[128 * 3] = {};
static const u16 sDoorNullPalette32[16] = {};
static const u8 sDoorAnimTiles_Empty12[128 * 3] = {};
static const u16 sDoorNullPalette33[16] = {};
static const u8 sDoorAnimTiles_Empty13[128 * 3] = {};
static const u16 sDoorNullPalette34[16] = {};
static const u8 sDoorAnimTiles_Empty14[128 * 3] = {};
static const u16 sDoorNullPalette35[16] = {};
static const u8 sDoorAnimTiles_Empty15[128 * 3] = {};
static const u16 sDoorNullPalette36[16] = {};
static const u8 sDoorAnimTiles_Empty16[128 * 3] = {};
static const u16 sDoorNullPalette37[16] = {};
static const u8 sDoorAnimTiles_Empty17[128 * 3] = {};
static const u16 sDoorNullPalette38[16] = {};
static const u8 sDoorAnimTiles_Empty18[128 * 3] = {};
static const u16 sDoorNullPalette39[16] = {};
static const u8 sDoorAnimTiles_Empty19[128 * 3] = {};
static const u16 sDoorNullPalette40[16] = {};
static const u8 sDoorAnimTiles_Empty20[128 * 3] = {};
static const u16 sDoorNullPalette41[16] = {};
static const u8 sDoorAnimTiles_Empty21[128 * 3] = {};
static const u16 sDoorNullPalette42[16] = {};
static const u8 sDoorAnimTiles_Empty22[128 * 3] = {};
static const u16 sDoorNullPalette43[16] = {};
static const u8 sDoorAnimTiles_Empty23[128 * 3] = {};
static const u16 sDoorNullPalette44[16] = {};
static const u8 sDoorAnimTiles_Empty24[128 * 3] = {};
static const u16 sDoorNullPalette45[16] = {};
static const u8 sDoorAnimTiles_Empty25[128 * 3] = {};
static const u16 sDoorNullPalette46[16] = {};
static const u8 sDoorAnimTiles_Empty26[128 * 3] = {};
static const u16 sDoorNullPalette47[16] = {};
static const u8 sDoorAnimTiles_Empty27[128 * 3] = {};
static const u16 sDoorNullPalette48[16] = {};
static const u8 sDoorAnimTiles_Empty28[128 * 3] = {};
static const u16 sDoorNullPalette49[16] = {};
static const u8 sDoorAnimTiles_Empty29[128 * 3] = {};
static const u16 sDoorNullPalette50[16] = {};
static const u8 sDoorAnimTiles_Empty30[128 * 3] = {};
static const u16 sDoorNullPalette51[16] = {};
static const u8 sDoorAnimTiles_Empty31[128 * 3] = {};
static const u16 sDoorNullPalette52[16] = {};

// Unused block of door tiles
static const u8 sDoorAnimTiles_UnusedTop[] = INCBIN_U8("graphics/door_anims/unused_top.4bpp");
static const u8 sDoorAnimTiles_Empty32[256] = {};
static const u8 sDoorAnimTiles_UnusedMidTop[] = INCBIN_U8("graphics/door_anims/unused_midtop.4bpp");
static const u8 sDoorAnimTiles_Empty33[256] = {};
static const u8 sDoorAnimTiles_UnusedMidBottom[] = INCBIN_U8("graphics/door_anims/unused_midbottom.4bpp");
static const u8 sDoorAnimTiles_Empty34[256] = {};
static const u8 sDoorAnimTiles_UnusedBottom[] = INCBIN_U8("graphics/door_anims/unused_bottom.4bpp");
static const u16 sDoorNullPalette53[16] = {};

// Used FRLG doors resume
static const u8 sDoorAnimTiles_SilphCoElevator[] = INCBIN_U8("graphics/door_anims/silph_co_elevator.4bpp");
static const u16 sDoorNullPalette54[16] = {};
static const u8 sDoorAnimTiles_Sevii123[] = INCBIN_U8("graphics/door_anims/sevii_123.4bpp");
static const u16 sDoorNullPalette55[16] = {};
static const u8 sDoorAnimTiles_JoyfulGameCorner[] = INCBIN_U8("graphics/door_anims/joyful_game_corner.4bpp");
static const u16 sDoorNullPalette56[16] = {};
static const u8 sDoorAnimTiles_OneIslandPokeCenter[] = INCBIN_U8("graphics/door_anims/one_island_poke_center.4bpp");
static const u16 sDoorNullPalette57[16] = {};
static const u8 sDoorAnimTiles_Sevii45[] = INCBIN_U8("graphics/door_anims/sevii_45.4bpp");
static const u16 sDoorNullPalette58[16] = {};
static const u8 sDoorAnimTiles_FourIslandDayCare[] = INCBIN_U8("graphics/door_anims/four_island_day_care.4bpp");
static const u16 sDoorNullPalette59[16] = {};
static const u8 sDoorAnimTiles_RocketWarehouse[] = INCBIN_U8("graphics/door_anims/rocket_warehouse.4bpp");
static const u16 sDoorNullPalette60[16] = {};
static const u8 sDoorAnimTiles_Sevii67[] = INCBIN_U8("graphics/door_anims/sevii_67.4bpp");
static const u16 sDoorNullPalette61[16] = {};
static const u8 sDoorAnimTiles_Teleporter[] = INCBIN_U8("graphics/door_anims/teleporter.4bpp");
static const u16 sDoorNullPalette62[16] = {};
static const u8 sDoorAnimTiles_TrainerTowerLobbyElevator[] = INCBIN_U8("graphics/door_anims/trainer_tower_lobby_elevator.4bpp");
static const u16 sDoorNullPalette63[16] = {};
static const u8 sDoorAnimTiles_TrainerTowerRoofElevator[] = INCBIN_U8("graphics/door_anims/trainer_tower_roof_elevator.4bpp");
static const u16 sDoorNullPalette64[16] = {};

#define CLOSED_DOOR_TILES_OFFSET 0xFFFF

static const struct DoorAnimFrame sDoorAnimFrames_OpenSmall[] = {
    {4, CLOSED_DOOR_TILES_OFFSET},
    {4, 0 * TILE_SIZE_4BPP},
    {4, 4 * TILE_SIZE_4BPP},
    {4, 8 * TILE_SIZE_4BPP},
    {}
};

static const struct DoorAnimFrame sDoorAnimFrames_OpenLarge[] = {
    {4, CLOSED_DOOR_TILES_OFFSET},
    {4, 0 * TILE_SIZE_4BPP},
    {4, 8 * TILE_SIZE_4BPP},
    {4, 16 * TILE_SIZE_4BPP},
    {}
};

static const struct DoorAnimFrame sDoorAnimFrames_CloseSmall[] = {
    {4, 8 * TILE_SIZE_4BPP},
    {4, 4 * TILE_SIZE_4BPP},
    {4, 0 * TILE_SIZE_4BPP},
    {4, CLOSED_DOOR_TILES_OFFSET},
    {}
};

static const struct DoorAnimFrame sDoorAnimFrames_CloseLarge[] = {
    {4, 16 * TILE_SIZE_4BPP},
    {4, 8 * TILE_SIZE_4BPP},
    {4, 0 * TILE_SIZE_4BPP},
    {4, CLOSED_DOOR_TILES_OFFSET},
    {}
};

static const u8 sDoorAnimPalettes_General[] = {2, 2, 2, 2, 2, 2, 2, 2};
static const u8 sDoorAnimPalettes_SlidingSingle[] = {3, 3, 3, 3, 3, 3, 3, 3};
static const u8 sDoorAnimPalettes_SlidingDouble[] = {3, 3, 3, 3, 3, 3, 3, 3};
static const u8 sDoorAnimPalettes_Pallet[] = {8, 8, 8, 8, 8, 8, 8, 8};
static const u8 sDoorAnimPalettes_OaksLab[] = {10, 10, 10, 10, 10, 10, 10, 10};
static const u8 sDoorAnimPalettes_Viridian[] = {8, 8, 8, 8, 8, 8, 8, 8};
static const u8 sDoorAnimPalettes_Pewter[] = {8, 8, 8, 8, 8, 8, 8, 8};
static const u8 sDoorAnimPalettes_Saffron[] = {8, 8, 8, 8, 8, 8, 8, 8};
static const u8 sDoorAnimPalettes_SilphCo[] = {3, 3, 3, 3, 3, 3, 3, 3};
static const u8 sDoorAnimPalettes_Cerulean[] = {12, 12, 12, 12, 12, 12, 12, 12};
static const u8 sDoorAnimPalettes_Lavender[] = {9, 9, 9, 9, 9, 9, 9, 9};
static const u8 sDoorAnimPalettes_Vermilion[] = {9, 9, 9, 9, 9, 9, 9, 9};
static const u8 sDoorAnimPalettes_PokemonFanClub[] = {9, 9, 9, 9, 9, 9, 9, 9};
static const u8 sDoorAnimPalettes_DeptStore[] = {3, 3, 3, 3, 3, 3, 3, 3};
static const u8 sDoorAnimPalettes_Fuchsia[] = {8, 8, 8, 8, 8, 8, 8, 8};
static const u8 sDoorAnimPalettes_SafariZone[] = {9, 9, 9, 9, 9, 9, 9, 9};
static const u8 sDoorAnimPalettes_CinnabarLab[] = {3, 3, 3, 3, 3, 3, 3, 3};
static const u8 sDoorAnimPalettes_DeptStoreElevator[] = {8, 8, 8, 8, 8, 8, 8, 8};
static const u8 sDoorAnimPalettes_CableClub[] = {8, 8, 8, 8, 8, 8, 8, 8};
static const u8 sDoorAnimPalettes_HideoutElevator[] = {12, 12, 2, 2, 2, 2, 2, 2};
static const u8 sDoorAnimPalettes_SSAnne[] = {7, 7, 7, 7, 7, 7, 7, 7};
static const u8 sDoorAnimPalettes_SilphCoElevator[] = {8, 8, 2, 2, 2, 2, 2, 2};
static const u8 sDoorAnimPalettes_Sevii123[] = {5, 5, 5, 5, 5, 5, 5, 5};
static const u8 sDoorAnimPalettes_JoyfulGameCorner[] = {3, 3, 3, 3, 3, 3, 3, 3};
static const u8 sDoorAnimPalettes_OneIslandPokeCenter[] = {3, 3, 3, 3, 3, 3, 3, 3};
static const u8 sDoorAnimPalettes_Sevii45[] = {5, 5, 5, 5, 5, 5, 5, 5};
static const u8 sDoorAnimPalettes_FourIslandDayCare[] = {3, 3, 3, 3, 3, 3, 3, 3};
static const u8 sDoorAnimPalettes_RocketWarehouse[] = {10, 10, 10, 10, 10, 10, 10, 10};
static const u8 sDoorAnimPalettes_Sevii67[] = {5, 5, 5, 5, 5, 5, 5, 5};
static const u8 sDoorAnimPalettes_Teleporter[] = {8, 8, 8, 8, 8, 8, 8, 8};
static const u8 sDoorAnimPalettes_TrainerTowerLobbyElevator[] = {8, 8, 2, 2, 2, 2, 2, 2};
static const u8 sDoorAnimPalettes_TrainerTowerRoofElevator[] = {11, 11, 2, 2, 2, 2, 2, 2};

static const struct DoorGraphics sDoorGraphics[] = {
    {METATILE_General_Door,                                DOOR_SOUND_NORMAL,  DOOR_SIZE_1x1, sDoorAnimTiles_General, sDoorAnimPalettes_General},
    {METATILE_General_SlidingSingleDoor,                   DOOR_SOUND_SLIDING, DOOR_SIZE_1x1, sDoorAnimTiles_SlidingSingle, sDoorAnimPalettes_SlidingSingle},
    {METATILE_General_SlidingDoubleDoor,                   DOOR_SOUND_SLIDING, DOOR_SIZE_1x1, sDoorAnimTiles_SlidingDouble, sDoorAnimPalettes_SlidingDouble},
    {METATILE_PalletTown_Door,                             DOOR_SOUND_NORMAL,  DOOR_SIZE_1x1, sDoorAnimTiles_Pallet, sDoorAnimPalettes_Pallet},
    {METATILE_PalletTown_OaksLabDoor,                      DOOR_SOUND_NORMAL,  DOOR_SIZE_1x1, sDoorAnimTiles_OaksLab, sDoorAnimPalettes_OaksLab},
    {METATILE_ViridianCity_Door,                           DOOR_SOUND_NORMAL,  DOOR_SIZE_1x1, sDoorAnimTiles_Viridian, sDoorAnimPalettes_Viridian},
    {METATILE_PewterCity_Door,                             DOOR_SOUND_NORMAL,  DOOR_SIZE_1x1, sDoorAnimTiles_Pewter, sDoorAnimPalettes_Pewter},
    {METATILE_SaffronCity_Door,                            DOOR_SOUND_NORMAL,  DOOR_SIZE_1x1, sDoorAnimTiles_Saffron, sDoorAnimPalettes_Saffron},
    {METATILE_SaffronCity_SilphCoDoor,                     DOOR_SOUND_SLIDING, DOOR_SIZE_1x1, sDoorAnimTiles_SilphCo, sDoorAnimPalettes_SilphCo},
    {METATILE_CeruleanCity_Door,                           DOOR_SOUND_NORMAL,  DOOR_SIZE_1x1, sDoorAnimTiles_Cerulean, sDoorAnimPalettes_Cerulean},
    {METATILE_LavenderTown_Door,                           DOOR_SOUND_NORMAL,  DOOR_SIZE_1x1, sDoorAnimTiles_Lavender, sDoorAnimPalettes_Lavender},
    {METATILE_VermilionCity_Door,                          DOOR_SOUND_NORMAL,  DOOR_SIZE_1x1, sDoorAnimTiles_Vermilion, sDoorAnimPalettes_Vermilion},
/*  Below was presumably intended for the door to the Pokemon Fan Club. The metatile is surrounded by metatiles for the fan club building.
    Its animation tiles are similar to the Vermilion door above, and the building on the map uses that metatile instead. The unused tiles
    have the pokeball above the door in view, but on the map the pokeball above the door is too high to be in view.
    The metatile below was subsequently re-used for the warp to enter the SS Anne from the harbor, which has no door. */
    {METATILE_VermilionCity_SSAnneWarp,                    DOOR_SOUND_NORMAL,  DOOR_SIZE_1x1, sDoorAnimTiles_PokemonFanClub, sDoorAnimPalettes_PokemonFanClub},
    {METATILE_CeladonCity_DeptStoreDoor,                   DOOR_SOUND_SLIDING, DOOR_SIZE_1x1, sDoorAnimTiles_DeptStore, sDoorAnimPalettes_DeptStore},
    {METATILE_FuchsiaCity_Door,                            DOOR_SOUND_NORMAL,  DOOR_SIZE_1x1, sDoorAnimTiles_Fuchsia, sDoorAnimPalettes_Fuchsia},
    {METATILE_FuchsiaCity_SafariZoneDoor,                  DOOR_SOUND_SLIDING, DOOR_SIZE_1x1, sDoorAnimTiles_SafariZone, sDoorAnimPalettes_SafariZone},
    {METATILE_CinnabarIsland_LabDoor,                      DOOR_SOUND_NORMAL,  DOOR_SIZE_1x1, sDoorAnimTiles_CinnabarLab, sDoorAnimPalettes_CinnabarLab},
    {METATILE_SeviiIslands123_Door,                        DOOR_SOUND_NORMAL,  DOOR_SIZE_1x1, sDoorAnimTiles_Sevii123, sDoorAnimPalettes_Sevii123},
    {METATILE_SeviiIslands123_GameCornerDoor,              DOOR_SOUND_SLIDING, DOOR_SIZE_1x1, sDoorAnimTiles_JoyfulGameCorner, sDoorAnimPalettes_JoyfulGameCorner},
    {METATILE_SeviiIslands123_PokeCenterDoor,              DOOR_SOUND_NORMAL,  DOOR_SIZE_1x1, sDoorAnimTiles_OneIslandPokeCenter, sDoorAnimPalettes_OneIslandPokeCenter},
    {METATILE_SeviiIslands45_Door,                         DOOR_SOUND_NORMAL,  DOOR_SIZE_1x1, sDoorAnimTiles_Sevii45, sDoorAnimPalettes_Sevii45},
    {METATILE_SeviiIslands45_DayCareDoor,                  DOOR_SOUND_NORMAL,  DOOR_SIZE_1x1, sDoorAnimTiles_FourIslandDayCare, sDoorAnimPalettes_FourIslandDayCare},
    {METATILE_SeviiIslands45_RocketWarehouseDoor_Unlocked, DOOR_SOUND_NORMAL,  DOOR_SIZE_1x1, sDoorAnimTiles_RocketWarehouse, sDoorAnimPalettes_RocketWarehouse},
    {METATILE_SeviiIslands67_Door,                         DOOR_SOUND_NORMAL,  DOOR_SIZE_1x1, sDoorAnimTiles_Sevii67, sDoorAnimPalettes_Sevii67},
    {METATILE_DepartmentStore_ElevatorDoor,                DOOR_SOUND_SLIDING, DOOR_SIZE_1x2, sDoorAnimTiles_DeptStoreElevator, sDoorAnimPalettes_DeptStoreElevator},
    {METATILE_PokemonCenter_CableClubDoor,                 DOOR_SOUND_SLIDING, DOOR_SIZE_1x2, sDoorAnimTiles_CableClub, sDoorAnimPalettes_CableClub},
    {METATILE_SilphCo_HideoutElevatorDoor,                 DOOR_SOUND_SLIDING, DOOR_SIZE_1x2, sDoorAnimTiles_HideoutElevator, sDoorAnimPalettes_HideoutElevator},
    {METATILE_SSAnne_Door,                                 DOOR_SOUND_NORMAL,  DOOR_SIZE_1x2, sDoorAnimTiles_SSAnne, sDoorAnimPalettes_SSAnne},
    {METATILE_SilphCo_ElevatorDoor,                        DOOR_SOUND_SLIDING, DOOR_SIZE_1x2, sDoorAnimTiles_SilphCoElevator, sDoorAnimPalettes_SilphCoElevator},
    {METATILE_SeaCottage_Teleporter_Door,                  DOOR_SOUND_SLIDING, DOOR_SIZE_1x2, sDoorAnimTiles_Teleporter, sDoorAnimPalettes_Teleporter},
    {METATILE_TrainerTower_LobbyElevatorDoor,              DOOR_SOUND_SLIDING, DOOR_SIZE_1x2, sDoorAnimTiles_TrainerTowerLobbyElevator, sDoorAnimPalettes_TrainerTowerLobbyElevator},
    {METATILE_TrainerTower_RoofElevatorDoor,               DOOR_SOUND_SLIDING, DOOR_SIZE_1x2, sDoorAnimTiles_TrainerTowerRoofElevator, sDoorAnimPalettes_TrainerTowerRoofElevator},
    {}
};

static void DrawDoor(const struct DoorGraphics *gfx, const struct DoorAnimFrame *frames, int x, int y)
{
    if (frames->tileOffset == CLOSED_DOOR_TILES_OFFSET)
        DrawClosedDoorTiles(gfx, x, y);
    else
    {
        CopyDoorTilesToVram(&gfx->tiles[frames->tileOffset]);
        DrawCurrentDoorAnimFrame(gfx, x, y, gfx->paletteNums);
    }
}

static void DrawClosedDoorTiles(const struct DoorGraphics *gfx, int x, int y)
{
    if (gfx->size == DOOR_SIZE_1x1)
        CurrentMapDrawMetatileAt(x, y);
    else
    {
        CurrentMapDrawMetatileAt(x, y);
        CurrentMapDrawMetatileAt(x, y - 1);
    }
}

// NOTE: The tiles of a door's animation must be copied to VRAM because they are
//       not already part of any given tileset. This means that if there are any
//       pre-existing tiles in this copied region that are visible when the door
//       animation is played, they will be overwritten.
#define DOOR_TILE_START (NUM_TILES_TOTAL - 8)

static void CopyDoorTilesToVram(const u8 *tiles)
{
    CpuFastCopy(tiles, (void *)(VRAM + TILE_OFFSET_4BPP(DOOR_TILE_START)), 8 * TILE_SIZE_4BPP);
}

static void DrawCurrentDoorAnimFrame(const struct DoorGraphics *gfx, int x, int y, const u8 *paletteNums)
{
    u16 tiles[8];
    if (gfx->size == DOOR_SIZE_1x1)
        BuildDoorTiles(tiles, DOOR_TILE_START, paletteNums);

    else
    {
        BuildDoorTiles(tiles, DOOR_TILE_START, paletteNums);
        DrawDoorMetatileAt(x, y - 1, tiles);
        BuildDoorTiles(tiles, DOOR_TILE_START + 4, &paletteNums[4]);
    }

    DrawDoorMetatileAt(x, y, tiles);
}

static void BuildDoorTiles(u16 *tiles, u16 tileNum, const u8 *paletteNums)
{
    int i;
    u16 tile;

    // Only the first 4 tiles of each metatile (bottom layer) actually use the door tiles
    for (i = 0; i < 4; i++)
    {
        tile = *(paletteNums++) << 12;
        tiles[i] = tile | (tileNum + i);
    }

    // The remaining tiles (top layer) always use tile 0 (with the same palette)
    for (; i < 8; i++)
    {
        tile = *(paletteNums++) << 12;
        tiles[i] = tile;
    }
}

#define tFramesHi data[0]
#define tFramesLo data[1]
#define tGfxHi    data[2]
#define tGfxLo    data[3]
#define tFrameId  data[4]
#define tCounter  data[5]
#define tX        data[6]
#define tY        data[7]

static void Task_AnimateDoor(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    const struct DoorAnimFrame *frames = (struct DoorAnimFrame *)((u16)tFramesHi << 16 | (u16)tFramesLo);
    const struct DoorGraphics *gfx = (struct DoorGraphics *)((u16)tGfxHi << 16 | (u16)tGfxLo);
    if (!AnimateDoorFrame(gfx, frames, data))
        DestroyTask(taskId);
}

static bool32 AnimateDoorFrame(const struct DoorGraphics *gfx, const struct DoorAnimFrame *frames, s16 *data)
{
    if (tCounter == 0)
        DrawDoor(gfx, &frames[tFrameId], tX, tY);

    if (tCounter == frames[tFrameId].duration)
    {
        tCounter = 0;
        tFrameId++;
        if (frames[tFrameId].duration == 0) // final frame has been reached
            return FALSE;
        else
            return TRUE;
    }

    tCounter++;
    return TRUE;
}

static const struct DoorGraphics *GetDoorGraphics(const struct DoorGraphics *gfx, u16 id)
{
    while (gfx->tiles != NULL)
    {
        if (gfx->metatileId == id)
            return gfx;
        gfx++;
    }
    return NULL;
}

static s8 StartDoorAnimationTask(const struct DoorGraphics *gfx, const struct DoorAnimFrame *frames, int x, int y)
{
    u8 taskId;
    s16 *data;
    if (FuncIsActiveTask(Task_AnimateDoor) == TRUE)
        return -1;

    taskId = CreateTask(Task_AnimateDoor, 80);
    data = gTasks[taskId].data;

    tX = x;
    tY = y;
    tFramesLo = (uintptr_t)frames;
    tFramesHi = (uintptr_t)frames >> 16;
    tGfxLo = (uintptr_t)gfx;
    tGfxHi = (uintptr_t)gfx >> 16;
    return taskId;
}

#undef tFramesHi
#undef tFramesLo
#undef tGfxHi
#undef tGfxLo
#undef tFrameId
#undef tCounter
#undef tX
#undef tY

static void DrawClosedDoor(const struct DoorGraphics *gfx, int x, int y)
{
    DrawClosedDoorTiles(gfx, x, y);
}

static void DrawOpenedDoor(const struct DoorGraphics *gfx, int x, int y)
{
    gfx = GetDoorGraphics(gfx, MapGridGetMetatileIdAt(x, y));
    if (gfx != NULL)
    {
        const struct DoorAnimFrame *frames = gfx->size == DOOR_SIZE_1x1 ? sDoorAnimFrames_OpenSmall : sDoorAnimFrames_OpenLarge;
        DrawDoor(gfx, GetLastDoorAnimFrame(frames), x, y);
    }
}

static const struct DoorAnimFrame *GetLastDoorAnimFrame(const struct DoorAnimFrame *frames)
{
    while (frames->duration != 0)
        frames++;
    return frames - 1;
}

static s8 AnimateDoorOpenInternal(const struct DoorGraphics *gfx, int x, int y)
{
    gfx = GetDoorGraphics(gfx, MapGridGetMetatileIdAt(x, y));
    if (gfx == NULL)
        return -1;
    else if (gfx->size == DOOR_SIZE_1x1)
        return StartDoorAnimationTask(gfx, sDoorAnimFrames_OpenSmall, x, y);
    else
        return StartDoorAnimationTask(gfx, sDoorAnimFrames_OpenLarge, x, y);
}

static s8 StartDoorCloseAnimation(const struct DoorGraphics *gfx, int x, int y)
{
    gfx = GetDoorGraphics(gfx, MapGridGetMetatileIdAt(x, y));
    if (gfx == NULL)
        return -1;
    else if (gfx->size == DOOR_SIZE_1x1)
        return StartDoorAnimationTask(gfx, sDoorAnimFrames_CloseSmall, x, y);
    else
        return StartDoorAnimationTask(gfx, sDoorAnimFrames_CloseLarge, x, y);
}

void FieldSetDoorOpened(int x, int y)
{
    if (MetatileBehavior_IsWarpDoor_2(MapGridGetMetatileBehaviorAt((s16)x, (s16)y)))
        DrawOpenedDoor(sDoorGraphics, x, y);
}

void FieldSetDoorClosed(int x, int y)
{
    if (MetatileBehavior_IsWarpDoor_2(MapGridGetMetatileBehaviorAt((s16)x, (s16)y)))
        DrawClosedDoor(sDoorGraphics, x, y);
}

s8 FieldAnimateDoorClose(int x, int y)
{
    if (!MetatileBehavior_IsWarpDoor_2(MapGridGetMetatileBehaviorAt((s16)x, (s16)y)))
        return -1;
    return StartDoorCloseAnimation(sDoorGraphics, x, y);
}

s8 FieldAnimateDoorOpen(int x, int y)
{
    if (!MetatileBehavior_IsWarpDoor_2(MapGridGetMetatileBehaviorAt((s16)x, (s16)y)))
        return -1;
    return AnimateDoorOpenInternal(sDoorGraphics, x, y);
}

bool8 FieldIsDoorAnimationRunning(void)
{
    return FuncIsActiveTask(Task_AnimateDoor);
}

u16 GetDoorSoundEffect(int x, int y)
{
    if (GetDoorSoundType(sDoorGraphics, x, y) == DOOR_SOUND_NORMAL)
        return SE_DOOR;
    else // DOOR_SOUND_SLIDING
        return SE_SLIDING_DOOR;
}

static s8 GetDoorSoundType(const struct DoorGraphics *gfx, int x, int y)
{
    gfx = GetDoorGraphics(gfx, MapGridGetMetatileIdAt(x, y));
    if (gfx == NULL)
        return -1;
    return gfx->sound;
}
