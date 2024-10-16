#include "global.h"
#include "gflib.h"
#include "bg_regs.h"
#include "cable_club.h"
#include "credits.h"
#include "event_data.h"
#include "event_object_movement.h"
#include "event_scripts.h"
#include "field_camera.h"
#include "field_control_avatar.h"
#include "field_effect.h"
#include "field_fadetransition.h"
#include "field_message_box.h"
#include "field_player_avatar.h"
#include "field_screen_effect.h"
#include "field_specials.h"
#include "field_tasks.h"
#include "field_weather.h"
#include "fieldmap.h"
#include "fldeff.h"
#include "heal_location.h"
#include "help_system.h"
#include "link.h"
#include "link_rfu.h"
#include "load_save.h"
#include "m4a.h"
#include "map_name_popup.h"
#include "map_preview_screen.h"
#include "metatile_behavior.h"
#include "money.h"
#include "new_game.h"
#include "new_menu_helpers.h"
#include "overworld.h"
#include "play_time.h"
#include "quest_log.h"
#include "quest_log_objects.h"
#include "random.h"
#include "renewable_hidden_items.h"
#include "roamer.h"
#include "safari_zone.h"
#include "save_location.h"
#include "scanline_effect.h"
#include "script.h"
#include "script_pokemon_util.h"
#include "start_menu.h"
#include "tileset_anims.h"
#include "trainer_pokemon_sprites.h"
#include "vs_seeker.h"
#include "wild_encounter.h"
#include "constants/cable_club.h"
#include "constants/event_objects.h"
#include "constants/maps.h"
#include "constants/region_map_sections.h"
#include "constants/songs.h"
#include "constants/sound.h"

#define PLAYER_LINK_STATE_IDLE 0x80
#define PLAYER_LINK_STATE_BUSY 0x81
#define PLAYER_LINK_STATE_READY 0x82
#define PLAYER_LINK_STATE_EXITING_ROOM 0x83

#define FACING_NONE 0
#define FACING_UP 1
#define FACING_DOWN 2
#define FACING_LEFT 3
#define FACING_RIGHT 4
#define FACING_FORCED_UP 7
#define FACING_FORCED_DOWN 8
#define FACING_FORCED_LEFT 9
#define FACING_FORCED_RIGHT 10

typedef u16 (*KeyInterCB)(u32 key);

struct InitialPlayerAvatarState
{
    u8 transitionFlags;
    u8 direction;
    bool8 hasDirectionSet;
};

struct CableClubPlayer
{
    u8 playerId;
    bool8 isLocalPlayer;
    u8 movementMode;
    u8 facing;
    struct MapPosition pos;
    u16 metatileBehavior;
};

EWRAM_DATA struct WarpData gLastUsedWarp = {};
static EWRAM_DATA struct WarpData sWarpDestination = {};
static EWRAM_DATA struct WarpData sFixedDiveWarp = {};
static EWRAM_DATA struct WarpData sFixedHoleWarp = {};

static EWRAM_DATA struct InitialPlayerAvatarState sInitialPlayerAvatarState = {};

EWRAM_DATA bool8 gDisableMapMusicChangeOnMapLoad = MUSIC_DISABLE_OFF;
static EWRAM_DATA u16 sAmbientCrySpecies = SPECIES_NONE;
static EWRAM_DATA bool8 sIsAmbientCryWaterMon = FALSE;

ALIGNED(4) EWRAM_DATA bool8 gExitStairsMovementDisabled = FALSE;
static EWRAM_DATA const struct CreditsOverworldCmd *sCreditsOverworld_Script = NULL;
static EWRAM_DATA s16 sCreditsOverworld_CmdLength = 0;
static EWRAM_DATA s16 sCreditsOverworld_CmdIndex = 0;

EWRAM_DATA struct LinkPlayerObjectEvent gLinkPlayerObjectEvents[4] = {};

COMMON_DATA u16 *gBGTilemapBuffers1 = NULL;
COMMON_DATA u16 *gBGTilemapBuffers2 = NULL;
COMMON_DATA u16 *gBGTilemapBuffers3 = NULL;
COMMON_DATA void (*gFieldCallback)(void) = NULL;
COMMON_DATA bool8 (*gFieldCallback2)(void) = NULL;
COMMON_DATA u16 gHeldKeyCodeToSend = 0;
COMMON_DATA u8 gLocalLinkPlayerId = 0;
COMMON_DATA u8 gFieldLinkPlayerCount = 0;

static u8 sPlayerLinkStates[MAX_LINK_PLAYERS];
static KeyInterCB sPlayerKeyInterceptCallback;
static bool8 sReceivingFromLink;
static u8 sRfuKeepAliveTimer;

static u8 CountBadgesForOverworldWhiteOutLossCalculation(void);
static void Overworld_ResetStateAfterWhitingOut(void);
static void Overworld_SetWhiteoutRespawnPoint(void);
static u8 GetAdjustedInitialTransitionFlags(struct InitialPlayerAvatarState *playerStruct, u16 metatileBehavior, u8 mapType);
static u8 GetAdjustedInitialDirection(struct InitialPlayerAvatarState *playerStruct, u8 transitionFlags, u16 metatileBehavior, u8 mapType);
static u16 GetCenterScreenMetatileBehavior(void);
static void SetDefaultFlashLevel(void);
static void Overworld_TryMapConnectionMusicTransition(void);
static void ChooseAmbientCrySpecies(void);

static void CB2_Overworld(void);
static void CB2_LoadMap2(void);
static void CB2_LoadMapOnReturnToFieldCableClub(void);
static void CB2_ReturnToFieldLocal(void);
static void CB2_ReturnToFieldLink(void);
static void FieldClearVBlankHBlankCallbacks(void);
static void SetFieldVBlankCallback(void);
static void VBlankCB_Field(void);

static bool32 LoadMapInStepsLink(u8 *state);
static bool32 ReturnToFieldLocal(u8 *state);
static bool32 ReturnToFieldLink(u8 *state);
static void DoMapLoadLoop(u8 *state);
static void MoveSaveBlocks_ResetHeap_(void);
static void ResetScreenForMapLoad(void);
static void InitViewGraphics(void);
static void InitOverworldGraphicsRegisters(void);
static void ResumeMap(bool32 inLink);
static void InitObjectEventsLink(void);
static void InitObjectEventsLocal(void);
static void ReloadObjectsAndRunReturnToFieldMapScript(void);
static void SetCameraToTrackPlayer(void);
static void SetCameraToTrackGuestPlayer(void);
static void SetCameraToTrackGuestPlayer_2(void);
static void OffsetCameraFocusByLinkPlayerId(void);
static void SpawnLinkPlayers(void);
static void CreateLinkPlayerSprites(void);
static void CB2_LoadMapForQLPlayback(void);
static void DoLoadMap_QLPlayback(u8 *state);
static bool32 LoadMap_QLPlayback(u8 *state);
static bool32 SetUpScrollSceneForCredits(u8 *state, u8 unused);
static bool8 MapLdr_Credits(void);
static void CameraCB_CreditsPan(struct CameraObject * camera);
static void Task_OvwldCredits_FadeOut(u8 taskId);
static void Task_OvwldCredits_WaitFade(u8 taskId);

static void CB1_UpdateLinkState(void);
static void ResetAllMultiplayerState(void);
static void ClearAllPlayerKeys(void);
static void SetKeyInterceptCallback(KeyInterCB callback);
static void ResetAllLinkStates(void);
static void UpdateAllLinkPlayers(u16 *linkKeys, s32 selfId);
static void UpdateHeldKeyCode(u16 interceptedKeys);
static u32 GetLinkSendQueueLength(void);
static u16 GetDirectionForDpadKey(u16 key);
static void SetPlayerFacingDirection(u8 linkPlayerId, u8 setFacing);
static void ResetPlayerHeldKeys(u16 *linkKeys);
static u16 KeyInterCB_SelfIdle(u32 linkPlayerId);
static u16 KeyInterCB_DeferToEventScript(u32 linkPlayerId);
static u16 KeyInterCB_DeferToRecvQueue(u32 linkPlayerId);
static u16 KeyInterCB_DeferToSendQueue(u32 linkPlayerId);
static void LoadCableClubPlayer(s32 i, s32 selfId, struct CableClubPlayer *player);
static bool32 PlayerIsAtSouthExit(struct CableClubPlayer *player);
static const u8 *TryGetTileEventScript(struct CableClubPlayer *player);
static const u8 *TryInteractWithPlayer(struct CableClubPlayer *player);
static bool32 IsCableClubPlayerUnfrozen(struct CableClubPlayer *player);
static bool32 CanCableClubPlayerPressStart(struct CableClubPlayer *player);
static u16 GetDirectionForEventScript(const u8 *script);
static void InitLinkPlayerQueueScript(void);
static void CreateConfirmLeaveTradeRoomPrompt(void);
static void InitLinkRoomStartMenuScript(void);
static void InitMenuBasedScript(const u8 *script);
static void RunInteractLocalPlayerScript(const u8 *script);
static void RunTerminateLinkScript(void);
static void SpawnLinkPlayerObjectEvent(u8 i, s16 x, s16 y, u8 gender);
static void InitLinkPlayerObjectEventPos(struct ObjectEvent *objEvent, s16 x, s16 y);
static u8 GetSpriteForLinkedPlayer(u8 linkPlayerId);
static void GetLinkPlayerCoords(u8 linkPlayerId, u16 *x, u16 *y);
static u8 GetLinkPlayerFacingDirection(u8 linkPlayerId);
static u8 GetLinkPlayerElevation(u8 linkPlayerId);
static u8 GetLinkPlayerIdAt(s16 x, s16 y);
static void CreateLinkPlayerSprite(u8 i, u8 version);
static u8 MovementEventModeCB_Normal(struct LinkPlayerObjectEvent *, struct ObjectEvent *, u8);
static u8 MovementEventModeCB_Ignored(struct LinkPlayerObjectEvent *, struct ObjectEvent *, u8);
static u8 MovementEventModeCB_Normal_2(struct LinkPlayerObjectEvent *, struct ObjectEvent *, u8);
static u8 FacingHandler_DoNothing(struct LinkPlayerObjectEvent *, struct ObjectEvent *, u8);
static u8 FacingHandler_DpadMovement(struct LinkPlayerObjectEvent *, struct ObjectEvent *, u8);
static u8 FacingHandler_ForcedFacingChange(struct LinkPlayerObjectEvent *, struct ObjectEvent *, u8);
static void MovementStatusHandler_EnterFreeMode(struct LinkPlayerObjectEvent *, struct ObjectEvent *);
static void MovementStatusHandler_TryAdvanceScript(struct LinkPlayerObjectEvent *, struct ObjectEvent *);
static u8 FlipVerticalAndClearForced(u8 newFacing, u8 oldFacing);
static u8 LinkPlayerDetectCollision(u8 selfObjEventId, u8 a2, s16 x, s16 y);
static void SpriteCB_LinkPlayer(struct Sprite *sprite);

extern const struct MapLayout * gMapLayouts[];
extern const struct MapHeader *const *gMapGroups[];

// Routines related to game state on warping in

static const u8 sWhiteOutMoneyLossMultipliers[] = {
     2,
     4,
     6,
     9,
    12,
    16,
    20,
    25,
    30
};

static const u16 sWhiteOutMoneyLossBadgeFlagIDs[] = {
    FLAG_BADGE01_GET,
    FLAG_BADGE02_GET,
    FLAG_BADGE03_GET,
    FLAG_BADGE04_GET,
    FLAG_BADGE05_GET,
    FLAG_BADGE06_GET,
    FLAG_BADGE07_GET,
    FLAG_BADGE08_GET
};

static void DoWhiteOut(void)
{
    RunScriptImmediately(EventScript_ResetEliteFourEnd);
    RemoveMoney(&gSaveBlock1Ptr->money, ComputeWhiteOutMoneyLoss());
    HealPlayerParty();
    Overworld_ResetStateAfterWhitingOut();
    Overworld_SetWhiteoutRespawnPoint();
    WarpIntoMap();
}

u32 ComputeWhiteOutMoneyLoss(void)
{
    u8 nbadges = CountBadgesForOverworldWhiteOutLossCalculation();
    u8 toplevel = GetPlayerPartyHighestLevel();
    u32 losings = toplevel * 4 * sWhiteOutMoneyLossMultipliers[nbadges];
    u32 money = GetMoney(&gSaveBlock1Ptr->money);
    if (losings > money)
        losings = money;
    return losings;
}

void OverworldWhiteOutGetMoneyLoss(void)
{
    u32 losings = ComputeWhiteOutMoneyLoss();
    ConvertIntToDecimalStringN(gStringVar1, losings, STR_CONV_MODE_LEFT_ALIGN, CountDigits(losings));
}

static u8 CountBadgesForOverworldWhiteOutLossCalculation(void)
{
    int i;
    u8 nbadges = 0;
    for (i = 0; i < NELEMS(sWhiteOutMoneyLossBadgeFlagIDs); i++)
    {
        if (FlagGet(sWhiteOutMoneyLossBadgeFlagIDs[i]))
            nbadges++;
    }
    return nbadges;
}

void Overworld_ResetStateAfterFly(void)
{
    ResetInitialPlayerAvatarState();
    FlagClear(FLAG_SYS_ON_CYCLING_ROAD);
    VarSet(VAR_MAP_SCENE_ROUTE16, 0);
    FlagClear(FLAG_SYS_CRUISE_MODE);
    FlagClear(FLAG_SYS_SAFARI_MODE);
    VarSet(VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 0);
    FlagClear(FLAG_SYS_USE_STRENGTH);
    FlagClear(FLAG_SYS_FLASH_ACTIVE);
    FlagClear(FLAG_SYS_QL_DEPARTED);
    VarSet(VAR_QL_ENTRANCE, 0);
}

void Overworld_ResetStateAfterTeleport(void)
{
    ResetInitialPlayerAvatarState();
    FlagClear(FLAG_SYS_ON_CYCLING_ROAD);
    VarSet(VAR_MAP_SCENE_ROUTE16, 0);
    FlagClear(FLAG_SYS_CRUISE_MODE);
    FlagClear(FLAG_SYS_SAFARI_MODE);
    VarSet(VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 0);
    FlagClear(FLAG_SYS_USE_STRENGTH);
    FlagClear(FLAG_SYS_FLASH_ACTIVE);
    FlagClear(FLAG_SYS_QL_DEPARTED);
    VarSet(VAR_QL_ENTRANCE, 0);
}

void Overworld_ResetStateAfterDigEscRope(void)
{
    ResetInitialPlayerAvatarState();
    FlagClear(FLAG_SYS_ON_CYCLING_ROAD);
    VarSet(VAR_MAP_SCENE_ROUTE16, 0);
    FlagClear(FLAG_SYS_CRUISE_MODE);
    FlagClear(FLAG_SYS_SAFARI_MODE);
    VarSet(VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 0);
    FlagClear(FLAG_SYS_USE_STRENGTH);
    FlagClear(FLAG_SYS_FLASH_ACTIVE);
    FlagClear(FLAG_SYS_QL_DEPARTED);
    VarSet(VAR_QL_ENTRANCE, 0);
}

static void Overworld_ResetStateAfterWhitingOut(void)
{
    ResetInitialPlayerAvatarState();
    FlagClear(FLAG_SYS_ON_CYCLING_ROAD);
    VarSet(VAR_MAP_SCENE_ROUTE16, 0);
    FlagClear(FLAG_SYS_CRUISE_MODE);
    FlagClear(FLAG_SYS_SAFARI_MODE);
    VarSet(VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 0);
    FlagClear(FLAG_SYS_USE_STRENGTH);
    FlagClear(FLAG_SYS_FLASH_ACTIVE);
    FlagClear(FLAG_SYS_QL_DEPARTED);
    VarSet(VAR_QL_ENTRANCE, 0);
}

static void Overworld_ResetStateOnContinue(void)
{
    FlagClear(FLAG_SYS_SAFARI_MODE);
    VarSet(VAR_MAP_SCENE_FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE, 0);
    ChooseAmbientCrySpecies();
    UpdateLocationHistoryForRoamer();
    RoamerMoveToOtherLocationSet();
}

// Routines related to game stats

void ResetGameStats(void)
{
    int i;

    for (i = 0; i < NUM_GAME_STATS; i++)
    {
        gSaveBlock1Ptr->gameStats[i] = 0;
    }
}

void IncrementGameStat(u8 statId)
{
    u32 statVal;
    if (statId >= NUM_USED_GAME_STATS)
        return;
    statVal = GetGameStat(statId);
    if (statVal < 0xFFFFFF)
        statVal++;
    else
        statVal = 0xFFFFFF;
    SetGameStat(statId, statVal);
}

u32 GetGameStat(u8 statId)
{
    if (statId >= NUM_USED_GAME_STATS)
        return 0;
    else
        return gSaveBlock1Ptr->gameStats[statId] ^ gSaveBlock2Ptr->encryptionKey;
}

void SetGameStat(u8 statId, u32 statVal)
{
    if (statId >= NUM_USED_GAME_STATS)
        return;
    gSaveBlock1Ptr->gameStats[statId] = statVal ^ gSaveBlock2Ptr->encryptionKey;
}

void ApplyNewEncryptionKeyToGameStats(u32 newKey)
{
    u8 i;
    for (i = 0; i < NUM_GAME_STATS; i++)
    {
        ApplyNewEncryptionKeyToWord(&gSaveBlock1Ptr->gameStats[i], newKey);
    }
}

// Routines related to object events

static void LoadObjEventTemplatesFromHeader(void)
{
    u8 i, j;
    for (i = 0, j = 0; i < gMapHeader.events->objectEventCount; i++)
    {
        if (gMapHeader.events->objectEvents[i].kind == OBJ_KIND_CLONE)
        {
            // load target object from the connecting map
            u8 localId = gMapHeader.events->objectEvents[i].objUnion.clone.targetLocalId;
            u8 mapNum = gMapHeader.events->objectEvents[i].objUnion.clone.targetMapNum;
            u8 mapGroup = gMapHeader.events->objectEvents[i].objUnion.clone.targetMapGroup;
            const struct MapHeader * connectionMap = Overworld_GetMapHeaderByGroupAndId(mapGroup, mapNum);

            gSaveBlock1Ptr->objectEventTemplates[j] = connectionMap->events->objectEvents[localId - 1];
            gSaveBlock1Ptr->objectEventTemplates[j].localId = gMapHeader.events->objectEvents[i].localId;
            gSaveBlock1Ptr->objectEventTemplates[j].x = gMapHeader.events->objectEvents[i].x;
            gSaveBlock1Ptr->objectEventTemplates[j].y = gMapHeader.events->objectEvents[i].y;
            gSaveBlock1Ptr->objectEventTemplates[j].objUnion.clone.targetLocalId = localId;
            gSaveBlock1Ptr->objectEventTemplates[j].objUnion.clone.targetMapNum = mapNum;
            gSaveBlock1Ptr->objectEventTemplates[j].objUnion.clone.targetMapGroup = mapGroup;
            gSaveBlock1Ptr->objectEventTemplates[j].kind = OBJ_KIND_CLONE;
            j++;
        }
        else
        {
            gSaveBlock1Ptr->objectEventTemplates[j] = gMapHeader.events->objectEvents[i];
            j++;
        }
    }
}

static void LoadSaveblockObjEventScripts(void)
{
    int i;
    const struct ObjectEventTemplate * src = gMapHeader.events->objectEvents;
    struct ObjectEventTemplate * savObjTemplates = gSaveBlock1Ptr->objectEventTemplates;

    for (i = 0; i < OBJECT_EVENT_TEMPLATES_COUNT; i++)
    {
        savObjTemplates[i].script = src[i].script;
    }
}

void SetObjEventTemplateCoords(u8 localId, s16 x, s16 y)
{
    int i;
    struct ObjectEventTemplate * savObjTemplates = gSaveBlock1Ptr->objectEventTemplates;
    for (i = 0; i < OBJECT_EVENT_TEMPLATES_COUNT; i++)
    {
        if (savObjTemplates[i].localId == localId)
        {
            savObjTemplates[i].x = x;
            savObjTemplates[i].y = y;
            break;
        }
    }
}

void SetObjEventTemplateMovementType(u8 localId, u8 movementType)
{
    s32 i;

    struct ObjectEventTemplate *savObjTemplates = gSaveBlock1Ptr->objectEventTemplates;
    for (i = 0; i < OBJECT_EVENT_TEMPLATES_COUNT; i++)
    {
        struct ObjectEventTemplate *objectEventTemplate = &savObjTemplates[i];
        if (objectEventTemplate->localId == localId)
        {
            objectEventTemplate->objUnion.normal.movementType = movementType;
            return;
        }
    }
}

// Routines related to the map layout

static void InitMapView(void)
{
    move_tilemap_camera_to_upper_left_corner();
    CopyMapTilesetsToVram(gMapHeader.mapLayout);
    LoadMapTilesetPalettes(gMapHeader.mapLayout);
    DrawWholeMapView();
    InitTilesetAnimations();
}

static const struct MapLayout *GetMapLayout(void)
{
    u16 mapLayoutId = gSaveBlock1Ptr->mapLayoutId;
    if (mapLayoutId)
        return gMapLayouts[mapLayoutId - 1];
    return NULL;
}

// Routines related to warps

static const struct WarpData sDummyWarpData = {
    .mapGroup = MAP_GROUP(UNDEFINED),
    .mapNum = MAP_NUM(UNDEFINED),
    .warpId = 0xFF,
    .x = -1,
    .y = -1
};

static void ApplyCurrentWarp(void)
{
    gLastUsedWarp = gSaveBlock1Ptr->location;
    gSaveBlock1Ptr->location = sWarpDestination;
    sFixedDiveWarp = sDummyWarpData;
    sFixedHoleWarp = sDummyWarpData;
}

static void SetWarpData(struct WarpData *warp, s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y)
{
    warp->mapGroup = mapGroup;
    warp->mapNum = mapNum;
    warp->warpId = warpId;
    warp->x = x;
    warp->y = y;
}

static bool32 IsDummyWarp(struct WarpData *warp)
{
    if (warp->mapGroup != (s8)MAP_GROUP(UNDEFINED))
        return FALSE;
    else if (warp->mapNum != (s8)MAP_NUM(UNDEFINED))
        return FALSE;
    else if (warp->warpId != -1)
        return FALSE;
    else if (warp->x != -1)
        return FALSE;
    else if (warp->y != -1)
        return FALSE;
    else
        return TRUE;
}

struct MapHeader const *const Overworld_GetMapHeaderByGroupAndId(u16 mapGroup, u16 mapNum)
{
    return gMapGroups[mapGroup][mapNum];
}

struct MapHeader const *const GetDestinationWarpMapHeader(void)
{
    return Overworld_GetMapHeaderByGroupAndId(sWarpDestination.mapGroup, sWarpDestination.mapNum);
}

static void LoadCurrentMapData(void)
{
    gMapHeader = *Overworld_GetMapHeaderByGroupAndId(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum);
    gSaveBlock1Ptr->mapLayoutId = gMapHeader.mapLayoutId;
    gMapHeader.mapLayout = GetMapLayout();
}

static void LoadSaveblockMapHeader(void)
{
    gMapHeader = *Overworld_GetMapHeaderByGroupAndId(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum);
    gMapHeader.mapLayout = GetMapLayout();
}

static void SetPlayerCoordsFromWarp(void)
{
    if (gSaveBlock1Ptr->location.warpId >= 0 && gSaveBlock1Ptr->location.warpId < gMapHeader.events->warpCount)
    {
        gSaveBlock1Ptr->pos.x = gMapHeader.events->warps[gSaveBlock1Ptr->location.warpId].x;
        gSaveBlock1Ptr->pos.y = gMapHeader.events->warps[gSaveBlock1Ptr->location.warpId].y;
    }
    else if (gSaveBlock1Ptr->location.x >= 0 && gSaveBlock1Ptr->location.y >= 0)
    {
        gSaveBlock1Ptr->pos.x = gSaveBlock1Ptr->location.x;
        gSaveBlock1Ptr->pos.y = gSaveBlock1Ptr->location.y;
    }
    else
    {
        gSaveBlock1Ptr->pos.x = gMapHeader.mapLayout->width / 2;
        gSaveBlock1Ptr->pos.y = gMapHeader.mapLayout->height / 2;
    }
}

void WarpIntoMap(void)
{
    ApplyCurrentWarp();
    LoadCurrentMapData();
    SetPlayerCoordsFromWarp();
}

void SetWarpDestination(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y)
{
    SetWarpData(&sWarpDestination, mapGroup, mapNum, warpId, x, y);
}

void SetWarpDestinationToMapWarp(s8 mapGroup, s8 mapNum, s8 warpId)
{
    SetWarpDestination(mapGroup, mapNum, warpId, -1, -1);
}

void SetDynamicWarp(s32 unused, s8 mapGroup, s8 mapNum, s8 warpId)
{
    SetWarpData(&gSaveBlock1Ptr->dynamicWarp, mapGroup, mapNum, warpId, gSaveBlock1Ptr->pos.x, gSaveBlock1Ptr->pos.y);
}

void SetDynamicWarpWithCoords(s32 unused, s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y)
{
    SetWarpData(&gSaveBlock1Ptr->dynamicWarp, mapGroup, mapNum, warpId, x, y);
}

void SetWarpDestinationToDynamicWarp(u8 unusedWarpId)
{
    sWarpDestination = gSaveBlock1Ptr->dynamicWarp;
}

void SetWarpDestinationToHealLocation(u8 healLocationId)
{
    const struct HealLocation *warp = GetHealLocation(healLocationId);
    if (warp)
        SetWarpDestination(warp->group, warp->map, -1, warp->x, warp->y);
}

void SetWarpDestinationToLastHealLocation(void)
{
    sWarpDestination = gSaveBlock1Ptr->lastHealLocation;
}

static void Overworld_SetWhiteoutRespawnPoint(void)
{
    SetWhiteoutRespawnWarpAndHealerNpc(&sWarpDestination);
}

void SetLastHealLocationWarp(u8 healLocationId)
{
    const struct HealLocation *healLocation = GetHealLocation(healLocationId);
    if (healLocation)
        SetWarpData(&gSaveBlock1Ptr->lastHealLocation, healLocation->group, healLocation->map, -1, healLocation->x, healLocation->y);
}

void UpdateEscapeWarp(s16 x, s16 y)
{
    u8 currMapType = GetCurrentMapType();
    u8 destMapType = GetMapTypeByGroupAndId(sWarpDestination.mapGroup, sWarpDestination.mapNum);
    u8 delta;
    if (IsMapTypeOutdoors(currMapType) && IsMapTypeOutdoors(destMapType) != TRUE && !(gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(VIRIDIAN_FOREST) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(VIRIDIAN_FOREST)))
    {
        delta = GetPlayerFacingDirection() != DIR_SOUTH;
        SetEscapeWarp(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum, -1, x - 7, y - 7 + delta);
    }
}

void SetEscapeWarp(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y)
{
    SetWarpData(&gSaveBlock1Ptr->escapeWarp, mapGroup, mapNum, warpId, x, y);
}

void SetWarpDestinationToEscapeWarp(void)
{
    sWarpDestination = gSaveBlock1Ptr->escapeWarp;
}

void SetFixedDiveWarp(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y)
{
    SetWarpData(&sFixedDiveWarp, mapGroup, mapNum, warpId, x, y);
}

static void SetWarpDestinationToDiveWarp(void)
{
    sWarpDestination = sFixedDiveWarp;
}

void SetFixedHoleWarp(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y)
{
    SetWarpData(&sFixedHoleWarp, mapGroup, mapNum, warpId, x, y);
}

void SetWarpDestinationToFixedHoleWarp(s16 x, s16 y)
{
    if (IsDummyWarp(&sFixedHoleWarp) == TRUE)
        sWarpDestination = gLastUsedWarp;
    else
        SetWarpDestination(sFixedHoleWarp.mapGroup, sFixedHoleWarp.mapNum, -1, x, y);
}

static void SetWarpDestinationToContinueGameWarp(void)
{
    sWarpDestination = gSaveBlock1Ptr->continueGameWarp;
}

static void SetContinueGameWarp(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y)
{
    SetWarpData(&gSaveBlock1Ptr->continueGameWarp, mapGroup, mapNum, warpId, x, y);
}

void SetContinueGameWarpToHealLocation(u8 healLocationId)
{
    const struct HealLocation *warp = GetHealLocation(healLocationId);
    if (warp)
        SetWarpData(&gSaveBlock1Ptr->continueGameWarp, warp->group, warp->map, -1, warp->x, warp->y);
}

void SetContinueGameWarpToDynamicWarp(int unused)
{
    gSaveBlock1Ptr->continueGameWarp = gSaveBlock1Ptr->dynamicWarp;
}

static const struct MapConnection * GetMapConnection(u8 dir)
{
    s32 i;
    s32 count = gMapHeader.connections->count;
    const struct MapConnection *connection = gMapHeader.connections->connections;

    if (connection == NULL)
        return NULL;

    for(i = 0; i < count; i++, connection++)
        if (connection->direction == dir)
            return connection;

    return NULL;
}

static bool8 SetDiveWarp(u8 dir, u16 x, u16 y)
{
    const struct MapConnection *connection = GetMapConnection(dir);

    if (connection != NULL)
    {
        SetWarpDestination(connection->mapGroup, connection->mapNum, -1, x, y);
    }
    else
    {
        RunOnDiveWarpMapScript();
        if (IsDummyWarp(&sFixedDiveWarp))
            return FALSE;
        SetWarpDestinationToDiveWarp();
    }
    return TRUE;
}

bool8 SetDiveWarpEmerge(u16 x, u16 y)
{
    return SetDiveWarp(CONNECTION_EMERGE, x, y);
}

bool8 SetDiveWarpDive(u16 x, u16 y)
{
    return SetDiveWarp(CONNECTION_DIVE, x, y);
}

// Map loaders

void LoadMapFromCameraTransition(u8 mapGroup, u8 mapNum)
{
    int paletteIndex;

    SetWarpDestination(mapGroup, mapNum, -1, -1, -1);
    Overworld_TryMapConnectionMusicTransition();
    ApplyCurrentWarp();
    LoadCurrentMapData();
    LoadObjEventTemplatesFromHeader();
    TrySetMapSaveWarpStatus();
    ClearTempFieldEventData();
    ResetCyclingRoadChallengeData();
    RestartWildEncounterImmunitySteps();
    MapResetTrainerRematches(mapGroup, mapNum);
    SetSavedWeatherFromCurrMapHeader();
    ChooseAmbientCrySpecies();
    SetDefaultFlashLevel();
    Overworld_ClearSavedMusic();
    RunOnTransitionMapScript();
    TryRegenerateRenewableHiddenItems();
    InitMap();
    CopySecondaryTilesetToVramUsingHeap(gMapHeader.mapLayout);
    LoadSecondaryTilesetPalette(gMapHeader.mapLayout);
    for (paletteIndex = 7; paletteIndex < 13; paletteIndex++)
        ApplyWeatherGammaShiftToPal(paletteIndex);
    InitSecondaryTilesetAnimation();
    UpdateLocationHistoryForRoamer();
    RoamerMove();
    QL_ResetDefeatedWildMonRecord();
    DoCurrentWeather();
    ResetFieldTasksArgs();
    RunOnResumeMapScript();
    if (GetLastUsedWarpMapSectionId() != gMapHeader.regionMapSectionId)
        ShowMapNamePopup(TRUE);
}

static void LoadMapFromWarp(bool32 unused)
{
    bool8 isOutdoors;

    LoadCurrentMapData();
    LoadObjEventTemplatesFromHeader();
    isOutdoors = IsMapTypeOutdoors(gMapHeader.mapType);

    TrySetMapSaveWarpStatus();
    ClearTempFieldEventData();
    ResetCyclingRoadChallengeData();
    RestartWildEncounterImmunitySteps();
    MapResetTrainerRematches(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum);
    SetSavedWeatherFromCurrMapHeader();
    ChooseAmbientCrySpecies();
    if (isOutdoors)
        FlagClear(FLAG_SYS_FLASH_ACTIVE);
    SetDefaultFlashLevel();
    Overworld_ClearSavedMusic();
    RunOnTransitionMapScript();
    TryRegenerateRenewableHiddenItems();
    UpdateLocationHistoryForRoamer();
    RoamerMoveToOtherLocationSet();
    QL_ResetDefeatedWildMonRecord();
    InitMap();
}

static void QL_LoadMapNormal(void)
{
    bool8 isOutdoors;

    LoadCurrentMapData();
    LoadObjEventTemplatesFromHeader();
    isOutdoors = IsMapTypeOutdoors(gMapHeader.mapType);
    TrySetMapSaveWarpStatus();
    SetSavedWeatherFromCurrMapHeader();
    ChooseAmbientCrySpecies();
    SetDefaultFlashLevel();
    QL_ResetDefeatedWildMonRecord();
    QL_RestoreMapLayoutId();
    LoadSaveblockMapHeader();
    InitMap();
}

// Routines related to the initial player avatar state

void ResetInitialPlayerAvatarState(void)
{
    sInitialPlayerAvatarState.direction = DIR_SOUTH;
    sInitialPlayerAvatarState.transitionFlags = PLAYER_AVATAR_FLAG_ON_FOOT;
    sInitialPlayerAvatarState.hasDirectionSet = FALSE;
}

static void SetInitialPlayerAvatarStateWithDirection(u8 dirn)
{
    sInitialPlayerAvatarState.direction = dirn;
    sInitialPlayerAvatarState.transitionFlags = PLAYER_AVATAR_FLAG_ON_FOOT;
    sInitialPlayerAvatarState.hasDirectionSet = TRUE;
}

void StoreInitialPlayerAvatarState(void)
{
    sInitialPlayerAvatarState.direction = GetPlayerFacingDirection();

    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_MACH_BIKE))
        sInitialPlayerAvatarState.transitionFlags = PLAYER_AVATAR_FLAG_MACH_BIKE;
    else if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_ACRO_BIKE))
        sInitialPlayerAvatarState.transitionFlags = PLAYER_AVATAR_FLAG_ACRO_BIKE;
    else if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
        sInitialPlayerAvatarState.transitionFlags = PLAYER_AVATAR_FLAG_SURFING;
    else if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_UNDERWATER))
        sInitialPlayerAvatarState.transitionFlags = PLAYER_AVATAR_FLAG_UNDERWATER;
    else
        sInitialPlayerAvatarState.transitionFlags = PLAYER_AVATAR_FLAG_ON_FOOT;
    sInitialPlayerAvatarState.hasDirectionSet = FALSE;
}

struct InitialPlayerAvatarState *GetInitialPlayerAvatarState(void)
{
    struct InitialPlayerAvatarState playerStruct;
    u8 mapType = GetCurrentMapType();
    u16 metatileBehavior = GetCenterScreenMetatileBehavior();
    u8 transitionFlags = GetAdjustedInitialTransitionFlags(&sInitialPlayerAvatarState, metatileBehavior, mapType);
    playerStruct.transitionFlags = transitionFlags;
    playerStruct.direction = GetAdjustedInitialDirection(&sInitialPlayerAvatarState, transitionFlags, metatileBehavior, mapType);
    playerStruct.hasDirectionSet = FALSE;
    sInitialPlayerAvatarState = playerStruct;
    return &sInitialPlayerAvatarState;
}

static u8 GetAdjustedInitialTransitionFlags(struct InitialPlayerAvatarState *playerStruct, u16 metatileBehavior, u8 mapType)
{
    if (mapType != MAP_TYPE_INDOOR && FlagGet(FLAG_SYS_CRUISE_MODE))
        return PLAYER_AVATAR_FLAG_ON_FOOT;
    else if (mapType == MAP_TYPE_UNDERWATER)
        return PLAYER_AVATAR_FLAG_UNDERWATER;
    else if (MetatileBehavior_IsSurfableInSeafoamIslands(metatileBehavior) == TRUE)
        return PLAYER_AVATAR_FLAG_ON_FOOT;
    else if (MetatileBehavior_IsSurfable(metatileBehavior) == TRUE)
        return PLAYER_AVATAR_FLAG_SURFING;
    else if (Overworld_IsBikingAllowed() != TRUE)
        return PLAYER_AVATAR_FLAG_ON_FOOT;
    else if (playerStruct->transitionFlags == PLAYER_AVATAR_FLAG_MACH_BIKE)
        return PLAYER_AVATAR_FLAG_MACH_BIKE;
    else if (playerStruct->transitionFlags != PLAYER_AVATAR_FLAG_ACRO_BIKE)
        return PLAYER_AVATAR_FLAG_ON_FOOT;
    else
        return PLAYER_AVATAR_FLAG_ACRO_BIKE;
}

bool8 MetatileBehavior_IsSurfableInSeafoamIslands(u16 metatileBehavior)
{
    if (MetatileBehavior_IsSurfable(metatileBehavior) != TRUE)
        return FALSE;
    if ((gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(SEAFOAM_ISLANDS_B3F)
          && gSaveBlock1Ptr->location.mapNum == MAP_NUM(SEAFOAM_ISLANDS_B3F))
     || (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(SEAFOAM_ISLANDS_B4F)
          && gSaveBlock1Ptr->location.mapNum == MAP_NUM(SEAFOAM_ISLANDS_B4F)))
        return TRUE;
    return FALSE;
}

static u8 GetAdjustedInitialDirection(struct InitialPlayerAvatarState *playerStruct, u8 transitionFlags, u16 metatileBehavior, u8 mapType)
{
    if (FlagGet(FLAG_SYS_CRUISE_MODE) && mapType == MAP_TYPE_OCEAN_ROUTE)
        return DIR_EAST;
    else if (MetatileBehavior_IsDeepSouthWarp(metatileBehavior) == TRUE)
        return DIR_NORTH;
    else if (MetatileBehavior_IsNonAnimDoor(metatileBehavior) == TRUE || MetatileBehavior_IsWarpDoor_2(metatileBehavior) == TRUE)
        return DIR_SOUTH;
    else if (MetatileBehavior_IsSouthArrowWarp(metatileBehavior) == TRUE)
        return DIR_NORTH;
    else if (MetatileBehavior_IsNorthArrowWarp(metatileBehavior) == TRUE)
        return DIR_SOUTH;
    else if (MetatileBehavior_IsWestArrowWarp(metatileBehavior) == TRUE)
        return DIR_EAST;
    else if (MetatileBehavior_IsEastArrowWarp(metatileBehavior) == TRUE)
        return DIR_WEST;
    else if (MetatileBehavior_IsDirectionalUpRightStairWarp(metatileBehavior) == TRUE || MetatileBehavior_IsDirectionalDownRightStairWarp(metatileBehavior) == TRUE)
        return DIR_WEST;
    else if (MetatileBehavior_IsDirectionalUpLeftStairWarp(metatileBehavior) == TRUE || MetatileBehavior_IsDirectionalDownLeftStairWarp(metatileBehavior) == TRUE)
        return DIR_EAST;
    else if ((playerStruct->transitionFlags == PLAYER_AVATAR_FLAG_UNDERWATER  && transitionFlags == PLAYER_AVATAR_FLAG_SURFING)
             || (playerStruct->transitionFlags == PLAYER_AVATAR_FLAG_SURFING && transitionFlags == PLAYER_AVATAR_FLAG_UNDERWATER ))
        return playerStruct->direction;
    else if (MetatileBehavior_IsLadder(metatileBehavior) == TRUE)
        return playerStruct->direction;
    else if (playerStruct->hasDirectionSet)
        return playerStruct->direction;
    else
        return DIR_SOUTH;
}

static u16 GetCenterScreenMetatileBehavior(void)
{
    return MapGridGetMetatileBehaviorAt(gSaveBlock1Ptr->pos.x + 7, gSaveBlock1Ptr->pos.y + 7);
}

// Routines related to flash level and map perms

bool32 Overworld_IsBikingAllowed(void)
{
    if (!gMapHeader.bikingAllowed)
        return FALSE;
    else
        return TRUE;
}

static void SetDefaultFlashLevel(void)
{
    if (!gMapHeader.cave)
        gSaveBlock1Ptr->flashLevel = 0;
    else if (FlagGet(FLAG_SYS_FLASH_ACTIVE))
        gSaveBlock1Ptr->flashLevel = 0;
    else
        gSaveBlock1Ptr->flashLevel = gMaxFlashLevel;
}

void SetFlashLevel(s32 flashLevel)
{
    if (flashLevel < 0 || flashLevel > gMaxFlashLevel)
        flashLevel = 0;
    gSaveBlock1Ptr->flashLevel = flashLevel;
}

u8 Overworld_GetFlashLevel(void)
{
    return gSaveBlock1Ptr->flashLevel;
}

void SetCurrentMapLayout(u16 mapLayoutId)
{
    gSaveBlock1Ptr->mapLayoutId = mapLayoutId;
    gMapHeader.mapLayout = GetMapLayout();
}

void Overworld_SetWarpDestinationFromWarp(struct WarpData * warp)
{
    sWarpDestination = *warp;
}

// Routines related to map music

static u16 GetLocationMusic(struct WarpData * warp)
{
    return Overworld_GetMapHeaderByGroupAndId(warp->mapGroup, warp->mapNum)->music;
}

static u16 GetCurrLocationDefaultMusic(void)
{
    u16 music;
    music = GetLocationMusic(&gSaveBlock1Ptr->location);
    return music;
}

static u16 GetWarpDestinationMusic(void)
{
    u16 music = GetLocationMusic(&sWarpDestination);
    return music;
}

void Overworld_ResetMapMusic(void)
{
    ResetMapMusic();
}

void Overworld_PlaySpecialMapMusic(void)
{
    u16 music;
    s16 x, y;

    if (gDisableMapMusicChangeOnMapLoad == MUSIC_DISABLE_STOP)
    {
        StopMapMusic();
        return;
    }
    if (gDisableMapMusicChangeOnMapLoad == MUSIC_DISABLE_KEEP)
        return;

    if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(POKEMON_LEAGUE_CHAMPIONS_ROOM) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(POKEMON_LEAGUE_CHAMPIONS_ROOM))
    {
        PlayerGetDestCoords(&x, &y);
        if (y - 7 < 11 && gMPlayInfo_BGM.songHeader == &mus_victory_gym_leader)
        {
            FadeInBGM(4);
            return;
        }
    }

    music = GetCurrLocationDefaultMusic();

    if (gSaveBlock1Ptr->savedMusic)
        music = gSaveBlock1Ptr->savedMusic;
    else if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING) && Overworld_MusicCanOverrideMapMusic(MUS_SURF))
        music = MUS_SURF;

    if (music != GetCurrentMapMusic())
        PlayNewMapMusic(music);
}

void Overworld_SetSavedMusic(u16 songNum)
{
    gSaveBlock1Ptr->savedMusic = songNum;
}

void Overworld_ClearSavedMusic(void)
{
    gSaveBlock1Ptr->savedMusic = 0;
}

static void Overworld_TryMapConnectionMusicTransition(void)
{
    u16 newMusic;
    u16 currentMusic;

    if (gDisableMapMusicChangeOnMapLoad == MUSIC_DISABLE_STOP)
    {
        StopMapMusic();
        return;
    }
    if (gDisableMapMusicChangeOnMapLoad == MUSIC_DISABLE_KEEP)
        return;

    if (FlagGet(FLAG_DONT_TRANSITION_MUSIC) != TRUE)
    {
        newMusic = GetWarpDestinationMusic();
        currentMusic = GetCurrentMapMusic();
        if (currentMusic == MUS_SURF)
            return;
        if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING) && Overworld_MusicCanOverrideMapMusic(MUS_SURF))
            newMusic = MUS_SURF;
        if (newMusic != currentMusic)
        {
            if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_MACH_BIKE | PLAYER_AVATAR_FLAG_ACRO_BIKE))
                FadeOutAndFadeInNewMapMusic(newMusic, 4, 4);
            else
                FadeOutAndPlayNewMapMusic(newMusic, 8);
        }
    }
}

void Overworld_ChangeMusicToDefault(void)
{
    u16 currentMusic = GetCurrentMapMusic();
    if (currentMusic != GetCurrLocationDefaultMusic())
        FadeOutAndPlayNewMapMusic(GetCurrLocationDefaultMusic(), 8);
}

void Overworld_ChangeMusicTo(u16 newMusic)
{
    u16 currentMusic = GetCurrentMapMusic();
    if (currentMusic != newMusic)
        FadeOutAndPlayNewMapMusic(newMusic, 8);
}

static u8 GetMapMusicFadeoutSpeed(void)
{
    const struct MapHeader *mapHeader = GetDestinationWarpMapHeader();
    if (IsMapTypeIndoors(mapHeader->mapType) == TRUE)
        return 2;
    else
        return 4;
}

void TryFadeOutOldMapMusic(void)
{
    u16 warpMusic = GetWarpDestinationMusic();
    if (FlagGet(FLAG_DONT_TRANSITION_MUSIC) != TRUE && warpMusic != GetCurrentMapMusic())
    {
        FadeOutMapMusic(GetMapMusicFadeoutSpeed());
    }
}

bool8 BGMusicStopped(void)
{
    return IsNotWaitingForBGMStop();
}

void Overworld_FadeOutMapMusic(void)
{
    FadeOutMapMusic(4);
}

static void PlayAmbientCry(void)
{
    s16 x, y;
    s8 pan;
    s8 volume;

    PlayerGetDestCoords(&x, &y);
    if (sIsAmbientCryWaterMon == TRUE
        && !MetatileBehavior_IsSurfable(MapGridGetMetatileBehaviorAt(x, y)))
        return;
    pan = (Random() % 88) + 212;
    volume = (Random() % 30) + 50;

    if (gDisableMapMusicChangeOnMapLoad == MUSIC_DISABLE_STOP)
    {
        StopMapMusic();
        return;
    }
    if (gDisableMapMusicChangeOnMapLoad == MUSIC_DISABLE_KEEP)
        return;

    PlayCry_NormalNoDucking(sAmbientCrySpecies, pan, volume, CRY_PRIORITY_AMBIENT);
}

void UpdateAmbientCry(s16 *state, u16 *delayCounter)
{
    u8 i, monsCount, divBy;

    switch (*state)
    {
    case 0:
        if (sAmbientCrySpecies == SPECIES_NONE)
            *state = 4;
        else
            *state = 1;
        break;
    case 1:
        *delayCounter = (Random() % 2400) + 1200;
        *state = 3;
        break;
    case 2:
        *delayCounter = (Random() % 1200) + 1200;
        *state = 3;
        break;
    case 3:
        (*delayCounter)--;
        if (*delayCounter == 0)
        {
            PlayAmbientCry();
            *state = 2;
        }
        break;
    case 4:
        break;
    }
}

static void ChooseAmbientCrySpecies(void)
{
    sAmbientCrySpecies = GetLocalWildMon(&sIsAmbientCryWaterMon);
}

bool32 Overworld_MusicCanOverrideMapMusic(u16 music)
{
    if (music == MUS_CYCLING || music == MUS_SURF)
    {
        if (gMapHeader.regionMapSectionId == MAPSEC_KANTO_VICTORY_ROAD || gMapHeader.regionMapSectionId == MAPSEC_ROUTE_23 || gMapHeader.regionMapSectionId == MAPSEC_INDIGO_PLATEAU)
            return FALSE;
    }
    return TRUE;
}

u8 GetMapTypeByGroupAndId(s8 mapGroup, s8 mapNum)
{
    return Overworld_GetMapHeaderByGroupAndId(mapGroup, mapNum)->mapType;
}

static u8 GetMapTypeByWarpData(struct WarpData *warp)
{
    return GetMapTypeByGroupAndId(warp->mapGroup, warp->mapNum);
}

u8 GetCurrentMapType(void)
{
    return GetMapTypeByWarpData(&gSaveBlock1Ptr->location);
}

u8 GetLastUsedWarpMapType(void)
{
    return GetMapTypeByWarpData(&gLastUsedWarp);
}

u8 GetLastUsedWarpMapSectionId(void)
{
    return Overworld_GetMapHeaderByGroupAndId(gLastUsedWarp.mapGroup, gLastUsedWarp.mapNum)->regionMapSectionId;
}

bool8 IsMapTypeOutdoors(u8 mapType)
{
    if (mapType == MAP_TYPE_ROUTE
        || mapType == MAP_TYPE_TOWN
        || mapType == MAP_TYPE_UNDERWATER
        || mapType == MAP_TYPE_CITY
        || mapType == MAP_TYPE_OCEAN_ROUTE)
        return TRUE;
    else
        return FALSE;
}

bool8 Overworld_MapTypeAllowsTeleportAndFly(u8 mapType)
{
    if (mapType == MAP_TYPE_ROUTE
        || mapType == MAP_TYPE_TOWN
        || mapType == MAP_TYPE_OCEAN_ROUTE
        || mapType == MAP_TYPE_CITY)
        return TRUE;
    else
        return FALSE;
}

bool8 IsMapTypeIndoors(u8 mapType)
{
    if (mapType == MAP_TYPE_INDOOR
        || mapType == MAP_TYPE_SECRET_BASE)
        return TRUE;
    else
        return FALSE;
}

static u8 GetSavedWarpRegionMapSectionId(void)
{
    return Overworld_GetMapHeaderByGroupAndId(gSaveBlock1Ptr->dynamicWarp.mapGroup, gSaveBlock1Ptr->dynamicWarp.mapNum)->regionMapSectionId;
}

u8 GetCurrentRegionMapSectionId(void)
{
    return Overworld_GetMapHeaderByGroupAndId(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum)->regionMapSectionId;
}

u8 GetCurrentMapBattleScene(void)
{
    return Overworld_GetMapHeaderByGroupAndId(gSaveBlock1Ptr->location.mapGroup, gSaveBlock1Ptr->location.mapNum)->battleType;
}

static const int sUnusedData[] = {
    1200,
    3600,
    1200,
    2400,
      50,
      80,
     -44,
      44
};

const struct Coords32 gDirectionToVectors[] = 
{
    [DIR_NONE]      = { 0,  0},
    [DIR_SOUTH]     = { 0,  1},
    [DIR_NORTH]     = { 0, -1},
    [DIR_WEST]      = {-1,  0},
    [DIR_EAST]      = { 1,  0},
    [DIR_SOUTHWEST] = {-1,  1},
    [DIR_SOUTHEAST] = { 1,  1},
    [DIR_NORTHWEST] = {-1, -1},
    [DIR_NORTHEAST] = { 1, -1},
};

static const struct BgTemplate sOverworldBgTemplates[] = {
    {
        .bg = 0,
        .charBaseIndex = 2,
        .mapBaseIndex = 31,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 0,
        .baseTile = 0x000
    }, {
        .bg = 1,
        .charBaseIndex = 0,
        .mapBaseIndex = 29,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 1,
        .baseTile = 0x000
    }, {
        .bg = 2,
        .charBaseIndex = 0,
        .mapBaseIndex = 28,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 2,
        .baseTile = 0x000
    }, {
        .bg = 3,
        .charBaseIndex = 0,
        .mapBaseIndex = 30,
        .screenSize = 0,
        .paletteMode = 0,
        .priority = 3,
        .baseTile = 0x000
    }
};

static void InitOverworldBgs(void)
{
    MoveSaveBlocks_ResetHeap_();
    ResetScreenForMapLoad();
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, sOverworldBgTemplates, NELEMS(sOverworldBgTemplates));
    SetBgAttribute(1, BG_ATTR_MOSAIC, TRUE);
    SetBgAttribute(2, BG_ATTR_MOSAIC, TRUE);
    SetBgAttribute(3, BG_ATTR_MOSAIC, TRUE);
    gBGTilemapBuffers2 = AllocZeroed(BG_SCREEN_SIZE);
    gBGTilemapBuffers1 = AllocZeroed(BG_SCREEN_SIZE);
    gBGTilemapBuffers3 = AllocZeroed(BG_SCREEN_SIZE);
    SetBgTilemapBuffer(1, gBGTilemapBuffers2);
    SetBgTilemapBuffer(2, gBGTilemapBuffers1);
    SetBgTilemapBuffer(3, gBGTilemapBuffers3);
    InitStandardTextBoxWindows();
    InitTextBoxGfxAndPrinters();
    InitFieldMessageBox();
}

static void InitOverworldBgs_NoResetHeap(void)
{
    ResetBgsAndClearDma3BusyFlags(FALSE);
    InitBgsFromTemplates(0, sOverworldBgTemplates, NELEMS(sOverworldBgTemplates));
    SetBgAttribute(1, BG_ATTR_MOSAIC, TRUE);
    SetBgAttribute(2, BG_ATTR_MOSAIC, TRUE);
    SetBgAttribute(3, BG_ATTR_MOSAIC, TRUE);
    gBGTilemapBuffers2 = AllocZeroed(BG_SCREEN_SIZE);
    gBGTilemapBuffers1 = AllocZeroed(BG_SCREEN_SIZE);
    gBGTilemapBuffers3 = AllocZeroed(BG_SCREEN_SIZE);
    SetBgTilemapBuffer(1, gBGTilemapBuffers2);
    SetBgTilemapBuffer(2, gBGTilemapBuffers1);
    SetBgTilemapBuffer(3, gBGTilemapBuffers3);
    InitStandardTextBoxWindows();
    InitTextBoxGfxAndPrinters();
    InitFieldMessageBox();
}

void CleanupOverworldWindowsAndTilemaps(void)
{
    FreeAllOverworldWindowBuffers();
    Free(gBGTilemapBuffers3);
    Free(gBGTilemapBuffers1);
    Free(gBGTilemapBuffers2);
}

static void ResetSafariZoneFlag_(void)
{
    ResetSafariZoneFlag();
}

bool32 IsUpdateLinkStateCBActive(void)
{
    if (gMain.callback1 == CB1_UpdateLinkState)
        return TRUE;
    else
        return FALSE;
}

static void DoCB1_Overworld(u16 newKeys, u16 heldKeys)
{
    struct FieldInput fieldInput;

    QL_TryRunActions();
    UpdatePlayerAvatarTransitionState();
    FieldClearPlayerInput(&fieldInput);
    FieldGetPlayerInput(&fieldInput, newKeys, heldKeys);
    FieldInput_HandleCancelSignpost(&fieldInput);
    if (!ArePlayerFieldControlsLocked())
    {
        if (ProcessPlayerFieldInput(&fieldInput) == TRUE)
        {
            if (gQuestLogPlaybackState == QL_PLAYBACK_STATE_RECORDING)
                QL_RecordFieldInput(&gFieldInputRecord);
            LockPlayerFieldControls();
            DismissMapNamePopup();
        }
        else
        {
            player_step(fieldInput.dpadDirection, newKeys, heldKeys);
        }
    }
    RunQuestLogCB();
}

static void DoCB1_Overworld_QuestLogPlayback(void)
{
    struct FieldInput fieldInput;

    QL_TryRunActions();
    UpdatePlayerAvatarTransitionState();
    QL_HandleInput();
    FieldClearPlayerInput(&fieldInput);
    fieldInput = gQuestLogFieldInput;
    FieldInput_HandleCancelSignpost(&fieldInput);
    if (!ArePlayerFieldControlsLocked())
    {
        if (ProcessPlayerFieldInput(&fieldInput) == TRUE)
        {
            LockPlayerFieldControls();
            DismissMapNamePopup();
        }
        else
        {
            RunQuestLogCB();
        }
    }
    else if (QuestLogScenePlaybackIsEnding() == TRUE)
    {
        RunQuestLogCB();
    }
    FieldClearPlayerInput(&gQuestLogFieldInput);
}

void CB1_Overworld(void)
{
    if (gMain.callback2 == CB2_Overworld)
    {
        if (QL_GetPlaybackState() == QL_PLAYBACK_STATE_RUNNING || gQuestLogState == QL_STATE_PLAYBACK)
            DoCB1_Overworld_QuestLogPlayback();
        else
            DoCB1_Overworld(gMain.newKeys, gMain.heldKeys);
    }
}

static void OverworldBasic(void)
{
    ScriptContext_RunScript();
    RunTasks();
    AnimateSprites();
    CameraUpdate();
    SetQuestLogEvent_Arrived();
    UpdateCameraPanning();
    BuildOamBuffer();
    UpdatePaletteFade();
    UpdateTilesetAnimations();
    DoScheduledBgTilemapCopiesToVram();
}

// This CB2 is used when starting
void CB2_OverworldBasic(void)
{
    OverworldBasic();
}

static void CB2_Overworld(void)
{
    bool32 fading = !!gPaletteFade.active;
    if (fading)
        SetVBlankCallback(NULL);
    OverworldBasic();
    if (fading)
        SetFieldVBlankCallback();
}

void SetMainCallback1(MainCallback cb)
{
    gMain.callback1 = cb;
}

static bool8 RunFieldCallback(void)
{
    if (gFieldCallback2)
    {
        if (!gFieldCallback2())
            return FALSE;
        else
        {
            gFieldCallback2 = NULL;
            gFieldCallback = NULL;
        }
    }
    else
    {
        if (gFieldCallback)
            gFieldCallback();
        else
            FieldCB_DefaultWarpExit();

        gFieldCallback = NULL;
    }

    return TRUE;
}

void CB2_NewGame(void)
{
    FieldClearVBlankHBlankCallbacks();
    StopMapMusic();
    ResetSafariZoneFlag_();
    NewGameInitData();
    ResetInitialPlayerAvatarState();
    PlayTimeCounter_Start();
    ScriptContext_Init();
    UnlockPlayerFieldControls();
    gFieldCallback = FieldCB_WarpExitFadeFromBlack;
    gFieldCallback2 = NULL;
    DoMapLoadLoop(&gMain.state);
    SetFieldVBlankCallback();
    SetMainCallback1(CB1_Overworld);
    SetMainCallback2(CB2_Overworld);
}

void CB2_WhiteOut(void)
{
    u8 val;

    if (++gMain.state >= 120)
    {
        FieldClearVBlankHBlankCallbacks();
        StopMapMusic();
        ResetSafariZoneFlag_();
        DoWhiteOut();
        SetInitialPlayerAvatarStateWithDirection(DIR_NORTH);
        ScriptContext_Init();
        UnlockPlayerFieldControls();
        gFieldCallback = FieldCB_RushInjuredPokemonToCenter;
        val = 0;
        DoMapLoadLoop(&val);
        QuestLog_CutRecording();
        SetFieldVBlankCallback();
        SetMainCallback1(CB1_Overworld);
        SetMainCallback2(CB2_Overworld);
    }
}

void CB2_LoadMap(void)
{
    FieldClearVBlankHBlankCallbacks();
    ScriptContext_Init();
    UnlockPlayerFieldControls();
    SetMainCallback1(NULL);
    SetMainCallback2(CB2_DoChangeMap);
    gMain.savedCallback = CB2_LoadMap2;
}

static void CB2_LoadMap2(void)
{
    DoMapLoadLoop(&gMain.state);
    if (QuestLog_ShouldEndSceneOnMapChange() == TRUE)
    {
        QuestLog_AdvancePlayhead_();
    }
    else
    {
        SetFieldVBlankCallback();
        SetMainCallback1(CB1_Overworld);
        SetMainCallback2(CB2_Overworld);
    }
}

void CB2_ReturnToFieldCableClub(void)
{
    FieldClearVBlankHBlankCallbacks();
    gFieldCallback = FieldCB_ReturnToFieldWirelessLink;
    SetMainCallback2(CB2_LoadMapOnReturnToFieldCableClub);
}

static void CB2_LoadMapOnReturnToFieldCableClub(void)
{
    if (LoadMapInStepsLink(&gMain.state))
    {
        SetFieldVBlankCallback();
        SetMainCallback1(CB1_UpdateLinkState);
        ResetAllMultiplayerState();
        SetMainCallback2(CB2_Overworld);
    }
}

void CB2_ReturnToField(void)
{
    if (IsUpdateLinkStateCBActive() == TRUE)
    {
        SetMainCallback2(CB2_ReturnToFieldLink);
    }
    else
    {
        FieldClearVBlankHBlankCallbacks();
        SetMainCallback2(CB2_ReturnToFieldLocal);
    }
}

static void CB2_ReturnToFieldLocal(void)
{
    if (ReturnToFieldLocal(&gMain.state))
    {
        SetFieldVBlankCallback();
        SetMainCallback2(CB2_Overworld);
    }
}

static void CB2_ReturnToFieldLink(void)
{
    if (!Overworld_LinkRecvQueueLengthMoreThan2() && ReturnToFieldLink(&gMain.state))
        SetMainCallback2(CB2_Overworld);
}

void CB2_ReturnToFieldFromMultiplayer(void)
{
    FieldClearVBlankHBlankCallbacks();
    StopMapMusic();
    SetMainCallback1(CB1_UpdateLinkState);
    ResetAllMultiplayerState();

    if (gWirelessCommType != 0)
        gFieldCallback = FieldCB_ReturnToFieldWirelessLink;
    else
        gFieldCallback = FieldCB_ReturnToFieldCableLink;

    ScriptContext_Init();
    UnlockPlayerFieldControls();
    CB2_ReturnToField();
}

void CB2_ReturnToFieldWithOpenMenu(void)
{
    FieldClearVBlankHBlankCallbacks();
    gFieldCallback2 = FieldCB_ReturnToFieldOpenStartMenu;
    CB2_ReturnToField();
}

void CB2_ReturnToFieldContinueScript(void)
{
    FieldClearVBlankHBlankCallbacks();
    gFieldCallback = FieldCB_ContinueScript;
    CB2_ReturnToField();
}

void CB2_ReturnToFieldContinueScriptPlayMapMusic(void)
{
    FieldClearVBlankHBlankCallbacks();
    gFieldCallback = FieldCB_ContinueScriptHandleMusic;
    CB2_ReturnToField();
}

void CB2_ReturnToFieldFromDiploma(void)
{
    FieldClearVBlankHBlankCallbacks();
    gFieldCallback = FieldCB_WarpExitFadeFromBlack;
    CB2_ReturnToField();
}

static void FieldCB_ShowMapNameOnContinue(void)
{
    if (gMapHeader.showMapName == TRUE)
        ShowMapNamePopup(FALSE);
    FieldCB_WarpExitFadeFromBlack();
}

void CB2_ContinueSavedGame(void)
{
    FieldClearVBlankHBlankCallbacks();
    StopMapMusic();
    ResetSafariZoneFlag_();
    LoadSaveblockMapHeader();
    LoadSaveblockObjEventScripts();
    UnfreezeObjectEvents();
    Overworld_ResetStateOnContinue();
    InitMapFromSavedGame();
    PlayTimeCounter_Start();
    ScriptContext_Init();
    UnlockPlayerFieldControls();
    gFieldCallback2 = NULL;
    gExitStairsMovementDisabled = TRUE;
    if (UseContinueGameWarp() == TRUE)
    {
        ClearContinueGameWarpStatus();
        SetWarpDestinationToContinueGameWarp();
        WarpIntoMap();
        SetMainCallback2(CB2_LoadMap);
    }
    else
    {
        gFieldCallback = FieldCB_ShowMapNameOnContinue;
        SetMainCallback1(CB1_Overworld);
        CB2_ReturnToField();
    }
}

static void FieldClearVBlankHBlankCallbacks(void)
{
    if (UsedPokemonCenterWarp() == TRUE)
        CloseLink();

    if (gWirelessCommType != 0)
    {
        EnableInterrupts(INTR_FLAG_VBLANK | INTR_FLAG_VCOUNT | INTR_FLAG_TIMER3 | INTR_FLAG_SERIAL);
        DisableInterrupts(INTR_FLAG_HBLANK);
    }
    else
    {
        DisableInterrupts(INTR_FLAG_HBLANK);
        EnableInterrupts(INTR_FLAG_VBLANK);
    }

    SetVBlankCallback(NULL);
    SetHBlankCallback(NULL);
}

static void SetFieldVBlankCallback(void)
{
    SetVBlankCallback(VBlankCB_Field);
}

static void VBlankCB_Field(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    ScanlineEffect_InitHBlankDmaTransfer();
    FieldUpdateBgTilemapScroll();
    TransferPlttBuffer();
    TransferTilesetAnimsBuffer();
}

static void InitCurrentFlashLevelScanlineEffect(void)
{
    u8 flashLevel = Overworld_GetFlashLevel();
    if (flashLevel != 0)
    {
        WriteFlashScanlineEffectBuffer(flashLevel);
        ScanlineEffect_SetParams((struct ScanlineEffectParams){
            .dmaDest = &REG_WIN0H,
            .dmaControl = (2 >> 1) | ((DMA_16BIT | DMA_DEST_RELOAD | DMA_SRC_INC | DMA_REPEAT | DMA_START_HBLANK | DMA_ENABLE) << 16),
            .initState = 1,
            .unused9 = 0
        });
    }
}

static bool32 LoadMapInStepsLink(u8 *state)
{
    switch (*state)
    {
    case 0:
        InitOverworldBgs();
        ScriptContext_Init();
        UnlockPlayerFieldControls();
        (*state)++;
        break;
    case 1:
        LoadMapFromWarp(TRUE);
        (*state)++;
        break;
    case 2:
        ResumeMap(TRUE);
        (*state)++;
        break;
    case 3:
        OffsetCameraFocusByLinkPlayerId();
        InitObjectEventsLink();
        SpawnLinkPlayers();
        SetCameraToTrackGuestPlayer();
        SetHelpContextForMap();
        (*state)++;
        break;
    case 4:
        InitCurrentFlashLevelScanlineEffect();
        InitOverworldGraphicsRegisters();
        (*state)++;
        break;
    case 5:
        move_tilemap_camera_to_upper_left_corner();
        (*state)++;
        break;
    case 6:
        CopyPrimaryTilesetToVram(gMapHeader.mapLayout);
        (*state)++;
        break;
    case 7:
        CopySecondaryTilesetToVram(gMapHeader.mapLayout);
        (*state)++;
        break;
    case 8:
        if (FreeTempTileDataBuffersIfPossible() != TRUE)
        {
            LoadMapTilesetPalettes(gMapHeader.mapLayout);
            (*state)++;
        }
        break;
    case 9:
        DrawWholeMapView();
        (*state)++;
        break;
    case 10:
        InitTilesetAnimations();
        (*state)++;
        break;
    case 11:
        if (gWirelessCommType != 0)
        {
            LoadWirelessStatusIndicatorSpriteGfx();
            CreateWirelessStatusIndicatorSprite(0, 0);
        }
        (*state)++;
        break;
    case 12:
        if (RunFieldCallback())
            (*state)++;
        break;
    case 13:
        return TRUE;
    }

    return FALSE;
}

static bool32 LoadMapInStepsLocal(u8 *state, bool32 inLink)
{
    switch (*state)
    {
    case 0:
        InitOverworldBgs();
        FieldClearVBlankHBlankCallbacks();
        LoadMapFromWarp(inLink);
        (*state)++;
        break;
    case 1:
        QuestLog_InitPalettesBackup();
        (*state)++;
        break;
    case 2:
        ResumeMap(inLink);
        (*state)++;
        break;
    case 3:
        if (QuestLog_ShouldEndSceneOnMapChange() == TRUE)
            return TRUE;
        (*state)++;
        break;
    case 4:
        InitObjectEventsLocal();
        SetCameraToTrackPlayer();
        if (gQuestLogState != QL_STATE_PLAYBACK)
        {
            QuestLog_CheckDepartingIndoorsMap();
            QuestLog_TryRecordDepartedLocation();
        }
        SetHelpContextForMap();
        (*state)++;
        break;
    case 5:
        InitCurrentFlashLevelScanlineEffect();
        InitOverworldGraphicsRegisters();
        (*state)++;
        break;
    case 6:
        move_tilemap_camera_to_upper_left_corner();
        (*state)++;
        break;
    case 7:
        CopyPrimaryTilesetToVram(gMapHeader.mapLayout);
        (*state)++;
        break;
    case 8:
        CopySecondaryTilesetToVram(gMapHeader.mapLayout);
        (*state)++;
        break;
    case 9:
        if (FreeTempTileDataBuffersIfPossible() != TRUE)
        {
            LoadMapTilesetPalettes(gMapHeader.mapLayout);
            (*state)++;
        }
        break;
    case 10:
        DrawWholeMapView();
        (*state)++;
        break;
    case 11:
        InitTilesetAnimations();
        (*state)++;
        break;
    case 12:
        if (GetLastUsedWarpMapSectionId() != gMapHeader.regionMapSectionId && MapHasPreviewScreen_HandleQLState2(gMapHeader.regionMapSectionId, MPS_TYPE_FOREST) == TRUE)
        {
            MapPreview_LoadGfx(gMapHeader.regionMapSectionId);
            MapPreview_StartForestTransition(gMapHeader.regionMapSectionId);
        }
        else if (gMapHeader.showMapName == TRUE)
        {
            ShowMapNamePopup(FALSE);
        }
        (*state)++;
        break;
    case 13:
        if (RunFieldCallback())
            (*state)++;
        break;
    case 14:
        return TRUE;
    }
    return FALSE;
}

static bool32 ReturnToFieldLocal(u8 *state)
{
    switch (*state)
    {
    case 0:
        InitOverworldBgs();
        QuestLog_InitPalettesBackup();
        ResumeMap(FALSE);
        ReloadObjectsAndRunReturnToFieldMapScript();
        SetCameraToTrackPlayer();
        (*state)++;
        break;
    case 1:
        (*state)++;
        break;
    case 2:
        InitViewGraphics();
        SetHelpContextForMap();
        (*state)++;
        break;
    case 3:
        if (RunFieldCallback())
            (*state)++;
        break;
    case 4:
        return TRUE;
    }
    return FALSE;
}

static bool32 ReturnToFieldLink(u8 *state)
{
    switch (*state)
    {
    case 0:
        InitOverworldBgs();
        FieldClearVBlankHBlankCallbacks();
        (*state)++;
        break;
    case 1:
        QuestLog_InitPalettesBackup();
        ResumeMap(TRUE);
        (*state)++;
        break;
    case 2:
        CreateLinkPlayerSprites();
        ReloadObjectsAndRunReturnToFieldMapScript();
        SetCameraToTrackGuestPlayer_2();
        SetHelpContextForMap();
        (*state)++;
        break;
    case 3:
        InitCurrentFlashLevelScanlineEffect();
        InitOverworldGraphicsRegisters();
        (*state)++;
        break;
    case 4:
        move_tilemap_camera_to_upper_left_corner();
        (*state)++;
        break;
    case 5:
        CopyPrimaryTilesetToVram(gMapHeader.mapLayout);
        (*state)++;
        break;
    case 6:
        CopySecondaryTilesetToVram(gMapHeader.mapLayout);
        (*state)++;
        break;
    case 7:
        if (FreeTempTileDataBuffersIfPossible() != TRUE)
        {
            LoadMapTilesetPalettes(gMapHeader.mapLayout);
            (*state)++;
        }
        break;
    case 8:
        DrawWholeMapView();
        (*state)++;
        break;
    case 9:
        InitTilesetAnimations();
        (*state)++;
        break;
    case 10:
        (*state)++;
        break;
    case 11:
        if (gWirelessCommType != 0)
        {
            LoadWirelessStatusIndicatorSpriteGfx();
            CreateWirelessStatusIndicatorSprite(0, 0);
        }
        (*state)++;
        break;
    case 12:
        if (RunFieldCallback())
            (*state)++;
        break;
    case 13:
        SetFieldVBlankCallback();
        (*state)++;
        return TRUE;
    }

    return FALSE;
}

static void DoMapLoadLoop(u8 *state)
{
    while (!LoadMapInStepsLocal(state, FALSE)) ;
}

static void MoveSaveBlocks_ResetHeap_(void)
{
    MoveSaveBlocks_ResetHeap();
}

static void ResetScreenForMapLoad(void)
{
    SetGpuReg(REG_OFFSET_DISPCNT, 0);
    ScanlineEffect_Stop();

    DmaClear16(3, PLTT + 2, PLTT_SIZE - 2);
    DmaFillLarge16(3, 0, (void *)(VRAM + 0x0), 0x18000, 0x1000);
    ResetOamRange(0, 128);
    LoadOam();
}

static void InitViewGraphics(void)
{
    InitCurrentFlashLevelScanlineEffect();
    InitOverworldGraphicsRegisters();
    InitMapView();
}

static void InitOverworldGraphicsRegisters(void)
{
    ClearScheduledBgCopiesToVram();
    ResetTempTileDataBuffers();
    SetGpuReg(REG_OFFSET_MOSAIC, 0);
    SetGpuReg(REG_OFFSET_WININ, WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN1_BG_ALL | WININ_WIN1_OBJ);
    SetGpuReg(REG_OFFSET_WINOUT, WINOUT_WIN01_BG0 | WINOUT_WINOBJ_BG0);
    SetGpuReg(REG_OFFSET_WIN0H, WIN_RANGE(0, 255));
    SetGpuReg(REG_OFFSET_WIN0V, WIN_RANGE(0, 255));
    SetGpuReg(REG_OFFSET_WIN1H, WIN_RANGE(255, 255));
    SetGpuReg(REG_OFFSET_WIN1V, WIN_RANGE(255, 255));
    SetGpuReg(REG_OFFSET_BLDCNT, gOverworldBackgroundLayerFlags[1] | gOverworldBackgroundLayerFlags[2] | gOverworldBackgroundLayerFlags[3]
                                 | BLDCNT_TGT2_OBJ | BLDCNT_EFFECT_BLEND);
    SetGpuReg(REG_OFFSET_BLDALPHA, BLDALPHA_BLEND(13, 7));
    ScheduleBgCopyTilemapToVram(1);
    ScheduleBgCopyTilemapToVram(2);
    ScheduleBgCopyTilemapToVram(3);
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | 0x20 | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON | DISPCNT_WIN1_ON);
    ShowBg(0);
    ShowBg(1);
    ShowBg(2);
    ShowBg(3);
    ChangeBgX(0, 0, 0);
    ChangeBgY(0, 0, 0);
    ChangeBgX(1, 0, 0);
    ChangeBgY(1, 0, 0);
    ChangeBgX(2, 0, 0);
    ChangeBgY(2, 0, 0);
    ChangeBgX(3, 0, 0);
    ChangeBgY(3, 0, 0);
}

static void ResumeMap(bool32 inLink)
{
    ResetTasks();
    ResetSpriteData();
    ResetPaletteFade();
    ScanlineEffect_Clear();
    ResetAllPicSprites();
    ResetCameraUpdateInfo();
    InstallCameraPanAheadCallback();
    if (!inLink)
        InitObjectEventPalettes(0);
    else
        InitObjectEventPalettes(1);

    FieldEffectActiveListClear();
    StartWeather();
    ResumePausedWeather();
    if (!inLink)
        SetUpFieldTasks();
    RunOnResumeMapScript();
}

static void InitObjectEventsLink(void)
{
    gTotalCameraPixelOffsetX = 0;
    gTotalCameraPixelOffsetY = 0;
    ResetObjectEvents();
    TrySpawnObjectEvents(0, 0);
    TryRunOnWarpIntoMapScript();
}

static void InitObjectEventsLocal(void)
{
    s16 x, y;
    struct InitialPlayerAvatarState *player;

    gTotalCameraPixelOffsetX = 0;
    gTotalCameraPixelOffsetY = 0;
    ResetObjectEvents();
    GetCameraFocusCoords(&x, &y);
    player = GetInitialPlayerAvatarState();
    InitPlayerAvatar(x, y, player->direction, gSaveBlock2Ptr->playerGender);
    SetPlayerAvatarTransitionFlags(player->transitionFlags);
    ResetInitialPlayerAvatarState();
    TrySpawnObjectEvents(0, 0);
    TryRunOnWarpIntoMapScript();
}

static void ReloadObjectsAndRunReturnToFieldMapScript(void)
{
    SpawnObjectEventsOnReturnToField(0, 0);
    RunOnReturnToFieldMapScript();
}

static void SetCameraToTrackPlayer(void)
{
    gObjectEvents[gPlayerAvatar.objectEventId].trackedByCamera = TRUE;
    InitCameraUpdateCallback(gPlayerAvatar.spriteId);
}

static void SetCameraToTrackGuestPlayer(void)
{
    InitCameraUpdateCallback(GetSpriteForLinkedPlayer(gLocalLinkPlayerId));
}

// Duplicate function.
static void SetCameraToTrackGuestPlayer_2(void)
{
    InitCameraUpdateCallback(GetSpriteForLinkedPlayer(gLocalLinkPlayerId));
}

static void OffsetCameraFocusByLinkPlayerId(void)
{
    u16 x, y;
    GetCameraFocusCoords(&x, &y);

    // This is a hack of some kind; it's undone in SpawnLinkPlayers, which is called
    // soon after this function.
    SetCameraFocusCoords(x + gLocalLinkPlayerId, y);
}

static void SpawnLinkPlayers(void)
{
    u16 i;
    u16 x, y;

    GetCameraFocusCoords(&x, &y);
    x -= gLocalLinkPlayerId;

    for (i = 0; i < gFieldLinkPlayerCount; i++)
    {
        SpawnLinkPlayerObjectEvent(i, i + x, y, gLinkPlayers[i].gender);
        CreateLinkPlayerSprite(i, gLinkPlayers[i].version);
    }

    ClearAllPlayerKeys();
}

static void CreateLinkPlayerSprites(void)
{
    u16 i;
    for (i = 0; i < gFieldLinkPlayerCount; i++)
        CreateLinkPlayerSprite(i, gLinkPlayers[i].version);
}

// Quest Log

void CB2_SetUpOverworldForQLPlaybackWithWarpExit(void)
{
    FieldClearVBlankHBlankCallbacks();
    gGlobalFieldTintMode = QL_TINT_GRAYSCALE;
    ScriptContext_Init();
    UnlockPlayerFieldControls();
    SetMainCallback1(NULL);
    SetMainCallback2(CB2_DoChangeMap);
    gMain.savedCallback = CB2_LoadMapForQLPlayback;
}

void CB2_SetUpOverworldForQLPlayback(void)
{
    FieldClearVBlankHBlankCallbacks();
    gGlobalFieldTintMode = QL_TINT_GRAYSCALE;
    LoadSaveblockMapHeader();
    ScriptContext_Init();
    UnlockPlayerFieldControls();
    SetMainCallback1(NULL);
    SetMainCallback2(CB2_LoadMapForQLPlayback);
}

static void CB2_LoadMapForQLPlayback(void)
{
    DoLoadMap_QLPlayback(&gMain.state);
    SetFieldVBlankCallback();
    SetMainCallback1(CB1_Overworld);
    SetMainCallback2(CB2_Overworld);
}

static void DoLoadMap_QLPlayback(u8 *state)
{
    while (!LoadMap_QLPlayback(state))
        ;
}

static bool32 LoadMap_QLPlayback(u8 *state)
{
    switch (*state)
    {
    case 0:
        InitOverworldBgs();
        FieldClearVBlankHBlankCallbacks();
        QuestLog_InitPalettesBackup();
        QL_CopySaveState();
        QL_ResetPartyAndPC();
        if (GetQuestLogStartType() == QL_START_WARP)
        {
            gExitStairsMovementDisabled = FALSE;
            LoadMapFromWarp(FALSE);
        }
        else
        {
            gExitStairsMovementDisabled = TRUE;
            QL_LoadMapNormal();
        }
        (*state)++;
        break;
    case 1:
        QL_InitSceneObjectsAndActions();
        (*state)++;
        break;
    case 2:
        ResumeMap(FALSE);
        (*state)++;
        break;
    case 3:
        ReloadObjectsAndRunReturnToFieldMapScript();
        SetCameraToTrackPlayer();
        (*state)++;
        break;
    case 4:
        InitCurrentFlashLevelScanlineEffect();
        InitOverworldGraphicsRegisters();
        (*state)++;
        break;
    case 5:
        move_tilemap_camera_to_upper_left_corner();
        (*state)++;
        break;
    case 6:
        CopyPrimaryTilesetToVram(gMapHeader.mapLayout);
        (*state)++;
        break;
    case 7:
        CopySecondaryTilesetToVram(gMapHeader.mapLayout);
        (*state)++;
        break;
    case 8:
        if (FreeTempTileDataBuffersIfPossible() != TRUE)
        {
            LoadMapTilesetPalettes(gMapHeader.mapLayout);
            (*state)++;
        }
        break;
    case 9:
        DrawWholeMapView();
        (*state)++;
        break;
    case 10:
        InitTilesetAnimations();
        QL_TryStopSurfing();
        (*state)++;
        break;
    default:
        if (RunFieldCallback())
            return TRUE;
        break;
    }
    return FALSE;
}

void CB2_EnterFieldFromQuestLog(void)
{
    FieldClearVBlankHBlankCallbacks();
    StopMapMusic();
    gGlobalFieldTintMode = QL_TINT_BACKUP_GRAYSCALE;
    ResetSafariZoneFlag_();
    LoadSaveblockMapHeader();
    LoadSaveblockObjEventScripts();
    UnfreezeObjectEvents();
    Overworld_ResetStateOnContinue();
    InitMapFromSavedGame();
    PlayTimeCounter_Start();
    ScriptContext_Init();
    gExitStairsMovementDisabled = TRUE;
    if (UseContinueGameWarp() == TRUE)
    {
        ClearContinueGameWarpStatus();
        SetWarpDestinationToContinueGameWarp();
        WarpIntoMap();
        SetMainCallback2(CB2_LoadMap);
    }
    else
    {
        SetMainCallback1(CB1_Overworld);
        CB2_ReturnToField();
    }
}

// Credits

void Overworld_CreditsMainCB(void)
{
    bool8 fading = !!gPaletteFade.active;
    if (fading)
        SetVBlankCallback(NULL);
    RunTasks();
    AnimateSprites();
    CameraUpdateNoObjectRefresh();
    UpdateCameraPanning();
    BuildOamBuffer();
    UpdatePaletteFade();
    UpdateTilesetAnimations();
    DoScheduledBgTilemapCopiesToVram();
    if (fading)
        SetFieldVBlankCallback();
}

static bool8 FieldCB2_Credits_WaitFade(void)
{
    if (gPaletteFade.active)
        return TRUE;
    else
        return FALSE;
}

bool32 Overworld_DoScrollSceneForCredits(u8 *state_p, const struct CreditsOverworldCmd * script, u8 tintMode)
{
    sCreditsOverworld_Script = script;
    gGlobalFieldTintMode = tintMode;
    return SetUpScrollSceneForCredits(state_p, 0);
}

static bool32 SetUpScrollSceneForCredits(u8 *state, u8 unused)
{
    struct WarpData warp;
    switch (*state)
    {
    case 0:
        sCreditsOverworld_CmdIndex = 0;
        sCreditsOverworld_CmdLength = 0;
        (*state)++;
        return FALSE;
    case 1:
        warp.mapGroup = sCreditsOverworld_Script[sCreditsOverworld_CmdIndex].unk_2;
        warp.mapNum = sCreditsOverworld_Script[sCreditsOverworld_CmdIndex].unk_4;
        warp.warpId = -1;
        sCreditsOverworld_CmdIndex++;
        warp.x = sCreditsOverworld_Script[sCreditsOverworld_CmdIndex].unk_0;
        warp.y = sCreditsOverworld_Script[sCreditsOverworld_CmdIndex].unk_2;
        sWarpDestination = warp;
        sCreditsOverworld_CmdLength = sCreditsOverworld_Script[sCreditsOverworld_CmdIndex].unk_4;
        WarpIntoMap();
        gPaletteFade.bufferTransferDisabled = TRUE;
        ScriptContext_Init();
        UnlockPlayerFieldControls();
        SetMainCallback1(NULL);
        gFieldCallback2 = FieldCB2_Credits_WaitFade;
        gMain.state = 0;
        (*state)++;
        return FALSE;
    case 2:
        if (MapLdr_Credits())
        {
            (*state)++;
            return FALSE;
        }
        break;
    case 3:
        gFieldCamera.callback = CameraCB_CreditsPan;
        SetFieldVBlankCallback();
        *state = 0;
        return TRUE;
    }
    return FALSE;
}

static bool8 MapLdr_Credits(void)
{
    u8 *state = &gMain.state;
    switch (*state)
    {
    case 0:
        InitOverworldBgs_NoResetHeap();
        LoadMapFromWarp(FALSE);
        (*state)++;
        break;
    case 1:
        ScanlineEffect_Clear();
        ResetAllPicSprites();
        ResetCameraUpdateInfo();
        InstallCameraPanAheadCallback();
        FieldEffectActiveListClear();
        StartWeather();
        ResumePausedWeather();
        SetUpFieldTasks();
        RunOnResumeMapScript();
        (*state)++;
        break;
    case 2:
        InitCurrentFlashLevelScanlineEffect();
        InitOverworldGraphicsRegisters();
        (*state)++;
        break;
    case 3:
        move_tilemap_camera_to_upper_left_corner();
        (*state)++;
        break;
    case 4:
        CopyPrimaryTilesetToVram(gMapHeader.mapLayout);
        (*state)++;
        break;
    case 5:
        CopySecondaryTilesetToVram(gMapHeader.mapLayout);
        (*state)++;
        break;
    case 6:
        if (FreeTempTileDataBuffersIfPossible() != TRUE)
        {
            LoadMapTilesetPalettes(gMapHeader.mapLayout);
            (*state)++;
        }
        break;
    case 7:
        DrawWholeMapView();
        (*state)++;
        break;
    case 8:
        InitTilesetAnimations();
        gPaletteFade.bufferTransferDisabled = FALSE;
        FadeSelectedPals(FADE_FROM_BLACK, 0, 0x3FFFFFFF);
        (*state)++;
        break;
    default:
        return TRUE;
    }
    return FALSE;
}

static void CameraCB_CreditsPan(struct CameraObject * camera)
{
    if (sCreditsOverworld_CmdLength == 0)
    {
        sCreditsOverworld_CmdIndex++;
        switch (sCreditsOverworld_Script[sCreditsOverworld_CmdIndex].unk_0)
        {
        case CREDITSOVWLDCMD_FC:
        case CREDITSOVWLDCMD_LOADMAP:
            return;
        case CREDITSOVWLDCMD_FF:
            camera->movementSpeedX = 0;
            camera->movementSpeedY = 0;
            camera->callback = NULL;
            CreateTask(Task_OvwldCredits_FadeOut, 0);
            return;
        case CREDITSOVWLDCMD_FB:
            camera->movementSpeedX = 0;
            camera->movementSpeedY = 0;
            camera->callback = NULL;
            break;
        case CREDITSOVWLDCMD_END:
            camera->movementSpeedX = 0;
            camera->movementSpeedY = 0;
            camera->callback = NULL;
            return;
        default:
            sCreditsOverworld_CmdLength = sCreditsOverworld_Script[sCreditsOverworld_CmdIndex].unk_4;
            camera->movementSpeedX = sCreditsOverworld_Script[sCreditsOverworld_CmdIndex].unk_0;
            camera->movementSpeedY = sCreditsOverworld_Script[sCreditsOverworld_CmdIndex].unk_2;
            break;
        }
    }
    if (sCreditsOverworld_Script[sCreditsOverworld_CmdIndex].unk_0 == 0xFF)
    {
        camera->movementSpeedX = 0;
        camera->movementSpeedY = 0;
    }
    else
        sCreditsOverworld_CmdLength--;
}

static void Task_OvwldCredits_FadeOut(u8 taskId)
{
    BeginNormalPaletteFade(PALETTES_ALL, 0, 0, 16, RGB_BLACK);
    gTasks[taskId].func = Task_OvwldCredits_WaitFade;
}

static void Task_OvwldCredits_WaitFade(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        CleanupOverworldWindowsAndTilemaps();
        SetMainCallback2(CB2_LoadMap);
        DestroyTask(taskId);
    }
}

// Link related

static u8 (*const sLinkPlayerMovementModes[])(struct LinkPlayerObjectEvent *, struct ObjectEvent *, u8) =
{
    [MOVEMENT_MODE_FREE]     = MovementEventModeCB_Normal,
    [MOVEMENT_MODE_FROZEN]   = MovementEventModeCB_Ignored,
    [MOVEMENT_MODE_SCRIPTED] = MovementEventModeCB_Normal_2,
};

// These handlers return TRUE if the movement was scripted and successful, and FALSE otherwise.
static bool8 (*const sLinkPlayerFacingHandlers[])(struct LinkPlayerObjectEvent *, struct ObjectEvent *, u8) =
{
    [DIR_NONE]  = FacingHandler_DoNothing,
    [DIR_SOUTH] = FacingHandler_DpadMovement,
    [DIR_NORTH] = FacingHandler_DpadMovement,
    [DIR_WEST]  = FacingHandler_DpadMovement,
    [DIR_EAST]  = FacingHandler_DpadMovement,
};

static bool8 (*const sUnusedLinkPlayerFacingHandlers[])(struct LinkPlayerObjectEvent *, struct ObjectEvent *, u8) =
{
    FacingHandler_DoNothing,
    FacingHandler_DoNothing,
    FacingHandler_ForcedFacingChange,
    FacingHandler_ForcedFacingChange,
    FacingHandler_ForcedFacingChange,
    FacingHandler_ForcedFacingChange,
};

// These handlers are run after an attempted movement.
static void (*const sMovementStatusHandler[])(struct LinkPlayerObjectEvent *, struct ObjectEvent *) = {
    [FALSE] = MovementStatusHandler_EnterFreeMode,
    [TRUE]  = MovementStatusHandler_TryAdvanceScript,
};

static void CB1_UpdateLinkState(void)
{
    if (gWirelessCommType == 0 || !IsRfuRecvQueueEmpty() || !IsSendingKeysToLink())
    {
        u8 selfId = gLocalLinkPlayerId;
        UpdateAllLinkPlayers(gLinkPartnersHeldKeys, selfId);

        // Note: Because guestId is between 0 and 4, while the smallest key code is
        // LINK_KEY_CODE_EMPTY, this is functionally equivalent to `sPlayerKeyInterceptCallback(0)`.
        // It is expecting the callback to be KeyInterCB_SelfIdle, and that will
        // completely ignore any input parameters.
        //
        // UpdateHeldKeyCode performs a sanity check on its input; if
        // sPlayerKeyInterceptCallback echoes back the argument, which is selfId, then
        // it'll use LINK_KEY_CODE_EMPTY instead.
        //
        // Note 2: There are some key intercept callbacks that treat the key as a player
        // ID. It's so hacky.
        UpdateHeldKeyCode(sPlayerKeyInterceptCallback(selfId));
        ClearAllPlayerKeys();
    }
}

static void ResetAllMultiplayerState(void)
{
    ResetAllLinkStates();
    SetKeyInterceptCallback(KeyInterCB_SelfIdle);
}

static void ClearAllPlayerKeys(void)
{
    ResetPlayerHeldKeys(gLinkPartnersHeldKeys);
}

static void SetKeyInterceptCallback(KeyInterCB func)
{
    sRfuKeepAliveTimer = 0;
    sPlayerKeyInterceptCallback = func;
}

// Once every ~60 frames, if the link state hasn't changed (timer reset by calls
// to SetKeyInterceptCallback), it does a bunch of sanity checks on the connection.
// I'm not sure if sRfuKeepAliveTimer is reset in the process, though; rfu stuff is
// still undocumented.
static void CheckRfuKeepAliveTimer(void)
{
    if (gWirelessCommType != 0 && ++sRfuKeepAliveTimer > 60)
        LinkRfu_FatalError();
}

static void ResetAllLinkStates(void)
{
    s32 i;
    for (i = 0; i < 4; i++)
        sPlayerLinkStates[i] = PLAYER_LINK_STATE_IDLE;
}

// Returns true if all connected players are in linkState.
static bool32 AreAllPlayersInLinkState(u16 linkState)
{
    s32 i;
    s32 count = gFieldLinkPlayerCount;

    for (i = 0; i < count; i++)
        if (sPlayerLinkStates[i] != linkState)
            return FALSE;
    return TRUE;
}

static bool32 IsAnyPlayerInLinkState(u16 linkState)
{
    s32 i;
    s32 count = gFieldLinkPlayerCount;

    for (i = 0; i < count; i++)
        if (sPlayerLinkStates[i] == linkState)
            return TRUE;
    return FALSE;
}

static void HandleLinkPlayerKeyInput(u32 playerId, u16 key, struct CableClubPlayer *player, u16 *forceFacing)
{
    const u8 *script;

    if (sPlayerLinkStates[playerId] == PLAYER_LINK_STATE_IDLE)
    {
        script = TryGetTileEventScript(player);
        if (script)
        {
            *forceFacing = GetDirectionForEventScript(script);
            sPlayerLinkStates[playerId] = PLAYER_LINK_STATE_BUSY;
            if (player->isLocalPlayer)
            {
                SetKeyInterceptCallback(KeyInterCB_DeferToEventScript);
                RunInteractLocalPlayerScript(script);
            }
            return;
        }
        if (IsAnyPlayerInLinkState(PLAYER_LINK_STATE_EXITING_ROOM) == TRUE)
        {
            sPlayerLinkStates[playerId] = PLAYER_LINK_STATE_BUSY;
            if (player->isLocalPlayer)
            {
                SetKeyInterceptCallback(KeyInterCB_DeferToEventScript);
                RunTerminateLinkScript();
            }
            return;
        }

        switch (key)
        {
        case LINK_KEY_CODE_START_BUTTON:
            if (CanCableClubPlayerPressStart(player))
            {
                sPlayerLinkStates[playerId] = PLAYER_LINK_STATE_BUSY;
                if (player->isLocalPlayer)
                {
                    SetKeyInterceptCallback(KeyInterCB_DeferToEventScript);
                    InitLinkRoomStartMenuScript();
                }
            }
            break;
        case LINK_KEY_CODE_DPAD_DOWN:
            if (PlayerIsAtSouthExit(player) == TRUE)
            {
                sPlayerLinkStates[playerId] = PLAYER_LINK_STATE_BUSY;
                if (player->isLocalPlayer)
                {
                    SetKeyInterceptCallback(KeyInterCB_DeferToEventScript);
                    CreateConfirmLeaveTradeRoomPrompt();
                }
            }
            break;
        case LINK_KEY_CODE_A_BUTTON:
            script = TryInteractWithPlayer(player);
            if (script)
            {
                sPlayerLinkStates[playerId] = PLAYER_LINK_STATE_BUSY;
                if (player->isLocalPlayer)
                {
                    SetKeyInterceptCallback(KeyInterCB_DeferToEventScript);
                    InitMenuBasedScript(script);
                }
            }
            break;
        case LINK_KEY_CODE_HANDLE_RECV_QUEUE:
            if (IsCableClubPlayerUnfrozen(player))
            {
                sPlayerLinkStates[playerId] = PLAYER_LINK_STATE_BUSY;
                if (player->isLocalPlayer)
                {
                    SetKeyInterceptCallback(KeyInterCB_DeferToRecvQueue);
                    InitLinkPlayerQueueScript();
                }
            }
            break;
        case LINK_KEY_CODE_HANDLE_SEND_QUEUE:
            if (IsCableClubPlayerUnfrozen(player))
            {
                sPlayerLinkStates[playerId] = PLAYER_LINK_STATE_BUSY;
                if (player->isLocalPlayer)
                {
                    SetKeyInterceptCallback(KeyInterCB_DeferToSendQueue);
                    InitLinkPlayerQueueScript();
                }
            }
            break;
        }
    }

    switch (key)
    {
    case LINK_KEY_CODE_EXIT_ROOM:
        sPlayerLinkStates[playerId] = PLAYER_LINK_STATE_EXITING_ROOM;
        break;
    case LINK_KEY_CODE_READY:
        sPlayerLinkStates[playerId] = PLAYER_LINK_STATE_READY;
        break;
    case LINK_KEY_CODE_IDLE:
        sPlayerLinkStates[playerId] = PLAYER_LINK_STATE_IDLE;
        if (player->isLocalPlayer)
            SetKeyInterceptCallback(KeyInterCB_SelfIdle);
        break;
    case LINK_KEY_CODE_EXIT_SEAT:
        if (sPlayerLinkStates[playerId] == PLAYER_LINK_STATE_READY)
            sPlayerLinkStates[playerId] = PLAYER_LINK_STATE_BUSY;
        break;
    }
}

static void UpdateAllLinkPlayers(u16 *keys, s32 selfId)
{
    struct CableClubPlayer player;
    s32 i;

    for (i = 0; i < MAX_LINK_PLAYERS; i++)
    {
        u8 key = keys[i];
        u16 setFacing = FACING_NONE;
        LoadCableClubPlayer(i, selfId, &player);
        HandleLinkPlayerKeyInput(i, key, &player, &setFacing);
        if (sPlayerLinkStates[i] == PLAYER_LINK_STATE_IDLE)
            setFacing = GetDirectionForDpadKey(key);
        SetPlayerFacingDirection(i, setFacing);
    }
}

static void UpdateHeldKeyCode(u16 key)
{
    if (key >= LINK_KEY_CODE_EMPTY && key <= LINK_KEY_CODE_EXIT_SEAT)
        gHeldKeyCodeToSend = key;
    else
        gHeldKeyCodeToSend = LINK_KEY_CODE_EMPTY;

    if (gWirelessCommType != 0
        && GetLinkSendQueueLength() > 1
        && IsUpdateLinkStateCBActive() == TRUE
        && IsSendingKeysToLink() == TRUE)
    {
        switch (key)
        {
        case LINK_KEY_CODE_EMPTY:
        case LINK_KEY_CODE_DPAD_DOWN:
        case LINK_KEY_CODE_DPAD_UP:
        case LINK_KEY_CODE_DPAD_LEFT:
        case LINK_KEY_CODE_DPAD_RIGHT:
        case LINK_KEY_CODE_START_BUTTON:
        case LINK_KEY_CODE_A_BUTTON:
            gHeldKeyCodeToSend = LINK_KEY_CODE_NULL;
            break;
        }
    }
}

static u16 KeyInterCB_ReadButtons(u32 key)
{
    if (JOY_HELD(DPAD_UP))
        return LINK_KEY_CODE_DPAD_UP;
    else if (JOY_HELD(DPAD_DOWN))
        return LINK_KEY_CODE_DPAD_DOWN;
    else if (JOY_HELD(DPAD_LEFT))
        return LINK_KEY_CODE_DPAD_LEFT;
    else if (JOY_HELD(DPAD_RIGHT))
        return LINK_KEY_CODE_DPAD_RIGHT;
    else if (JOY_NEW(START_BUTTON))
        return LINK_KEY_CODE_START_BUTTON;
    else if (JOY_NEW(A_BUTTON))
        return LINK_KEY_CODE_A_BUTTON;
    else
        return LINK_KEY_CODE_EMPTY;
}

static u16 GetDirectionForDpadKey(u16 a1)
{
    switch (a1)
    {
    case LINK_KEY_CODE_DPAD_RIGHT:
        return FACING_RIGHT;
    case LINK_KEY_CODE_DPAD_LEFT:
        return FACING_LEFT;
    case LINK_KEY_CODE_DPAD_UP:
        return FACING_UP;
    case LINK_KEY_CODE_DPAD_DOWN:
        return FACING_DOWN;
    default:
        return FACING_NONE;
    }
}

// Overwrites the keys with 0x11
static void ResetPlayerHeldKeys(u16 *keys)
{
    s32 i;
    for (i = 0; i < 4; i++)
        keys[i] = LINK_KEY_CODE_EMPTY;
}

static u16 KeyInterCB_SelfIdle(u32 key)
{
    if (ArePlayerFieldControlsLocked() == TRUE)
        return LINK_KEY_CODE_EMPTY;
    if (GetLinkRecvQueueLength() > 4)
        return LINK_KEY_CODE_HANDLE_RECV_QUEUE;
    if (GetLinkSendQueueLength() <= 4)
        return KeyInterCB_ReadButtons(key);
    return LINK_KEY_CODE_HANDLE_SEND_QUEUE;
}

static u16 KeyInterCB_Idle(u32 key)
{
    CheckRfuKeepAliveTimer();
    return LINK_KEY_CODE_EMPTY;
}

// Ignore the player's inputs as long as there is an event script
// in ScriptContext2.
static u16 KeyInterCB_DeferToEventScript(u32 key)
{
    u16 retVal;
    if (ArePlayerFieldControlsLocked() == TRUE)
    {
        retVal = LINK_KEY_CODE_EMPTY;
    }
    else
    {
        retVal = LINK_KEY_CODE_IDLE;
        SetKeyInterceptCallback(KeyInterCB_Idle);
    }
    return retVal;
}

// Ignore the player's inputs as long as there are events being recived.
static u16 KeyInterCB_DeferToRecvQueue(u32 key)
{
    u16 retVal;
    if (GetLinkRecvQueueLength() > 2)
    {
        retVal = LINK_KEY_CODE_EMPTY;
    }
    else
    {
        retVal = LINK_KEY_CODE_IDLE;
        UnlockPlayerFieldControls();
        SetKeyInterceptCallback(KeyInterCB_Idle);
    }
    return retVal;
}

// Ignore the player's inputs as long as there are events being sent.
static u16 KeyInterCB_DeferToSendQueue(u32 key)
{
    u16 retVal;
    if (GetLinkSendQueueLength() > 2)
    {
        retVal = LINK_KEY_CODE_EMPTY;
    }
    else
    {
        retVal = LINK_KEY_CODE_IDLE;
        UnlockPlayerFieldControls();
        SetKeyInterceptCallback(KeyInterCB_Idle);
    }
    return retVal;
}

static u16 KeyInterCB_DoNothingAndKeepAlive(u32 key)
{
    CheckRfuKeepAliveTimer();
    return LINK_KEY_CODE_EMPTY;
}

static u16 KeyInterCB_Ready(u32 keyOrPlayerId)
{
    if (sPlayerLinkStates[keyOrPlayerId] == PLAYER_LINK_STATE_READY)
    {
        if (JOY_NEW(B_BUTTON))
        {
            SetKeyInterceptCallback(KeyInterCB_DoNothingAndKeepAlive);
            return LINK_KEY_CODE_EXIT_SEAT;
        }
        else
        {
            return LINK_KEY_CODE_EMPTY;
        }
    }
    else
    {
        CheckRfuKeepAliveTimer();
        return LINK_KEY_CODE_EMPTY;
    }
}

static u16 KeyInterCB_SetReady(u32 a1)
{
    SetKeyInterceptCallback(KeyInterCB_Ready);
    return LINK_KEY_CODE_READY;
}

static u16 KeyInterCB_SendNothing(u32 key)
{
    return LINK_KEY_CODE_EMPTY;
}

static u16 KeyInterCB_WaitForPlayersToExit(u32 keyOrPlayerId)
{
    // keyOrPlayerId could be any keycode. This callback does no sanity checking
    // on the size of the key. It's assuming that it is being called from
    // CB1_UpdateLinkState.
    if (sPlayerLinkStates[keyOrPlayerId] != PLAYER_LINK_STATE_EXITING_ROOM)
        CheckRfuKeepAliveTimer();
    if (AreAllPlayersInLinkState(PLAYER_LINK_STATE_EXITING_ROOM) == TRUE)
    {
        ScriptContext_SetupScript(CableClub_EventScript_DoLinkRoomExit);
        SetKeyInterceptCallback(KeyInterCB_SendNothing);
    }
    return LINK_KEY_CODE_EMPTY;
}

static u16 KeyInterCB_SendExitRoomKey(u32 key)
{
    SetKeyInterceptCallback(KeyInterCB_WaitForPlayersToExit);
    return LINK_KEY_CODE_EXIT_ROOM;
}

// Duplicate function.
static u16 KeyInterCB_SendNothing_2(u32 key)
{
    return LINK_KEY_CODE_EMPTY;
}

u32 GetCableClubPartnersReady(void)
{
    if (IsAnyPlayerInLinkState(PLAYER_LINK_STATE_EXITING_ROOM) == TRUE)
        return CABLE_SEAT_FAILED;
    if (sPlayerKeyInterceptCallback == KeyInterCB_Ready && sPlayerLinkStates[gLocalLinkPlayerId] != PLAYER_LINK_STATE_READY)
        return CABLE_SEAT_WAITING;
    if (sPlayerKeyInterceptCallback == KeyInterCB_DoNothingAndKeepAlive && sPlayerLinkStates[gLocalLinkPlayerId] == PLAYER_LINK_STATE_BUSY)
        return CABLE_SEAT_FAILED;
    if (AreAllPlayersInLinkState(PLAYER_LINK_STATE_READY) != FALSE)
        return CABLE_SEAT_SUCCESS;
    return CABLE_SEAT_WAITING;
}

static bool32 IsAnyPlayerExitingCableClub(void)
{
    return IsAnyPlayerInLinkState(PLAYER_LINK_STATE_EXITING_ROOM);
}

u16 SetInCableClubSeat(void)
{
    SetKeyInterceptCallback(KeyInterCB_SetReady);
    return 0;
}

u16 SetLinkWaitingForScript(void)
{
    SetKeyInterceptCallback(KeyInterCB_DeferToEventScript);
    return 0;
}

// The exit room key will be sent at the next opportunity.
// The return value is meaningless.
u16 QueueExitLinkRoomKey(void)
{
    SetKeyInterceptCallback(KeyInterCB_SendExitRoomKey);
    return 0;
}

u16 SetStartedCableClubActivity(void)
{
    SetKeyInterceptCallback(KeyInterCB_SendNothing_2);
    return 0;
}

static void LoadCableClubPlayer(s32 linkPlayerId, s32 myPlayerId, struct CableClubPlayer *player)
{
    s16 x, y;

    player->playerId = linkPlayerId;
    player->isLocalPlayer = (linkPlayerId == myPlayerId) ? TRUE : FALSE;
    player->movementMode = gLinkPlayerObjectEvents[linkPlayerId].movementMode;
    player->facing = GetLinkPlayerFacingDirection(linkPlayerId);
    GetLinkPlayerCoords(linkPlayerId, &x, &y);
    player->pos.x = x;
    player->pos.y = y;
    player->pos.elevation = GetLinkPlayerElevation(linkPlayerId);
    player->metatileBehavior = MapGridGetMetatileBehaviorAt(x, y);
}

static bool32 IsCableClubPlayerUnfrozen(struct CableClubPlayer *player)
{
    u8 mode = player->movementMode;
    if (mode == MOVEMENT_MODE_SCRIPTED || mode == MOVEMENT_MODE_FREE)
        return TRUE;
    else
        return FALSE;
}

// Duplicate function.
static bool32 CanCableClubPlayerPressStart(struct CableClubPlayer *player)
{
    u8 mode = player->movementMode;
    if (mode == MOVEMENT_MODE_SCRIPTED || mode == MOVEMENT_MODE_FREE)
        return TRUE;
    else
        return FALSE;
}

static const u8 *TryGetTileEventScript(struct CableClubPlayer *player)
{
    if (player->movementMode != MOVEMENT_MODE_SCRIPTED)
        return FACING_NONE;
    return GetCoordEventScriptAtMapPosition(&player->pos);
}

static bool32 PlayerIsAtSouthExit(struct CableClubPlayer *player)
{
    if (player->movementMode != MOVEMENT_MODE_SCRIPTED && player->movementMode != MOVEMENT_MODE_FREE)
        return FALSE;
    else if (!MetatileBehavior_IsSouthArrowWarp(player->metatileBehavior))
        return FALSE;
    else if (player->facing != DIR_SOUTH)
        return FALSE;
    else
        return TRUE;
}

static const u8 *TryInteractWithPlayer(struct CableClubPlayer *player)
{
    struct MapPosition otherPlayerPos;
    u8 linkPlayerId;

    if (player->movementMode != MOVEMENT_MODE_FREE && player->movementMode != MOVEMENT_MODE_SCRIPTED)
        return FACING_NONE;

    otherPlayerPos = player->pos;
    otherPlayerPos.x += gDirectionToVectors[player->facing].x;
    otherPlayerPos.y += gDirectionToVectors[player->facing].y;
    otherPlayerPos.elevation = 0;
    linkPlayerId = GetLinkPlayerIdAt(otherPlayerPos.x, otherPlayerPos.y);

    if (linkPlayerId != 4)
    {
        if (!player->isLocalPlayer)
            return CableClub_EventScript_TooBusyToNotice;
        else if (sPlayerLinkStates[linkPlayerId] != PLAYER_LINK_STATE_IDLE)
            return CableClub_EventScript_TooBusyToNotice;
        else if (!GetSeeingLinkPlayerCardMsg(linkPlayerId))
            return CableClub_EventScript_ReadTrainerCard;
        else
            return CableClub_EventScript_ReadTrainerCardColored;
    }

    return GetInteractedLinkPlayerScript(&otherPlayerPos, player->metatileBehavior, player->facing);
}

// This returns which direction to force the player to look when one of
// these event scripts runs.
static u16 GetDirectionForEventScript(const u8 *script)
{
    if (script == BattleColosseum_4P_EventScript_PlayerSpot0)
        return FACING_FORCED_RIGHT;
    else if (script == BattleColosseum_4P_EventScript_PlayerSpot1)
        return FACING_FORCED_LEFT;
    else if (script == BattleColosseum_4P_EventScript_PlayerSpot2)
        return FACING_FORCED_RIGHT;
    else if (script == BattleColosseum_4P_EventScript_PlayerSpot3)
        return FACING_FORCED_LEFT;
    else if (script == RecordCorner_EventScript_Spot0)
        return FACING_FORCED_RIGHT;
    else if (script == RecordCorner_EventScript_Spot1)
        return FACING_FORCED_LEFT;
    else if (script == RecordCorner_EventScript_Spot2)
        return FACING_FORCED_RIGHT;
    else if (script == RecordCorner_EventScript_Spot3)
        return FACING_FORCED_LEFT;
    else if (script == BattleColosseum_2P_EventScript_PlayerSpot0)
        return FACING_FORCED_RIGHT;
    else if (script == BattleColosseum_2P_EventScript_PlayerSpot1)
        return FACING_FORCED_LEFT;
    else if (script == TradeCenter_EventScript_Chair0)
        return FACING_FORCED_RIGHT;
    else if (script == TradeCenter_EventScript_Chair1)
        return FACING_FORCED_LEFT;
    else
        return FACING_NONE;
}

static void InitLinkPlayerQueueScript(void)
{
    LockPlayerFieldControls();
}

static void InitLinkRoomStartMenuScript(void)
{
    PlaySE(SE_WIN_OPEN);
    ShowStartMenu();
    LockPlayerFieldControls();
}

static void RunInteractLocalPlayerScript(const u8 *script)
{
    PlaySE(SE_SELECT);
    ScriptContext_SetupScript(script);
    LockPlayerFieldControls();
}

static void CreateConfirmLeaveTradeRoomPrompt(void)
{
    PlaySE(SE_WIN_OPEN);
    ScriptContext_SetupScript(TradeCenter_ConfirmLeaveRoom);
    LockPlayerFieldControls();
}

static void InitMenuBasedScript(const u8 *script)
{
    PlaySE(SE_SELECT);
    ScriptContext_SetupScript(script);
    LockPlayerFieldControls();
}

static void RunTerminateLinkScript(void)
{
    ScriptContext_SetupScript(TradeCenter_TerminateLink);
    LockPlayerFieldControls();
}

bool32 Overworld_LinkRecvQueueLengthMoreThan2(void)
{
    if (!IsUpdateLinkStateCBActive())
        return FALSE;
    if (GetLinkRecvQueueLength() >= 3)
        sReceivingFromLink = TRUE;
    else
        sReceivingFromLink = FALSE;
    return sReceivingFromLink;
}

bool32 Overworld_RecvKeysFromLinkIsRunning(void)
{
    u8 temp;

    if (GetLinkRecvQueueLength() < 2)
        return FALSE;
    else if (IsUpdateLinkStateCBActive() != TRUE)
        return FALSE;
    else if (IsSendingKeysToLink() != TRUE)
        return FALSE;
    else if (sPlayerKeyInterceptCallback == KeyInterCB_DeferToRecvQueue)
        return TRUE;
    else if (sPlayerKeyInterceptCallback != KeyInterCB_DeferToEventScript)
        return FALSE;

    temp = sReceivingFromLink;
    sReceivingFromLink = FALSE;

    if (temp == TRUE)
        return TRUE;
    else if (gPaletteFade.active && gPaletteFade.softwareFadeFinishing)
        return TRUE;
    else
        return FALSE;
}

bool32 Overworld_SendKeysToLinkIsRunning(void)
{
    if (GetLinkSendQueueLength() < 2)
        return FALSE;
    else if (IsUpdateLinkStateCBActive() != TRUE)
        return FALSE;
    else if (IsSendingKeysToLink() != TRUE)
        return FALSE;
    else if (sPlayerKeyInterceptCallback == KeyInterCB_DeferToSendQueue)
        return TRUE;
    else
        return FALSE;
}

bool32 IsSendingKeysOverCable(void)
{
    if (gWirelessCommType != 0)
        return FALSE;
    else if (!IsSendingKeysToLink())
        return FALSE;
    else
        return TRUE;
}

static u32 GetLinkSendQueueLength(void)
{
    if (gWirelessCommType != 0)
        return gRfu.sendQueue.count;
    else
        return gLink.sendQueue.count;
}

static void ZeroLinkPlayerObjectEvent(struct LinkPlayerObjectEvent *linkPlayerObjEvent)
{
    memset(linkPlayerObjEvent, 0, sizeof(struct LinkPlayerObjectEvent));
}

void ClearLinkPlayerObjectEvents(void)
{
    memset(gLinkPlayerObjectEvents, 0, sizeof(gLinkPlayerObjectEvents));
}

static void ZeroObjectEvent(struct ObjectEvent *objEvent)
{
    memset(objEvent, 0, sizeof(struct ObjectEvent));
}

// Note: Emerald reuses the direction and range variables during Link mode
// as special gender and direction values. The types and placement
// conflict with the usual Event Object struct, thus the definitions.
#define linkGender(obj) obj->singleMovementActive
// not even one can reference *byte* aligned bitfield members...
#define linkDirection(obj) ((u8 *)obj)[offsetof(typeof(*obj), fieldEffectSpriteId) - 1] // -> rangeX

static void SpawnLinkPlayerObjectEvent(u8 linkPlayerId, s16 x, s16 y, u8 gender)
{
    u8 objEventId = GetFirstInactiveObjectEventId();
    struct LinkPlayerObjectEvent *linkPlayerObjEvent = &gLinkPlayerObjectEvents[linkPlayerId];
    struct ObjectEvent *objEvent = &gObjectEvents[objEventId];

    ZeroLinkPlayerObjectEvent(linkPlayerObjEvent);
    ZeroObjectEvent(objEvent);

    linkPlayerObjEvent->active = TRUE;
    linkPlayerObjEvent->linkPlayerId = linkPlayerId;
    linkPlayerObjEvent->objEventId = objEventId;
    linkPlayerObjEvent->movementMode = MOVEMENT_MODE_FREE;

    objEvent->active = TRUE;
    linkGender(objEvent) = gender;
    linkDirection(objEvent) = DIR_NORTH;
    objEvent->spriteId = MAX_SPRITES;

    InitLinkPlayerObjectEventPos(objEvent, x, y);
}

static void InitLinkPlayerObjectEventPos(struct ObjectEvent *objEvent, s16 x, s16 y)
{
    objEvent->currentCoords.x = x;
    objEvent->currentCoords.y = y;
    objEvent->previousCoords.x = x;
    objEvent->previousCoords.y = y;
    SetSpritePosToMapCoords(x, y, &objEvent->initialCoords.x, &objEvent->initialCoords.y);
    objEvent->initialCoords.x += 8;
    ObjectEventUpdateElevation(objEvent);
}

static void SetLinkPlayerObjectRange(u8 linkPlayerId, u8 dir)
{
    if (gLinkPlayerObjectEvents[linkPlayerId].active)
    {
        u8 objEventId = gLinkPlayerObjectEvents[linkPlayerId].objEventId;
        struct ObjectEvent *objEvent = &gObjectEvents[objEventId];
        linkDirection(objEvent) = dir;
    }
}

static void DestroyLinkPlayerObject(u8 linkPlayerId)
{
    struct LinkPlayerObjectEvent *linkPlayerObjEvent = &gLinkPlayerObjectEvents[linkPlayerId];
    u8 objEventId = linkPlayerObjEvent->objEventId;
    struct ObjectEvent *objEvent = &gObjectEvents[objEventId];
    if (objEvent->spriteId != MAX_SPRITES)
        DestroySprite(&gSprites[objEvent->spriteId]);
    linkPlayerObjEvent->active = FALSE;
    objEvent->active = FALSE;
}

// Returns the spriteId corresponding to this player.
static u8 GetSpriteForLinkedPlayer(u8 linkPlayerId)
{
    u8 objEventId = gLinkPlayerObjectEvents[linkPlayerId].objEventId;
    struct ObjectEvent *objEvent = &gObjectEvents[objEventId];
    return objEvent->spriteId;
}

static void GetLinkPlayerCoords(u8 linkPlayerId, u16 *x, u16 *y)
{
    u8 objEventId = gLinkPlayerObjectEvents[linkPlayerId].objEventId;
    struct ObjectEvent *objEvent = &gObjectEvents[objEventId];
    *x = objEvent->currentCoords.x;
    *y = objEvent->currentCoords.y;
}

static u8 GetLinkPlayerFacingDirection(u8 linkPlayerId)
{
    u8 objEventId = gLinkPlayerObjectEvents[linkPlayerId].objEventId;
    struct ObjectEvent *objEvent = &gObjectEvents[objEventId];
    return linkDirection(objEvent);
}

static u8 GetLinkPlayerElevation(u8 linkPlayerId)
{
    u8 objEventId = gLinkPlayerObjectEvents[linkPlayerId].objEventId;
    struct ObjectEvent *objEvent = &gObjectEvents[objEventId];
    return objEvent->currentElevation;
}

static s32 GetLinkPlayerObjectStepTimer(u8 linkPlayerId)
{
    u8 objEventId = gLinkPlayerObjectEvents[linkPlayerId].objEventId;
    struct ObjectEvent *objEvent = &gObjectEvents[objEventId];
    return 16 - (s8)objEvent->directionSequenceIndex;
}

static u8 GetLinkPlayerIdAt(s16 x, s16 y)
{
    u8 i;
    for (i = 0; i < MAX_LINK_PLAYERS; i++)
    {
        if (gLinkPlayerObjectEvents[i].active
            && (gLinkPlayerObjectEvents[i].movementMode == 0 || gLinkPlayerObjectEvents[i].movementMode == 2))
        {
            struct ObjectEvent *objEvent = &gObjectEvents[gLinkPlayerObjectEvents[i].objEventId];
            if (objEvent->currentCoords.x == x && objEvent->currentCoords.y == y)
                return i;
        }
    }
    return 4;
}

static void SetPlayerFacingDirection(u8 linkPlayerId, u8 facing)
{
    struct LinkPlayerObjectEvent *linkPlayerObjEvent = &gLinkPlayerObjectEvents[linkPlayerId];
    u8 objEventId = linkPlayerObjEvent->objEventId;
    struct ObjectEvent *objEvent = &gObjectEvents[objEventId];

    if (linkPlayerObjEvent->active)
    {
        if (facing > FACING_FORCED_RIGHT)
        {
            objEvent->triggerGroundEffectsOnMove = TRUE;
        }
        else
        {
            // This is a hack to split this code onto two separate lines, without declaring a local variable.
            // C++ style inline variables would be nice here.
#define TEMP sLinkPlayerMovementModes[linkPlayerObjEvent->movementMode](linkPlayerObjEvent, objEvent, facing)

            sMovementStatusHandler[TEMP](linkPlayerObjEvent, objEvent);

            // Clean up the hack.
#undef TEMP
        }
    }
}

static u8 MovementEventModeCB_Normal(struct LinkPlayerObjectEvent *linkPlayerObjEvent, struct ObjectEvent *objEvent, u8 dir)
{
    return sLinkPlayerFacingHandlers[dir](linkPlayerObjEvent, objEvent, dir);
}

static u8 MovementEventModeCB_Ignored(struct LinkPlayerObjectEvent *linkPlayerObjEvent, struct ObjectEvent *objEvent, u8 dir)
{
    return FACING_UP;
}

// Duplicate Function
static u8 MovementEventModeCB_Normal_2(struct LinkPlayerObjectEvent *linkPlayerObjEvent, struct ObjectEvent *objEvent, u8 dir)
{
    return sLinkPlayerFacingHandlers[dir](linkPlayerObjEvent, objEvent, dir);
}

static bool8 FacingHandler_DoNothing(struct LinkPlayerObjectEvent *linkPlayerObjEvent, struct ObjectEvent *objEvent, u8 dir)
{
    return FALSE;
}

static bool8 FacingHandler_DpadMovement(struct LinkPlayerObjectEvent *linkPlayerObjEvent, struct ObjectEvent *objEvent, u8 dir)
{
    s16 x, y;

    linkDirection(objEvent) = FlipVerticalAndClearForced(dir, linkDirection(objEvent));
    ObjectEventMoveDestCoords(objEvent, linkDirection(objEvent), &x, &y);

    if (LinkPlayerDetectCollision(linkPlayerObjEvent->objEventId, linkDirection(objEvent), x, y))
    {
        return FALSE;
    }
    else
    {
        objEvent->directionSequenceIndex = 16;
        ShiftObjectEventCoords(objEvent, x, y);
        ObjectEventUpdateElevation(objEvent);
        return TRUE;
    }
}

static bool8 FacingHandler_ForcedFacingChange(struct LinkPlayerObjectEvent *linkPlayerObjEvent, struct ObjectEvent *objEvent, u8 dir)
{
    linkDirection(objEvent) = FlipVerticalAndClearForced(dir, linkDirection(objEvent));
    return FALSE;
}

// This is called every time a free movement happens. Most of the time it's a No-Op.
static void MovementStatusHandler_EnterFreeMode(struct LinkPlayerObjectEvent *linkPlayerObjEvent, struct ObjectEvent *objEvent)
{
    linkPlayerObjEvent->movementMode = MOVEMENT_MODE_FREE;
}

static void MovementStatusHandler_TryAdvanceScript(struct LinkPlayerObjectEvent *linkPlayerObjEvent, struct ObjectEvent *objEvent)
{
    objEvent->directionSequenceIndex--;
    linkPlayerObjEvent->movementMode = MOVEMENT_MODE_FROZEN;
    MoveCoords(linkDirection(objEvent), &objEvent->initialCoords.x, &objEvent->initialCoords.y);
    if (!objEvent->directionSequenceIndex)
    {
        ShiftStillObjectEventCoords(objEvent);
        linkPlayerObjEvent->movementMode = MOVEMENT_MODE_SCRIPTED;
    }
}

// Flip Up/Down facing codes. If newFacing doesn't specify a direction, default
// to oldFacing. Note that this clears also the "FORCED" part of the facing code,
// even for Left/Right codes.
static u8 FlipVerticalAndClearForced(u8 newFacing, u8 oldFacing)
{
    switch (newFacing)
    {
    case FACING_UP:
    case FACING_FORCED_UP:
        return DIR_NORTH;
    case FACING_DOWN:
    case FACING_FORCED_DOWN:
        return DIR_SOUTH;
    case FACING_LEFT:
    case FACING_FORCED_LEFT:
        return DIR_WEST;
    case FACING_RIGHT:
    case FACING_FORCED_RIGHT:
        return DIR_EAST;
    }
    return oldFacing;
}

static bool8 LinkPlayerDetectCollision(u8 selfObjEventId, u8 a2, s16 x, s16 y)
{
    u8 i;
    for (i = 0; i < 16; i++)
    {
        if (i != selfObjEventId)
        {
            if ((gObjectEvents[i].currentCoords.x == x && gObjectEvents[i].currentCoords.y == y)
                || (gObjectEvents[i].previousCoords.x == x && gObjectEvents[i].previousCoords.y == y))
            {
                return TRUE;
            }
        }
    }
    return MapGridGetCollisionAt(x, y);
}

static void CreateLinkPlayerSprite(u8 linkPlayerId, u8 gameVersion)
{
    struct LinkPlayerObjectEvent *linkPlayerObjEvent = &gLinkPlayerObjectEvents[linkPlayerId];
    u8 objEventId = linkPlayerObjEvent->objEventId;
    struct ObjectEvent *objEvent = &gObjectEvents[objEventId];
    struct Sprite *sprite;

    if (linkPlayerObjEvent->active)
    {
        if (gameVersion == VERSION_FIRE_RED || gameVersion == VERSION_LEAF_GREEN)
        {
            objEvent->spriteId = CreateObjectGraphicsSprite(
                GetRivalAvatarGraphicsIdByStateIdAndGender(PLAYER_AVATAR_STATE_NORMAL, linkGender(objEvent)),
                SpriteCB_LinkPlayer, 0, 0, 0);
        }
        else
        {
            objEvent->spriteId = CreateObjectGraphicsSprite(GetRSAvatarGraphicsIdByGender(linkGender(objEvent)), SpriteCB_LinkPlayer, 0, 0, 0);
        }

        sprite = &gSprites[objEvent->spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->data[0] = linkPlayerId;
        objEvent->triggerGroundEffectsOnMove = FALSE;
    }
}

static void SpriteCB_LinkPlayer(struct Sprite *sprite)
{
    struct LinkPlayerObjectEvent *linkPlayerObjEvent = &gLinkPlayerObjectEvents[sprite->data[0]];
    struct ObjectEvent *objEvent = &gObjectEvents[linkPlayerObjEvent->objEventId];
    sprite->x = objEvent->initialCoords.x;
    sprite->y = objEvent->initialCoords.y;
    SetObjectSubpriorityByElevation(objEvent->previousElevation, sprite, 1);
    sprite->oam.priority = ElevationToPriority(objEvent->previousElevation);

    if (!linkPlayerObjEvent->movementMode != MOVEMENT_MODE_FREE)
        StartSpriteAnim(sprite, GetFaceDirectionAnimNum(linkDirection(objEvent)));
    else
        StartSpriteAnimIfDifferent(sprite, GetMoveDirectionAnimNum(linkDirection(objEvent)));

    UpdateObjectEventSpriteInvisibility(sprite, FALSE);
    if (objEvent->triggerGroundEffectsOnMove)
    {
        sprite->invisible = ((sprite->data[7] & 4) >> 2);
        sprite->data[7]++;
    }
}
