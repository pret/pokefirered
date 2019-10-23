#include "global.h"
#include "malloc.h"
#include "quest_log.h"
#include "list_menu.h"
#include "diploma.h"
#include "script.h"
#include "field_player_avatar.h"
#include "overworld.h"
#include "field_message_box.h"
#include "event_data.h"
#include "string_util.h"
#include "strings.h"
#include "battle.h"
#include "fieldmap.h"
#include "field_specials.h"
#include "region_map.h"
#include "task.h"
#include "battle_tower.h"
#include "field_camera.h"
#include "field_map_obj.h"
#include "random.h"
#include "sound.h"
#include "text.h"
#include "pokemon_storage_system.h"
#include "script_menu.h"
#include "data.h"
#include "pokedex.h"
#include "window.h"
#include "text_window.h"
#include "menu.h"
#include "new_menu_helpers.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "constants/items.h"
#include "constants/map_objects.h"
#include "constants/maps.h"

EWRAM_DATA u8 sElevatorCurrentFloorWindowId = 0;
EWRAM_DATA u16 sElevatorScroll = 0;
EWRAM_DATA u16 sElevatorCursorPos = 0;
EWRAM_DATA struct ListMenuItem * gUnknown_2039A14 = NULL;
EWRAM_DATA u16 gUnknown_2039A18 = 0;
EWRAM_DATA u8 gUnknown_2039A1A = 0;
EWRAM_DATA u8 gUnknown_2039A1B = 0;

struct ListMenuTemplate gUnknown_3005360;
u16 gUnknown_3005378;

static void Task_AnimatePcTurnOn(u8 taskId);
static void PcTurnOnUpdateMetatileId(bool16 flag);
static void Task_ShakeScreen(u8 taskId);
static void Task_EndScreenShake(u8 taskId);
static u16 SampleResortGoregeousMon(void);
static u16 SampleResortGoregeousReward(void);
static void Task_ElevatorShake(u8 taskId);
static void AnimateElevatorWindowView(u16 nfloors, bool8 direction);
static void Task_AnimateElevatorWindowView(u8 taskId);
static void Task_CreateScriptListMenu(u8 taskId);
void sub_80CBA7C(void);
void sub_80CBADC(s32 nothing, bool8 is, struct ListMenu * used);
void sub_80CBB28(u8 taskId);
void sub_80CBBAC(u8 taskId);
void sub_80CBC2C(u8 taskId);
void sub_80CBCC0(u8 taskId);
void sub_80CBD50(u8 taskId);
u16 GetStarterPokemon(u16 starterIdx);

extern const u8 *const gUnknown_83F5BCC[][12];
extern const u8 sSlotMachineIndices[22];
extern const u16 sResortGorgeousDeluxeRewards[6];
extern const struct WindowTemplate sElevatorCurrentFloorWindowTemplate;
extern const u8 *const sFloorNamePointers[15];
extern const u16 sElevatorWindowMetatilesGoingUp[3][3];
extern const u16 sElevatorWindowMetatilesGoingDown[3][3];
extern const u8 sElevatorAnimationDuration[9];
extern const u8 sElevatorWindowAnimDuration[9];

void Special_ShowDiploma(void)
{
    sub_8112364();
    SetMainCallback2(CB2_ShowDiploma);
    ScriptContext2_Enable();
}

void Special_ForcePlayerOntoBike(void)
{
    if (gPlayerAvatar.flags & 1)
        SetPlayerAvatarTransitionFlags(2);
    Overworld_SetSavedMusic(MUS_CYCLING);
    Overworld_ChangeMusicTo(MUS_CYCLING);
}

void nullsub_74(void)
{

}

u8 Special_GetPlayerAvatarBike(void)
{
    if (TestPlayerAvatarFlags(4))
        return 1;
    else if (TestPlayerAvatarFlags(2))
        return 2;
    else
        return 0;
}

void Special_ShowStringVar4AsFieldMessage(void)
{
    ShowFieldMessage(gStringVar4);
}

void Special_GetPlayerXY(void)
{
    gSpecialVar_0x8004 = gSaveBlock1Ptr->pos.x;
    gSpecialVar_0x8005 = gSaveBlock1Ptr->pos.y;
}

u8 Special_GetPlayerTrainerIdOnesDigit(void)
{
    u16 playerId = (gSaveBlock2Ptr->playerTrainerId[1] << 8) | gSaveBlock2Ptr->playerTrainerId[0];
    return playerId % 10;
}

void Special_BufferBigGuyOrBigGirlString(void)
{
    if (gSaveBlock2Ptr->playerGender == MALE)
        StringCopy(gStringVar1, gUnknown_8417FBB);
    else
        StringCopy(gStringVar1, gUnknown_8417FC3);
}

void Special_BufferSonOrDaughterString(void)
{
    if (gSaveBlock2Ptr->playerGender == MALE)
        StringCopy(gStringVar1, gUnknown_8417FD0);
    else
        StringCopy(gStringVar1, gUnknown_8417FCC);
}

u8 Special_GetBattleOutcome(void)
{
    return gBattleOutcome;
}

void Special_SetHiddenItemFlag(void)
{
    FlagSet(gSpecialVar_0x8004);
}

u8 Special_GetLeadMonFriendship(void)
{
    struct Pokemon * pokemon = &gPlayerParty[GetLeadMonIndex()];
    if (GetMonData(pokemon, MON_DATA_FRIENDSHIP) == 255)
        return 6;
    else if (GetMonData(pokemon, MON_DATA_FRIENDSHIP) >= 200)
        return 5;
    else if (GetMonData(pokemon, MON_DATA_FRIENDSHIP) >= 150)
        return 4;
    else if (GetMonData(pokemon, MON_DATA_FRIENDSHIP) >= 100)
        return 3;
    else if (GetMonData(pokemon, MON_DATA_FRIENDSHIP) >= 50)
        return 2;
    else if (GetMonData(pokemon, MON_DATA_FRIENDSHIP) > 0)
        return 1;
    else
        return 0;
}

void Special_TownMap(void)
{
    sub_8112364();
    sub_80BFF50(1, CB2_ReturnToFieldContinueScriptPlayMapMusic);
}

bool8 Special_PlayerHasGrassPokemonInParty(void)
{
    u8 i;
    struct Pokemon * pokemon;
    u16 species;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        pokemon = &gPlayerParty[i];
        if (   GetMonData(pokemon, MON_DATA_SANITY_HAS_SPECIES)
            && !GetMonData(pokemon, MON_DATA_IS_EGG))
        {
            species = GetMonData(pokemon, MON_DATA_SPECIES);
            if (gBaseStats[species].type1 == TYPE_GRASS || gBaseStats[species].type2 == TYPE_GRASS)
                return TRUE;
        }
    }
    return FALSE;
}

void Special_AnimatePcTurnOn(void)
{
    u8 taskId;

    if (FuncIsActiveTask(Task_AnimatePcTurnOn) != TRUE)
    {
        taskId = CreateTask(Task_AnimatePcTurnOn, 8);
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1] = 0;
    }
}

static void Task_AnimatePcTurnOn(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (data[1] == 6)
    {
        PcTurnOnUpdateMetatileId(data[0] & 1);
        DrawWholeMapView();
        data[1] = 0;
        data[0]++;
        if (data[0] == 5)
            DestroyTask(taskId);
    }
    data[1]++;
}

static void PcTurnOnUpdateMetatileId(bool16 a0)
{
    u16 metatileId = 0;
    s8 deltaX = 0;
    s8 deltaY = 0;
    u8 direction = GetPlayerFacingDirection();

    switch (direction)
    {
    case DIR_NORTH:
        deltaX = 0;
        deltaY = -1;
        break;
    case DIR_WEST:
        deltaX = -1;
        deltaY = -1;
        break;
    case DIR_EAST:
        deltaX = 1;
        deltaY = -1;
        break;
    }
    if (a0)
    {
        if (gSpecialVar_0x8004 == 0)
            metatileId = 0x62;
        else if (gSpecialVar_0x8004 == 1)
            metatileId = 0x28F;
        else if (gSpecialVar_0x8004 == 2)
            metatileId = 0x28F;
    }
    else
    {
        if (gSpecialVar_0x8004 == 0)
            metatileId = 0x63;
        else if (gSpecialVar_0x8004 == 1)
            metatileId = 0x28A;
        else if (gSpecialVar_0x8004 == 2)
            metatileId = 0x28A;
    }
    MapGridSetMetatileIdAt(gSaveBlock1Ptr->pos.x + deltaX + 7, gSaveBlock1Ptr->pos.y + deltaY + 7, metatileId | 0xC00);
}

void Special_AnimatePcTurnOff()
{
    u16 metatileId = 0;
    s8 deltaX = 0;
    s8 deltaY = 0;
    u8 direction = GetPlayerFacingDirection();

    switch (direction)
    {
    case DIR_NORTH:
        deltaX = 0;
        deltaY = -1;
        break;
    case DIR_WEST:
        deltaX = -1;
        deltaY = -1;
        break;
    case DIR_EAST:
        deltaX = 1;
        deltaY = -1;
        break;
    }
    if (gSpecialVar_0x8004 == 0)
        metatileId = 0x62;
    else if (gSpecialVar_0x8004 == 1)
        metatileId = 0x28F;
    else if (gSpecialVar_0x8004 == 2)
        metatileId = 0x28F;
    MapGridSetMetatileIdAt(gSaveBlock1Ptr->pos.x + deltaX + 7, gSaveBlock1Ptr->pos.y + deltaY + 7, metatileId | 0xC00);
    DrawWholeMapView();
}

void SpawnCameraObject(void)
{
    u8 mapObjectId = SpawnSpecialFieldObjectParameterized(MAP_OBJ_GFX_YOUNGSTER, 8, 127, gSaveBlock1Ptr->pos.x + 7, gSaveBlock1Ptr->pos.y + 7, 3);
    gMapObjects[mapObjectId].mapobj_bit_13 = TRUE;
    CameraObjectSetFollowedObjectId(gMapObjects[mapObjectId].spriteId);
}

void RemoveCameraObject(void)
{
    CameraObjectSetFollowedObjectId(GetPlayerAvatarObjectId());
    RemoveFieldObjectByLocalIdAndMap(127, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
}

void Special_BufferEReaderTrainerName5(void)
{
    CopyEReaderTrainerName5(gStringVar1);
}

u8 Special_GetRandomSlotMachine(void)
{
    u16 rval = Random() % NELEMS(sSlotMachineIndices);
    return sSlotMachineIndices[rval];
}

bool8 LeadMonHasEffortRibbon(void)
{
    u8 leadMonIdx = GetLeadMonIndex();
    return GetMonData(&gPlayerParty[leadMonIdx], MON_DATA_EFFORT_RIBBON, NULL);
}

void GiveLeadMonEffortRibbon(void)
{
    u8 leadMonIdx;
    bool8 param;
    IncrementGameStat(GAME_STAT_RECEIVED_RIBBONS);
    FlagSet(FLAG_SYS_RIBBON_GET);
    param = TRUE;
    leadMonIdx = GetLeadMonIndex();
    SetMonData(&gPlayerParty[leadMonIdx], MON_DATA_EFFORT_RIBBON, &param);
}

bool8 ScrSpecial_AreLeadMonEVsMaxedOut(void)
{
    u8 leadMonIndex = GetLeadMonIndex();
    if (GetMonEVCount(&gPlayerParty[leadMonIndex]) >= 510)
        return TRUE;
    else
        return FALSE;
}

bool8 Special_IsStarterFirstStageInParty(void)
{
    u16 species = GetStarterPokemon(VarGet(VAR_STARTER_MON));
    u8 partyCount = CalculatePlayerPartyCount();
    u8 i;
    for (i = 0; i < partyCount; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2, NULL) == species)
            return TRUE;
    }
    return FALSE;
}

bool8 Special_IsThereRoomInAnyBoxForMorePokemon(void)
{
    u16 i;
    u16 j;
    for (i = 0; i < TOTAL_BOXES_COUNT; i++)
    {
        for (j = 0; j < IN_BOX_COUNT; j++)
        {
            if (GetBoxMonDataFromAnyBox(i, j, MON_DATA_SPECIES) == SPECIES_NONE)
                return TRUE;
        }
    }
    return FALSE;
}

bool8 Special_CheckPartyPokerus(void)
{
    if (!CheckPartyPokerus(gPlayerParty, 0x3F))
        return FALSE;
    else
        return TRUE;
}

#define tXtrans   data[0]
#define tTimer    data[1]
#define tNremain  data[2]
#define tDuration data[3]
#define tYtrans   data[4]

void Special_ShakeScreen(void)
{
    /*
     * 0x8004 = x translation
     * 0x8005 = y translation
     * 0x8006 = num interations
     * 0x8007 = duration of an iteration
     */
    u8 taskId = CreateTask(Task_ShakeScreen, 9);
    gTasks[taskId].tXtrans = gSpecialVar_0x8005;
    gTasks[taskId].tTimer = 0;
    gTasks[taskId].tNremain = gSpecialVar_0x8006;
    gTasks[taskId].tDuration = gSpecialVar_0x8007;
    gTasks[taskId].tYtrans = gSpecialVar_0x8004;
    SetCameraPanningCallback(NULL);
    PlaySE(SE_W070);
}

static void Task_ShakeScreen(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    tTimer++;
    if (tTimer % tDuration == 0)
    {
        tTimer = 0;
        tNremain--;
        tXtrans = -tXtrans;
        tYtrans = -tYtrans;
        SetCameraPanning(tXtrans, tYtrans);
        if (tNremain == 0)
        {
            Task_EndScreenShake(taskId);
            InstallCameraPanAheadCallback();
        }
    }
}

static void Task_EndScreenShake(u8 taskId)
{
    DestroyTask(taskId);
    EnableBothScriptContexts();
}

#undef tYtrans
#undef tDuration
#undef tNremain
#undef tTimer
#undef tXtrans

u8 GetLeadMonIndex(void)
{
    u8 partyCount = CalculatePlayerPartyCount();
    u8 i;
    struct Pokemon * pokemon;
    for (i = 0; i < partyCount; i++)
    {
        pokemon = &gPlayerParty[i];
        if (GetMonData(pokemon, MON_DATA_SPECIES2, NULL) != SPECIES_EGG && GetMonData(pokemon, MON_DATA_SPECIES2, NULL) != SPECIES_NONE)
            return i;
    }
    return 0;
}

u16 Special_GetSpeciesOfPartySlot_x8004(void)
{
    return GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_SPECIES2, NULL);
}

bool8 Special_BufferMonOTNameAndCompareToPlayerName(void)
{
    GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_OT_NAME, gStringVar1);
    if (!StringCompare(gSaveBlock2Ptr->playerName, gStringVar1))
        return FALSE;
    else
        return TRUE;
}

void nullsub_75(void)
{

}

void sub_80CADC4(void)
{
    u8 t = EOS;
    AddTextPrinterParameterized(0, 2, &t, 0, 1, 0, NULL);
    sub_809D424();
}

void Special_SetVermilionTrashCans(void)
{
    u16 idx = (Random() % 15) + 1;
    gSpecialVar_0x8004 = idx;
    gSpecialVar_0x8005 = idx;
    switch (gSpecialVar_0x8004)
    {
    case 1:
        idx = Random() % 2;
        if (idx == 0)
            gSpecialVar_0x8005 += 1;
        else
            gSpecialVar_0x8005 += 5;
        break;
    case 2:
    case 3:
    case 4:
        idx = Random() % 3;
        if (idx == 0)
            gSpecialVar_0x8005 += 1;
        else if (idx == 1)
            gSpecialVar_0x8005 += 5;
        else
            gSpecialVar_0x8005 -= 1;
        break;
    case 5:
        idx = Random() % 2;
        if (idx == 0)
            gSpecialVar_0x8005 += 5;
        else
            gSpecialVar_0x8005 -= 1;
        break;
    case 6:
        idx = Random() % 3;
        if (idx == 0)
            gSpecialVar_0x8005 -= 5;
        else if (idx == 1)
            gSpecialVar_0x8005 += 1;
        else
            gSpecialVar_0x8005 += 5;
        break;
    case 7:
    case 8:
    case 9:
        idx = Random() % 4;
        if (idx == 0)
            gSpecialVar_0x8005 -= 5;
        else if (idx == 1)
            gSpecialVar_0x8005 += 1;
        else if (idx == 2)
            gSpecialVar_0x8005 += 5;
        else
            gSpecialVar_0x8005 -= 1;
        break;
    case 10:
        idx = Random() % 3;
        if (idx == 0)
            gSpecialVar_0x8005 -= 5;
        else if (idx == 1)
            gSpecialVar_0x8005 += 5;
        else
            gSpecialVar_0x8005 -= 1;
        break;
    case 11:
        idx = Random() % 2;
        if (idx == 0)
            gSpecialVar_0x8005 -= 5;
        else
            gSpecialVar_0x8005 += 1;
        break;
    case 12:
    case 13:
    case 14:
        idx = Random() % 3;
        if (idx == 0)
            gSpecialVar_0x8005 -= 5;
        else if (idx == 1)
            gSpecialVar_0x8005 += 1;
        else
            gSpecialVar_0x8005 -= 1;
        break;
    case 15:
        idx = Random() % 2;
        if (idx == 0)
            gSpecialVar_0x8005 -= 5;
        else
            gSpecialVar_0x8005 -= 1;
        break;
    }
    if (gSpecialVar_0x8005 > 15)
    {
        if (gSpecialVar_0x8004 % 5 == 1)
            gSpecialVar_0x8005 = gSpecialVar_0x8004 + 1;
        else if (gSpecialVar_0x8004 % 5 == 0)
            gSpecialVar_0x8005 = gSpecialVar_0x8004 - 1;
        else
            gSpecialVar_0x8005 = gSpecialVar_0x8004 + 1;
    }
}

void IncrementResortGorgeousStepCounter(void)
{
    u16 var4035 = VarGet(VAR_RESORT_GOREGEOUS_STEP_COUNTER);
    if (VarGet(VAR_RESORT_GOREGOUS_REQUESTED_MON) != SPECIES_NONE)
    {
        var4035++;
        if (var4035 >= 250)
        {
            VarSet(VAR_RESORT_GOREGOUS_REQUESTED_MON, 0xFFFF);
            VarSet(VAR_RESORT_GOREGEOUS_STEP_COUNTER, 0);
        }
        else
        {
            VarSet(VAR_RESORT_GOREGEOUS_STEP_COUNTER, var4035);
        }
    }
}

void Special_SampleResortGorgeousMonAndReward(void)
{
    u16 var4036 = VarGet(VAR_RESORT_GOREGOUS_REQUESTED_MON);
    if (var4036 == SPECIES_NONE || var4036 == 0xFFFF)
    {
        VarSet(VAR_RESORT_GOREGOUS_REQUESTED_MON, SampleResortGoregeousMon());
        VarSet(VAR_RESORT_GOREGOUS_REWARD, SampleResortGoregeousReward());
        VarSet(VAR_RESORT_GOREGEOUS_STEP_COUNTER, 0);
    }
    StringCopy(gStringVar1, gSpeciesNames[VarGet(VAR_RESORT_GOREGOUS_REQUESTED_MON)]);
}

static u16 SampleResortGoregeousMon(void)
{
    u16 i;
    u16 species;
    for (i = 0; i < 100; i++)
    {
        species = (Random() % (NUM_SPECIES - 1)) + 1;
        if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FALSE) == TRUE)
            return species;
    }
    while (GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FALSE) != TRUE)
    {
        if (species == SPECIES_BULBASAUR)
            species = NUM_SPECIES - 1;
        else
            species--;
    }
    return species;
}

static u16 SampleResortGoregeousReward(void)
{
    if ((Random() % 100) >= 30)
        return ITEM_LUXURY_BALL;
    else
        return sResortGorgeousDeluxeRewards[Random() % NELEMS(sResortGorgeousDeluxeRewards)];
}

bool8 Special_CheckAddCoins(void)
{
    if (gSpecialVar_Result + gSpecialVar_0x8006 > 9999)
        return FALSE;
    else
        return TRUE;
}

void Special_GetElevatorFloor(void)
{
    u16 floor = 4;
    if (gSaveBlock1Ptr->warp2.mapGroup == MAP_GROUP(ROCKET_HIDEOUT_B1F))
    {
        switch (gSaveBlock1Ptr->warp2.mapNum)
        {
        case MAP_NUM(SILPH_CO_1F):
            floor = 4;
            break;
        case MAP_NUM(SILPH_CO_2F):
            floor = 5;
            break;
        case MAP_NUM(SILPH_CO_3F):
            floor = 6;
            break;
        case MAP_NUM(SILPH_CO_4F):
            floor = 7;
            break;
        case MAP_NUM(SILPH_CO_5F):
            floor = 8;
            break;
        case MAP_NUM(SILPH_CO_6F):
            floor = 9;
            break;
        case MAP_NUM(SILPH_CO_7F):
            floor = 10;
            break;
        case MAP_NUM(SILPH_CO_8F):
            floor = 11;
            break;
        case MAP_NUM(SILPH_CO_9F):
            floor = 12;
            break;
        case MAP_NUM(SILPH_CO_10F):
            floor = 13;
            break;
        case MAP_NUM(SILPH_CO_11F):
            floor = 14;
            break;
        case MAP_NUM(ROCKET_HIDEOUT_B1F):
            floor = 3;
            break;
        case MAP_NUM(ROCKET_HIDEOUT_B2F):
            floor = 2;
            break;
        case MAP_NUM(ROCKET_HIDEOUT_B4F):
            floor = 0;
            break;
        }
    }
    if (gSaveBlock1Ptr->warp2.mapGroup == MAP_GROUP(CELADON_CITY_DEPARTMENT_STORE_1F))
    {
        switch (gSaveBlock1Ptr->warp2.mapNum)
        {
        case MAP_NUM(CELADON_CITY_DEPARTMENT_STORE_1F):
            floor = 4;
            break;
        case MAP_NUM(CELADON_CITY_DEPARTMENT_STORE_2F):
            floor = 5;
            break;
        case MAP_NUM(CELADON_CITY_DEPARTMENT_STORE_3F):
            floor = 6;
            break;
        case MAP_NUM(CELADON_CITY_DEPARTMENT_STORE_4F):
            floor = 7;
            break;
        case MAP_NUM(CELADON_CITY_DEPARTMENT_STORE_5F):
            floor = 8;
            break;
        }
    }
    if (gSaveBlock1Ptr->warp2.mapGroup == MAP_GROUP(SEVEN_ISLAND_TRAINER_TOWER_1F))
    {
        switch (gSaveBlock1Ptr->warp2.mapNum)
        {
        case MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER_1F):
        case MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER_2F):
        case MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER_3F):
        case MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER_4F):
        case MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER_5F):
        case MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER_6F):
        case MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER_7F):
        case MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER_8F):
        case MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER_ROOF):
            floor = 15;
            break;
        case MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER_LOBBY):
            floor = 3;
            break;
        }
    }
    VarSet(VAR_ELEVATOR_FLOOR, floor);
}

u16 Special_InitElevatorFloorSelectMenuPos(void)
{
    sElevatorScroll = 0;
    sElevatorCursorPos = 0;

    if (gSaveBlock1Ptr->warp2.mapGroup == MAP_GROUP(ROCKET_HIDEOUT_B1F))
    {
        switch (gSaveBlock1Ptr->warp2.mapNum)
        {
        case MAP_NUM(SILPH_CO_11F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 0;
            break;
        case MAP_NUM(SILPH_CO_10F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 1;
            break;
        case MAP_NUM(SILPH_CO_9F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 2;
            break;
        case MAP_NUM(SILPH_CO_8F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 3;
            break;
        case MAP_NUM(SILPH_CO_7F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 4;
            break;
        case MAP_NUM(SILPH_CO_6F):
            sElevatorScroll = 1;
            sElevatorCursorPos = 4;
            break;
        case MAP_NUM(SILPH_CO_5F):
            sElevatorScroll = 2;
            sElevatorCursorPos = 4;
            break;
        case MAP_NUM(SILPH_CO_4F):
            sElevatorScroll = 3;
            sElevatorCursorPos = 4;
            break;
        case MAP_NUM(SILPH_CO_3F):
            sElevatorScroll = 4;
            sElevatorCursorPos = 4;
            break;
        case MAP_NUM(SILPH_CO_2F):
            sElevatorScroll = 5;
            sElevatorCursorPos = 4;
            break;
        case MAP_NUM(SILPH_CO_1F):
            sElevatorScroll = 5;
            sElevatorCursorPos = 5;
            break;
        case MAP_NUM(ROCKET_HIDEOUT_B1F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 0;
            break;
        case MAP_NUM(ROCKET_HIDEOUT_B2F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 1;
            break;
        case MAP_NUM(ROCKET_HIDEOUT_B4F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 2;
            break;
        }
    }
    if (gSaveBlock1Ptr->warp2.mapGroup == MAP_GROUP(CELADON_CITY_DEPARTMENT_STORE_1F))
    {
        switch (gSaveBlock1Ptr->warp2.mapNum)
        {
        case MAP_NUM(CELADON_CITY_DEPARTMENT_STORE_5F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 0;
            break;
        case MAP_NUM(CELADON_CITY_DEPARTMENT_STORE_4F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 1;
            break;
        case MAP_NUM(CELADON_CITY_DEPARTMENT_STORE_3F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 2;
            break;
        case MAP_NUM(CELADON_CITY_DEPARTMENT_STORE_2F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 3;
            break;
        case MAP_NUM(CELADON_CITY_DEPARTMENT_STORE_1F):
            sElevatorScroll = 0;
            sElevatorCursorPos = 4;
            break;
        }
    }
    if (gSaveBlock1Ptr->warp2.mapGroup == MAP_GROUP(SEVEN_ISLAND_TRAINER_TOWER_1F))
    {
        switch (gSaveBlock1Ptr->warp2.mapNum)
        {
        case MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER_1F):
        case MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER_2F):
        case MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER_3F):
        case MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER_4F):
        case MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER_5F):
        case MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER_6F):
        case MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER_7F):
        case MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER_8F):
        case MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER_ROOF):
            sElevatorScroll = 0;
            sElevatorCursorPos = 0;
            break;
        case MAP_NUM(SEVEN_ISLAND_TRAINER_TOWER_LOBBY):
            sElevatorScroll = 0;
            sElevatorCursorPos = 1;
            break;
        }
    }
    return sElevatorCursorPos;
}

void Special_AnimateElevator(void)
{
    u16 nfloors;
    s16 *data = gTasks[CreateTask(Task_ElevatorShake, 9)].data;
    data[1] = 0;
    data[2] = 0;
    data[4] = 1;
    if (gSpecialVar_0x8005 > gSpecialVar_0x8006)
    {
        nfloors = gSpecialVar_0x8005 - gSpecialVar_0x8006;
        data[6] = 1;
    }
    else
    {
        nfloors = gSpecialVar_0x8006 - gSpecialVar_0x8005;
        data[6] = 0;
    }
    if (nfloors > 8)
        nfloors = 8;
    data[5] = sElevatorAnimationDuration[nfloors];
    SetCameraPanningCallback(NULL);
    AnimateElevatorWindowView(nfloors, data[6]);
    PlaySE(SE_ELEBETA);
}

static void Task_ElevatorShake(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    data[1]++;
    if ((data[1] % 3) == 0)
    {
        data[1] = 0;
        data[2]++;
        data[4] = -data[4];
        SetCameraPanning(0, data[4]);
        if (data[2] == data[5])
        {
            PlaySE(SE_PINPON);
            DestroyTask(taskId);
            EnableBothScriptContexts();
            InstallCameraPanAheadCallback();
        }
    }
}

void Special_DrawElevatorCurrentFloorWindow(void)
{
    const u8 *floorname;
    u32 strwidth;
    if (sub_81119D4(sub_809D6D4) != TRUE)
    {
        sElevatorCurrentFloorWindowId = AddWindow(&sElevatorCurrentFloorWindowTemplate);
        TextWindow_SetStdFrame0_WithPal(sElevatorCurrentFloorWindowId, 0x21D, 0xD0);
        DrawStdFrameWithCustomTileAndPalette(sElevatorCurrentFloorWindowId, FALSE, 0x21D, 0xD);
        AddTextPrinterParameterized(sElevatorCurrentFloorWindowId, 2, gUnknown_8418075, 0, 2, 0xFF, NULL);
        floorname = sFloorNamePointers[gSpecialVar_0x8005];
        strwidth = GetStringWidth(2, floorname, 0);
        AddTextPrinterParameterized(sElevatorCurrentFloorWindowId, 2, floorname, 56 - strwidth, 16, 0xFF, NULL);
        PutWindowTilemap(sElevatorCurrentFloorWindowId);
        CopyWindowToVram(sElevatorCurrentFloorWindowId, 3);
    }
}

void Special_CloseElevatorCurrentFloorWindow(void)
{
    ClearStdWindowAndFrameToTransparent(sElevatorCurrentFloorWindowId, TRUE);
    RemoveWindow(sElevatorCurrentFloorWindowId);
}

static void AnimateElevatorWindowView(u16 nfloors, u8 direction)
{
    u8 taskId;
    if (FuncIsActiveTask(Task_AnimateElevatorWindowView) != TRUE)
    {
        taskId = CreateTask(Task_AnimateElevatorWindowView, 8);
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].data[2] = direction;
        gTasks[taskId].data[3] = sElevatorWindowAnimDuration[nfloors];
    }
}

static void Task_AnimateElevatorWindowView(u8 taskId)
{
    u8 i;
    u8 j;
    s16 *data = gTasks[taskId].data;
    if (data[1] == 6)
    {
        data[0]++;
        if (data[2] == 0)
        {
            for (i = 0; i < 3; i++)
            {
                for (j = 0; j < 3; j++)
                {
                    MapGridSetMetatileIdAt(j + 8, i + 7, sElevatorWindowMetatilesGoingUp[i][data[0] % 3] | 0xC00);
                }
            }
        }
        else
        {
            for (i = 0; i < 3; i++)
            {
                for (j = 0; j < 3; j++)
                {
                    MapGridSetMetatileIdAt(j + 8, i + 7, sElevatorWindowMetatilesGoingDown[i][data[0] % 3] | 0xC00);
                }
            }
        }
        DrawWholeMapView();
        data[1] = 0;
        if (data[0] == data[3])
            DestroyTask(taskId);
    }
    data[1]++;
}

void Special_ListMenu(void)
{
    u8 taskId;
    struct Task * task;
    if (sub_81119D4(sub_809D6D4) != TRUE)
    {
        taskId = CreateTask(Task_CreateScriptListMenu, 8);
        task = &gTasks[taskId];
        switch (gSpecialVar_0x8004)
        {
        case 0:
            task->data[0] = 4;
            task->data[1] = 9;
            task->data[2] = 1;
            task->data[3] = 1;
            task->data[4] = 12;
            task->data[5] = 7;
            task->data[6] = 1;
            task->data[15] = taskId;
            break;
        case 1:
            task->data[0] = 7;
            task->data[1] = 12;
            task->data[2] = 1;
            task->data[3] = 1;
            task->data[4] = 8;
            task->data[5] = 12;
            task->data[6] = 0;
            task->data[15] = taskId;
            task->data[7] = sElevatorScroll;
            task->data[8] = sElevatorCursorPos;
            break;
        case 2:
            task->data[0] = 4;
            task->data[1] = 4;
            task->data[2] = 1;
            task->data[3] = 1;
            task->data[4] = 8;
            task->data[5] = 8;
            task->data[6] = 0;
            task->data[15] = taskId;
            break;
        case 3:
            task->data[0] = 4;
            task->data[1] = 6;
            task->data[2] = 1;
            task->data[3] = 1;
            task->data[4] = 8;
            task->data[5] = 8;
            task->data[6] = 0;
            task->data[15] = taskId;
            break;
        case 4:
            task->data[0] = 4;
            task->data[1] = 4;
            task->data[2] = 1;
            task->data[3] = 1;
            task->data[4] = 17;
            task->data[5] = 8;
            task->data[6] = 1;
            task->data[15] = taskId;
            break;
        case 5:
            task->data[0] = 7;
            task->data[1] = 12;
            task->data[2] = 16;
            task->data[3] = 1;
            task->data[4] = 17;
            task->data[5] = 12;
            task->data[6] = 0;
            task->data[15] = taskId;
            break;
        case 6:
            task->data[0] = 3;
            task->data[1] = 3;
            task->data[2] = 1;
            task->data[3] = 1;
            task->data[4] = 8;
            task->data[5] = 6;
            task->data[6] = 0;
            task->data[15] = taskId;
            break;
        case 99:
            break;
        default:
            gSpecialVar_Result = 0x7F;
            DestroyTask(taskId);
            break;
        }
    }
}

static void Task_CreateScriptListMenu(u8 taskId)
{
    struct WindowTemplate template;
    u8 i;
    s32 width;
    s32 mwidth;
    struct Task * task = &gTasks[taskId];
    u8 windowId;
    ScriptContext2_Enable();
    if (gSpecialVar_0x8004 == 1)
        gUnknown_2039A18 = sElevatorScroll;
    else
        gUnknown_2039A18 = 0;
    gUnknown_2039A14 = AllocZeroed(task->data[1] * sizeof(struct ListMenuItem));
    sub_80CBA7C();
    mwidth = 0;
    for (i = 0; i < task->data[1]; i++)
    {
        gUnknown_2039A14[i].label = gUnknown_83F5BCC[gSpecialVar_0x8004][i];
        gUnknown_2039A14[i].index = i;
        width = GetStringWidth(2, gUnknown_2039A14[i].label, 0);
        if (width > mwidth)
            mwidth = width;
    }
    task->data[4] = (mwidth + 9) / 8 + 1;
    if (task->data[2] + task->data[4] > 29)
        task->data[2] = 29 - task->data[4];
    template = SetWindowTemplateFields(0, task->data[2], task->data[3], task->data[4], task->data[5], 15, 0x038);
    task->data[13] = windowId = AddWindow(&template);
    SetStdWindowBorderStyle(task->data[13], 0);
    gUnknown_3005360.totalItems = task->data[1];
    gUnknown_3005360.maxShowed = task->data[0];
    gUnknown_3005360.windowId = task->data[13];
    sub_80CBCC0(taskId);
    task->data[14] = ListMenuInit(&gUnknown_3005360, task->data[7], task->data[8]);
    PutWindowTilemap(task->data[13]);
    CopyWindowToVram(task->data[13], 3);
    gTasks[taskId].func = sub_80CBB28;
}

void sub_80CBA7C(void)
{
    gUnknown_3005360.items = gUnknown_2039A14;
    gUnknown_3005360.moveCursorFunc = sub_80CBADC;
    gUnknown_3005360.itemPrintFunc = NULL;
    gUnknown_3005360.totalItems = 1;
    gUnknown_3005360.maxShowed = 1;
    gUnknown_3005360.windowId = 0;
    gUnknown_3005360.header_X = 0;
    gUnknown_3005360.item_X = 8;
    gUnknown_3005360.cursor_X = 0;
    gUnknown_3005360.upText_Y = 0;
    gUnknown_3005360.cursorPal = 2;
    gUnknown_3005360.fillValue = 1;
    gUnknown_3005360.cursorShadowPal = 3;
    gUnknown_3005360.lettersSpacing = 1;
    gUnknown_3005360.itemVerticalPadding = 0;
    gUnknown_3005360.scrollMultiple = 0;
    gUnknown_3005360.fontId = 2;
    gUnknown_3005360.cursorKind = 0;
}

void sub_80CBADC(s32 nothing, bool8 is, struct ListMenu * used)
{
    u8 taskId;
    struct Task * task;
    PlaySE(SE_SELECT);
    taskId = FindTaskIdByFunc(sub_80CBB28);
    if (taskId != 0xFF)
    {
        task = &gTasks[taskId];
        ListMenuGetScrollAndRow(task->data[14], &gUnknown_3005378, NULL);
        gUnknown_2039A18 = gUnknown_3005378;
    }
}

#ifdef NONMATCHING
// task should be in r6, taskId in r5
void sub_80CBB28(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    s32 input = ListMenu_ProcessInput(task->data[14]);
    switch (input)
    {
    case -1:
        break;
    case -2:
        gSpecialVar_Result = 0x7F;
        PlaySE(SE_SELECT);
        sub_80CBBAC(taskId);
        break;
    default:
        gSpecialVar_Result = input;
        PlaySE(SE_SELECT);
        if (task->data[6] == 0 || input == task->data[1] - 1)
        {
            sub_80CBBAC(taskId);
        }
        else
        {
            sub_80CBD50(taskId);
            task->func = sub_80CBC2C;
            EnableBothScriptContexts();
        }
        break;
    }
}
#else
NAKED
void sub_80CBB28(u8 taskId)
{
    asm_unified("\tpush {r4-r6,lr}\n"
                "\tlsls r0, 24\n"
                "\tlsrs r5, r0, 24\n"
                "\tlsls r0, r5, 2\n"
                "\tadds r0, r5\n"
                "\tlsls r0, 3\n"
                "\tldr r1, _080CBB54 @ =gTasks\n"
                "\tadds r6, r0, r1\n"
                "\tldrh r0, [r6, 0x24]\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tbl ListMenu_ProcessInput\n"
                "\tadds r4, r0, 0\n"
                "\tmovs r0, 0x2\n"
                "\tnegs r0, r0\n"
                "\tcmp r4, r0\n"
                "\tbeq _080CBB58\n"
                "\tadds r0, 0x1\n"
                "\tcmp r4, r0\n"
                "\tbne _080CBB6C\n"
                "\tb _080CBBA2\n"
                "\t.align 2, 0\n"
                "_080CBB54: .4byte gTasks\n"
                "_080CBB58:\n"
                "\tldr r1, _080CBB68 @ =gSpecialVar_Result\n"
                "\tmovs r0, 0x7F\n"
                "\tstrh r0, [r1]\n"
                "\tmovs r0, 0x5\n"
                "\tbl PlaySE\n"
                "\tb _080CBB88\n"
                "\t.align 2, 0\n"
                "_080CBB68: .4byte gSpecialVar_Result\n"
                "_080CBB6C:\n"
                "\tldr r0, _080CBB90 @ =gSpecialVar_Result\n"
                "\tstrh r4, [r0]\n"
                "\tmovs r0, 0x5\n"
                "\tbl PlaySE\n"
                "\tmovs r1, 0x14\n"
                "\tldrsh r0, [r6, r1]\n"
                "\tcmp r0, 0\n"
                "\tbeq _080CBB88\n"
                "\tmovs r1, 0xA\n"
                "\tldrsh r0, [r6, r1]\n"
                "\tsubs r0, 0x1\n"
                "\tcmp r4, r0\n"
                "\tbne _080CBB94\n"
                "_080CBB88:\n"
                "\tadds r0, r5, 0\n"
                "\tbl sub_80CBBAC\n"
                "\tb _080CBBA2\n"
                "\t.align 2, 0\n"
                "_080CBB90: .4byte gSpecialVar_Result\n"
                "_080CBB94:\n"
                "\tadds r0, r5, 0\n"
                "\tbl sub_80CBD50\n"
                "\tldr r0, _080CBBA8 @ =sub_80CBC2C\n"
                "\tstr r0, [r6]\n"
                "\tbl EnableBothScriptContexts\n"
                "_080CBBA2:\n"
                "\tpop {r4-r6}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_080CBBA8: .4byte sub_80CBC2C");
}
#endif //NONMATCHING
