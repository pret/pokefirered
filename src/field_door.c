#include "global.h"
#include "field_camera.h"
#include "task.h"
#include "fieldmap.h"
#include "metatile_behavior.h"
#include "constants/songs.h"
#include "constants/metatile_labels.h"

#define DOOR_SOUND_NORMAL  0
#define DOOR_SOUND_SLIDING 1

struct DoorAnimFrame
{
    u8 duration;
    u16 tile;
};

struct DoorGraphics
{
    u16 metatileId;
    u8 sound;
    u8 size;
    const u8 * tiles;
    const u8 * palettes;
};

static void DrawDoorDefaultImage(const struct DoorGraphics * gfx, int x, int y);
static void LoadDoorFrameTiles(const u8 *a0);
static void SetDoorFramePalettes(const struct DoorGraphics * gfx, int x, int y, const u8 *a3);
static void BufferDoorFrameTilesWithPalettes(u16 *a0, u16 a1, const u8 *a2);
static bool32 PlayDoorAnimationFrame(const struct DoorGraphics * gfx, const struct DoorAnimFrame * frames, s16 *data);
static const struct DoorAnimFrame * SeekToEndOfDoorAnim(const struct DoorAnimFrame * frames);
static s8 GetDoorSoundType(const struct DoorGraphics * gfx, int x, int y);

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

static const struct DoorAnimFrame sDoorAnimFrames_OpenSmall[] = {
    {4, 0xFFFF},
    {4, 0x0000},
    {4, 0x0080},
    {4, 0x0100},
    {}
};

static const struct DoorAnimFrame sDoorAnimFrames_OpenLarge[] = {
    {4, 0xFFFF},
    {4, 0x0000},
    {4, 0x0100},
    {4, 0x0200},
    {}
};

static const struct DoorAnimFrame sDoorAnimFrames_CloseSmall[] = {
    {4, 0x0100},
    {4, 0x0080},
    {4, 0x0000},
    {4, 0xFFFF},
    {}
};

static const struct DoorAnimFrame sDoorAnimFrames_CloseLarge[] = {
    {4, 0x0200},
    {4, 0x0100},
    {4, 0x0000},
    {4, 0xFFFF},
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
    {METATILE_General_Door,                                DOOR_SOUND_NORMAL,  0, sDoorAnimTiles_General, sDoorAnimPalettes_General},
    {METATILE_General_SlidingSingleDoor,                   DOOR_SOUND_SLIDING, 0, sDoorAnimTiles_SlidingSingle, sDoorAnimPalettes_SlidingSingle},
    {METATILE_General_SlidingDoubleDoor,                   DOOR_SOUND_SLIDING, 0, sDoorAnimTiles_SlidingDouble, sDoorAnimPalettes_SlidingDouble},
    {METATILE_PalletTown_Door,                             DOOR_SOUND_NORMAL,  0, sDoorAnimTiles_Pallet, sDoorAnimPalettes_Pallet},
    {METATILE_PalletTown_OaksLabDoor,                      DOOR_SOUND_NORMAL,  0, sDoorAnimTiles_OaksLab, sDoorAnimPalettes_OaksLab},
    {METATILE_ViridianCity_Door,                           DOOR_SOUND_NORMAL,  0, sDoorAnimTiles_Viridian, sDoorAnimPalettes_Viridian},
    {METATILE_PewterCity_Door,                             DOOR_SOUND_NORMAL,  0, sDoorAnimTiles_Pewter, sDoorAnimPalettes_Pewter},
    {METATILE_SaffronCity_Door,                            DOOR_SOUND_NORMAL,  0, sDoorAnimTiles_Saffron, sDoorAnimPalettes_Saffron},
    {METATILE_SaffronCity_SilphCoDoor,                     DOOR_SOUND_SLIDING, 0, sDoorAnimTiles_SilphCo, sDoorAnimPalettes_SilphCo},
    {METATILE_CeruleanCity_Door,                           DOOR_SOUND_NORMAL,  0, sDoorAnimTiles_Cerulean, sDoorAnimPalettes_Cerulean},
    {METATILE_LavenderTown_Door,                           DOOR_SOUND_NORMAL,  0, sDoorAnimTiles_Lavender, sDoorAnimPalettes_Lavender},
    {METATILE_VermilionCity_Door,                          DOOR_SOUND_NORMAL,  0, sDoorAnimTiles_Vermilion, sDoorAnimPalettes_Vermilion},
    {METATILE_VermilionCity_PokemonFanClubDoor,            DOOR_SOUND_NORMAL,  0, sDoorAnimTiles_PokemonFanClub, sDoorAnimPalettes_PokemonFanClub},
    {METATILE_CeladonCity_DeptStoreDoor,                   DOOR_SOUND_SLIDING, 0, sDoorAnimTiles_DeptStore, sDoorAnimPalettes_DeptStore},
    {METATILE_FuchsiaCity_Door,                            DOOR_SOUND_NORMAL,  0, sDoorAnimTiles_Fuchsia, sDoorAnimPalettes_Fuchsia},
    {METATILE_FuchsiaCity_SafariZoneDoor,                  DOOR_SOUND_SLIDING, 0, sDoorAnimTiles_SafariZone, sDoorAnimPalettes_SafariZone},
    {METATILE_CinnabarIsland_LabDoor,                      DOOR_SOUND_NORMAL,  0, sDoorAnimTiles_CinnabarLab, sDoorAnimPalettes_CinnabarLab},
    {METATILE_SeviiIslands123_Door,                        DOOR_SOUND_NORMAL,  0, sDoorAnimTiles_Sevii123, sDoorAnimPalettes_Sevii123},
    {METATILE_SeviiIslands123_GameCornerDoor,              DOOR_SOUND_SLIDING, 0, sDoorAnimTiles_JoyfulGameCorner, sDoorAnimPalettes_JoyfulGameCorner},
    {METATILE_SeviiIslands123_PokeCenterDoor,              DOOR_SOUND_NORMAL,  0, sDoorAnimTiles_OneIslandPokeCenter, sDoorAnimPalettes_OneIslandPokeCenter},
    {METATILE_SeviiIslands45_Door,                         DOOR_SOUND_NORMAL,  0, sDoorAnimTiles_Sevii45, sDoorAnimPalettes_Sevii45},
    {METATILE_SeviiIslands45_DayCareDoor,                  DOOR_SOUND_NORMAL,  0, sDoorAnimTiles_FourIslandDayCare, sDoorAnimPalettes_FourIslandDayCare},
    {METATILE_SeviiIslands45_RocketWarehouseDoor_Unlocked, DOOR_SOUND_NORMAL,  0, sDoorAnimTiles_RocketWarehouse, sDoorAnimPalettes_RocketWarehouse},
    {METATILE_SeviiIslands67_Door,                         DOOR_SOUND_NORMAL,  0, sDoorAnimTiles_Sevii67, sDoorAnimPalettes_Sevii67},
    {METATILE_DepartmentStore_ElevatorDoor,                DOOR_SOUND_SLIDING, 1, sDoorAnimTiles_DeptStoreElevator, sDoorAnimPalettes_DeptStoreElevator},
    {METATILE_PokemonCenter_CableClubDoor,                 DOOR_SOUND_SLIDING, 1, sDoorAnimTiles_CableClub, sDoorAnimPalettes_CableClub},
    {METATILE_SilphCo_HideoutElevatorDoor,                 DOOR_SOUND_SLIDING, 1, sDoorAnimTiles_HideoutElevator, sDoorAnimPalettes_HideoutElevator},
    {METATILE_SSAnne_Door,                                 DOOR_SOUND_NORMAL,  1, sDoorAnimTiles_SSAnne, sDoorAnimPalettes_SSAnne},
    {METATILE_SilphCo_ElevatorDoor,                        DOOR_SOUND_SLIDING, 1, sDoorAnimTiles_SilphCoElevator, sDoorAnimPalettes_SilphCoElevator},
    {METATILE_SeaCottage_Teleporter_Door,                  DOOR_SOUND_SLIDING, 1, sDoorAnimTiles_Teleporter, sDoorAnimPalettes_Teleporter},
    {METATILE_TrainerTower_LobbyElevatorDoor,              DOOR_SOUND_SLIDING, 1, sDoorAnimTiles_TrainerTowerLobbyElevator, sDoorAnimPalettes_TrainerTowerLobbyElevator},
    {METATILE_TrainerTower_RoofElevatorDoor,               DOOR_SOUND_SLIDING, 1, sDoorAnimTiles_TrainerTowerRoofElevator, sDoorAnimPalettes_TrainerTowerRoofElevator},
    {}
};

static void UpdateDrawDoorFrame(const struct DoorGraphics * gfx, const struct DoorAnimFrame * frames, int x, int y)
{
    if (frames->tile == 0xFFFF)
    {
        DrawDoorDefaultImage(gfx, x, y);
    }
    else
    {
        LoadDoorFrameTiles(&gfx->tiles[frames->tile]);
        SetDoorFramePalettes(gfx, x, y, gfx->palettes);
    }
}

static void DrawDoorDefaultImage(const struct DoorGraphics * gfx, int x, int y)
{
    if (gfx->size == 0)
    {
        CurrentMapDrawMetatileAt(x, y);
    }
    else
    {
        CurrentMapDrawMetatileAt(x, y);
        CurrentMapDrawMetatileAt(x, y - 1);
    }
}

static void LoadDoorFrameTiles(const u8 *a0)
{
    CpuFastCopy(a0, (void *)(BG_VRAM + 0x7F00), 0x100);
}

static void SetDoorFramePalettes(const struct DoorGraphics * gfx, int x, int y, const u8 *a3)
{
    u16 sp00[8];
    if (gfx->size == 0)
    {
        BufferDoorFrameTilesWithPalettes(sp00, 0x3F8, a3);
    }
    else
    {
        BufferDoorFrameTilesWithPalettes(sp00, 0x3F8, a3);
        DrawDoorMetatileAt(x, y - 1, sp00);
        BufferDoorFrameTilesWithPalettes(sp00, 0x3FC, a3 + 4);
    }
    DrawDoorMetatileAt(x, y, sp00);
}

static void BufferDoorFrameTilesWithPalettes(u16 *a0, u16 a1, const u8 *a2)
{
    int i;
    u16 tile;
    for (i = 0; i < 4; i++)
    {
        tile = *(a2++) << 12;
        a0[i] = tile | (a1 + i);
    }
    for (; i < 8; i++)
    {
        tile = *(a2++) << 12;
        a0[i] = tile;
    }
}

static void Task_AnimateDoor(u8 taskId)
{
    s16 *data = (void *)gTasks[taskId].data;
    const struct DoorAnimFrame * frames = (const void *)(((u16)data[0] << 16) | (u16)data[1]);
    const struct DoorGraphics * gfx = (const void *)(((u16)data[2] << 16) | (u16)data[3]);
    if (!PlayDoorAnimationFrame(gfx, frames, data))
        DestroyTask(taskId);
}

static bool32 PlayDoorAnimationFrame(const struct DoorGraphics * gfx, const struct DoorAnimFrame * frames, s16 *data)
{
    if (data[5] == 0)
    {
        UpdateDrawDoorFrame(gfx, &frames[data[4]], data[6], data[7]);
    }
    if (data[5] == frames[data[4]].duration)
    {
        data[5] = 0;
        data[4]++;
        if (frames[data[4]].duration == 0)
            return FALSE;
    }
    else
    {
        data[5]++;
    }
    return TRUE;
}

static const struct DoorGraphics * GetDoorGraphics(const struct DoorGraphics * gfx, u16 id)
{
    while (gfx->tiles != NULL)
    {
        if (gfx->metatileId == id)
            return gfx;
        gfx++;
    }
    return NULL;
}

static s8 StartDoorAnimationTask(const struct DoorGraphics * gfx, const struct DoorAnimFrame * frames, int x, int y)
{
    u8 taskId;
    s16 *data;
    if (FuncIsActiveTask(Task_AnimateDoor) == TRUE)
        return -1;

    taskId = CreateTask(Task_AnimateDoor, 80);
    data = gTasks[taskId].data;

    data[6] = x;
    data[7] = y;
    data[1] = (uintptr_t)frames;
    data[0] = (uintptr_t)frames >> 16;
    data[3] = (uintptr_t)gfx;
    data[2] = (uintptr_t)gfx >> 16;
    return taskId;
}

static void DrawOpenedDoor(const struct DoorGraphics * gfx, int x, int y)
{
    gfx = GetDoorGraphics(gfx, MapGridGetMetatileIdAt(x, y));
    if (gfx != NULL)
    {
        UpdateDrawDoorFrame(gfx, SeekToEndOfDoorAnim(gfx->size == 0 ? sDoorAnimFrames_OpenSmall : sDoorAnimFrames_OpenLarge), x, y);
    }
}

static const struct DoorAnimFrame * SeekToEndOfDoorAnim(const struct DoorAnimFrame * frames)
{
    while (frames->duration != 0)
        frames++;
    return frames - 1;
}

static s8 AnimateDoorOpenInternal(const struct DoorGraphics * gfx, int x, int y)
{
    gfx = GetDoorGraphics(gfx, MapGridGetMetatileIdAt(x, y));
    if (gfx == NULL)
        return -1;
    else if (gfx->size == 0)
        return StartDoorAnimationTask(gfx, sDoorAnimFrames_OpenSmall, x, y);
    else
        return StartDoorAnimationTask(gfx, sDoorAnimFrames_OpenLarge, x, y);
}

static s8 AnimateDoorCloseInternal(const struct DoorGraphics * gfx, int x, int y)
{
    gfx = GetDoorGraphics(gfx, MapGridGetMetatileIdAt(x, y));
    if (gfx == NULL)
        return -1;
    else if (gfx->size == 0)
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
        DrawDoorDefaultImage(sDoorGraphics, x, y);
}

s8 FieldAnimateDoorClose(int x, int y)
{
    if (!MetatileBehavior_IsWarpDoor_2(MapGridGetMetatileBehaviorAt((s16)x, (s16)y)))
        return -1;
    return AnimateDoorCloseInternal(sDoorGraphics, x, y);
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

static s8 GetDoorSoundType(const struct DoorGraphics * gfx, int x, int y)
{
    gfx = GetDoorGraphics(gfx, MapGridGetMetatileIdAt(x, y));
    if (gfx == NULL)
        return -1;
    return gfx->sound;
}
