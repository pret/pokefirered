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

static EWRAM_DATA struct BerryCrushGame *gUnknown_203F3DC = NULL;

static void sub_814B860(void);
static void sub_814BA6C(void);
static void sub_814BA80(void);
static void sub_814BA98(u8 taskId);

struct BerryCrushGame *sub_814B6F0(void)
{
    return gUnknown_203F3DC;
}

u32 sub_814B6FC(MainCallback callback)
{
    if (!gUnknown_203F3DC)
        return 2;

    if (!callback)
        callback = gUnknown_203F3DC->unk0;

    DestroyTask(gUnknown_203F3DC->unkA);
    FREE_AND_SET_NULL(gUnknown_203F3DC);
    SetMainCallback2(callback);
    if (callback == CB2_ReturnToField)
    {
        PlayNewMapMusic(MUS_POKECEN);
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
        Rfu.linkman_param[0] = 0;
        Rfu.linkman_param[1] = 0;
        Rfu.errorState = 1;
        return;
    }

    playerCount = GetLinkPlayerCount();
    multiplayerId = GetMultiplayerId();
    if (playerCount < 2 || multiplayerId >= playerCount)
    {
        SetMainCallback2(callback);
        Rfu.linkman_param[0] = 0;
        Rfu.linkman_param[1] = 0;
        Rfu.errorState = 1;
        return;
    }

    gUnknown_203F3DC = AllocZeroed(sizeof(*gUnknown_203F3DC));
    if (!gUnknown_203F3DC)
    {
        SetMainCallback2(callback);
        Rfu.linkman_param[0] = 0;
        Rfu.linkman_param[1] = 0;
        Rfu.errorState = 1;
        return;
    }

    gUnknown_203F3DC->unk0 = callback;
    gUnknown_203F3DC->unk8 = multiplayerId;
    gUnknown_203F3DC->unk9 = playerCount;
    sub_814BABC(gUnknown_203F3DC);
    gUnknown_203F3DC->unk12 = 1;
    gUnknown_203F3DC->unkE = 1;
    gUnknown_203F3DC->unkF = 6;
    sub_814D564(gUnknown_203F3DC->unk36, 1, -1, 0, 16, 0, 0);
    sub_814BB4C(4, 1, gUnknown_203F3DC->unk36);
    SetMainCallback2(sub_814BA80);
    gUnknown_203F3DC->unkA = CreateTask(sub_814BA98, 8);
}

static void sub_814B860(void)
{
    if (gSpecialVar_ItemId < FIRST_BERRY_INDEX || gSpecialVar_ItemId > LAST_BERRY_INDEX + 1)
        gSpecialVar_ItemId = ITEM_CHERI_BERRY;
    else
        RemoveBagItem(gSpecialVar_ItemId, 1);

    gUnknown_203F3DC->unk68.as_four_players.others[gUnknown_203F3DC->unk8].unk0 = gSpecialVar_ItemId - FIRST_BERRY_INDEX;
    gUnknown_203F3DC->unkE = 1;
    gUnknown_203F3DC->unkF = 9;
    sub_814D564(gUnknown_203F3DC->unk36, 0, -1, 0, 16, 0, 0);
    sub_814BB4C(4, 1, gUnknown_203F3DC->unk36);
    gUnknown_203F3DC->unkA = CreateTask(sub_814BA98, 8);
    SetMainCallback2(sub_814BA80);
}

void sub_814B8F0(void)
{
    DestroyTask(gUnknown_203F3DC->unkA);
    InitBerryPouch(BERRYPOUCH_FROMBERRYCRUSH, sub_814B860, FALSE);
}

void sub_814B914(void)
{
    SetVBlankCallback(sub_814BA6C);
}

void sub_814B924(void)
{
    SetVBlankCallback(NULL);
}

void sub_814B930(void)
{
    u32 var0, var1;

    var0 = gUnknown_203F3DC->unk68.as_four_players.unk00.unk04;
    var0 <<= 8;
    var0 = sub_80D8B68(var0, 60 << 8);
    var1 = gUnknown_203F3DC->unk68.as_four_players.unk00.unk0A;
    var1 <<= 8;
    var1 = sub_80D8B68(var1, var0) & 0xFFFF;
    gUnknown_203F3DC->unk16 = var1;
    switch (gUnknown_203F3DC->unk9)
    {
    case 2:
        if (gUnknown_203F3DC->unk16 > gSaveBlock2Ptr->berryCrush.berryCrushResults[0])
        {
            gUnknown_203F3DC->unk25_1 = 1;
            gSaveBlock2Ptr->berryCrush.berryCrushResults[0] = gUnknown_203F3DC->unk16;
        }
        break;
    case 3:
        if (gUnknown_203F3DC->unk16 > gSaveBlock2Ptr->berryCrush.berryCrushResults[1])
        {
            gUnknown_203F3DC->unk25_1 = 1;
            gSaveBlock2Ptr->berryCrush.berryCrushResults[1] = gUnknown_203F3DC->unk16;
        }
        break;
    case 4:
        if (gUnknown_203F3DC->unk16 > gSaveBlock2Ptr->berryCrush.berryCrushResults[2])
        {
            gUnknown_203F3DC->unk25_1 = 1;
            gSaveBlock2Ptr->berryCrush.berryCrushResults[2] = gUnknown_203F3DC->unk16;
        }
        break;
    case 5:
        if (gUnknown_203F3DC->unk16 > gSaveBlock2Ptr->berryCrush.berryCrushResults[3])
        {
            gUnknown_203F3DC->unk25_1 = 1;
            gSaveBlock2Ptr->berryCrush.berryCrushResults[3] = gUnknown_203F3DC->unk16;
        }
        break;
    }

    gUnknown_203F3DC->unk1C = gUnknown_203F3DC->unk68.as_four_players.unk00.unk00;
    if (GiveBerryPowder(gUnknown_203F3DC->unk1C))
        return;

    gUnknown_203F3DC->unk25_0 = 1;
}

static void sub_814BA6C(void)
{
    TransferPlttBuffer();
    LoadOam();
    ProcessSpriteCopyRequests();
}

static void sub_814BA80(void)
{
    RunTasks();
    RunTextPrinters();
    AnimateSprites();
    BuildOamBuffer();
}

static void sub_814BA98(u8 taskId)
{
    if (gUnknown_203F3DC->unk4)
        gUnknown_203F3DC->unk4(gUnknown_203F3DC, gUnknown_203F3DC->unk36);

    sub_814D9CC(gUnknown_203F3DC);
}

void sub_814BABC(struct BerryCrushGame *arg0)
{
    u8 i;

    for (i = 0; i < arg0->unk9; i++)
    {
        StringCopy(PLAYER_UNK14(arg0, i), gLinkPlayers[i].name);
        arg0->unk68.as_five_players.unk1C[i].unk14[PLAYER_NAME_LENGTH] = EOS;
    }
    for (; i < 5; i++)
    {
        memset(PLAYER_UNK14(arg0, i), 1, PLAYER_NAME_LENGTH);
        arg0->unk68.as_five_players.unk1C[i].unk14[PLAYER_NAME_LENGTH] = EOS;
    }

    switch (gSaveBlock2Ptr->optionsTextSpeed)
    {
    case OPTIONS_TEXT_SPEED_SLOW:
        arg0->textSpeed = 8;
        break;
    case OPTIONS_TEXT_SPEED_MID:
        arg0->textSpeed = 4;
        break;
    case OPTIONS_TEXT_SPEED_FAST:
        arg0->textSpeed = 1;
        break;
    }
}
