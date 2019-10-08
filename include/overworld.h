#ifndef GUARD_OVERWORLD_H
#define GUARD_OVERWORLD_H

#include "global.h"
#include "main.h"

struct UnkPlayerStruct
{
    u8 player_field_0;
    u8 player_field_1;
};

struct LinkPlayerMapObject
{
    u8 active;
    u8 linkPlayerId;
    u8 mapObjId;
    u8 mode;
};

struct UCoords32
{
    u32 x, y;
};

struct CreditsOverworldCmd
{
    s16 unk_0;
    u16 unk_2;
    u16 unk_4;
};

/* gDisableMapMusicChangeOnMapLoad */
#define MUSIC_DISABLE_OFF 0
#define MUSIC_DISABLE_STOP 1
#define MUSIC_DISABLE_KEEP 2

extern struct UCoords32 gDirectionToVectors[];

extern struct LinkPlayerMapObject gLinkPlayerMapObjects[4];
extern MainCallback gFieldCallback;

extern struct WarpData gUnknown_2031DBC;

extern u8 gUnknown_2031DE0;

void IncrementGameStat(u8 index);

void Overworld_SetMapObjTemplateCoords(u8, s16, s16);
void Overworld_SetMapObjTemplateMovementType(u8, u8);

void SetWarpDestination(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y);

void saved_warp2_set(int unused, s8 mapGroup, s8 mapNum, s8 warpId);
void SetDynamicWarpWithCoords(int unused, s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y);
void SetFixedDiveWarp(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y);
void SetFixedHoleWarp(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y);
void SetEscapeWarp(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y);
void Overworld_SetHealLocationWarp(u8);
void sub_8084DD4(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y);
void sub_8084E2C(s8, s8, s8, s8, s8);
void sub_8084E80(s8, s8, s8, s8, s8);
void sub_8084EBC(s16, s16);

void player_avatar_init_params_reset(void);

void Overworld_SetFlashLevel(s32 a1);
//u8 Overworld_GetFlashLevel(void);
void sub_8085524(u16);

void Overworld_SetSavedMusic(u16);
void Overworld_ChangeMusicToDefault(void);
void Overworld_ChangeMusicTo(u16);

bool32 IsUpdateLinkStateCBActive(void);

void strange_npc_table_clear(void);
const struct MapHeader *get_mapheader_by_bank_and_number(u16, u16);
void FieldObjectMoveDestCoords(struct MapObject *, u32, s16 *, s16 *);
void sub_8086230(void);
void CB2_ReturnToField(void);
bool32 sub_8087598(void);
void CB2_ReturnToFieldContinueScriptPlayMapMusic(void);
void WarpIntoMap(void);
u8 get_map_light_level_by_bank_and_number(s8 mapGroup, s8 mapNum);
void sub_8086194(void);
void sub_8084CCC(u8 spawn);
void warp1_set_2(s8 mapGroup, s8 mapNum, s8 warpNum);
void c2_load_new_map(void);
void copy_saved_warp2_bank_and_enter_x_to_warp1(u8 unused);
void mapldr_default(void);

u32 GetGameStat(u8 statId);
u32 SetGameStat(u8 statId, u32 value);

void CB2_ContinueSavedGame(void);
void sub_8055D5C(struct WarpData *);
void sub_80572A8(void);
void sub_805726C(void);
void sub_8057430(void);
void Overworld_PlaySpecialMapMusic(void);

u8 GetCurrentRegionMapSectionId(void);

void SetCurrentMapLayout(u16 mapDataId);
void SetWarpDestinationToFixedHoleWarp(s16 x, s16 y);

void ResetInitialPlayerAvatarState(void);
void sub_8055D40(u16 mapDataId);
void CleanupOverworldWindowsAndTilemaps(void);
u32 sub_8054C04(void);

extern u8 gDisableMapMusicChangeOnMapLoad;
extern u8 gUnknown_2036E28;

extern void (*gFieldCallback)(void);
extern bool8 (* gFieldCallback2)(void);

void SetLastHealLocationWarp(u8 healLocaionId);
void sub_8055864(u8 mapGroup, u8 mapNum);
void CB2_Overworld(void);
void CB2_OverworldBasic(void);
void CB2_NewGame(void);
bool8 Overworld_MapTypeAllowsTeleportAndFly(u8 mapType);
void Overworld_ResetStateAfterTeleport(void);

void Overworld_FadeOutMapMusic(void);
void CB2_LoadMap(void);
bool8 sub_8055FC4(void);
bool8 is_light_level_8_or_9(u8 mapType);
bool32 sub_8055C9C(void);
void Overworld_ResetStateAfterDigEscRope(void);
bool32 sub_8058244(void);
u8 GetCurrentMapType(void);

u8 get_map_light_from_warp0(void);
const struct MapHeader *warp1_get_mapheader(void);
void sub_8055F88(void);
void sub_8056788(void);
void ResetGameStats(void);

void Overworld_CreditsMainCB(void);
bool32 Overworld_DoScrollSceneForCredits(u8 *, const struct CreditsOverworldCmd *, u8);

bool32 sub_8058318(void);

#endif //GUARD_OVERWORLD_H
