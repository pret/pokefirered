#include "global.h"
#include "malloc.h"
#include "palette.h"
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
#include "field_effect.h"
#include "event_object_movement.h"
#include "menu_indicators.h"
#include "random.h"
#include "mail_data.h"
#include "help_system.h"
#include "sound.h"
#include "text.h"
#include "pokemon_storage_system.h"
#include "script_menu.h"
#include "data.h"
#include "pokedex.h"
#include "window.h"
#include "text_window.h"
#include "menu.h"
#include "mevent.h"
#include "naming_screen.h"
#include "party_menu.h"
#include "dynamic_placeholder_text_util.h"
#include "new_menu_helpers.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "constants/items.h"
#include "constants/object_events.h"
#include "constants/maps.h"
#include "constants/region_map.h"
#include "constants/moves.h"
#include "constants/menu.h"

static EWRAM_DATA u8 sElevatorCurrentFloorWindowId = 0;
static EWRAM_DATA u16 sElevatorScroll = 0;
static EWRAM_DATA u16 sElevatorCursorPos = 0;
static EWRAM_DATA struct ListMenuItem * sListMenuItems = NULL;
static EWRAM_DATA u16 sListMenuLastScrollPosition = 0;
static EWRAM_DATA u8 sPCBoxToSendMon = 0;
static EWRAM_DATA u8 sBrailleTextCursorSpriteID = 0;

struct ListMenuTemplate sFieldSpecialsListMenuTemplate;
u16 sFieldSpecialsListMenuScrollBuffer;

static void Task_AnimatePcTurnOn(u8 taskId);
static void PcTurnOnUpdateMetatileId(bool16 flag);
static void Task_ShakeScreen(u8 taskId);
static void Task_EndScreenShake(u8 taskId);
static u16 SampleResortGorgeousMon(void);
static u16 SampleResortGorgeousReward(void);
static void Task_ElevatorShake(u8 taskId);
static void AnimateElevatorWindowView(u16 nfloors, bool8 direction);
static void Task_AnimateElevatorWindowView(u8 taskId);
static void Task_CreateScriptListMenu(u8 taskId);
static void CreateScriptListMenu(void);
static void ScriptListMenuMoveCursorFunction(s32 nothing, bool8 is, struct ListMenu * used);
static void Task_ListMenuHandleInput(u8 taskId);
static void Task_DestroyListMenu(u8 taskId);
static void Task_SuspendListMenu(u8 taskId);
static void Task_RedrawScrollArrowsAndWaitInput(u8 taskId);
static void Task_CreateMenuRemoveScrollIndicatorArrowPair(u8 taskId);
static void Task_ListMenuRemoveScrollIndicatorArrowPair(u8 taskId);
static u16 GetStarterPokemon(u16 starterIdx);
static void ChangeBoxPokemonNickname_CB(void);
static void ChangePokemonNickname_CB(void);
static void Task_RunPokemonLeagueLightingEffect(u8 taskId);
static void Task_CancelPokemonLeagueLightingEffect(u8 taskId);
static void Task_DoDeoxysRockInteraction(u8 taskId);
static void MoveDeoxysObject(u8 num);
static void Task_WaitDeoxysFieldEffect(u8 taskId);
static void Task_WingFlapSound(u8 taskId);

static u8 *const sStringVarPtrs[] = {
    gStringVar1,
    gStringVar2,
    gStringVar3
};

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
        StringCopy(gStringVar1, gText_BigGuy);
    else
        StringCopy(gStringVar1, gText_BigGirl);
}

void Special_BufferSonOrDaughterString(void)
{
    if (gSaveBlock2Ptr->playerGender == MALE)
        StringCopy(gStringVar1, gText_Son);
    else
        StringCopy(gStringVar1, gText_Daughter);
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
        if (GetMonData(pokemon, MON_DATA_SANITY_HAS_SPECIES)
         && !GetMonData(pokemon, MON_DATA_IS_EGG)
        )
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
    u8 objectEventId = SpawnSpecialObjectEventParameterized(OBJECT_EVENT_GFX_YOUNGSTER, 8, 127, gSaveBlock1Ptr->pos.x + 7, gSaveBlock1Ptr->pos.y + 7, 3);
    gObjectEvents[objectEventId].mapobj_bit_13 = TRUE;
    CameraObjectSetFollowedObjectId(gObjectEvents[objectEventId].spriteId);
}

void RemoveCameraObject(void)
{
    CameraObjectSetFollowedObjectId(GetPlayerAvatarObjectId());
    RemoveObjectEventByLocalIdAndMap(127, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup);
}

void Special_BufferEReaderTrainerName5(void)
{
    CopyEReaderTrainerName5(gStringVar1);
}

static const u8 sUnused_83F5B04[] = {
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    12,
    2,
    4,
    5,
    1,
    8,
    7,
    11,
    3,
    10,
    9,
    6
};

static const u8 sSlotMachineIndices[] = {
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    1,
    2,
    2,
    2,
    3,
    3,
    3,
    4,
    4,
    5
};

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

bool8 Special_IsMonOTNameNotPlayers(void)
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

static const u16 sResortGorgeousDeluxeRewards[] = {
    ITEM_BIG_PEARL,
    ITEM_PEARL,
    ITEM_STARDUST,
    ITEM_STAR_PIECE,
    ITEM_NUGGET,
    ITEM_RARE_CANDY
};

void IncrementResortGorgeousStepCounter(void)
{
    u16 var4035 = VarGet(VAR_RESORT_GOREGEOUS_STEP_COUNTER);
    if (VarGet(VAR_RESORT_GORGEOUS_REQUESTED_MON) != SPECIES_NONE)
    {
        var4035++;
        if (var4035 >= 250)
        {
            VarSet(VAR_RESORT_GORGEOUS_REQUESTED_MON, 0xFFFF);
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
    u16 var4036 = VarGet(VAR_RESORT_GORGEOUS_REQUESTED_MON);
    if (var4036 == SPECIES_NONE || var4036 == 0xFFFF)
    {
        VarSet(VAR_RESORT_GORGEOUS_REQUESTED_MON, SampleResortGorgeousMon());
        VarSet(VAR_RESORT_GORGEOUS_REWARD, SampleResortGorgeousReward());
        VarSet(VAR_RESORT_GOREGEOUS_STEP_COUNTER, 0);
    }
    StringCopy(gStringVar1, gSpeciesNames[VarGet(VAR_RESORT_GORGEOUS_REQUESTED_MON)]);
}

static u16 SampleResortGorgeousMon(void)
{
    u16 i;
    u16 species;
    for (i = 0; i < 100; i++)
    {
        species = (Random() % (NUM_SPECIES - 1)) + 1;
        if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), 0) == TRUE)
            return species;
    }
    while (GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), 0) != TRUE)
    {
        if (species == SPECIES_BULBASAUR)
            species = NUM_SPECIES - 1;
        else
            species--;
    }
    return species;
}

static u16 SampleResortGorgeousReward(void)
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

static const struct WindowTemplate sElevatorCurrentFloorWindowTemplate = {
    .bg = 0,
    .tilemapLeft = 22,
    .tilemapTop = 1,
    .width = 7,
    .height = 4,
    .paletteNum = 0xF,
    .baseBlock = 0x008
};

static const u8 *const sFloorNamePointers[] = {
    gText_B4F,
    gText_B3F,
    gText_B2F,
    gText_B1F,
    gText_1F,
    gText_2F,
    gText_3F,
    gText_4F,
    gText_5F,
    gText_6F,
    gText_7F,
    gText_8F,
    gText_9F,
    gText_10F,
    gText_11F,
    gText_Rooftop
};

static const u8 sUnused_83F5B84[] = {
    26,
    26,
    26,
    26,
    30,
    30,
    30,
    30,
    30,
    30,
    30,
    30,
    30,
    26,
    26,
    18
};

static const u16 sElevatorWindowMetatilesGoingUp[][3] = {
    {0x2e8, 0x2e9, 0x2ea},
    {0x2f0, 0x2f1, 0x2f2},
    {0x2f8, 0x2f9, 0x2fa}
};

static const u16 sElevatorWindowMetatilesGoingDown[][3] = {
    {0x2e8, 0x2ea, 0x2e9},
    {0x2f0, 0x2f2, 0x2f1},
    {0x2f8, 0x2fa, 0x2f9}
};

static const u8 sElevatorAnimationDuration[] = {
    8,
    16,
    24,
    32,
    38,
    46,
    53,
    56,
    57
};

static const u8 sElevatorWindowAnimDuration[] = {
    3,
    6,
    9,
    12,
    15,
    18,
    21,
    24,
    27
};

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
    if (gSaveBlock1Ptr->warp2.mapGroup == MAP_GROUP(TRAINER_TOWER_1F))
    {
        switch (gSaveBlock1Ptr->warp2.mapNum)
        {
        case MAP_NUM(TRAINER_TOWER_1F):
        case MAP_NUM(TRAINER_TOWER_2F):
        case MAP_NUM(TRAINER_TOWER_3F):
        case MAP_NUM(TRAINER_TOWER_4F):
        case MAP_NUM(TRAINER_TOWER_5F):
        case MAP_NUM(TRAINER_TOWER_6F):
        case MAP_NUM(TRAINER_TOWER_7F):
        case MAP_NUM(TRAINER_TOWER_8F):
        case MAP_NUM(TRAINER_TOWER_ROOF):
            floor = 15;
            break;
        case MAP_NUM(TRAINER_TOWER_LOBBY):
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
    if (gSaveBlock1Ptr->warp2.mapGroup == MAP_GROUP(TRAINER_TOWER_1F))
    {
        switch (gSaveBlock1Ptr->warp2.mapNum)
        {
        case MAP_NUM(TRAINER_TOWER_1F):
        case MAP_NUM(TRAINER_TOWER_2F):
        case MAP_NUM(TRAINER_TOWER_3F):
        case MAP_NUM(TRAINER_TOWER_4F):
        case MAP_NUM(TRAINER_TOWER_5F):
        case MAP_NUM(TRAINER_TOWER_6F):
        case MAP_NUM(TRAINER_TOWER_7F):
        case MAP_NUM(TRAINER_TOWER_8F):
        case MAP_NUM(TRAINER_TOWER_ROOF):
            sElevatorScroll = 0;
            sElevatorCursorPos = 0;
            break;
        case MAP_NUM(TRAINER_TOWER_LOBBY):
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
    if (QuestLog_SchedulePlaybackCB(QLPlaybackCB_DestroyScriptMenuMonPicSprites) != TRUE)
    {
        sElevatorCurrentFloorWindowId = AddWindow(&sElevatorCurrentFloorWindowTemplate);
        TextWindow_SetStdFrame0_WithPal(sElevatorCurrentFloorWindowId, 0x21D, 0xD0);
        DrawStdFrameWithCustomTileAndPalette(sElevatorCurrentFloorWindowId, FALSE, 0x21D, 0xD);
        AddTextPrinterParameterized(sElevatorCurrentFloorWindowId, 2, gText_NowOn, 0, 2, 0xFF, NULL);
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
    if (QuestLog_SchedulePlaybackCB(QLPlaybackCB_DestroyScriptMenuMonPicSprites) != TRUE)
    {
        taskId = CreateTask(Task_CreateScriptListMenu, 8);
        task = &gTasks[taskId];
        switch (gSpecialVar_0x8004)
        {
        case LISTMENU_BADGES:
            task->data[0] = 4;
            task->data[1] = 9;
            task->data[2] = 1;
            task->data[3] = 1;
            task->data[4] = 12;
            task->data[5] = 7;
            task->data[6] = 1;
            task->data[15] = taskId;
            break;
        case LISTMENU_SILPHCO_FLOORS:
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
        case LISTMENU_ROCKET_HIDEOUT_FLOORS: // Multichoice used instead
            task->data[0] = 4;
            task->data[1] = 4;
            task->data[2] = 1;
            task->data[3] = 1;
            task->data[4] = 8;
            task->data[5] = 8;
            task->data[6] = 0;
            task->data[15] = taskId;
            break;
        case LISTMENU_DEPT_STORE_FLOORS: // Multichoice used instead
            task->data[0] = 4;
            task->data[1] = 6;
            task->data[2] = 1;
            task->data[3] = 1;
            task->data[4] = 8;
            task->data[5] = 8;
            task->data[6] = 0;
            task->data[15] = taskId;
            break;
        case LISTMENU_WIRELESS_LECTURE_HEADERS: // Multichoice used instead
            task->data[0] = 4;
            task->data[1] = 4;
            task->data[2] = 1;
            task->data[3] = 1;
            task->data[4] = 17;
            task->data[5] = 8;
            task->data[6] = 1;
            task->data[15] = taskId;
            break;
        case LISTMENU_BERRY_POWDER:
            task->data[0] = 7;
            task->data[1] = 12;
            task->data[2] = 16;
            task->data[3] = 1;
            task->data[4] = 17;
            task->data[5] = 12;
            task->data[6] = 0;
            task->data[15] = taskId;
            break;
        case LISTMENU_TRAINER_TOWER_FLOORS: // Mulitchoice used instead
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

static const u8 *const sListMenuLabels[][12] = {
    [LISTMENU_BADGES] = 
    {
        gText_BoulderBadge,
        gText_CascadeBadge,
        gText_ThunderBadge,
        gText_RainbowBadge,
        gText_SoulBadge,
        gText_MarshBadge,
        gText_VolcanoBadge,
        gText_EarthBadge,
        gOtherText_Exit,
    }, 
    [LISTMENU_SILPHCO_FLOORS] = 
    {
        gText_11F,
        gText_10F,
        gText_9F,
        gText_8F,
        gText_7F,
        gText_6F,
        gText_5F,
        gText_4F,
        gText_3F,
        gText_2F,
        gText_1F,
        gOtherText_Exit,
    }, 
    [LISTMENU_ROCKET_HIDEOUT_FLOORS] = // Unncessary, MULTICHOICE_ROCKET_HIDEOUT_ELEVATOR is used instead
    {
        gText_B1F,
        gText_B2F,
        gText_B4F,
        gOtherText_Exit,
    }, 
    [LISTMENU_DEPT_STORE_FLOORS] = // Unncessary, MULTICHOICE_DEPT_STORE_ELEVATOR is used instead
    {
        gText_5F,
        gText_4F,
        gText_3F,
        gText_2F,
        gText_1F,
        gOtherText_Exit,
    }, 
    [LISTMENU_WIRELESS_LECTURE_HEADERS] = // Unnecessary, MULTICHOICE_LINKED_DIRECT_UNION is used instead
    {
        gText_LinkedGamePlay,
        gText_DirectCorner,
        gText_UnionRoom,
        gOtherText_Quit,
    }, 
    [LISTMENU_BERRY_POWDER] = 
    {
        gText_Energypowder_50,
        gText_EnergyRoot_80,
        gText_HealPowder_50,
        gText_RevivalHerb_300,
        gText_Protein_1000,
        gText_Iron_1000,
        gText_Carbos_1000,
        gText_Calcium_1000,
        gText_Zinc_1000,
        gText_HpUp_1000,
        gText_PpUp_3000,
        gOtherText_Exit,
    }, 
    [LISTMENU_TRAINER_TOWER_FLOORS] = // Unnecessary, MULTICHOICE_ROOFTOP_B1F is used instead
    {
        gText_Rooftop,
        gText_B1F,
        gOtherText_Exit,
    }
};

static void Task_CreateScriptListMenu(u8 taskId)
{
    struct WindowTemplate template;
    u8 i;
    s32 width;
    s32 mwidth;
    struct Task * task = &gTasks[taskId];
    u8 windowId;
    ScriptContext2_Enable();
    if (gSpecialVar_0x8004 == LISTMENU_SILPHCO_FLOORS)
        sListMenuLastScrollPosition = sElevatorScroll;
    else
        sListMenuLastScrollPosition = 0;
    sListMenuItems = AllocZeroed(task->data[1] * sizeof(struct ListMenuItem));
    CreateScriptListMenu();
    mwidth = 0;
    for (i = 0; i < task->data[1]; i++)
    {
        sListMenuItems[i].label = sListMenuLabels[gSpecialVar_0x8004][i];
        sListMenuItems[i].index = i;
        width = GetStringWidth(2, sListMenuItems[i].label, 0);
        if (width > mwidth)
            mwidth = width;
    }
    task->data[4] = (mwidth + 9) / 8 + 1;
    if (task->data[2] + task->data[4] > 29)
        task->data[2] = 29 - task->data[4];
    template = SetWindowTemplateFields(0, task->data[2], task->data[3], task->data[4], task->data[5], 15, 0x038);
    task->data[13] = windowId = AddWindow(&template);
    SetStdWindowBorderStyle(task->data[13], 0);
    sFieldSpecialsListMenuTemplate.totalItems = task->data[1];
    sFieldSpecialsListMenuTemplate.maxShowed = task->data[0];
    sFieldSpecialsListMenuTemplate.windowId = task->data[13];
    Task_CreateMenuRemoveScrollIndicatorArrowPair(taskId);
    task->data[14] = ListMenuInit(&sFieldSpecialsListMenuTemplate, task->data[7], task->data[8]);
    PutWindowTilemap(task->data[13]);
    CopyWindowToVram(task->data[13], 3);
    gTasks[taskId].func = Task_ListMenuHandleInput;
}

static void CreateScriptListMenu(void)
{
    sFieldSpecialsListMenuTemplate.items = sListMenuItems;
    sFieldSpecialsListMenuTemplate.moveCursorFunc = ScriptListMenuMoveCursorFunction;
    sFieldSpecialsListMenuTemplate.itemPrintFunc = NULL;
    sFieldSpecialsListMenuTemplate.totalItems = 1;
    sFieldSpecialsListMenuTemplate.maxShowed = 1;
    sFieldSpecialsListMenuTemplate.windowId = 0;
    sFieldSpecialsListMenuTemplate.header_X = 0;
    sFieldSpecialsListMenuTemplate.item_X = 8;
    sFieldSpecialsListMenuTemplate.cursor_X = 0;
    sFieldSpecialsListMenuTemplate.upText_Y = 0;
    sFieldSpecialsListMenuTemplate.cursorPal = 2;
    sFieldSpecialsListMenuTemplate.fillValue = 1;
    sFieldSpecialsListMenuTemplate.cursorShadowPal = 3;
    sFieldSpecialsListMenuTemplate.lettersSpacing = 1;
    sFieldSpecialsListMenuTemplate.itemVerticalPadding = 0;
    sFieldSpecialsListMenuTemplate.scrollMultiple = 0;
    sFieldSpecialsListMenuTemplate.fontId = 2;
    sFieldSpecialsListMenuTemplate.cursorKind = 0;
}

static void ScriptListMenuMoveCursorFunction(s32 nothing, bool8 is, struct ListMenu * used)
{
    u8 taskId;
    struct Task * task;
    PlaySE(SE_SELECT);
    taskId = FindTaskIdByFunc(Task_ListMenuHandleInput);
    if (taskId != 0xFF)
    {
        task = &gTasks[taskId];
        ListMenuGetScrollAndRow(task->data[14], &sFieldSpecialsListMenuScrollBuffer, NULL);
        sListMenuLastScrollPosition = sFieldSpecialsListMenuScrollBuffer;
    }
}

static void Task_ListMenuHandleInput(u8 taskId)
{
    s32 input;
    struct Task * task;

    task = &gTasks[taskId];
    task++;task--;
    input = ListMenu_ProcessInput(task->data[14]);
    switch (input)
    {
    case -1:
        break;
    case -2:
        gSpecialVar_Result = 0x7F;
        PlaySE(SE_SELECT);
        Task_DestroyListMenu(taskId);
        break;
    default:
        gSpecialVar_Result = input;
        PlaySE(SE_SELECT);
        if (task->data[6] == 0 || input == task->data[1] - 1)
        {
            Task_DestroyListMenu(taskId);
        }
        else
        {
            Task_ListMenuRemoveScrollIndicatorArrowPair(taskId);
            task->func = Task_SuspendListMenu;
            EnableBothScriptContexts();
        }
        break;
    }
}

static void Task_DestroyListMenu(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    Task_ListMenuRemoveScrollIndicatorArrowPair(taskId);
    DestroyListMenuTask(task->data[14], NULL, NULL);
    Free(sListMenuItems);
    ClearStdWindowAndFrameToTransparent(task->data[13], TRUE);
    FillWindowPixelBuffer(task->data[13], PIXEL_FILL(0));
    ClearWindowTilemap(task->data[13]);
    CopyWindowToVram(task->data[13], 2);
    RemoveWindow(task->data[13]);
    DestroyTask(taskId);
    EnableBothScriptContexts();
}

static void Task_SuspendListMenu(u8 taskId)
{
    switch (gTasks[taskId].data[6])
    {
    case 1:
        break;
    case 2:
        gTasks[taskId].data[6] = 1;
        gTasks[taskId].func = Task_RedrawScrollArrowsAndWaitInput;
        break;
    }
}

void Special_ReturnToListMenu(void)
{
    u8 taskId = FindTaskIdByFunc(Task_SuspendListMenu);
    if (taskId == 0xFF)
        EnableBothScriptContexts();
    else
        gTasks[taskId].data[6]++;
}

static void Task_RedrawScrollArrowsAndWaitInput(u8 taskId)
{
    ScriptContext2_Enable();
    Task_CreateMenuRemoveScrollIndicatorArrowPair(taskId);
    gTasks[taskId].func = Task_ListMenuHandleInput;
}

static void Task_CreateMenuRemoveScrollIndicatorArrowPair(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    struct ScrollArrowsTemplate template = {
        .firstArrowType = 2,
        .secondArrowType = 3,
        .tileTag = 2000,
        .palTag = 100
    };
    if (task->data[0] != task->data[1])
    {
        template.firstX = 4 * task->data[4] + 8 * task->data[2];
        template.firstY = 8;
        template.secondX = 4 * task->data[4] + 8 * task->data[2];
        template.secondY = 8 * task->data[5] + 10;
        template.fullyUpThreshold = 0;
        template.fullyDownThreshold = task->data[1] - task->data[0];
        task->data[12] = AddScrollIndicatorArrowPair(&template, &sListMenuLastScrollPosition);
    }
}

static void Task_ListMenuRemoveScrollIndicatorArrowPair(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    if (task->data[0] != task->data[1])
        RemoveScrollIndicatorArrowPair(task->data[12]);
}

void Special_ForcePlayerToStartSurfing(void)
{
    HelpSystem_SetSomeVariable2(22);
    SetPlayerAvatarTransitionFlags(8);
}

static const u16 sStarterMon[] = {
    SPECIES_BULBASAUR,
    SPECIES_SQUIRTLE,
    SPECIES_CHARMANDER
};

static u16 GetStarterPokemon(u16 idx)
{
    if (idx >= NELEMS(sStarterMon))
        idx = 0;
    return sStarterMon[idx];
}

u16 ScrSpecial_GetStarter(void)
{
    return GetStarterPokemon(VarGet(VAR_STARTER_MON));
}

void Special_SetSeenMon(void)
{
    GetSetPokedexFlag(SpeciesToNationalPokedexNum(gSpecialVar_0x8004), 2);
}

void sub_80CBDE8(void)
{
    gSelectedObjectEvent = 0;
    gSpecialVar_TextColor = 0xFF;
}

u8 ContextNpcGetTextColor(void)
{
    u8 gfxId;
    if (gSpecialVar_TextColor != 0xFF)
        return gSpecialVar_TextColor;
    else if (gSelectedObjectEvent == 0)
        return 3;
    else
    {
        gfxId = gObjectEvents[gSelectedObjectEvent].graphicsId;
        if (gfxId >= OBJECT_EVENT_GFX_VAR_0)
            gfxId = VarGetObjectEventGraphicsId(gfxId - OBJECT_EVENT_GFX_VAR_0);
        return GetColorFromTextColorTable(gfxId);
    }
}

static bool8 HasMonBeenRenamed(u8 idx)
{
    struct Pokemon * pokemon = &gPlayerParty[idx];
    u8 language;
    GetMonData(pokemon, MON_DATA_NICKNAME, gStringVar1);
    language = GetMonData(pokemon, MON_DATA_LANGUAGE, &language);
    if (language != LANGUAGE_ENGLISH)
        return TRUE;
    else if (StringCompare(gSpeciesNames[GetMonData(pokemon, MON_DATA_SPECIES, NULL)], gStringVar1) != 0)
        return TRUE;
    else
        return FALSE;
}

bool8 Special_HasLeadMonBeenRenamed(void)
{
    return HasMonBeenRenamed(GetLeadMonIndex());
}

void TV_PrintIntToStringVar(u8 varidx, s32 number)
{
    s32 n = CountDigits(number);
    ConvertIntToDecimalStringN(sStringVarPtrs[varidx], number, STR_CONV_MODE_LEFT_ALIGN, n);
}

s32 CountDigits(s32 number)
{
    if (number / 10 == 0)
        return 1;
    else if (number / 100 == 0)
        return 2;
    else if (number / 1000 == 0)
        return 3;
    else if (number / 10000 == 0)
        return 4;
    else if (number / 100000 == 0)
        return 5;
    else if (number / 1000000 == 0)
        return 6;
    else if (number / 10000000 == 0)
        return 7;
    else if (number / 100000000 == 0)
        return 8;
    else
        return 1;
}

bool8 NameRaterWasNicknameChanged(void)
{
    struct Pokemon * pokemon = &gPlayerParty[gSpecialVar_0x8004];
    GetMonData(pokemon, MON_DATA_NICKNAME, gStringVar1);
    if (StringCompare(gStringVar3, gStringVar1) == 0)
        return FALSE;
    else
        return TRUE;
}

void ChangeBoxPokemonNickname(void)
{
    struct BoxPokemon * pokemon = GetBoxedMonPtr(gSpecialVar_MonBoxId, gSpecialVar_MonBoxPos);
    u16 species;
    u8 gender;
    u32 personality;


    GetBoxMonData(pokemon, MON_DATA_NICKNAME, gStringVar3);
    GetBoxMonData(pokemon, MON_DATA_NICKNAME, gStringVar2);
    species = GetBoxMonData(pokemon, MON_DATA_SPECIES, NULL);
    gender = GetBoxMonGender(pokemon);
    personality = GetBoxMonData(pokemon, MON_DATA_PERSONALITY, NULL);
    DoNamingScreen(3, gStringVar2, species, gender, personality, ChangeBoxPokemonNickname_CB);
}

static void ChangeBoxPokemonNickname_CB(void)
{
    SetBoxMonNickFromAnyBox(gSpecialVar_MonBoxId, gSpecialVar_MonBoxPos, gStringVar2);
    CB2_ReturnToFieldContinueScriptPlayMapMusic();
}

void ChangePokemonNickname(void)
{
    u16 species;
    u8 gender;
    u32 personality;

    GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_NICKNAME, gStringVar3);
    GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_NICKNAME, gStringVar2);
    species = GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_SPECIES, NULL);
    gender = GetMonGender(&gPlayerParty[gSpecialVar_0x8004]);
    personality = GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_PERSONALITY, NULL);
    DoNamingScreen(3, gStringVar2, species, gender, personality, ChangePokemonNickname_CB);
}

static void ChangePokemonNickname_CB(void)
{
    SetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_NICKNAME, gStringVar2);
    CB2_ReturnToFieldContinueScriptPlayMapMusic();
}

void Special_GetMonNickname(void)
{
    GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_NICKNAME, gStringVar1);
    StringGetEnd10(gStringVar1);
}

void Special_IsMonOTIDNotPlayers(void)
{
    if (GetPlayerTrainerId() == GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_OT_ID, NULL))
        gSpecialVar_Result = FALSE;
    else
        gSpecialVar_Result = TRUE;
}

u32 GetPlayerTrainerId(void)
{
    return (gSaveBlock2Ptr->playerTrainerId[3] << 24) | (gSaveBlock2Ptr->playerTrainerId[2] << 16) | (gSaveBlock2Ptr->playerTrainerId[1] << 8) | gSaveBlock2Ptr->playerTrainerId[0];
}

u8 GetUnlockedSeviiAreas(void)
{
    u8 result = 0;
    if (FlagGet(FLAG_WORLD_MAP_ONE_ISLAND) == TRUE)
        result |= 1 << 0;
    if (FlagGet(FLAG_WORLD_MAP_TWO_ISLAND) == TRUE)
        result |= 1 << 1;
    if (FlagGet(FLAG_WORLD_MAP_THREE_ISLAND) == TRUE)
        result |= 1 << 2;
    if (FlagGet(FLAG_WORLD_MAP_FOUR_ISLAND) == TRUE)
        result |= 1 << 3;
    if (FlagGet(FLAG_WORLD_MAP_FIVE_ISLAND) == TRUE)
        result |= 1 << 4;
    if (FlagGet(FLAG_WORLD_MAP_SIX_ISLAND) == TRUE)
        result |= 1 << 5;
    if (FlagGet(FLAG_WORLD_MAP_SEVEN_ISLAND) == TRUE)
        result |= 1 << 6;
    return result;
}

void Special_UpdateTrainerCardPhotoIcons(void)
{
    u16 species[PARTY_SIZE];
    u32 personality[PARTY_SIZE];
    u8 i;
    u8 partyCount;
    for (i = 0; i < PARTY_SIZE; i++)
        species[i] = SPECIES_NONE;
    partyCount = CalculatePlayerPartyCount();
    for (i = 0; i < partyCount; i++)
    {
        species[i] = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2, NULL);
        personality[i] = GetMonData(&gPlayerParty[i], MON_DATA_PERSONALITY, NULL);
    }
    VarSet(VAR_TRAINER_CARD_MON_ICON_1, SpeciesToMailSpecies(species[0], personality[0]));
    VarSet(VAR_TRAINER_CARD_MON_ICON_2, SpeciesToMailSpecies(species[1], personality[1]));
    VarSet(VAR_TRAINER_CARD_MON_ICON_3, SpeciesToMailSpecies(species[2], personality[2]));
    VarSet(VAR_TRAINER_CARD_MON_ICON_4, SpeciesToMailSpecies(species[3], personality[3]));
    VarSet(VAR_TRAINER_CARD_MON_ICON_5, SpeciesToMailSpecies(species[4], personality[4]));
    VarSet(VAR_TRAINER_CARD_MON_ICON_6, SpeciesToMailSpecies(species[5], personality[5]));
    VarSet(VAR_TRAINER_CARD_MON_ICON_TINT_IDX, gSpecialVar_0x8004);
}

u16 Special_StickerLadyGetBragFlags(void)
{
    u16 result = 0;
    u32 numEggs;
    gSpecialVar_0x8004 = GetGameStat(GAME_STAT_ENTERED_HOF);
    numEggs = GetGameStat(GAME_STAT_HATCHED_EGGS);
    gSpecialVar_0x8006 = GetGameStat(GAME_STAT_LINK_BATTLE_WINS);
    if (numEggs > 0xFFFF)
        gSpecialVar_0x8005 = 0xFFFF;
    else
        gSpecialVar_0x8005 = numEggs;
    if (gSpecialVar_0x8004 != 0)
        result |= 1 << 0;
    if (gSpecialVar_0x8005 != 0)
        result |= 1 << 1;
    if (gSpecialVar_0x8006 != 0)
        result |= 1 << 2;
    return result;
}

u16 GetHiddenItemAttr(u32 hiddenItem, u8 attr)
{
    if (attr == 0)
        return hiddenItem & 0xFFFF;
    else if (attr == 1)
        return ((hiddenItem >> 16) & 0xFF) + 1000;
    else if (attr == 2)
        return (hiddenItem >> 24) & 0x7F;
    else if (attr == 3)
        return (hiddenItem >> 31) & 0x01;
    else
        return 1;
}

bool8 Special_PlayerPartyContainsSpecies(void)
{
    u8 partyCount = CalculatePlayerPartyCount();
    u8 i;
    for (i = 0; i < partyCount; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2, NULL) == gSpecialVar_0x8004)
            return TRUE;
    }
    return FALSE;
}

static const u8 sMartMaps[][3] = {
    {MAP_GROUP(VIRIDIAN_CITY_MART),   MAP_NUM(VIRIDIAN_CITY_MART),   1},
    {MAP_GROUP(PEWTER_CITY_MART),     MAP_NUM(PEWTER_CITY_MART),     3},
    {MAP_GROUP(CERULEAN_CITY_MART),   MAP_NUM(CERULEAN_CITY_MART),   1},
    {MAP_GROUP(LAVENDER_TOWN_MART),   MAP_NUM(LAVENDER_TOWN_MART),   1},
    {MAP_GROUP(VERMILION_CITY_MART),  MAP_NUM(VERMILION_CITY_MART),  1},
    {MAP_GROUP(FUCHSIA_CITY_MART),    MAP_NUM(FUCHSIA_CITY_MART),    1},
    {MAP_GROUP(CINNABAR_ISLAND_MART), MAP_NUM(CINNABAR_ISLAND_MART), 1},
    {MAP_GROUP(SAFFRON_CITY_MART),    MAP_NUM(SAFFRON_CITY_MART),    1},
    {MAP_GROUP(THREE_ISLAND_MART),    MAP_NUM(THREE_ISLAND_MART),    1},
    {MAP_GROUP(FOUR_ISLAND_MART),     MAP_NUM(FOUR_ISLAND_MART),     1},
    {MAP_GROUP(SEVEN_ISLAND_MART),    MAP_NUM(SEVEN_ISLAND_MART),    1},
    {MAP_GROUP(SIX_ISLAND_MART),      MAP_NUM(SIX_ISLAND_MART),      1}
};

u8 Special_GetMartClerkObjectId(void)
{
    u8 i;
    for (i = 0; i < NELEMS(sMartMaps); i++)
    {
        if (gSaveBlock1Ptr->location.mapGroup == sMartMaps[i][0] && gSaveBlock1Ptr->location.mapNum == sMartMaps[i][1])
            return sMartMaps[i][2];
    }
    return 1;
}

void SetUsedPkmnCenterQuestLogEvent(void)
{
    SetQuestLogEvent(QL_EVENT_USED_PKMN_CENTER, NULL);
}

static const struct {
    u16 grp;
    u16 num;
    u16 grp2;
    u16 num2;
} sInsideOutsidePairs[51] = {
    {MAP_GROUP(PALLET_TOWN_PLAYERS_HOUSE_1F),          MAP_NUM(PALLET_TOWN_PLAYERS_HOUSE_1F),          MAP_GROUP(PALLET_TOWN),                           MAP_NUM(PALLET_TOWN)},
    {MAP_GROUP(PALLET_TOWN_PROFESSOR_OAKS_LAB),        MAP_NUM(PALLET_TOWN_PROFESSOR_OAKS_LAB),        MAP_GROUP(PALLET_TOWN),                           MAP_NUM(PALLET_TOWN)},
    {MAP_GROUP(VIRIDIAN_CITY_GYM),                     MAP_NUM(VIRIDIAN_CITY_GYM),                     MAP_GROUP(VIRIDIAN_CITY),                         MAP_NUM(VIRIDIAN_CITY)},
    {MAP_GROUP(ROUTE22_NORTH_ENTRANCE),                MAP_NUM(ROUTE22_NORTH_ENTRANCE),                MAP_GROUP(ROUTE22),                               MAP_NUM(ROUTE22)},
    {MAP_GROUP(ROUTE22_NORTH_ENTRANCE),                MAP_NUM(ROUTE22_NORTH_ENTRANCE),                MAP_GROUP(ROUTE23),                               MAP_NUM(ROUTE23)},
    {MAP_GROUP(VIRIDIAN_FOREST),                       MAP_NUM(VIRIDIAN_FOREST),                       MAP_GROUP(ROUTE2_VIRIDIAN_FOREST_SOUTH_ENTRANCE), MAP_NUM(ROUTE2_VIRIDIAN_FOREST_SOUTH_ENTRANCE)},
    {MAP_GROUP(VIRIDIAN_FOREST),                       MAP_NUM(VIRIDIAN_FOREST),                       MAP_GROUP(ROUTE2_VIRIDIAN_FOREST_NORTH_ENTRANCE), MAP_NUM(ROUTE2_VIRIDIAN_FOREST_NORTH_ENTRANCE)},
    {MAP_GROUP(PEWTER_CITY_MUSEUM_1F),                 MAP_NUM(PEWTER_CITY_MUSEUM_1F),                 MAP_GROUP(PEWTER_CITY),                           MAP_NUM(PEWTER_CITY)},
    {MAP_GROUP(PEWTER_CITY_GYM),                       MAP_NUM(PEWTER_CITY_GYM),                       MAP_GROUP(PEWTER_CITY),                           MAP_NUM(PEWTER_CITY)},
    {MAP_GROUP(MT_MOON_1F),                            MAP_NUM(MT_MOON_1F),                            MAP_GROUP(ROUTE4),                                MAP_NUM(ROUTE4)},
    {MAP_GROUP(MT_MOON_B1F),                           MAP_NUM(MT_MOON_B1F),                           MAP_GROUP(ROUTE4),                                MAP_NUM(ROUTE4)},
    {MAP_GROUP(CERULEAN_CITY_GYM),                     MAP_NUM(CERULEAN_CITY_GYM),                     MAP_GROUP(CERULEAN_CITY),                         MAP_NUM(CERULEAN_CITY)},
    {MAP_GROUP(CERULEAN_CITY_BIKE_SHOP),               MAP_NUM(CERULEAN_CITY_BIKE_SHOP),               MAP_GROUP(CERULEAN_CITY),                         MAP_NUM(CERULEAN_CITY)},
    {MAP_GROUP(ROUTE25_SEA_COTTAGE),                   MAP_NUM(ROUTE25_SEA_COTTAGE),                   MAP_GROUP(ROUTE25),                               MAP_NUM(ROUTE25)},
    {MAP_GROUP(ROUTE5_POKEMON_DAY_CARE),               MAP_NUM(ROUTE5_POKEMON_DAY_CARE),               MAP_GROUP(ROUTE5),                                MAP_NUM(ROUTE5)},
    {MAP_GROUP(UNDERGROUND_PATH_NORTH_ENTRANCE),       MAP_NUM(UNDERGROUND_PATH_NORTH_ENTRANCE),       MAP_GROUP(ROUTE5),                                MAP_NUM(ROUTE5)},
    {MAP_GROUP(UNDERGROUND_PATH_SOUTH_ENTRANCE),       MAP_NUM(UNDERGROUND_PATH_SOUTH_ENTRANCE),       MAP_GROUP(ROUTE6),                                MAP_NUM(ROUTE6)},
    {MAP_GROUP(VERMILION_CITY_POKEMON_FAN_CLUB),       MAP_NUM(VERMILION_CITY_POKEMON_FAN_CLUB),       MAP_GROUP(VERMILION_CITY),                        MAP_NUM(VERMILION_CITY)},
    {MAP_GROUP(VERMILION_CITY_GYM),                    MAP_NUM(VERMILION_CITY_GYM),                    MAP_GROUP(VERMILION_CITY),                        MAP_NUM(VERMILION_CITY)},
    {MAP_GROUP(SSANNE_1F_CORRIDOR),                    MAP_NUM(SSANNE_1F_CORRIDOR),                    MAP_GROUP(VERMILION_CITY),                        MAP_NUM(VERMILION_CITY)},
    {MAP_GROUP(DIGLETTS_CAVE_NORTH_ENTRANCE),          MAP_NUM(DIGLETTS_CAVE_NORTH_ENTRANCE),          MAP_GROUP(ROUTE2),                                MAP_NUM(ROUTE2)},
    {MAP_GROUP(DIGLETTS_CAVE_SOUTH_ENTRANCE),          MAP_NUM(DIGLETTS_CAVE_SOUTH_ENTRANCE),          MAP_GROUP(ROUTE11),                               MAP_NUM(ROUTE11)},
    {MAP_GROUP(ROCK_TUNNEL_1F),                        MAP_NUM(ROCK_TUNNEL_1F),                        MAP_GROUP(ROUTE10),                               MAP_NUM(ROUTE10)},
    {MAP_GROUP(ROCK_TUNNEL_1F),                        MAP_NUM(ROCK_TUNNEL_1F),                        MAP_GROUP(ROUTE10),                               MAP_NUM(ROUTE10)},
    {MAP_GROUP(POWER_PLANT),                           MAP_NUM(POWER_PLANT),                           MAP_GROUP(ROUTE10),                               MAP_NUM(ROUTE10)},
    {MAP_GROUP(POKEMON_TOWER_1F),                      MAP_NUM(POKEMON_TOWER_1F),                      MAP_GROUP(LAVENDER_TOWN),                         MAP_NUM(LAVENDER_TOWN)},
    {MAP_GROUP(LAVENDER_TOWN_VOLUNTEER_POKEMON_HOUSE), MAP_NUM(LAVENDER_TOWN_VOLUNTEER_POKEMON_HOUSE), MAP_GROUP(LAVENDER_TOWN),                         MAP_NUM(LAVENDER_TOWN)},
    {MAP_GROUP(LAVENDER_TOWN_HOUSE2),                  MAP_NUM(LAVENDER_TOWN_HOUSE2),                  MAP_GROUP(LAVENDER_TOWN),                         MAP_NUM(LAVENDER_TOWN)},
    {MAP_GROUP(UNDERGROUND_PATH_EAST_ENTRANCE),        MAP_NUM(UNDERGROUND_PATH_EAST_ENTRANCE),        MAP_GROUP(ROUTE8),                                MAP_NUM(ROUTE8)},
    {MAP_GROUP(UNDERGROUND_PATH_WEST_ENTRANCE),        MAP_NUM(UNDERGROUND_PATH_WEST_ENTRANCE),        MAP_GROUP(ROUTE7),                                MAP_NUM(ROUTE7)},
    {MAP_GROUP(CELADON_CITY_DEPARTMENT_STORE_1F),      MAP_NUM(CELADON_CITY_DEPARTMENT_STORE_1F),      MAP_GROUP(CELADON_CITY),                          MAP_NUM(CELADON_CITY)},
    {MAP_GROUP(CELADON_CITY_CONDOMINIUMS_1F),          MAP_NUM(CELADON_CITY_CONDOMINIUMS_1F),          MAP_GROUP(CELADON_CITY),                          MAP_NUM(CELADON_CITY)},
    {MAP_GROUP(CELADON_CITY_GAME_CORNER),              MAP_NUM(CELADON_CITY_GAME_CORNER),              MAP_GROUP(CELADON_CITY),                          MAP_NUM(CELADON_CITY)},
    {MAP_GROUP(CELADON_CITY_GYM),                      MAP_NUM(CELADON_CITY_GYM),                      MAP_GROUP(CELADON_CITY),                          MAP_NUM(CELADON_CITY)},
    {MAP_GROUP(CELADON_CITY_RESTAURANT),               MAP_NUM(CELADON_CITY_RESTAURANT),               MAP_GROUP(CELADON_CITY),                          MAP_NUM(CELADON_CITY)},
    {MAP_GROUP(ROCKET_HIDEOUT_B1F),                    MAP_NUM(ROCKET_HIDEOUT_B1F),                    MAP_GROUP(CELADON_CITY_GAME_CORNER),              MAP_NUM(CELADON_CITY_GAME_CORNER)},
    {MAP_GROUP(SAFARI_ZONE_CENTER),                    MAP_NUM(SAFARI_ZONE_CENTER),                    MAP_GROUP(FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE),     MAP_NUM(FUCHSIA_CITY_SAFARI_ZONE_ENTRANCE)},
    {MAP_GROUP(FUCHSIA_CITY_GYM),                      MAP_NUM(FUCHSIA_CITY_GYM),                      MAP_GROUP(FUCHSIA_CITY),                          MAP_NUM(FUCHSIA_CITY)},
    {MAP_GROUP(FUCHSIA_CITY_WARDENS_HOUSE),            MAP_NUM(FUCHSIA_CITY_WARDENS_HOUSE),            MAP_GROUP(FUCHSIA_CITY),                          MAP_NUM(FUCHSIA_CITY)},
    {MAP_GROUP(SAFFRON_CITY_DOJO),                     MAP_NUM(SAFFRON_CITY_DOJO),                     MAP_GROUP(SAFFRON_CITY),                          MAP_NUM(SAFFRON_CITY)},
    {MAP_GROUP(SAFFRON_CITY_GYM),                      MAP_NUM(SAFFRON_CITY_GYM),                      MAP_GROUP(SAFFRON_CITY),                          MAP_NUM(SAFFRON_CITY)},
    {MAP_GROUP(SILPH_CO_1F),                           MAP_NUM(SILPH_CO_1F),                           MAP_GROUP(SAFFRON_CITY),                          MAP_NUM(SAFFRON_CITY)},
    {MAP_GROUP(SEAFOAM_ISLANDS_1F),                    MAP_NUM(SEAFOAM_ISLANDS_1F),                    MAP_GROUP(ROUTE20),                               MAP_NUM(ROUTE20)},
    {MAP_GROUP(SEAFOAM_ISLANDS_1F),                    MAP_NUM(SEAFOAM_ISLANDS_1F),                    MAP_GROUP(ROUTE20),                               MAP_NUM(ROUTE20)},
    {MAP_GROUP(POKEMON_MANSION_1F),                    MAP_NUM(POKEMON_MANSION_1F),                    MAP_GROUP(CINNABAR_ISLAND),                       MAP_NUM(CINNABAR_ISLAND)},
    {MAP_GROUP(CINNABAR_ISLAND_GYM),                   MAP_NUM(CINNABAR_ISLAND_GYM),                   MAP_GROUP(CINNABAR_ISLAND),                       MAP_NUM(CINNABAR_ISLAND)},
    {MAP_GROUP(CINNABAR_ISLAND_POKEMON_LAB_ENTRANCE),  MAP_NUM(CINNABAR_ISLAND_POKEMON_LAB_ENTRANCE),  MAP_GROUP(CINNABAR_ISLAND),                       MAP_NUM(CINNABAR_ISLAND)},
    {MAP_GROUP(VICTORY_ROAD_1F),                       MAP_NUM(VICTORY_ROAD_1F),                       MAP_GROUP(ROUTE23),                               MAP_NUM(ROUTE23)},
    {MAP_GROUP(VICTORY_ROAD_2F),                       MAP_NUM(VICTORY_ROAD_2F),                       MAP_GROUP(ROUTE23),                               MAP_NUM(ROUTE23)},
    {MAP_GROUP(INDIGO_PLATEAU_POKEMON_CENTER_1F),      MAP_NUM(INDIGO_PLATEAU_POKEMON_CENTER_1F),      MAP_GROUP(INDIGO_PLATEAU_EXTERIOR),               MAP_NUM(INDIGO_PLATEAU_EXTERIOR)},
    {MAP_GROUP(CERULEAN_CAVE_1F),                      MAP_NUM(CERULEAN_CAVE_1F),                      MAP_GROUP(CERULEAN_CITY),                         MAP_NUM(CERULEAN_CITY)}
};

void sub_80CC534(void)
{
    u8 i;
    for (i = 0; i < NELEMS(sInsideOutsidePairs); i++)
    {
        if (gSaveBlock1Ptr->location.mapGroup == sInsideOutsidePairs[i].grp && gSaveBlock1Ptr->location.mapNum == sInsideOutsidePairs[i].num)
        {
            if (VarGet(VAR_0x404D) != 35 || i != 32)
            {
                VarSet(VAR_0x404D, i);
                FlagSet(FLAG_0x808);
            }
            break;
        }
    }
}

void sub_80CC59C(void)
{
    s16 x, y;
    struct {
        u8 unk0;
        u8 unk1;
    } sp0;
    u16 r5 = VarGet(VAR_0x404D);
    sp0.unk0 = 0;
    sp0.unk1 = 0;
    if (FlagGet(FLAG_0x808))
    {
        if (r5 == 5)
        {
            if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(ROUTE2_VIRIDIAN_FOREST_SOUTH_ENTRANCE) && (gSaveBlock1Ptr->location.mapNum == MAP_NUM(ROUTE2_VIRIDIAN_FOREST_SOUTH_ENTRANCE) || gSaveBlock1Ptr->location.mapNum == MAP_NUM(ROUTE2_VIRIDIAN_FOREST_NORTH_ENTRANCE)))
            {
                sp0.unk0 = MAPSEC_ROUTE_2;
                if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(ROUTE2_VIRIDIAN_FOREST_SOUTH_ENTRANCE))
                    sp0.unk1 = r5;
                else
                    sp0.unk1 = r5 + 1;
                SetQuestLogEvent(QL_EVENT_DEPARTED, (void *)&sp0);
                FlagClear(FLAG_0x808);
                return;
            }
        }
        else if (r5 == 3)
        {
            if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(ROUTE22) && (gSaveBlock1Ptr->location.mapNum == MAP_NUM(ROUTE22) || gSaveBlock1Ptr->location.mapNum == MAP_NUM(ROUTE23)))
            {
                sp0.unk0 = Overworld_GetMapHeaderByGroupAndId(sInsideOutsidePairs[r5].grp, sInsideOutsidePairs[r5].num)->regionMapSectionId;
                if (gSaveBlock1Ptr->location.mapNum == MAP_NUM(ROUTE22))
                    sp0.unk1 = r5;
                else
                    sp0.unk1 = r5 + 1;
                SetQuestLogEvent(QL_EVENT_DEPARTED, (void *)&sp0);
                FlagClear(FLAG_0x808);
                return;
            }
        }
        if (gSaveBlock1Ptr->location.mapGroup == sInsideOutsidePairs[r5].grp2 && gSaveBlock1Ptr->location.mapNum == sInsideOutsidePairs[r5].num2)
        {
            sp0.unk0 = Overworld_GetMapHeaderByGroupAndId(sInsideOutsidePairs[r5].grp, sInsideOutsidePairs[r5].num)->regionMapSectionId;
            sp0.unk1 = r5;
            if (r5 == 22)
            {
                PlayerGetDestCoords(&x, &y);
                if (x != 15 || y != 26)
                    sp0.unk1++;
            }
            else if (r5 == 42)
            {
                PlayerGetDestCoords(&x, &y);
                if (x != 67 || y != 15)
                    sp0.unk1++;
            }
            SetQuestLogEvent(QL_EVENT_DEPARTED, (void *)&sp0);
            FlagClear(FLAG_0x808);
            if (r5 == 35)
            {
                VarSet(VAR_0x404D, 32);
                FlagSet(FLAG_0x808);
            }
        }
    }
}

u16 Special_BattleCardAction(void)
{
    switch (gSpecialVar_Result)
    {
    case 0:
        return sub_81445C0(3);
    case 1:
        return sub_81445C0(4);
    case 2:
        return sub_81445C0(0);
    case 3:
        return sub_81445C0(1);
    case 4:
        return sub_81445C0(2);
    default:
        AGB_ASSERT_EX(0, ABSPATH("scr_tool.c"), 3873);
        return 0;
    }
}

void SetPCBoxToSendMon(u8 boxId)
{
    sPCBoxToSendMon = boxId;
}

u16 GetPCBoxToSendMon(void)
{
    return sPCBoxToSendMon;
}

bool8 ShouldShowBoxWasFullMessage(void)
{
    if (FlagGet(FLAG_SYS_CHANGED_BOX_TO_STORE_MON))
        return FALSE;
    if (StorageGetCurrentBox() == VarGet(VAR_PC_BOX_TO_SEND_MON))
        return FALSE;
    FlagSet(FLAG_SYS_CHANGED_BOX_TO_STORE_MON);
    return TRUE;
}

bool8 IsDestinationBoxFull(void)
{
    s32 i;
    s32 j;
    SetPCBoxToSendMon(VarGet(VAR_PC_BOX_TO_SEND_MON));
    i = StorageGetCurrentBox();
    do
    {
        for (j = 0; j < IN_BOX_COUNT; j++)
        {
            if (GetBoxMonData(GetBoxedMonPtr(i, j), MON_DATA_SPECIES, NULL) == SPECIES_NONE)
            {
                if (GetPCBoxToSendMon() != i)
                    FlagClear(FLAG_SYS_CHANGED_BOX_TO_STORE_MON);
                VarSet(VAR_PC_BOX_TO_SEND_MON, i);
                return ShouldShowBoxWasFullMessage();
            }
        }
        i++;
        if (i == TOTAL_BOXES_COUNT)
            i = 0;
    } while (i != StorageGetCurrentBox());
    return FALSE;
}

const u16 sPokeCenter1FMaps[] = {
    MAP_VIRIDIAN_CITY_POKEMON_CENTER_1F,
    MAP_PEWTER_CITY_POKEMON_CENTER_1F,
    MAP_CERULEAN_CITY_POKEMON_CENTER_1F,
    MAP_LAVENDER_TOWN_POKEMON_CENTER_1F,
    MAP_VERMILION_CITY_POKEMON_CENTER_1F,
    MAP_CELADON_CITY_POKEMON_CENTER_1F,
    MAP_FUCHSIA_CITY_POKEMON_CENTER_1F,
    MAP_CINNABAR_ISLAND_POKEMON_CENTER_1F,
    MAP_INDIGO_PLATEAU_POKEMON_CENTER_1F,
    MAP_SAFFRON_CITY_POKEMON_CENTER_1F,
    MAP_ROUTE4_POKEMON_CENTER_1F,
    MAP_ROUTE10_POKEMON_CENTER_1F,
    MAP_ONE_ISLAND_POKEMON_CENTER_1F,
    MAP_TWO_ISLAND_POKEMON_CENTER_1F,
    MAP_THREE_ISLAND_POKEMON_CENTER_1F,
    MAP_FOUR_ISLAND_POKEMON_CENTER_1F,
    MAP_FIVE_ISLAND_POKEMON_CENTER_1F,
    MAP_SEVEN_ISLAND_POKEMON_CENTER_1F,
    MAP_SIX_ISLAND_POKEMON_CENTER_1F,
    MAP_UNION_ROOM,
    MAP_UNDEFINED
};

bool8 sub_80CC87C(void)
{
    s32 i;
    u16 mapno = (gUnknown_2031DB4.mapGroup << 8) + gUnknown_2031DB4.mapNum;
    for (i = 0; sPokeCenter1FMaps[i] != MAP_UNDEFINED; i++)
    {
        if (sPokeCenter1FMaps[i] == mapno)
            return TRUE;
    }
    return FALSE;
}

bool8 Special_ItemIsTM_GetMoveName(void)
{
    // 8004 = item ID
    if (gSpecialVar_0x8004 >= ITEM_TM01 && gSpecialVar_0x8004 <= ITEM_HM08)
    {
        StringCopy(gStringVar1, gMoveNames[ItemIdToBattleMoveId(gSpecialVar_0x8004)]);
        return TRUE;
    }
    else
        return FALSE;
}

void RunMassageCooldownStepCounter(void)
{
    u16 count = VarGet(VAR_MASSAGE_COOLDOWN_STEP_COUNTER);
    if (count < 500)
        VarSet(VAR_MASSAGE_COOLDOWN_STEP_COUNTER, count + 1);
}

void Special_DaisyMassageServices(void)
{
    AdjustFriendship(&gPlayerParty[gSpecialVar_0x8004], 6);
    VarSet(VAR_MASSAGE_COOLDOWN_STEP_COUNTER, 0);
}

static const u16 sEliteFourLightingPalettes[][16] = {
    INCBIN_U16("data/field_specials/unk_83F5F50.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F5F70.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F5F90.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F5FB0.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F5FD0.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F5FF0.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F6010.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F6030.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F6050.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F6070.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F6090.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F60B0.gbapal")
};

static const u16 sChampionRoomLightingPalettes[][16] = {
    INCBIN_U16("data/field_specials/unk_83F60D0.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F60F0.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F6110.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F6130.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F6150.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F6170.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F6190.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F61B0.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F61D0.gbapal")
};

static const u8 sEliteFourLightingTimers[] = {
    40,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12
};

static const u8 sChampionRoomLightingTimers[] = {
    20,
     8,
     8,
     8,
     8,
     8,
     8,
     8
};

void Special_PokemonLeagueLightingEffect(void)
{
    u8 taskId = CreateTask(Task_RunPokemonLeagueLightingEffect, 8);
    s16 *data = gTasks[taskId].data;
    if (FlagGet(FLAG_TEMP_3) == TRUE)
    {
        gTasks[taskId].func = Task_CancelPokemonLeagueLightingEffect;
    }
    else
    {
        if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(POKEMON_LEAGUE_CHAMPIONS_ROOM) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(POKEMON_LEAGUE_CHAMPIONS_ROOM))
        {
            data[0] = sChampionRoomLightingTimers[0];
            data[2] = 8;
            LoadPalette(sChampionRoomLightingPalettes[0], 0x70, 0x20);
        }
        else
        {
            data[0] = sEliteFourLightingTimers[0];
            data[2] = 11;
            LoadPalette(sEliteFourLightingPalettes[0], 0x70, 0x20);
        }
        data[1] = 0;
        sub_8059948(7, 1);
    }
}

static void Task_RunPokemonLeagueLightingEffect(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (!gPaletteFade.active
     && FlagGet(FLAG_TEMP_2) != FALSE
     && FlagGet(FLAG_TEMP_5) != TRUE
     && gUnknown_2036E28 != 3
     && --data[0] == 0
    )
    {
        if (++data[1] == data[2])
            data[1] = 0;

        if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(POKEMON_LEAGUE_CHAMPIONS_ROOM) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(POKEMON_LEAGUE_CHAMPIONS_ROOM))
        {
            data[0] = sChampionRoomLightingTimers[data[1]];
            LoadPalette(sChampionRoomLightingPalettes[data[1]], 0x70, 0x20);
        }
        else
        {
            data[0] = sEliteFourLightingTimers[data[1]];
            LoadPalette(sEliteFourLightingPalettes[data[1]], 0x70, 0x20);
        }
        sub_8059948(7, 1);
    }
}

static void Task_CancelPokemonLeagueLightingEffect(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (FlagGet(FLAG_TEMP_4) != FALSE)
    {
        if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(POKEMON_LEAGUE_CHAMPIONS_ROOM) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(POKEMON_LEAGUE_CHAMPIONS_ROOM))
        {
            LoadPalette(sChampionRoomLightingPalettes[8], 0x70, 0x20);
        }
        else
        {
            LoadPalette(sEliteFourLightingPalettes[11], 0x70, 0x20);
        }
        sub_8059948(7, 1);
        if (gPaletteFade.active)
        {
            BlendPalettes(0x00000080, 16, RGB_BLACK);
        }
        DestroyTask(taskId);
    }
}

void StopPokemonLeagueLightingEffectTask(void)
{
    if (FuncIsActiveTask(Task_RunPokemonLeagueLightingEffect) == TRUE)
    {
        DestroyTask(FindTaskIdByFunc(Task_RunPokemonLeagueLightingEffect));
    }
}

static const u8 sCapeBrinkCompatibleSpecies[] = {
    SPECIES_VENUSAUR,
    SPECIES_CHARIZARD,
    SPECIES_BLASTOISE
};

bool8 Special_CapeBrinkGetMoveToTeachLeadPokemon(void)
{
    // Returns:
    //   8005 = Move tutor index
    //   8006 = Num moves known by lead mon
    //   8007 = Index of lead mon
    //   to specialvar = whether a move can be taught in the first place
    u8 r7 = 0;
    u8 r6 = 0;
    u8 r8 = GetLeadMonIndex();
    u8 r4;
    gSpecialVar_0x8007 = r8;
    for (r4 = 0; r4 < NELEMS(sCapeBrinkCompatibleSpecies); r4++)
    {
        if (GetMonData(&gPlayerParty[r8], MON_DATA_SPECIES2, NULL) == sCapeBrinkCompatibleSpecies[r4])
        {
            r7 = r4;
            break;
        }
    }
    if (r4 == NELEMS(sCapeBrinkCompatibleSpecies) || GetMonData(&gPlayerParty[r8], MON_DATA_FRIENDSHIP) != 255)
        return FALSE;
    if (r7 == 0)
    {
        StringCopy(gStringVar2, gMoveNames[MOVE_FRENZY_PLANT]);
        gSpecialVar_0x8005 = MOVETUTOR_FRENZY_PLANT;
        if (FlagGet(FLAG_TUTOR_FRENZY_PLANT) == TRUE)
            return FALSE;
    }
    else if (r7 == 1)
    {
        StringCopy(gStringVar2, gMoveNames[MOVE_BLAST_BURN]);
        gSpecialVar_0x8005 = MOVETUTOR_BLAST_BURN;
        if (FlagGet(FLAG_TUTOR_BLAST_BURN) == TRUE)
            return FALSE;
    }
    else
    {
        StringCopy(gStringVar2, gMoveNames[MOVE_HYDRO_CANNON]);
        gSpecialVar_0x8005 = MOVETUTOR_HYDRO_CANNON;
        if (FlagGet(FLAG_TUTOR_HYDRO_CANNON) == TRUE)
            return FALSE;
    }
    if (GetMonData(&gPlayerParty[r8], MON_DATA_MOVE1) != MOVE_NONE)
        r6++;
    if (GetMonData(&gPlayerParty[r8], MON_DATA_MOVE2) != MOVE_NONE)
        r6++;
    if (GetMonData(&gPlayerParty[r8], MON_DATA_MOVE3) != MOVE_NONE)
        r6++;
    if (GetMonData(&gPlayerParty[r8], MON_DATA_MOVE4) != MOVE_NONE)
        r6++;
    gSpecialVar_0x8006 = r6;
    return TRUE;
}

bool8 Special_HasLearnedAllMovesFromCapeBrinkTutor(void)
{
    // 8005 is set by Special_CapeBrinkGetMoveToTeachLeadPokemon
    u8 r4 = 0;
    if (gSpecialVar_0x8005 == MOVETUTOR_FRENZY_PLANT)
        FlagSet(FLAG_TUTOR_FRENZY_PLANT);
    else if (gSpecialVar_0x8005 == MOVETUTOR_BLAST_BURN)
        FlagSet(FLAG_TUTOR_BLAST_BURN);
    else
        FlagSet(FLAG_TUTOR_HYDRO_CANNON);
    if (FlagGet(FLAG_TUTOR_FRENZY_PLANT) == TRUE)
        r4++;
    if (FlagGet(FLAG_TUTOR_BLAST_BURN) == TRUE)
        r4++;
    if (FlagGet(FLAG_TUTOR_HYDRO_CANNON) == TRUE)
        r4++;
    if (r4 == 3)
        return TRUE;
    else
        return FALSE;
}

bool8 CutMoveRuinValleyCheck(void)
{
    if (FlagGet(FLAG_USED_CUT_ON_RUIN_VALLEY_BRAILLE) != TRUE
     && gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(SIX_ISLAND_RUIN_VALLEY)
     && gSaveBlock1Ptr->location.mapNum == MAP_NUM(SIX_ISLAND_RUIN_VALLEY)
     && gSaveBlock1Ptr->pos.x == 24
     && gSaveBlock1Ptr->pos.y == 25
     && GetPlayerFacingDirection() == DIR_NORTH
    )
        return TRUE;
    else
        return FALSE;
}

void CutMoveOpenDottedHoleDoor(void)
{
    MapGridSetMetatileIdAt(31, 31, 0x358);
    DrawWholeMapView();
    PlaySE(SE_BAN);
    FlagSet(FLAG_USED_CUT_ON_RUIN_VALLEY_BRAILLE);
    ScriptContext2_Disable();
}

static const u16 sDeoxysObjectPals[][16] = {
    INCBIN_U16("data/field_specials/unk_83F6206.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F6226.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F6246.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F6266.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F6286.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F62A6.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F62C6.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F62E6.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F6306.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F6326.gbapal"),
    INCBIN_U16("data/field_specials/unk_83F6346.gbapal")
};

static const u8 sDeoxysCoords[][2] = {
    {15, 12},
    {11, 14},
    {15,  8},
    {19, 14},
    {12, 11},
    {18, 11},
    {15, 14},
    {11, 14},
    {19, 14},
    {15, 15},
    {15, 10}
};

static const u8 sDeoxysStepCaps[] = {
    4,
    8,
    8,
    8,
    4,
    4,
    4,
    6,
    3,
    3
};

void DoDeoxysRockInteraction(void)
{
    CreateTask(Task_DoDeoxysRockInteraction, 8);
}

static void Task_DoDeoxysRockInteraction(u8 taskId)
{
    u16 r5;
    u16 r6;
    if (FlagGet(FLAG_SYS_DEOXYS_AWAKENED) == TRUE)
    {
        gSpecialVar_Result = 3;
        EnableBothScriptContexts();
        DestroyTask(taskId);
    }
    else
    {
        r5 = VarGet(VAR_DEOXYS_INTERACTION_NUM);
        r6 = VarGet(VAR_DEOXYS_INTERACTION_STEP_COUNTER);
        VarSet(VAR_DEOXYS_INTERACTION_STEP_COUNTER, 0);
        if (r5 != 0 && sDeoxysStepCaps[r5 - 1] < r6)
        {
            MoveDeoxysObject(0);
            VarSet(VAR_DEOXYS_INTERACTION_NUM, 0);
            gSpecialVar_Result = 0;
            DestroyTask(taskId);
        }
        else if (r5 == 10)
        {
            FlagSet(FLAG_SYS_DEOXYS_AWAKENED);
            gSpecialVar_Result = 2;
            EnableBothScriptContexts();
            DestroyTask(taskId);
        }
        else
        {
            r5++;
            MoveDeoxysObject(r5);
            VarSet(VAR_DEOXYS_INTERACTION_NUM, r5);
            gSpecialVar_Result = 1;
            DestroyTask(taskId);
        }
    }
}

static void MoveDeoxysObject(u8 num)
{
    u8 mapObjId;
    LoadPalette(sDeoxysObjectPals[num], 0x1A0, 0x08);
    sub_8083598(10);
    TryGetObjectEventIdByLocalIdAndMap(1, gSaveBlock1Ptr->location.mapNum, gSaveBlock1Ptr->location.mapGroup, &mapObjId);
    if (num == 0)
        PlaySE(SE_W109);
    else
        PlaySE(SE_DEOMOV);
    CreateTask(Task_WaitDeoxysFieldEffect, 8);
    gFieldEffectArguments[0] = 1;
    gFieldEffectArguments[1] = 56;
    gFieldEffectArguments[2] = 2;
    gFieldEffectArguments[3] = sDeoxysCoords[num][0];
    gFieldEffectArguments[4] = sDeoxysCoords[num][1];
    if (num == 0)
        gFieldEffectArguments[5] = 60;
    else
        gFieldEffectArguments[5] = 5;
    FieldEffectStart(FLDEFF_UNK_43);
    Overworld_SetMapObjTemplateCoords(1, sDeoxysCoords[num][0], sDeoxysCoords[num][1]);
}

static void Task_WaitDeoxysFieldEffect(u8 taskId)
{
    if (!FieldEffectActiveListContains(FLDEFF_UNK_43))
    {
        EnableBothScriptContexts();
        DestroyTask(taskId);
    }
}

void BirthIslandDeoxysStepCounter(void)
{
    u16 count = VarGet(VAR_DEOXYS_INTERACTION_STEP_COUNTER);
    if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(BIRTH_ISLAND_EXTERIOR) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(BIRTH_ISLAND_EXTERIOR))
    {
        count++;
        if (count > 99)
            VarSet(VAR_DEOXYS_INTERACTION_STEP_COUNTER, 0);
        else
            VarSet(VAR_DEOXYS_INTERACTION_STEP_COUNTER, count);
    }
}

void Special_SetDeoxysTriangleObjectPal(void)
{
    u8 num = VarGet(VAR_DEOXYS_INTERACTION_NUM);
    LoadPalette(sDeoxysObjectPals[num], 0x1A0, 0x08);
    sub_8083598(10);
}

bool8 Special_BadEggInParty(void)
{
    u8 partyCount = CalculatePlayerPartyCount();
    u8 i;
    for (i = 0; i < partyCount; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SANITY_IS_BAD_EGG) == TRUE)
            return TRUE;
    }
    return FALSE;
}

bool8 Special_PlayerIsNotInTrainerTowerLobby(void)
{
    if (gSaveBlock1Ptr->location.mapGroup == MAP_GROUP(TRAINER_TOWER_LOBBY) && gSaveBlock1Ptr->location.mapNum == MAP_NUM(TRAINER_TOWER_LOBBY))
        return FALSE;
    else
        return TRUE;
}

void Special_BrailleCursorToggle(void)
{
    // 8004 = x - 27
    // 8005 = y
    // 8006 = action (0 = create, 1 = delete)
    u16 x;
    if (gQuestLogState != 2)
    {
        x = gSpecialVar_0x8004 + 27;
        if (gSpecialVar_0x8006 == 0)
            sBrailleTextCursorSpriteID = CreateTextCursorSpriteForOakSpeech(0, x, gSpecialVar_0x8005, 0, 0);
        else
            sub_8006398(sBrailleTextCursorSpriteID);
    }
}

bool8 Special_PlayerPartyContainsSpeciesWithPlayerID(void)
{
    // 8004 = species
    u8 playerCount = CalculatePlayerPartyCount();
    u8 i;
    for (i = 0; i < playerCount; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2, NULL) == gSpecialVar_0x8004 && GetPlayerTrainerId() == GetMonData(&gPlayerParty[i], MON_DATA_OT_ID, NULL))
            return TRUE;
    }
    return FALSE;
}

/*
 * Determines which of Lorelei's doll collection to show
 * based on how many times you've entered the Hall of Fame.
 */
void Special_ComputeLoreleiDollCollection(void)
{
    u32 numHofClears = GetGameStat(GAME_STAT_ENTERED_HOF);
    if (numHofClears >= 25)
    {
        FlagClear(FLAG_HIDE_LORELEI_HOUSE_MEOWTH_DOLL);
        if (numHofClears >= 50)
            FlagClear(FLAG_HIDE_LORELEI_HOUSE_CHANSEY_DOLL);
        if (numHofClears >= 75)
            FlagClear(FLAG_HIDE_LORELEIS_HOUSE_NIDORAN_F_DOLL);
        if (numHofClears >= 100)
            FlagClear(FLAG_HIDE_LORELEI_HOUSE_JIGGLYPUFF_DOLL);
        if (numHofClears >= 125)
            FlagClear(FLAG_HIDE_LORELEIS_HOUSE_NIDORAN_M_DOLL);
        if (numHofClears >= 150)
            FlagClear(FLAG_HIDE_LORELEIS_HOUSE_FEAROW_DOLL);
        if (numHofClears >= 175)
            FlagClear(FLAG_HIDE_LORELEIS_HOUSE_PIDGEOT_DOLL);
        if (numHofClears >= 200)
            FlagClear(FLAG_HIDE_LORELEIS_HOUSE_LAPRAS_DOLL);
    }
}

void Special_LoopWingFlapSound(void)
{
    // 8004 = Num flaps
    // 8005 = Frame delay between flaps
    CreateTask(Task_WingFlapSound, 8);
    PlaySE(SE_W017);
}

static void Task_WingFlapSound(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    data[1]++;
    if (data[1] == gSpecialVar_0x8005)
    {
        data[0]++;
        data[1] = 0;
        PlaySE(SE_W017);
    }
    if (data[0] == gSpecialVar_0x8004 - 1)
        DestroyTask(taskId);
}
