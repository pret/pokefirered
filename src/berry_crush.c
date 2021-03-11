#include "global.h"
#include "gflib.h"
#include "berry_crush.h"
#include "berry_pouch.h"
#include "berry_powder.h"
#include "item.h"
#include "item_menu.h"
#include "link.h"
#include "link_rfu.h"
#include "math_util.h"
#include "overworld.h"
#include "task.h"
#include "constants/songs.h"
#include "constants/items.h"

static EWRAM_DATA struct BerryCrushGame *sBerryCrushGamePtr = NULL;

static void BerryCrush_InitPlayerNamesAndTextSpeed(struct BerryCrushGame *game);
static void CB2_ReturnToBerryCrushGameFromBerryPouch(void);
static void VBlankCB(void);
static void MainCB(void);
static void Task_RunBerryCrushGame(u8 taskId);

struct BerryCrushGame *GetBerryCrushGame(void)
{
    return sBerryCrushGamePtr;
}

u32 ExitBerryCrushWithCallback(MainCallback callback)
{
    if (!sBerryCrushGamePtr)
        return 2;

    if (!callback)
        callback = sBerryCrushGamePtr->savedCallback;

    DestroyTask(sBerryCrushGamePtr->taskId);
    FREE_AND_SET_NULL(sBerryCrushGamePtr);
    SetMainCallback2(callback);
    if (callback == CB2_ReturnToField)
    {
        PlayNewMapMusic(MUS_POKE_CENTER);
        SetMainCallback1(CB1_Overworld);
    }

    return 0;
}

void StartBerryCrush(MainCallback callback)
{
    u8 playerCount = 0;
    u8 multiplayerId;

    if (!gReceivedRemoteLinkPlayers || gWirelessCommType == 0)
    {
        SetMainCallback2(callback);
        Rfu.linkmanCmdId = 0;
        Rfu.linkmanCmdResult = 0;
        Rfu.errorState = 1;
        return;
    }

    playerCount = GetLinkPlayerCount();
    multiplayerId = GetMultiplayerId();
    if (playerCount < 2 || multiplayerId >= playerCount)
    {
        SetMainCallback2(callback);
        Rfu.linkmanCmdId = 0;
        Rfu.linkmanCmdResult = 0;
        Rfu.errorState = 1;
        return;
    }

    sBerryCrushGamePtr = AllocZeroed(sizeof(struct BerryCrushGame));
    if (!sBerryCrushGamePtr)
    {
        SetMainCallback2(callback);
        Rfu.linkmanCmdId = 0;
        Rfu.linkmanCmdResult = 0;
        Rfu.errorState = 1;
        return;
    }

    sBerryCrushGamePtr->savedCallback = callback;
    sBerryCrushGamePtr->localId = multiplayerId;
    sBerryCrushGamePtr->playerCount = playerCount;
    BerryCrush_InitPlayerNamesAndTextSpeed(sBerryCrushGamePtr);
    sBerryCrushGamePtr->gameState = 1;
    sBerryCrushGamePtr->nextCmd = BCCMD_BeginNormalPaletteFade;
    sBerryCrushGamePtr->afterPalFadeCmd = BCCMD_SignalReadyToBegin;
    BerryCrush_SetPaletteFadeParams(sBerryCrushGamePtr->commandParams, TRUE, 0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
    BerryCrush_RunOrScheduleCommand(BCCMD_InitGfx, 1, sBerryCrushGamePtr->commandParams);
    SetMainCallback2(MainCB);
    sBerryCrushGamePtr->taskId = CreateTask(Task_RunBerryCrushGame, 8);
}

static void CB2_ReturnToBerryCrushGameFromBerryPouch(void)
{
    if (gSpecialVar_ItemId < FIRST_BERRY_INDEX || gSpecialVar_ItemId > LAST_BERRY_INDEX + 1)
        gSpecialVar_ItemId = ITEM_CHERI_BERRY;
    else
        RemoveBagItem(gSpecialVar_ItemId, 1);

    sBerryCrushGamePtr->unk98[sBerryCrushGamePtr->localId].berryId = gSpecialVar_ItemId - FIRST_BERRY_INDEX;
    sBerryCrushGamePtr->nextCmd = BCCMD_BeginNormalPaletteFade;
    sBerryCrushGamePtr->afterPalFadeCmd = BCCMD_WaitForOthersToPickBerries;
    BerryCrush_SetPaletteFadeParams(sBerryCrushGamePtr->commandParams, FALSE, 0xFFFFFFFF, 0, 16, 0, RGB_BLACK);
    BerryCrush_RunOrScheduleCommand(BCCMD_InitGfx, 1, sBerryCrushGamePtr->commandParams);
    sBerryCrushGamePtr->taskId = CreateTask(Task_RunBerryCrushGame, 8);
    SetMainCallback2(MainCB);
}

void CB2_BerryCrush_GoToBerryPouch(void)
{
    DestroyTask(sBerryCrushGamePtr->taskId);
    InitBerryPouch(BERRYPOUCH_FROMBERRYCRUSH, CB2_ReturnToBerryCrushGameFromBerryPouch, FALSE);
}

void BerryCrush_SetVBlankCallback(void)
{
    SetVBlankCallback(VBlankCB);
}

void BerryCrush_UnsetVBlankCallback(void)
{
    SetVBlankCallback(NULL);
}

void BerryCrush_UpdateSav2Records(void)
{
    u32 var0, var1;

    // unk0A / (unk04 / 60)
    var0 = sBerryCrushGamePtr->unk68.time;
    var0 <<= 8;
    var0 = MathUtil_Div32(var0, 60 << 8);
    var1 = sBerryCrushGamePtr->unk68.unk0A;
    var1 <<= 8;
    var1 = MathUtil_Div32(var1, var0) & 0xFFFF;
    sBerryCrushGamePtr->pressingSpeed = var1;
    switch (sBerryCrushGamePtr->playerCount)
    {
    case 2:
        if (sBerryCrushGamePtr->pressingSpeed > gSaveBlock2Ptr->berryCrush.berryCrushResults[0])
        {
            sBerryCrushGamePtr->unk25_1 = 1;
            gSaveBlock2Ptr->berryCrush.berryCrushResults[0] = sBerryCrushGamePtr->pressingSpeed;
        }
        break;
    case 3:
        if (sBerryCrushGamePtr->pressingSpeed > gSaveBlock2Ptr->berryCrush.berryCrushResults[1])
        {
            sBerryCrushGamePtr->unk25_1 = 1;
            gSaveBlock2Ptr->berryCrush.berryCrushResults[1] = sBerryCrushGamePtr->pressingSpeed;
        }
        break;
    case 4:
        if (sBerryCrushGamePtr->pressingSpeed > gSaveBlock2Ptr->berryCrush.berryCrushResults[2])
        {
            sBerryCrushGamePtr->unk25_1 = 1;
            gSaveBlock2Ptr->berryCrush.berryCrushResults[2] = sBerryCrushGamePtr->pressingSpeed;
        }
        break;
    case 5:
        if (sBerryCrushGamePtr->pressingSpeed > gSaveBlock2Ptr->berryCrush.berryCrushResults[3])
        {
            sBerryCrushGamePtr->unk25_1 = 1;
            gSaveBlock2Ptr->berryCrush.berryCrushResults[3] = sBerryCrushGamePtr->pressingSpeed;
        }
        break;
    }

    sBerryCrushGamePtr->powder = sBerryCrushGamePtr->unk68.powder;
    if (!GiveBerryPowder(sBerryCrushGamePtr->powder))
        sBerryCrushGamePtr->unk25_0 = 1;
}

static void VBlankCB(void)
{
    TransferPlttBuffer();
    LoadOam();
    ProcessSpriteCopyRequests();
}

static void MainCB(void)
{
    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
}

static void Task_RunBerryCrushGame(u8 taskId)
{
    if (sBerryCrushGamePtr->cmdCallback != NULL)
        sBerryCrushGamePtr->cmdCallback(sBerryCrushGamePtr, sBerryCrushGamePtr->commandParams);

    sub_814D9CC(sBerryCrushGamePtr);
}

void BerryCrush_InitPlayerNamesAndTextSpeed(struct BerryCrushGame *game)
{
    u8 i;

    for (i = 0; i < game->playerCount; i++)
    {
        StringCopy(BERRYCRUSH_PLAYER_NAME(game, i), gLinkPlayers[i].name);
        game->unk98[i].name[PLAYER_NAME_LENGTH] = EOS;
    }
    for (; i < 5; i++)
    {
        memset(BERRYCRUSH_PLAYER_NAME(game, i), 1, PLAYER_NAME_LENGTH);
        game->unk98[i].name[PLAYER_NAME_LENGTH] = EOS;
    }

    switch (gSaveBlock2Ptr->optionsTextSpeed)
    {
    case OPTIONS_TEXT_SPEED_SLOW:
        game->textSpeed = 8;
        break;
    case OPTIONS_TEXT_SPEED_MID:
        game->textSpeed = 4;
        break;
    case OPTIONS_TEXT_SPEED_FAST:
        game->textSpeed = 1;
        break;
    }
}
