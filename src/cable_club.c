#include "global.h"
#include "gflib.h"
#include "event_data.h"
#include "event_scripts.h"
#include "field_message_box.h"
#include "link.h"
#include "overworld.h"
#include "new_menu_helpers.h"
#include "script.h"
#include "strings.h"
#include "task.h"
#include "trainer_card.h"
#include "constants/songs.h"

void sub_80809F8(u8 taskId);
void sub_8080A4C(u8 taskId);
void sub_8080AD0(u8 taskId);
void sub_8080B20(u8 taskId);
void sub_8080BC8(u8 taskId);
void sub_8080C6C(u8 taskId);
void sub_8080CDC(u8 taskId);
void sub_8080DC0(u8 taskId);
void sub_8080E6C(u8 taskId);
void sub_8080F78(u8 taskId);
void sub_8080FB4(u8 taskId);
void sub_8080FF0(u8 taskId);
bool8 sub_808102C(u8 taskId);

static const struct WindowTemplate gUnknown_83C6AB0 = {
    .bg = 0,
    .tilemapLeft = 16,
    .tilemapTop = 11,
    .width = 11,
    .height = 2,
    .paletteNum = 15,
    .baseBlock = 0x125
};

const u8 *const gUnknown_83C6AB8[] = {
    gUnknown_841DF8B,
    gUnknown_841DF92,
    gUnknown_841DF99,
    gUnknown_841DFA0
};

void sub_8080748(u8 a0, u8 a1)
{
    u8 taskId;
    if (FindTaskIdByFunc(sub_80809F8) == 0xFF)
    {
        taskId = CreateTask(sub_80809F8, 80);
        gTasks[taskId].data[1] = a0;
        gTasks[taskId].data[2] = a1;
    }
}

void sub_808078C(u16 windowId, s32 num)
{
    ConvertIntToDecimalStringN(gStringVar1, num, STR_CONV_MODE_LEFT_ALIGN, 1);
    SetStdWindowBorderStyle(windowId, FALSE);
    StringExpandPlaceholders(gStringVar4, gUnknown_841DF82);
    AddTextPrinterParameterized(windowId, 2, gStringVar4, 0, 0, TEXT_SPEED_FF, NULL);
    CopyWindowToVram(windowId, 3);
}

void sub_80807E8(u16 windowId)
{
    ClearStdWindowAndFrame(windowId, FALSE);
    CopyWindowToVram(windowId, 3);
}

void sub_8080808(u8 taskId, u8 num)
{
    s16 *data = gTasks[taskId].data;
    if (num != data[3])
    {
        if (num < 2)
            sub_80807E8(data[5]);
        else
            sub_808078C(data[5], num);
        data[3] = num;
    }
}

u16 sub_8080844(u8 lower, u8 higher)
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

bool32 sub_80808BC(u8 taskId)
{
    if (HasLinkErrorOccurred() == TRUE)
    {
        gTasks[taskId].func = sub_8080FF0;
        return TRUE;
    }
    return FALSE;
}

bool32 sub_80808F0(u8 taskId)
{
    if (JOY_NEW(B_BUTTON) && !IsLinkConnectionEstablished())
    {
        gLinkType = 0;
        gTasks[taskId].func = sub_8080FB4;
        return TRUE;
    }
    return FALSE;
}

bool32 sub_808093C(u8 taskId)
{
    if (IsLinkConnectionEstablished())
    {
        SetSuppressLinkErrorMessage(TRUE);
    }
    if (JOY_NEW(B_BUTTON))
    {
        gLinkType = 0;
        gTasks[taskId].func = sub_8080FB4;
        return TRUE;
    }
    return FALSE;
}

bool32 sub_8080990(u8 taskId)
{
    if (GetSioMultiSI() == TRUE)
    {
        gTasks[taskId].func = sub_8080FF0;
        return TRUE;
    }
    return FALSE;
}

void sub_80809C4(u8 taskId)
{
    gTasks[taskId].data[0]++;
    if (gTasks[taskId].data[0] == 10)
    {
        sub_800A474(2);
        DestroyTask(taskId);
    }
}

void sub_80809F8(u8 taskId)
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
        gTasks[taskId].func = sub_8080A4C;
    }
    data[0]++;
}

void sub_8080A4C(u8 taskId)
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
            gTasks[taskId].func = sub_8080AD0;
        }
        else
        {
            PlaySE(SE_BOO);
            ShowFieldAutoScrollMessage(CableClub_Text_AwaitingLinkupBCancel);
            gTasks[taskId].func = sub_8080CDC;
        }
    }
}

void sub_8080AD0(u8 taskId)
{
    if (sub_80808F0(taskId) != TRUE && sub_8080990(taskId) != TRUE && sub_80808BC(taskId) != TRUE && !textbox_any_visible())
    {
        gTasks[taskId].data[3] = 0;
        gTasks[taskId].func = sub_8080B20;
    }
}

void sub_8080B20(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    s32 linkPlayerCount = GetLinkPlayerCount_2();
    if (sub_80808F0(taskId) != TRUE && sub_8080990(taskId) != TRUE && sub_80808BC(taskId) != TRUE)
    {
        sub_8080808(taskId, linkPlayerCount);
        if (JOY_NEW(A_BUTTON) && linkPlayerCount >= data[1])
        {
            sub_800A900(linkPlayerCount);
            sub_80807E8(data[5]);
            ConvertIntToDecimalStringN(gStringVar1, linkPlayerCount, STR_CONV_MODE_LEFT_ALIGN, 1);
            ShowFieldAutoScrollMessage(CableClub_Text_StartLinkWithXPlayersAConfirmBCancel);
            gTasks[taskId].func = sub_8080BC8;
        }
    }
}

void sub_8080BC8(u8 taskId)
{
    if (sub_80808F0(taskId) != TRUE && sub_8080990(taskId) != TRUE && sub_80808BC(taskId) != TRUE && !textbox_any_visible())
    {
        if (GetSavedPlayerCount() != GetLinkPlayerCount_2())
        {
            ShowFieldAutoScrollMessage(CableClub_Text_WhenAllPlayersReadyAConfirmBCancel);
            gTasks[taskId].func = sub_8080AD0;
        }
        else if (JOY_HELD(B_BUTTON))
        {
            ShowFieldAutoScrollMessage(CableClub_Text_WhenAllPlayersReadyAConfirmBCancel);
            gTasks[taskId].func = sub_8080AD0;
        }
        else if (JOY_HELD(A_BUTTON))
        {
            PlaySE(SE_SELECT);
            CheckShouldAdvanceLinkState();
            gTasks[taskId].func = sub_8080C6C;
        }
    }
}

void sub_8080C6C(u8 taskId)
{
    u8 lower = gTasks[taskId].data[1];
    u8 higher = gTasks[taskId].data[2];
    u16 *res;
    if (sub_80808BC(taskId) != TRUE && sub_808102C(taskId) != TRUE)
    {
        if (GetLinkPlayerCount_2() != GetSavedPlayerCount())
        {
            gTasks[taskId].func = sub_8080FF0;
        }
        else
        {
            res = &gSpecialVar_Result;
            *res = sub_8080844(lower, higher);
            if (*res)
                gTasks[taskId].func = sub_8080DC0;
        }
    }
}

void sub_8080CDC(u8 taskId)
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
                gTasks[taskId].func = sub_8080F78;
            }
            else if (*res == 7 || *res == 9)
            {
                CloseLink();
                HideFieldMessageBox();
                gTasks[taskId].func = sub_8080F78;
            }
            else
            {
                gFieldLinkPlayerCount = GetLinkPlayerCount_2();
                gLocalLinkPlayerId = GetMultiplayerId();
                sub_800A900(gFieldLinkPlayerCount);
                TrainerCard_GenerateCardForLinkPlayer((void*)gBlockSendBuffer);
                gTasks[taskId].func = sub_8080E6C;
            }
        }
    }
}

bool32 sub_8080D8C(void)
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

void sub_8080DC0(u8 taskId)
{
    if (sub_80808BC(taskId) != TRUE)
    {
        if (gSpecialVar_Result == 4)
        {
            if (sub_8080D8C() == TRUE)
                CloseLink();
            else
                Link_TryStartSend5FFF();
            HideFieldMessageBox();
            gTasks[taskId].func = sub_8080F78;
        }
        else if (gSpecialVar_Result == 3)
        {
            Link_TryStartSend5FFF();
            HideFieldMessageBox();
            gTasks[taskId].func = sub_8080F78;
        }
        else if (gSpecialVar_Result == 7 || gSpecialVar_Result == 9)
        {
            CloseLink();
            HideFieldMessageBox();
            gTasks[taskId].func = sub_8080F78;
        }
        else
        {
            gFieldLinkPlayerCount = GetLinkPlayerCount_2();
            gLocalLinkPlayerId = GetMultiplayerId();
            sub_800A900(gFieldLinkPlayerCount);
            TrainerCard_GenerateCardForLinkPlayer((void*)gBlockSendBuffer);
            gTasks[taskId].func = sub_8080E6C;
            sub_800A474(2);
        }
    }
}

void sub_8080E6C(u8 taskId)
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
            if (gLinkType == 0x4411)
                gFieldLinkPlayerCount += 0;
            sub_80807E8(gTasks[taskId].data[5]);
            EnableBothScriptContexts();
            DestroyTask(taskId);
        }
        else
        {
            Link_TryStartSend5FFF();
            gTasks[taskId].func = sub_8080F78;
        }
    }
}
