#include "global.h"
#include "gflib.h"
#include "battle.h"
#include "battle_records.h"
#include "cable_club.h"
#include "event_data.h"
#include "event_scripts.h"
#include "field_message_box.h"
#include "field_weather.h"
#include "link.h"
#include "load_save.h"
#include "m4a.h"
#include "mystery_gift.h"
#include "new_menu_helpers.h"
#include "overworld.h"
#include "quest_log.h"
#include "script.h"
#include "script_pokemon_util.h"
#include "start_menu.h"
#include "strings.h"
#include "task.h"
#include "trade.h"
#include "trainer_card.h"
#include "union_room.h"
#include "constants/songs.h"
#include "constants/cable_club.h"
#include "constants/field_weather.h"
#include "constants/maps.h"

COMMON_DATA u32 UnusedVarNeededToMatch[8] = {0};

static void Task_LinkupStart(u8 taskId);
static void Task_LinkupAwaitConnection(u8 taskId);
static void Task_LinkupConfirmWhenReady(u8 taskId);
static void Task_LinkupAwaitConfirmation(u8 taskId);
static void Task_LinkupTryConfirmation(u8 taskId);
static void Task_LinkupConfirm(u8 taskId);
static void Task_LinkupExchangeDataWithLeader(u8 taskId);
static void Task_LinkupCheckStatusAfterConfirm(u8 taskId);
static void Task_LinkupAwaitTrainerCardData(u8 taskId);
static void Task_StopLinkup(u8 taskId);
static void Task_LinkupFailed(u8 taskId);
static void Task_LinkupConnectionError(u8 taskId);
static bool8 TryLinkTimeout(u8 taskId);
static void Task_ReestablishLink(u8 taskId);
static void Task_ReestablishLinkAwaitConnection(u8 taskId);
static void Task_ReestablishLinkLeader(u8 taskId);
static void Task_ReestablishLinkAwaitConfirmation(u8 taskId);

#define tState      data[0]


#define tMinPlayers data[1]
#define tMaxPlayers data[2]
#define tNumPlayers data[3]
#define tTimer      data[4]
#define tWindowId   data[5]

static const struct WindowTemplate sWindowTemplate_LinkPlayerCount = {
    .bg = 0,
    .tilemapLeft = 16,
    .tilemapTop = 11,
    .width = 11,
    .height = 2,
    .paletteNum = 15,
    .baseBlock = 0x125
};

static const u8 *const sTrainerCardColorNames[] = {
    gText_BronzeCard,
    gText_CopperCard,
    gText_SilverCard,
    gText_GoldCard
};

static void CreateLinkupTask(u8 minPlayers, u8 maxPlayers)
{
    u8 taskId;
    if (FindTaskIdByFunc(Task_LinkupStart) == TASK_NONE)
    {
        taskId = CreateTask(Task_LinkupStart, 80);
        gTasks[taskId].tMinPlayers = minPlayers;
        gTasks[taskId].tMaxPlayers = maxPlayers;
    }
}

static void PrintNumPlayersInLink(u16 windowId, s32 numPlayers)
{
    ConvertIntToDecimalStringN(gStringVar1, numPlayers, STR_CONV_MODE_LEFT_ALIGN, 1);
    SetStdWindowBorderStyle(windowId, FALSE);
    StringExpandPlaceholders(gStringVar4, gText_NumPlayerLink);
    AddTextPrinterParameterized(windowId, FONT_NORMAL, gStringVar4, 0, 0, TEXT_SKIP_DRAW, NULL);
    CopyWindowToVram(windowId, COPYWIN_FULL);
}

static void ClearLinkPlayerCountWindow(u16 windowId)
{
    ClearStdWindowAndFrame(windowId, FALSE);
    CopyWindowToVram(windowId, COPYWIN_FULL);
}

static void UpdateLinkPlayerCountDisplay(u8 taskId, u8 numPlayers)
{
    s16 *data = gTasks[taskId].data;
    if (numPlayers != tNumPlayers)
    {
        if (numPlayers < 2)
            ClearLinkPlayerCountWindow(tWindowId);
        else
            PrintNumPlayersInLink(tWindowId, numPlayers);
        tNumPlayers = numPlayers;
    }
}

static u16 ExchangeDataAndGetLinkupStatus(u8 minPlayers, u8 maxPlayers)
{
    switch (GetLinkPlayerDataExchangeStatusTimed(minPlayers, maxPlayers))
    {
    case EXCHANGE_COMPLETE:
        return LINKUP_SUCCESS;
    case EXCHANGE_DIFF_SELECTIONS:
        return LINKUP_DIFF_SELECTIONS;
    case EXCHANGE_PLAYER_NOT_READY:
        return LINKUP_PLAYER_NOT_READY;
    case EXCHANGE_PARTNER_NOT_READY:
        return LINKUP_PARTNER_NOT_READY;
    case EXCHANGE_WRONG_NUM_PLAYERS:
        ConvertIntToDecimalStringN(gStringVar1, GetLinkPlayerCount_2(), STR_CONV_MODE_LEFT_ALIGN, 1);
        return LINKUP_WRONG_NUM_PLAYERS;
    default:
        return LINKUP_ONGOING;
    }
}

static bool32 CheckLinkErrored(u8 taskId)
{
    if (HasLinkErrorOccurred() == TRUE)
    {
        gTasks[taskId].func = Task_LinkupConnectionError;
        return TRUE;
    }
    return FALSE;
}

static bool32 CheckLinkCanceledBeforeConnection(u8 taskId)
{
    if (JOY_NEW(B_BUTTON) && !IsLinkConnectionEstablished())
    {
        gLinkType = 0;
        gTasks[taskId].func = Task_LinkupFailed;
        return TRUE;
    }
    return FALSE;
}

static bool32 CheckLinkCanceled(u8 taskId)
{
    if (IsLinkConnectionEstablished())
        SetSuppressLinkErrorMessage(TRUE);

    if (JOY_NEW(B_BUTTON))
    {
        gLinkType = 0;
        gTasks[taskId].func = Task_LinkupFailed;
        return TRUE;
    }
    return FALSE;
}

static bool32 CheckSioErrored(u8 taskId)
{
    if (GetSioMultiSI() == TRUE)
    {
        gTasks[taskId].func = Task_LinkupConnectionError;
        return TRUE;
    }
    return FALSE;
}

// Unused
static void Task_DelayedBlockRequest(u8 taskId)
{
    gTasks[taskId].data[0]++;
    if (gTasks[taskId].data[0] == 10)
    {
        SendBlockRequest(BLOCK_REQ_SIZE_100);
        DestroyTask(taskId);
    }
}

static void Task_LinkupStart(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (data[0] == 0)
    {
        OpenLinkTimed();
        ResetLinkPlayerCount();
        ResetLinkPlayers();
        tWindowId = AddWindow(&sWindowTemplate_LinkPlayerCount);
    }
    else if (data[0] > 9)
    {
        gTasks[taskId].func = Task_LinkupAwaitConnection;
    }
    data[0]++;
}

static void Task_LinkupAwaitConnection(u8 taskId)
{
    u8 playerCount = GetLinkPlayerCount_2();
    if (CheckLinkCanceledBeforeConnection(taskId) == TRUE
     || CheckLinkCanceled(taskId) == TRUE
     || playerCount < 2)
        return;

    SetSuppressLinkErrorMessage(TRUE);
    gTasks[taskId].data[3] = 0;
    if (IsLinkMaster() == TRUE)
    {
        PlaySE(SE_PIN);
        ShowFieldAutoScrollMessage(CableClub_Text_WhenAllPlayersReadyAConfirmBCancel);
        gTasks[taskId].func = Task_LinkupConfirmWhenReady;
    }
    else
    {
        PlaySE(SE_BOO);
        ShowFieldAutoScrollMessage(CableClub_Text_AwaitingLinkupBCancel);
        gTasks[taskId].func = Task_LinkupExchangeDataWithLeader;
    }
}

static void Task_LinkupConfirmWhenReady(u8 taskId)
{
    if (CheckLinkCanceledBeforeConnection(taskId) == TRUE
     || CheckSioErrored(taskId) == TRUE
     || CheckLinkErrored(taskId) == TRUE)
        return;

    if (GetFieldMessageBoxType() == FIELD_MESSAGE_BOX_HIDDEN)
    {
        gTasks[taskId].tNumPlayers = 0;
        gTasks[taskId].func = Task_LinkupAwaitConfirmation;
    }
}

static void Task_LinkupAwaitConfirmation(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    s32 linkPlayerCount = GetLinkPlayerCount_2();

    if (CheckLinkCanceledBeforeConnection(taskId) == TRUE
     || CheckSioErrored(taskId) == TRUE
     || CheckLinkErrored(taskId) == TRUE)
        return;

    UpdateLinkPlayerCountDisplay(taskId, linkPlayerCount);
    if (JOY_NEW(A_BUTTON) && linkPlayerCount >= tMinPlayers)
    {
        SaveLinkPlayers(linkPlayerCount);
        ClearLinkPlayerCountWindow(tWindowId);
        ConvertIntToDecimalStringN(gStringVar1, linkPlayerCount, STR_CONV_MODE_LEFT_ALIGN, 1);
        ShowFieldAutoScrollMessage(CableClub_Text_StartLinkWithXPlayersAConfirmBCancel);
        gTasks[taskId].func = Task_LinkupTryConfirmation;
    }

}

static void Task_LinkupTryConfirmation(u8 taskId)
{
    if (CheckLinkCanceledBeforeConnection(taskId) == TRUE
     || CheckSioErrored(taskId) == TRUE
     || CheckLinkErrored(taskId) == TRUE)
        return;

    if (GetFieldMessageBoxType() == FIELD_MESSAGE_BOX_HIDDEN)
    {
        if (GetSavedPlayerCount() != GetLinkPlayerCount_2())
        {
            ShowFieldAutoScrollMessage(CableClub_Text_WhenAllPlayersReadyAConfirmBCancel);
            gTasks[taskId].func = Task_LinkupConfirmWhenReady;
        }
        else if (JOY_HELD(B_BUTTON))
        {
            ShowFieldAutoScrollMessage(CableClub_Text_WhenAllPlayersReadyAConfirmBCancel);
            gTasks[taskId].func = Task_LinkupConfirmWhenReady;
        }
        else if (JOY_HELD(A_BUTTON))
        {
            PlaySE(SE_SELECT);
            CheckShouldAdvanceLinkState();
            gTasks[taskId].func = Task_LinkupConfirm;
        }
    }
}

static void Task_LinkupConfirm(u8 taskId)
{
    u8 minPlayers = gTasks[taskId].tMinPlayers;
    u8 maxPlayers = gTasks[taskId].tMaxPlayers;

    if (CheckLinkErrored(taskId) == TRUE
     || TryLinkTimeout(taskId) == TRUE)
        return;

    if (GetLinkPlayerCount_2() != GetSavedPlayerCount())
    {
        gTasks[taskId].func = Task_LinkupConnectionError;
    }
    else
    {
        u16 *result = &gSpecialVar_Result;
        *result = ExchangeDataAndGetLinkupStatus(minPlayers, maxPlayers);
        if (*result)
            gTasks[taskId].func = Task_LinkupCheckStatusAfterConfirm;
    }
}

static void Task_LinkupExchangeDataWithLeader(u8 taskId)
{
    u8 minPlayers = gTasks[taskId].tMinPlayers;
    u8 maxPlayers = gTasks[taskId].tMaxPlayers;
    u16 *result;

    if (CheckLinkCanceledBeforeConnection(taskId) == TRUE
     || CheckLinkErrored(taskId) == TRUE)
        return;

    result = &gSpecialVar_Result;
    *result = ExchangeDataAndGetLinkupStatus(minPlayers, maxPlayers);
    if (*result == LINKUP_ONGOING)
        return;
    if (*result == LINKUP_DIFF_SELECTIONS
     || *result == LINKUP_WRONG_NUM_PLAYERS)
    {
        SetCloseLinkCallback();
        HideFieldMessageBox();
        gTasks[taskId].func = Task_StopLinkup;
    }
    else if (*result == LINKUP_PLAYER_NOT_READY
          || *result == LINKUP_PARTNER_NOT_READY)
    {
        CloseLink();
        HideFieldMessageBox();
        gTasks[taskId].func = Task_StopLinkup;
    }
    else
    {
        gFieldLinkPlayerCount = GetLinkPlayerCount_2();
        gLocalLinkPlayerId = GetMultiplayerId();
        SaveLinkPlayers(gFieldLinkPlayerCount);
        TrainerCard_GenerateCardForLinkPlayer((void *)gBlockSendBuffer);
        gTasks[taskId].func = Task_LinkupAwaitTrainerCardData;
    }
}

static bool32 AnyConnectedPartnersPlayingRS(void)
{
    int i;
    u16 version;

    for (i = 0; i < GetLinkPlayerCount(); i++)
    {
        version = gLinkPlayers[i].version & 0xFF;
        if (version == VERSION_RUBY || version == VERSION_SAPPHIRE)
            return TRUE;
    }
    return FALSE;
}

static void Task_LinkupCheckStatusAfterConfirm(u8 taskId)
{
    if (CheckLinkErrored(taskId) == TRUE)
        return;

    if (gSpecialVar_Result == LINKUP_WRONG_NUM_PLAYERS)
    {
        if (AnyConnectedPartnersPlayingRS() == TRUE)
            CloseLink();
        else
            SetCloseLinkCallback();
        HideFieldMessageBox();
        gTasks[taskId].func = Task_StopLinkup;
    }
    else if (gSpecialVar_Result == LINKUP_DIFF_SELECTIONS)
    {
        SetCloseLinkCallback();
        HideFieldMessageBox();
        gTasks[taskId].func = Task_StopLinkup;
    }
    else if (gSpecialVar_Result == LINKUP_PLAYER_NOT_READY
          || gSpecialVar_Result == LINKUP_PARTNER_NOT_READY)
    {
        CloseLink();
        HideFieldMessageBox();
        gTasks[taskId].func = Task_StopLinkup;
    }
    else
    {
        gFieldLinkPlayerCount = GetLinkPlayerCount_2();
        gLocalLinkPlayerId = GetMultiplayerId();
        SaveLinkPlayers(gFieldLinkPlayerCount);
        TrainerCard_GenerateCardForLinkPlayer((void *)gBlockSendBuffer);
        gTasks[taskId].func = Task_LinkupAwaitTrainerCardData;
        SendBlockRequest(BLOCK_REQ_SIZE_100);
    }
}

static void Task_LinkupAwaitTrainerCardData(u8 taskId)
{
    u8 i;
    u16 version;
    u8 * dest;

    if (CheckLinkErrored(taskId) == TRUE)
        return;

    if (GetBlockReceivedStatus() != GetSavedLinkPlayerCountAsBitFlags())
        return;

    for (i = 0; i < GetLinkPlayerCount(); i++)
    {
        version = gLinkPlayers[i].version & 0xFF;
        if (version != VERSION_FIRE_RED && version != VERSION_LEAF_GREEN)
        {
            const struct TrainerCardRSE * src = (const struct TrainerCardRSE *)gBlockRecvBuffer[i];
            gTrainerCards[i].rse = *src;
            gTrainerCards[i].version = gLinkPlayers[i].version;
        }
        else
        {
            const struct TrainerCard * src = (const struct TrainerCard *)gBlockRecvBuffer[i];
            gTrainerCards[i] = *src;
        }
    }
    SetSuppressLinkErrorMessage(FALSE);
    ResetBlockReceivedFlags();
    HideFieldMessageBox();
    if (gSpecialVar_Result == LINKUP_SUCCESS)
    {
        // Dumb trick required to match
        if (gLinkType == LINKTYPE_BERRY_BLENDER_SETUP)
            *UnusedVarNeededToMatch += 0;
        ClearLinkPlayerCountWindow(gTasks[taskId].tWindowId);
        ScriptContext_Enable();
        DestroyTask(taskId);
    }
    else
    {
        SetCloseLinkCallback();
        gTasks[taskId].func = Task_StopLinkup;
    }
}

static void Task_StopLinkup(u8 taskId)
{
    if (!gReceivedRemoteLinkPlayers)
    {
        ClearLinkPlayerCountWindow(gTasks[taskId].tWindowId);
        ScriptContext_Enable();
        RemoveWindow(gTasks[taskId].tWindowId);
        DestroyTask(taskId);
    }
}

static void Task_LinkupFailed(u8 taskId)
{
    gSpecialVar_Result = LINKUP_FAILED;
    ClearLinkPlayerCountWindow(gTasks[taskId].tWindowId);
    HideFieldMessageBox();
    ScriptContext_Enable();
    DestroyTask(taskId);
}

static void Task_LinkupConnectionError(u8 taskId)
{
    gSpecialVar_Result = LINKUP_CONNECTION_ERROR;
    ClearLinkPlayerCountWindow(gTasks[taskId].tWindowId);
    HideFieldMessageBox();
    ScriptContext_Enable();
    DestroyTask(taskId);
}

static bool8 TryLinkTimeout(u8 taskId)
{
    if (++gTasks[taskId].tTimer > 600)
    {
        gTasks[taskId].func = Task_LinkupConnectionError;
        return TRUE;
    }
    return FALSE;
}

void TryBattleLinkup(void)
{
    u8 minPlayers = 2;
    u8 maxPlayers = 2;

    switch (gSpecialVar_0x8004)
    {
    case USING_SINGLE_BATTLE:
        minPlayers = 2;
        maxPlayers = 2;
        gLinkType = LINKTYPE_SINGLE_BATTLE;
        break;
    case USING_DOUBLE_BATTLE:
        minPlayers = 2;
        maxPlayers = 2;
        gLinkType = LINKTYPE_DOUBLE_BATTLE;
        break;
    case USING_MULTI_BATTLE:
        minPlayers = 4;
        maxPlayers = 4;
        gLinkType = LINKTYPE_MULTI_BATTLE;
        break;
    }
    CreateLinkupTask(minPlayers, maxPlayers);
}

#undef tMinPlayers
#undef tMaxPlayers
#undef tNumPlayers
#undef tTimer
#undef tWindowId

void TryTradeLinkup(void)
{
    gLinkType = LINKTYPE_TRADE_SETUP;
    gBattleTypeFlags = 0;
    CreateLinkupTask(2, 2);
}

void TryRecordMixLinkup(void)
{
    gSpecialVar_Result = LINKUP_ONGOING;
    gLinkType = LINKTYPE_RECORD_MIX_BEFORE;
    gBattleTypeFlags = 0;
    CreateLinkupTask(2, 4);
}

void TryContestLinkup(void)
{
    gLinkType = LINKTYPE_CONTEST_GMODE;
    gBattleTypeFlags = 0;
    CreateLinkupTask(4, 4);
}

u8 CreateTask_ReestablishCableClubLink(void)
{
    if (FuncIsActiveTask(Task_ReestablishLink))
        return TASK_NONE;

    switch (gSpecialVar_0x8004)
    {
    case USING_SINGLE_BATTLE:
        gLinkType = LINKTYPE_SINGLE_BATTLE;
        break;
    case USING_DOUBLE_BATTLE:
        gLinkType = LINKTYPE_DOUBLE_BATTLE;
        break;
    case USING_MULTI_BATTLE:
        gLinkType = LINKTYPE_MULTI_BATTLE;
        break;
    case USING_TRADE_CENTER:
        gLinkType = LINKTYPE_TRADE;
        break;
    case USING_RECORD_CORNER:
        gLinkType = LINKTYPE_RECORD_MIX_AFTER;
        break;
    }
    return CreateTask(Task_ReestablishLink, 80);
}

static void Task_ReestablishLink(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (data[0] == 0)
    {
        OpenLink();
        ResetLinkPlayers();
        CreateTask(Task_WaitForLinkPlayerConnection, 80);
    }
    else if (data[0] > 9)
    {
        gTasks[taskId].func = Task_ReestablishLinkAwaitConnection;
    }
    data[0]++;
}

static void Task_ReestablishLinkAwaitConnection(u8 taskId)
{
    if (GetLinkPlayerCount_2() >= 2)
    {
        if (IsLinkMaster() == TRUE)
            gTasks[taskId].func = Task_ReestablishLinkLeader;
        else
            gTasks[taskId].func = Task_ReestablishLinkAwaitConfirmation;
    }
}

static void Task_ReestablishLinkLeader(u8 taskId)
{
    if (GetSavedPlayerCount() == GetLinkPlayerCount_2())
    {
        CheckShouldAdvanceLinkState();
        gTasks[taskId].func = Task_ReestablishLinkAwaitConfirmation;
    }
}

static void Task_ReestablishLinkAwaitConfirmation(u8 taskId)
{
    if (gReceivedRemoteLinkPlayers == TRUE && IsLinkPlayerDataExchangeComplete() == TRUE)
    {
        CheckLinkPlayersMatchSaved();
        StartSendingKeysToLink();
        DestroyTask(taskId);
    }
}

// Unused
void CableClub_AskSaveTheGame(void)
{
    Field_AskSaveTheGame();
}

#define tTimer data[1]

static void Task_StartWiredCableClubBattle(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->tState)
    {
    case 0:
        FadeScreen(FADE_TO_BLACK, 0);
        gLinkType = LINKTYPE_BATTLE;
        ClearLinkCallback_2();
        task->tState++;
        break;
    case 1:
        if (!gPaletteFade.active)
            task->tState++;
        break;
    case 2:
        if (++task->tTimer > 20)
            task->tState++;
        break;
    case 3:
        SetCloseLinkCallback();
        task->tState++;
        break;
    case 4:
        if (!gReceivedRemoteLinkPlayers)
            task->tState++;
        break;
    case 5:
        if (gLinkPlayers[0].trainerId & 1)
            PlayMapChosenOrBattleBGM(MUS_RS_VS_GYM_LEADER);
        else
            PlayMapChosenOrBattleBGM(MUS_RS_VS_TRAINER);
        switch (gSpecialVar_0x8004)
        {
        case USING_SINGLE_BATTLE:
            gBattleTypeFlags = BATTLE_TYPE_TRAINER | BATTLE_TYPE_LINK;
            break;
        case USING_DOUBLE_BATTLE:
            gBattleTypeFlags = BATTLE_TYPE_TRAINER | BATTLE_TYPE_LINK | BATTLE_TYPE_DOUBLE;
            break;
        case USING_MULTI_BATTLE:
            ReducePlayerPartyToThree();
            gBattleTypeFlags = BATTLE_TYPE_TRAINER | BATTLE_TYPE_LINK | BATTLE_TYPE_DOUBLE | BATTLE_TYPE_MULTI;
            break;
        }
        CleanupOverworldWindowsAndTilemaps();
        gTrainerBattleOpponent_A = TRAINER_LINK_OPPONENT;
        SetMainCallback2(CB2_InitBattle);
        gMain.savedCallback = CB2_ReturnFromCableClubBattle;
        DestroyTask(taskId);
        break;
    }
}

static void Task_StartWirelessCableClubBattle(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    int i;

    switch (tState)
    {
    case 0:
        FadeScreen(FADE_TO_BLACK, 0);
        gLinkType = LINKTYPE_BATTLE;
        ClearLinkCallback_2();
        tState = 1;
        break;
    case 1:
        if (!gPaletteFade.active)
            tState = 2;
        break;
    case 2:
        SendBlock(0, &gLocalLinkPlayer, sizeof(gLocalLinkPlayer));
        tState = 3;
        break;
    case 3:
        if (GetBlockReceivedStatus() == GetLinkPlayerCountAsBitFlags())
        {
            for (i = 0; i < GetLinkPlayerCount(); i++)
            {
                gLinkPlayers[i] = *(struct LinkPlayer *)gBlockRecvBuffer[i];
                ConvertLinkPlayerName(&gLinkPlayers[i]);
                ResetBlockReceivedFlag(i);
            }
            tState = 4;
        }
        break;
    case 4:
        if (++tTimer > 20)
            tState = 5;
        break;
    case 5:
        SetLinkStandbyCallback();
        tState = 6;
        break;
    case 6:
        if (IsLinkTaskFinished())
            tState = 7;
        break;
    case 7:
        if (gLinkPlayers[0].trainerId & 1)
            PlayMapChosenOrBattleBGM(MUS_RS_VS_GYM_LEADER);
        else
            PlayMapChosenOrBattleBGM(MUS_RS_VS_TRAINER);
        gLinkPlayers[0].linkType = LINKTYPE_BATTLE;
        switch (gSpecialVar_0x8004)
        {
        case USING_SINGLE_BATTLE:
            gBattleTypeFlags = BATTLE_TYPE_TRAINER | BATTLE_TYPE_LINK;
            break;
        case USING_DOUBLE_BATTLE:
            gBattleTypeFlags = BATTLE_TYPE_TRAINER | BATTLE_TYPE_LINK | BATTLE_TYPE_DOUBLE;
            break;
        case USING_MULTI_BATTLE:
            ReducePlayerPartyToThree();
            gBattleTypeFlags = BATTLE_TYPE_TRAINER | BATTLE_TYPE_LINK | BATTLE_TYPE_DOUBLE | BATTLE_TYPE_MULTI;
            break;
        }
        CleanupOverworldWindowsAndTilemaps();
        gTrainerBattleOpponent_A = TRAINER_LINK_OPPONENT;
        SetMainCallback2(CB2_InitBattle);
        gMain.savedCallback = CB2_ReturnFromCableClubBattle;
        DestroyTask(taskId);
        break;
    }
}

#undef tTimer

static void CB2_ReturnFromUnionRoomBattle(void)
{
    switch (gMain.state)
    {
    case 0:
        SetCloseLinkCallback();
        gMain.state++;
        break;
    case 1:
        if (IsLinkTaskFinished())
            SetMainCallback2(CB2_ReturnToField);
        break;
    }
}

void CB2_ReturnFromCableClubBattle(void)
{
    gBattleTypeFlags &= (u16)~BATTLE_TYPE_LINK_IN_BATTLE;
    Overworld_ResetMapMusic();
    LoadPlayerParty();
    SavePlayerBag();
    Special_UpdateTrainerFansAfterLinkBattle();

    if (gSpecialVar_0x8004 != USING_MULTI_BATTLE)
    {
        UpdatePlayerLinkBattleRecords(gLocalLinkPlayerId ^ 1);
        if (gWirelessCommType != 0)
        {
            switch (gBattleOutcome)
            {
            case B_OUTCOME_WON:
                MysteryGift_TryIncrementStat(CARD_STAT_BATTLES_WON, gLinkPlayers[GetMultiplayerId() ^ 1].trainerId);
                break;
            case B_OUTCOME_LOST:
                MysteryGift_TryIncrementStat(CARD_STAT_BATTLES_LOST, gLinkPlayers[GetMultiplayerId() ^ 1].trainerId);
                break;
            }
        }
    }

    if (InUnionRoom() == TRUE)
        gMain.savedCallback = CB2_ReturnFromUnionRoomBattle;
    else
        gMain.savedCallback = CB2_ReturnToFieldFromMultiplayer;

    SetMainCallback2(CB2_SetUpSaveAfterLinkBattle);
}

void CleanupLinkRoomState(void)
{
    if (gSpecialVar_0x8004 == USING_SINGLE_BATTLE
     || gSpecialVar_0x8004 == USING_DOUBLE_BATTLE
     || gSpecialVar_0x8004 == USING_MULTI_BATTLE)
    {
        LoadPlayerParty();
        SavePlayerBag();
    }
    SetWarpDestinationToDynamicWarp(WARP_ID_DYNAMIC);
}

void ExitLinkRoom(void)
{
    QueueExitLinkRoomKey();
}

// Note: gSpecialVar_0x8005 contains the id of the seat the player entered
static void Task_EnterCableClubSeat(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    switch (task->tState)
    {
    case 0:
        ShowFieldMessage(CableClub_Text_PleaseWaitBCancel);
        task->tState = 1;
        break;
    case 1:
        if (IsFieldMessageBoxHidden())
        {
            SetInCableClubSeat();
            SetLocalLinkPlayerId(gSpecialVar_0x8005);
            task->tState = 2;
        }
        break;
    case 2:
        switch (GetCableClubPartnersReady())
        {
        case CABLE_SEAT_WAITING:
            break;
        case CABLE_SEAT_SUCCESS:
            // Partners linked and ready, switch to relevant link function
            HideFieldMessageBox();
            task->tState = 0;
            SetStartedCableClubActivity();
            SwitchTaskToFollowupFunc(taskId);
            break;
        case CABLE_SEAT_FAILED:
            task->tState = 3;
            break;
        }
        break;
    case 3:
        // Exit, failure
        SetLinkWaitingForScript();
        EraseFieldMessageBox(TRUE);
        DestroyTask(taskId);
        ScriptContext_Enable();
        break;
    }
}

static void CreateTask_EnterCableClubSeat(TaskFunc followUpFunc)
{
    u8 taskId = CreateTask(Task_EnterCableClubSeat, 80);
    SetTaskFuncWithFollowupFunc(taskId, Task_EnterCableClubSeat, followUpFunc);
    ScriptContext_Stop();
}

static void Task_StartWiredTrade(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    switch (task->tState)
    {
    case 0:
        LockPlayerFieldControls();
        FadeScreen(FADE_TO_BLACK, 0);
        ClearLinkCallback_2();
        task->tState++;
        break;
    case 1:
        if (!gPaletteFade.active)
            task->tState++;
        break;
    case 2:
        gSelectedTradeMonPositions[TRADE_PLAYER] = 0;
        gSelectedTradeMonPositions[TRADE_PARTNER] = 0;
        m4aMPlayAllStop();
        SetCloseLinkCallback();
        task->tState++;
        break;
    case 3:
        if (!gReceivedRemoteLinkPlayers)
        {
            SetMainCallback2(CB2_StartCreateTradeMenu);
            DestroyTask(taskId);
        }
        break;
    }
}

static void Task_StartWirelessTrade(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    switch (tState)
    {
    case 0:
        LockPlayerFieldControls();
        FadeScreen(FADE_TO_BLACK, 0);
        ClearLinkRfuCallback();
        tState++;
        break;
    case 1:
        if (!gPaletteFade.active)
            tState++;
        break;
    case 2:
        gSelectedTradeMonPositions[TRADE_PLAYER] = 0;
        gSelectedTradeMonPositions[TRADE_PARTNER] = 0;
        m4aMPlayAllStop();
        SetLinkStandbyCallback();
        tState++;
        break;
    case 3:
        if (IsLinkTaskFinished())
        {
            CreateTask_CreateTradeMenu();
            DestroyTask(taskId);
        }
        break;
    }
}

void EnterTradeSeat(void)
{
    if (gWirelessCommType)
        CreateTask_EnterCableClubSeat(Task_StartWirelessTrade);
    else
        CreateTask_EnterCableClubSeat(Task_StartWiredTrade);
}

static void CreateTask_StartWiredTrade(void)
{
    CreateTask(Task_StartWiredTrade, 80);
}

void StartWiredCableClubTrade(void)
{
    CreateTask_StartWiredTrade();
    ScriptContext_Stop();
}

void EnterColosseumPlayerSpot(void)
{
    gLinkType = LINKTYPE_BATTLE;
    if (gWirelessCommType)
        CreateTask_EnterCableClubSeat(Task_StartWirelessCableClubBattle);
    else
        CreateTask_EnterCableClubSeat(Task_StartWiredCableClubBattle);
}

// Unused
static void CreateTask_EnterCableClubSeatNoFollowup(void)
{
    CreateTask(Task_EnterCableClubSeat, 80);
    ScriptContext_Stop();
}

void Script_ShowLinkTrainerCard(void)
{
    ShowTrainerCardInLink(gSpecialVar_0x8006, CB2_ReturnToFieldContinueScriptPlayMapMusic);
}

bool32 GetSeeingLinkPlayerCardMsg(u8 linkPlayerIndex)
{
    u8 numStars;

    gSpecialVar_0x8006 = linkPlayerIndex;
    StringCopy(gStringVar1, gLinkPlayers[linkPlayerIndex].name);

    numStars = GetTrainerCardStars(linkPlayerIndex);
    if (numStars == 0)
        return FALSE;

    StringCopy(gStringVar2, sTrainerCardColorNames[numStars - 1]);
    return TRUE;
}

#define tTimer data[0]

void Task_WaitForLinkPlayerConnection(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    if (++task->tTimer > 300)
    {
        CloseLink();
        SetMainCallback2(CB2_LinkError);
        DestroyTask(taskId);
    }

    if (gReceivedRemoteLinkPlayers)
        DestroyTask(taskId);
}

#undef tTimer

static void Task_WaitExitToScript(u8 taskId)
{
    if (!gReceivedRemoteLinkPlayers)
    {
        ScriptContext_Enable();
        DestroyTask(taskId);
    }
}

// Unused
static void ExitLinkToScript(u8 taskId)
{
    SetCloseLinkCallback();
    gTasks[taskId].func = Task_WaitExitToScript;
}
