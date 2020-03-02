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
#include "mevent.h"
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

u32 UnusedVarNeededToMatch[8];

static void Task_Linkup0(u8 taskId);
static void Task_Linkup1(u8 taskId);
static void Task_LinkupMaster_2(u8 taskId);
static void Task_LinkupMaster_3(u8 taskId);
static void Task_LinkupMaster_4(u8 taskId);
static void Task_LinkupMaster_5(u8 taskId);
static void Task_LinkupSlave_2(u8 taskId);
static void Task_LinkupMaster_6(u8 taskId);
static void Task_Linkup_6a(u8 taskId);
static void Task_Linkup_7(u8 taskId);
static void Task_Linkup_Canceled(u8 taskId);
static void Task_Linkup_ErroredOut(u8 taskId);
static bool8 Task_Linkup_TimedOut(u8 taskId);
static void Task_ReestablishLinkInCableClubRoom_0(u8 taskId);
static void Task_ReestablishLinkInCableClubRoom_1(u8 taskId);
static void Task_ReestablishLinkInCableClubRoom_Master(u8 taskId);
static void Task_ReestablishLinkInCableClubRoom_2(u8 taskId);

static const struct WindowTemplate gUnknown_83C6AB0 = {
    .bg = 0,
    .tilemapLeft = 16,
    .tilemapTop = 11,
    .width = 11,
    .height = 2,
    .paletteNum = 15,
    .baseBlock = 0x125
};

static const u8 *const sStarsMessagePtrs[] = {
    gUnknown_841DF8B,
    gUnknown_841DF92,
    gUnknown_841DF99,
    gUnknown_841DFA0
};

static void CreateLinkupTask(u8 lower, u8 higher)
{
    u8 taskId;
    if (FindTaskIdByFunc(Task_Linkup0) == 0xFF)
    {
        taskId = CreateTask(Task_Linkup0, 80);
        gTasks[taskId].data[1] = lower;
        gTasks[taskId].data[2] = higher;
    }
}

static void PrintNewCountOnLinkPlayerCountDisplayWindow(u16 windowId, s32 num)
{
    ConvertIntToDecimalStringN(gStringVar1, num, STR_CONV_MODE_LEFT_ALIGN, 1);
    SetStdWindowBorderStyle(windowId, FALSE);
    StringExpandPlaceholders(gStringVar4, gUnknown_841DF82);
    AddTextPrinterParameterized(windowId, 2, gStringVar4, 0, 0, TEXT_SPEED_FF, NULL);
    CopyWindowToVram(windowId, 3);
}

static void DestroyLinkPlayerCountDisplayWindow(u16 windowId)
{
    ClearStdWindowAndFrame(windowId, FALSE);
    CopyWindowToVram(windowId, 3);
}

static void UpdateLinkPlayerCountDisplay(u8 taskId, u8 num)
{
    s16 *data = gTasks[taskId].data;
    if (num != data[3])
    {
        if (num < 2)
            DestroyLinkPlayerCountDisplayWindow(data[5]);
        else
            PrintNewCountOnLinkPlayerCountDisplayWindow(data[5], num);
        data[3] = num;
    }
}

static u16 sub_8080844(u8 lower, u8 higher)
{
    switch (GetLinkPlayerDataExchangeStatusTimed(lower, higher))
    {
    case EXCHANGE_COMPLETE:
        return 1;
    case EXCHANGE_IN_PROGRESS:
        return 3;
    case EXCHANGE_STAT_4:
        return 7;
    case EXCHANGE_STAT_5:
        return 9;
    case EXCHANGE_STAT_6:
        ConvertIntToDecimalStringN(gStringVar1, GetLinkPlayerCount_2(), STR_CONV_MODE_LEFT_ALIGN, 1);
        return 4;
    default:
        return 0;
    }
}

static bool32 sub_80808BC(u8 taskId)
{
    if (HasLinkErrorOccurred() == TRUE)
    {
        gTasks[taskId].func = Task_Linkup_ErroredOut;
        return TRUE;
    }
    return FALSE;
}

static bool32 sub_80808F0(u8 taskId)
{
    if (JOY_NEW(B_BUTTON) && !IsLinkConnectionEstablished())
    {
        gLinkType = 0;
        gTasks[taskId].func = Task_Linkup_Canceled;
        return TRUE;
    }
    return FALSE;
}

static bool32 sub_808093C(u8 taskId)
{
    if (IsLinkConnectionEstablished())
    {
        SetSuppressLinkErrorMessage(TRUE);
    }
    if (JOY_NEW(B_BUTTON))
    {
        gLinkType = 0;
        gTasks[taskId].func = Task_Linkup_Canceled;
        return TRUE;
    }
    return FALSE;
}

static bool32 sub_8080990(u8 taskId)
{
    if (GetSioMultiSI() == TRUE)
    {
        gTasks[taskId].func = Task_Linkup_ErroredOut;
        return TRUE;
    }
    return FALSE;
}

static void sub_80809C4(u8 taskId)
{
    gTasks[taskId].data[0]++;
    if (gTasks[taskId].data[0] == 10)
    {
        sub_800A474(2);
        DestroyTask(taskId);
    }
}

static void Task_Linkup0(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (data[0] == 0)
    {
        OpenLinkTimed();
        sub_800AA24();
        ResetLinkPlayers();
        data[5] = AddWindow(&gUnknown_83C6AB0);
    }
    else if (data[0] > 9)
    {
        gTasks[taskId].func = Task_Linkup1;
    }
    data[0]++;
}

static void Task_Linkup1(u8 taskId)
{
    u8 linkPlayerCount = GetLinkPlayerCount_2();
    if (sub_80808F0(taskId) != TRUE && sub_808093C(taskId) != TRUE && linkPlayerCount >= 2)
    {
        SetSuppressLinkErrorMessage(TRUE);
        gTasks[taskId].data[3] = 0;
        if (IsLinkMaster() == TRUE)
        {
            PlaySE(SE_PIN);
            ShowFieldAutoScrollMessage(CableClub_Text_WhenAllPlayersReadyAConfirmBCancel);
            gTasks[taskId].func = Task_LinkupMaster_2;
        }
        else
        {
            PlaySE(SE_BOO);
            ShowFieldAutoScrollMessage(CableClub_Text_AwaitingLinkupBCancel);
            gTasks[taskId].func = Task_LinkupSlave_2;
        }
    }
}

static void Task_LinkupMaster_2(u8 taskId)
{
    if (sub_80808F0(taskId) != TRUE && sub_8080990(taskId) != TRUE && sub_80808BC(taskId) != TRUE && !textbox_any_visible())
    {
        gTasks[taskId].data[3] = 0;
        gTasks[taskId].func = Task_LinkupMaster_3;
    }
}

static void Task_LinkupMaster_3(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    s32 linkPlayerCount = GetLinkPlayerCount_2();
    if (sub_80808F0(taskId) != TRUE && sub_8080990(taskId) != TRUE && sub_80808BC(taskId) != TRUE)
    {
        UpdateLinkPlayerCountDisplay(taskId, linkPlayerCount);
        if (JOY_NEW(A_BUTTON) && linkPlayerCount >= data[1])
        {
            sub_800A900(linkPlayerCount);
            DestroyLinkPlayerCountDisplayWindow(data[5]);
            ConvertIntToDecimalStringN(gStringVar1, linkPlayerCount, STR_CONV_MODE_LEFT_ALIGN, 1);
            ShowFieldAutoScrollMessage(CableClub_Text_StartLinkWithXPlayersAConfirmBCancel);
            gTasks[taskId].func = Task_LinkupMaster_4;
        }
    }
}

static void Task_LinkupMaster_4(u8 taskId)
{
    if (sub_80808F0(taskId) != TRUE && sub_8080990(taskId) != TRUE && sub_80808BC(taskId) != TRUE && !textbox_any_visible())
    {
        if (GetSavedPlayerCount() != GetLinkPlayerCount_2())
        {
            ShowFieldAutoScrollMessage(CableClub_Text_WhenAllPlayersReadyAConfirmBCancel);
            gTasks[taskId].func = Task_LinkupMaster_2;
        }
        else if (JOY_HELD(B_BUTTON))
        {
            ShowFieldAutoScrollMessage(CableClub_Text_WhenAllPlayersReadyAConfirmBCancel);
            gTasks[taskId].func = Task_LinkupMaster_2;
        }
        else if (JOY_HELD(A_BUTTON))
        {
            PlaySE(SE_SELECT);
            CheckShouldAdvanceLinkState();
            gTasks[taskId].func = Task_LinkupMaster_5;
        }
    }
}

static void Task_LinkupMaster_5(u8 taskId)
{
    u8 lower = gTasks[taskId].data[1];
    u8 higher = gTasks[taskId].data[2];
    u16 *res;
    if (sub_80808BC(taskId) != TRUE && Task_Linkup_TimedOut(taskId) != TRUE)
    {
        if (GetLinkPlayerCount_2() != GetSavedPlayerCount())
        {
            gTasks[taskId].func = Task_Linkup_ErroredOut;
        }
        else
        {
            res = &gSpecialVar_Result;
            *res = sub_8080844(lower, higher);
            if (*res)
                gTasks[taskId].func = Task_LinkupMaster_6;
        }
    }
}

static void Task_LinkupSlave_2(u8 taskId)
{
    u8 lower = gTasks[taskId].data[1];
    u8 higher = gTasks[taskId].data[2];
    u16 *res;
    if (sub_80808F0(taskId) != TRUE && sub_80808BC(taskId) != TRUE)
    {
        res = &gSpecialVar_Result;
        *res = sub_8080844(lower, higher);
        if (*res)
        {
            if (*res == 3 || *res == 4)
            {
                Link_TryStartSend5FFF();
                HideFieldMessageBox();
                gTasks[taskId].func = Task_Linkup_7;
            }
            else if (*res == 7 || *res == 9)
            {
                CloseLink();
                HideFieldMessageBox();
                gTasks[taskId].func = Task_Linkup_7;
            }
            else
            {
                gFieldLinkPlayerCount = GetLinkPlayerCount_2();
                gLocalLinkPlayerId = GetMultiplayerId();
                sub_800A900(gFieldLinkPlayerCount);
                TrainerCard_GenerateCardForLinkPlayer((void*)gBlockSendBuffer);
                gTasks[taskId].func = Task_Linkup_6a;
            }
        }
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

static void Task_LinkupMaster_6(u8 taskId)
{
    if (sub_80808BC(taskId) != TRUE)
    {
        if (gSpecialVar_Result == 4)
        {
            if (AnyConnectedPartnersPlayingRS() == TRUE)
                CloseLink();
            else
                Link_TryStartSend5FFF();
            HideFieldMessageBox();
            gTasks[taskId].func = Task_Linkup_7;
        }
        else if (gSpecialVar_Result == 3)
        {
            Link_TryStartSend5FFF();
            HideFieldMessageBox();
            gTasks[taskId].func = Task_Linkup_7;
        }
        else if (gSpecialVar_Result == 7 || gSpecialVar_Result == 9)
        {
            CloseLink();
            HideFieldMessageBox();
            gTasks[taskId].func = Task_Linkup_7;
        }
        else
        {
            gFieldLinkPlayerCount = GetLinkPlayerCount_2();
            gLocalLinkPlayerId = GetMultiplayerId();
            sub_800A900(gFieldLinkPlayerCount);
            TrainerCard_GenerateCardForLinkPlayer((void*)gBlockSendBuffer);
            gTasks[taskId].func = Task_Linkup_6a;
            sub_800A474(2);
        }
    }
}

static void Task_Linkup_6a(u8 taskId)
{
    u8 i;
    u16 version;
    u8 * dest;
    if (sub_80808BC(taskId) != TRUE && GetBlockReceivedStatus() == sub_800A8A4())
    {
        for(i = 0; i < GetLinkPlayerCount(); i++)
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
        if (gSpecialVar_Result == 1)
        {
            // Dumb trick required to match
            if (gLinkType == LINKTYPE_0x4411)
                *UnusedVarNeededToMatch += 0;
            DestroyLinkPlayerCountDisplayWindow(gTasks[taskId].data[5]);
            EnableBothScriptContexts();
            DestroyTask(taskId);
        }
        else
        {
            Link_TryStartSend5FFF();
            gTasks[taskId].func = Task_Linkup_7;
        }
    }
}

static void Task_Linkup_7(u8 taskId)
{
    if (!gReceivedRemoteLinkPlayers)
    {
        DestroyLinkPlayerCountDisplayWindow(gTasks[taskId].data[5]);
        EnableBothScriptContexts();
        RemoveWindow(gTasks[taskId].data[5]);
        DestroyTask(taskId);
    }
}

static void Task_Linkup_Canceled(u8 taskId)
{
    gSpecialVar_Result = 5;
    DestroyLinkPlayerCountDisplayWindow(gTasks[taskId].data[5]);
    HideFieldMessageBox();
    EnableBothScriptContexts();
    DestroyTask(taskId);
}

static void Task_Linkup_ErroredOut(u8 taskId)
{
    gSpecialVar_Result = 6;
    DestroyLinkPlayerCountDisplayWindow(gTasks[taskId].data[5]);
    HideFieldMessageBox();
    EnableBothScriptContexts();
    DestroyTask(taskId);
}

static bool8 Task_Linkup_TimedOut(u8 taskId)
{
    gTasks[taskId].data[4]++;
    if (gTasks[taskId].data[4] > 600)
    {
        gTasks[taskId].func = Task_Linkup_ErroredOut;
        return TRUE;
    }
    return FALSE;
}

void TryBattleLinkup(void)
{
    u8 lower, higher;
    higher = lower = 2;
    switch (gSpecialVar_0x8004)
    {
    case USING_SINGLE_BATTLE:
        higher = lower = 2;
        gLinkType = LINKTYPE_SINGLE_BATTLE;
        break;
    case USING_DOUBLE_BATTLE:
        higher = lower = 2;
        gLinkType = LINKTYPE_DOUBLE_BATTLE;
        break;
    case USING_MULTI_BATTLE:
        higher = lower = 4;
        gLinkType = LINKTYPE_MULTI_BATTLE;
        break;
    }
    CreateLinkupTask(lower, higher);
}

void TryTradeLinkup(void)
{
    gLinkType = LINKTYPE_0x1133;
    gBattleTypeFlags = 0;
    CreateLinkupTask(2, 2);
}

void TryRecordMixLinkup(void)
{
    gSpecialVar_Result = 0;
    gLinkType = LINKTYPE_0x3311;
    gBattleTypeFlags = 0;
    CreateLinkupTask(2, 4);
}

void sub_8081128(void)
{
    gLinkType = LINKTYPE_0x6601;
    gBattleTypeFlags = 0;
    CreateLinkupTask(4, 4);
}

u8 CreateTask_ReestablishLinkInCableClubRoom(void)
{
    if (FuncIsActiveTask(Task_ReestablishLinkInCableClubRoom_0))
        return 0xFF;
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
        gLinkType = LINKTYPE_0x1111;
        break;
    case USING_RECORD_CORNER:
        gLinkType = LINKTYPE_0x3322;
        break;
    }
    return CreateTask(Task_ReestablishLinkInCableClubRoom_0, 80);
}

static void Task_ReestablishLinkInCableClubRoom_0(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    if (data[0] == 0)
    {
        OpenLink();
        ResetLinkPlayers();
        CreateTask(sub_8081A90, 80);
    }
    else if (data[0] > 9)
        gTasks[taskId].func = Task_ReestablishLinkInCableClubRoom_1;
    data[0]++;
}

static void Task_ReestablishLinkInCableClubRoom_1(u8 taskId)
{
    if (GetLinkPlayerCount_2() >= 2)
    {
        if (IsLinkMaster() == TRUE)
        {
            gTasks[taskId].func = Task_ReestablishLinkInCableClubRoom_Master;
        }
        else
        {
            gTasks[taskId].func = Task_ReestablishLinkInCableClubRoom_2;
        }
    }
}

static void Task_ReestablishLinkInCableClubRoom_Master(u8 taskId)
{
    if (GetSavedPlayerCount() == GetLinkPlayerCount_2())
    {
        CheckShouldAdvanceLinkState();
        gTasks[taskId].func = Task_ReestablishLinkInCableClubRoom_2;
    }
}

static void Task_ReestablishLinkInCableClubRoom_2(u8 taskId)
{
    if (gReceivedRemoteLinkPlayers == TRUE && IsLinkPlayerDataExchangeComplete() == TRUE)
    {
        sub_800A9A4();
        sub_8009FE8();
        DestroyTask(taskId);
    }
}

void Special_CableClub_AskSaveTheGame(void)
{
    Field_AskSaveTheGame();
}

static void Task_StartWiredCableClubBattle(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        FadeScreen(FADE_TO_BLACK, 0);
        gLinkType = LINKTYPE_BATTLE;
        ClearLinkCallback_2();
        task->data[0]++;
        break;
    case 1:
        if (!gPaletteFade.active)
            task->data[0]++;
        break;
    case 2:
        task->data[1]++;
        if (task->data[1] > 20)
            task->data[0]++;
        break;
    case 3:
        Link_TryStartSend5FFF();
        task->data[0]++;
        break;
    case 4:
        if (!gReceivedRemoteLinkPlayers)
            task->data[0]++;
        break;
    case 5:
        if (gLinkPlayers[0].trainerId & 1)
            PlayMapChosenOrBattleBGM(MUS_BATTLE32);
        else
            PlayMapChosenOrBattleBGM(MUS_BATTLE20);
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
    switch (data[0])
    {
    case 0:
        FadeScreen(FADE_TO_BLACK, 0);
        gLinkType = LINKTYPE_BATTLE;
        ClearLinkCallback_2();
        data[0] = 1;
        break;
    case 1:
        if (!gPaletteFade.active)
            data[0] = 2;
        break;
    case 2:
        SendBlock(0, &gLocalLinkPlayer, sizeof(struct LinkPlayer));
        data[0] = 3;
        break;
    case 3:
        if (GetBlockReceivedStatus() == sub_800A8D4())
        {
            for (i = 0; i < GetLinkPlayerCount(); i++)
            {
                gLinkPlayers[i] = *(struct LinkPlayer *)gBlockRecvBuffer[i];
                IntlConvertLinkPlayerName(&gLinkPlayers[i]);
                ResetBlockReceivedFlag(i);
            }
            data[0] = 4;
        }
        break;
    case 4:
        data[1]++;
        if (data[1] > 20)
            data[0] = 5;
        break;
    case 5:
        PrepareSendLinkCmd2FFE_or_RfuCmd6600();
        data[0] = 6;
        break;
    case 6:
        if (IsLinkTaskFinished())
            data[0] = 7;
        break;
    case 7:
        if (gLinkPlayers[0].trainerId & 1)
            PlayMapChosenOrBattleBGM(MUS_BATTLE32);
        else
            PlayMapChosenOrBattleBGM(MUS_BATTLE20);
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

static void sub_8081624(void)
{
    switch (gMain.state)
    {
    case 0:
        Link_TryStartSend5FFF();
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
    gBattleTypeFlags &= (u16)~BATTLE_TYPE_20;
    sub_8055DB8();
    LoadPlayerParty();
    SavePlayerBag();
    Special_UpdateTrainerFansAfterLinkBattle();
    if (gSpecialVar_0x8004 != USING_MULTI_BATTLE)
    {
        TryRecordLinkBattleOutcome(gLocalLinkPlayerId ^ 1);
        if (gWirelessCommType != 0)
        {
            switch (gBattleOutcome)
            {
            case B_OUTCOME_WON:
                MEvent_RecordIdOfWonderCardSenderByEventType(0, gLinkPlayers[GetMultiplayerId() ^ 1].trainerId);
                break;
            case B_OUTCOME_LOST:
                MEvent_RecordIdOfWonderCardSenderByEventType(1, gLinkPlayers[GetMultiplayerId() ^ 1].trainerId);
                break;
            }
        }
    }
    if (InUnionRoom() == TRUE)
    {
        gMain.savedCallback = sub_8081624;
    }
    else
    {
        gMain.savedCallback = c2_8056854;
    }
    SetMainCallback2(CB2_SetUpSaveAfterLinkBattle);
}

void CleanupLinkRoomState(void)
{
    if (gSpecialVar_0x8004 == USING_SINGLE_BATTLE || gSpecialVar_0x8004 == USING_DOUBLE_BATTLE || gSpecialVar_0x8004 == USING_MULTI_BATTLE)
    {
        LoadPlayerParty();
        SavePlayerBag();
    }
    copy_saved_warp2_bank_and_enter_x_to_warp1(127);
}

void sub_8081770(void)
{
    sub_8057F5C();
}

static void Task_EnterCableClubSeat(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        ShowFieldMessage(CableClub_Text_PleaseWaitBCancel);
        task->data[0] = 1;
        break;
    case 1:
        if (IsFieldMessageBoxHidden())
        {
            sub_8057F34();
            SetLocalLinkPlayerId(gSpecialVar_0x8005);
            task->data[0] = 2;
        }
        break;
    case 2:
        switch (sub_8057EC0())
        {
        case 0:
            break;
        case 1:
            HideFieldMessageBox();
            task->data[0] = 0;
            sub_8057F70();
            SwitchTaskToFollowupFunc(taskId);
            break;
        case 2:
            task->data[0] = 3;
            break;
        }
        break;
    case 3:
        sub_8057F48();
        sub_80F771C(TRUE);
        DestroyTask(taskId);
        EnableBothScriptContexts();
        break;
    }
}

static void CreateEnterCableClubSeatTaskWithFollowupFunc(TaskFunc followUpFunc)
{
    u8 taskId = CreateTask(Task_EnterCableClubSeat, 80);
    SetTaskFuncWithFollowupFunc(taskId, Task_EnterCableClubSeat, followUpFunc);
    ScriptContext1_Stop();
}

static void Task_StartWiredCableClubTrade(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        ScriptContext2_Enable();
        FadeScreen(FADE_TO_BLACK, 0);
        ClearLinkCallback_2();
        task->data[0]++;
        break;
    case 1:
        if (!gPaletteFade.active)
            task->data[0]++;
        break;
    case 2:
        gSelectedTradeMonPositions[0] = 0;
        gSelectedTradeMonPositions[1] = 0;
        m4aMPlayAllStop();
        Link_TryStartSend5FFF();
        task->data[0]++;
        break;
    case 3:
        if (!gReceivedRemoteLinkPlayers)
        {
            SetMainCallback2(CB2_ReturnFromLinkTrade);
            DestroyTask(taskId);
        }
        break;
    }
}

static void Task_StartWirelessCableClubTrade(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    switch (data[0])
    {
    case 0:
        ScriptContext2_Enable();
        FadeScreen(FADE_TO_BLACK, 0);
        Rfu_set_zero();
        data[0]++;
        break;
    case 1:
        if (!gPaletteFade.active)
            data[0]++;
        break;
    case 2:
        gSelectedTradeMonPositions[0] = 0;
        gSelectedTradeMonPositions[1] = 0;
        m4aMPlayAllStop();
        PrepareSendLinkCmd2FFE_or_RfuCmd6600();
        data[0]++;
        break;
    case 3:
        if (IsLinkTaskFinished())
        {
            UnionRoom_CreateTask_CallCB2ReturnFromLinkTrade();
            DestroyTask(taskId);
        }
        break;
    }
}

void EnterTradeSeat(void)
{
    if (gWirelessCommType)
        CreateEnterCableClubSeatTaskWithFollowupFunc(Task_StartWirelessCableClubTrade);
    else
        CreateEnterCableClubSeatTaskWithFollowupFunc(Task_StartWiredCableClubTrade);
}

static void CreateTask_StartWiredCableClubTrade(void)
{
    CreateTask(Task_StartWiredCableClubTrade, 80);
}

void Special_WiredCableClubTrade(void)
{
    CreateTask_StartWiredCableClubTrade();
    ScriptContext1_Stop();
}

void EnterColosseumPlayerSpot(void)
{
    gLinkType = LINKTYPE_BATTLE;
    if (gWirelessCommType)
        CreateEnterCableClubSeatTaskWithFollowupFunc(Task_StartWirelessCableClubBattle);
    else
        CreateEnterCableClubSeatTaskWithFollowupFunc(Task_StartWiredCableClubBattle);
}

static void Debug_CreateTaskEnterCableClubSeat(void)
{
    CreateTask(Task_EnterCableClubSeat, 80);
    ScriptContext1_Stop();
}

void Script_ShowLinkTrainerCard(void)
{
    ShowTrainerCardInLink(gSpecialVar_0x8006, CB2_ReturnToFieldContinueScriptPlayMapMusic);
}

bool32 GetSeeingLinkPlayerCardMsg(u8 who)
{
    u8 stars;
    gSpecialVar_0x8006 = who;
    StringCopy(gStringVar1, gLinkPlayers[who].name);
    stars = GetTrainerCardStars(who);
    if (stars == 0)
        return FALSE;
    StringCopy(gStringVar2, sStarsMessagePtrs[stars - 1]);
    return TRUE;
}

void sub_8081A90(u8 taskId)
{
    struct Task * task = &gTasks[taskId];
    task->data[0]++;
    if (task->data[0] > 300)
    {
        CloseLink();
        SetMainCallback2(CB2_LinkError);
        DestroyTask(taskId);
    }
    if (gReceivedRemoteLinkPlayers)
        DestroyTask(taskId);
}

static void sub_8081AE4(u8 taskId)
{
    if (!gReceivedRemoteLinkPlayers)
    {
        EnableBothScriptContexts();
        DestroyTask(taskId);
    }
}

static void sub_8081B08(u8 taskId)
{
    Link_TryStartSend5FFF();
    gTasks[taskId].func = sub_8081AE4;
}
