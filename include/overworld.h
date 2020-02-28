#ifndef GUARD_OVERWORLD_H
#define GUARD_OVERWORLD_H

#include "global.h"
#include "main.h"

#define LINK_KEY_CODE_NULL 0x00
#define LINK_KEY_CODE_EMPTY 0x11
#define LINK_KEY_CODE_DPAD_DOWN 0x12
#define LINK_KEY_CODE_DPAD_UP 0x13
#define LINK_KEY_CODE_DPAD_LEFT 0x14
#define LINK_KEY_CODE_DPAD_RIGHT 0x15
#define LINK_KEY_CODE_UNK_2 0x16
#define LINK_KEY_CODE_EXIT_ROOM 0x17
#define LINK_KEY_CODE_START_BUTTON 0x18
#define LINK_KEY_CODE_A_BUTTON 0x19
#define LINK_KEY_CODE_UNK_4 0x1A // I'd guess this is the B button?

// These two are a hack to stop user input until link stuff can be
// resolved.
#define LINK_KEY_CODE_HANDLE_RECV_QUEUE 0x1B
#define LINK_KEY_CODE_HANDLE_SEND_QUEUE 0x1C
#define LINK_KEY_CODE_UNK_7 0x1D
#define LINK_KEY_CODE_UNK_8 0x1E

#define MOVEMENT_MODE_FREE 0
#define MOVEMENT_MODE_FROZEN 1
#define MOVEMENT_MODE_SCRIPTED 2

struct UnkPlayerStruct
{
    u8 player_field_0;
    u8 player_field_1;
};

struct LinkPlayerObjectEvent
{
    u8 active;
    u8 linkPlayerId;
    u8 mapObjId;
    u8 mode;
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

extern struct LinkPlayerObjectEvent gLinkPlayerObjectEvents[4];
extern MainCallback gFieldCallback;

extern struct WarpData gUnknown_2031DB4;
extern struct WarpData gUnknown_2031DBC;

extern u8 gUnknown_2031DE0;
extern u8 gFieldLinkPlayerCount;
extern u8 gLocalLinkPlayerId;

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
void sub_80555E0(void);
void copy_saved_warp3_bank_and_enter_x_to_warp1(void);
u8 IsMapTypeOutdoors(u8 mapType);
void sav1_reset_battle_music_maybe(void);
bool32 sub_8056124(u16 song);

void player_avatar_init_params_reset(void);

void Overworld_SetFlashLevel(s32 a1);
u8 Overworld_GetFlashLevel(void);

void Overworld_SetSavedMusic(u16);
void Overworld_ChangeMusicToDefault(void);
void Overworld_ChangeMusicTo(u16);

bool32 IsUpdateLinkStateCBActive(void);

void strange_npc_table_clear(void);
const struct MapHeader *Overworld_GetMapHeaderByGroupAndId(u16, u16);
void ObjectEventMoveDestCoords(struct ObjectEvent *, u32, s16 *, s16 *);
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

void SetCurrentMapLayout(u16 mapLayoutId);
void SetWarpDestinationToFixedHoleWarp(s16 x, s16 y);

void ResetInitialPlayerAvatarState(void);
void sub_8055D40(u16 mapLayoutId);
void CleanupOverworldWindowsAndTilemaps(void);
u32 ComputeWhiteOutMoneyLoss(void);

extern u8 gDisableMapMusicChangeOnMapLoad;
extern u8 gUnknown_2036E28;

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
bool8 BGMusicStopped(void);
bool8 IsMapTypeIndoors(u8 mapType);
bool32 sub_8055C9C(void);
void Overworld_ResetStateAfterDigEscRope(void);
bool32 sub_8058244(void);
u8 GetCurrentMapType(void);

u8 get_map_light_from_warp0(void);
const struct MapHeader *warp1_get_mapheader(void);
void TryFadeOutOldMapMusic(void);
void CB2_ReturnToFieldCableClub(void);
void ResetGameStats(void);

void Overworld_CreditsMainCB(void);
bool32 Overworld_DoScrollSceneForCredits(u8 *, const struct CreditsOverworldCmd *, u8);

bool32 sub_8058318(void);

void CB2_ReturnToFieldWithOpenMenu(void);
void CB2_WhiteOut(void);
void c2_8056854(void);
void sub_8054F38(u32 newKey);
void sub_8055778(int);

void sub_8055738(u8 loc);

void sub_8056078(void *, void *);
void sub_805546C(u8 a0);
bool32 sub_80582E0(void);
bool32 sub_8058274(void);
u8 GetCurrentMapBattleScene(void);
void Overworld_ResetStateAfterFly(void);
bool8 sub_8055B38(u16 metatileBehavior);

extern u16 gHeldKeyCodeToSend;

#endif //GUARD_OVERWORLD_H
