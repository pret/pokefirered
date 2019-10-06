#include "global.h"
#include "palette.h"
#include "gpu_regs.h"
#include "link.h"
#include "quest_log.h"
#include "link_rfu.h"
#include "librfu.h"
#include "random.h"
#include "task.h"
#include "event_data.h"
#include "string_util.h"

struct BlockTransfer
{
    u16 pos;
    u16 size;
    const u8 *src;
    bool8 active;
    u8 multiplayerId;
};

struct LinkTestBGInfo
{
    u32 screenBaseBlock;
    u32 paletteNum;
    u32 dummy_8;
    u32 dummy_C;
};

#define static __attribute__((section(".bss")))
static struct BlockTransfer sBlockSend;
ALIGNED(8) static struct BlockTransfer sBlockRecv[MAX_LINK_PLAYERS];
static u32 sBlockSendDelayCounter;
static u32 gUnknown_3000E4C;
static u8 gUnknown_3000E50;
static u32 sPlayerDataExchangeStatus;
static u32 gUnknown_3000E58;
static u8 sLinkTestLastBlockSendPos;
ALIGNED(8) static u8 sLinkTestLastBlockRecvPos[MAX_LINK_PLAYERS];
static u8 sNumVBlanksWithoutSerialIntr;
static bool8 sSendBufferEmpty;
static u16 sSendNonzeroCheck;
static u16 sRecvNonzeroCheck;
static u8 sChecksumAvailable;
static u8 sHandshakePlayerCount;
#undef static

struct LinkTestBGInfo gLinkTestBGInfo;
bool8 gLinkErrorOccurred;
bool8 gSuppressLinkErrorMessage;
void (*gLinkCallback)(void);
bool8 gUnknown_3003F28;
bool8 gUnknown_3003F24;
u16 gUnknown_3003F34;
u8 gRemoteLinkPlayersNotReceived[MAX_LINK_PLAYERS];
u8 gUnknown_3003F30[MAX_LINK_PLAYERS];
u8 gUnknown_3003F2C[MAX_LINK_PLAYERS];
u16 gLinkTestBlockChecksums[MAX_LINK_PLAYERS];

EWRAM_DATA bool8 gLinkTestDebugValuesEnabled = FALSE;
EWRAM_DATA bool8 gUnknown_2022111 = FALSE;
EWRAM_DATA u32 gUnknown_2022114 = 0;
EWRAM_DATA u16 gBlockRecvBuffer[MAX_RFU_PLAYERS][BLOCK_BUFFER_SIZE / 2] = {};
EWRAM_DATA u8 gBlockSendBuffer[BLOCK_BUFFER_SIZE] = {};
EWRAM_DATA bool8 gLinkOpen = FALSE;
EWRAM_DATA u16 gLinkType = 0;
EWRAM_DATA u16 gLinkTimeOutCounter = 0;
EWRAM_DATA struct LinkPlayer gLocalLinkPlayer = {};
EWRAM_DATA struct LinkPlayer gLinkPlayers[MAX_RFU_PLAYERS] = {};
EWRAM_DATA struct LinkPlayer gSavedLinkPlayers[MAX_RFU_PLAYERS] = {};
EWRAM_DATA struct {
    u32 status;
    u8 lastRecvQueueCount;
    u8 lastSendQueueCount;
    u8 unk_06;
} sLinkErrorBuffer = {};
EWRAM_DATA u16 gUnknown_202285C = 0;
EWRAM_DATA void *gUnknown_2022860 = NULL;

void InitLocalLinkPlayer(void);
void sub_800978C(void);
u16 LinkTestCalcBlockChecksum(const u16 *src, u16 size);
void LinkTest_prnthex(u32 pos, u8 a0, u8 a1, u8 a2);
void LinkCB_RequestPlayerDataExchange(void);
void ResetBlockSend(void);
void task00_link_test(u8 taskId);
void CB2_LinkTest(void);
void EnableSerial(void);
void sub_800B210(void);
void sub_80F8DC0(void);
void DisableSerial(void);

extern const u16 gLinkTestDigitsPal[0x20];
extern const u16 gLinkTestDigitsGfx[0x1000];
extern const u8 gBGControlRegOffsets[];

bool8 IsWirelessAdapterConnected(void)
{
    if (gUnknown_203ADFA == 2 || gUnknown_203ADFA == 3)
        return FALSE;

    sub_800B1F4();
    sub_80F86F4();
    sub_80FB128(1);
    if (sub_80FD3A4() == 0x8001)
    {
        rfu_REQ_stopMode();
        rfu_waitREQComplete();
        return TRUE;
    }
    sub_800B210();
    CloseLink();
    RestoreSerialTimer3IntrHandlers();
    return FALSE;
}

void Task_DestroySelf(u8 taskId)
{
    DestroyTask(taskId);
}

void InitLinkTestBG(u8 paletteNum, u8 bgNum, u8 screenBaseBlock, u8 charBaseBlock, u16 a4)
{
    LoadPalette(gLinkTestDigitsPal, paletteNum * 16, 0x20);
    DmaCopy16(3, gLinkTestDigitsGfx, (u16 *)BG_CHAR_ADDR(charBaseBlock) + (16 * a4), sizeof gLinkTestDigitsGfx);
    gLinkTestBGInfo.screenBaseBlock = screenBaseBlock;
    gLinkTestBGInfo.paletteNum = paletteNum;
    gLinkTestBGInfo.dummy_8 = a4;
    switch (bgNum)
    {
    case 1:
        SetGpuReg(REG_OFFSET_BG1CNT, BGCNT_SCREENBASE(screenBaseBlock) | BGCNT_PRIORITY(1) | BGCNT_CHARBASE(charBaseBlock));
        break;
    case 2:
        SetGpuReg(REG_OFFSET_BG2CNT, BGCNT_SCREENBASE(screenBaseBlock) | BGCNT_PRIORITY(1) | BGCNT_CHARBASE(charBaseBlock));
        break;
    case 3:
        SetGpuReg(REG_OFFSET_BG3CNT, BGCNT_SCREENBASE(screenBaseBlock) | BGCNT_PRIORITY(1) | BGCNT_CHARBASE(charBaseBlock));
        break;
    }
    SetGpuReg(REG_OFFSET_BG0HOFS + bgNum * 4, 0);
    SetGpuReg(REG_OFFSET_BG0VOFS + bgNum * 4, 0);
}

void sub_80095BC(u8 paletteNum, u8 bgNum, u8 screenBaseBlock, u8 charBaseBlock)
{
    LoadPalette(gLinkTestDigitsPal, paletteNum * 16, 0x20);
    DmaCopy16(3, gLinkTestDigitsGfx, (u16 *)BG_CHAR_ADDR(charBaseBlock), sizeof gLinkTestDigitsGfx);
    gLinkTestBGInfo.screenBaseBlock = screenBaseBlock;
    gLinkTestBGInfo.paletteNum = paletteNum;
    gLinkTestBGInfo.dummy_8 = 0;
    SetGpuReg(gBGControlRegOffsets[bgNum], BGCNT_SCREENBASE(screenBaseBlock) | BGCNT_CHARBASE(charBaseBlock));
}

void LinkTestScreen(void)
{
    int i;

    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
    SetVBlankCallback(sub_800978C);
    ResetBlockSend();
    gLinkType = 0x1111;
    OpenLink();
    SeedRng(gMain.vblankCounter2);
    for (i = 0; i < MAX_LINK_PLAYERS; i++)
    {
        gSaveBlock2Ptr->playerTrainerId[i] = Random() % 256;
    }
    InitLinkTestBG(0, 2, 4, 0, 0);
    SetGpuReg(REG_OFFSET_DISPCNT, DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_ON);
    CreateTask(Task_DestroySelf, 0);
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    gUnknown_3000E58 = 0;
    InitLocalLinkPlayer();
    CreateTask(task00_link_test, 0);
    SetMainCallback2(CB2_LinkTest);
}

void SetLocalLinkPlayerId(u8 playerId)
{
    gLocalLinkPlayer.id = playerId;
}

void InitLocalLinkPlayer(void)
{
    gLocalLinkPlayer.trainerId = gSaveBlock2Ptr->playerTrainerId[0] | (gSaveBlock2Ptr->playerTrainerId[1] << 8) | (gSaveBlock2Ptr->playerTrainerId[2] << 16) | (gSaveBlock2Ptr->playerTrainerId[3] << 24);
    StringCopy(gLocalLinkPlayer.name, gSaveBlock2Ptr->playerName);
    gLocalLinkPlayer.gender = gSaveBlock2Ptr->playerGender;
    gLocalLinkPlayer.linkType = gLinkType;
    gLocalLinkPlayer.language = gGameLanguage;
    gLocalLinkPlayer.version = gGameVersion + 0x4000;
    gLocalLinkPlayer.lp_field_2 = 0x8000;
    gLocalLinkPlayer.name[8] = IsNationalPokedexEnabled();
    if (FlagGet(FLAG_0x844))
    {
        gLocalLinkPlayer.name[8] |= 0x10;
    }
}

void sub_800978C(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void InitLink(void)
{
    int i;

    for (i = 0; i < 8; i++)
    {
        gSendCmd[i] = 0xEFFF;
    }
    gLinkOpen = TRUE;
    EnableSerial();
}

void Task_TriggerHandshake(u8 taskId)
{
    if (++gTasks[taskId].data[0] == 5)
    {
        gShouldAdvanceLinkState = 1;
        DestroyTask(taskId);
    }
}

void OpenLink(void)
{
    int i;

    if (!gWirelessCommType)
    {
        ResetSerial();
        InitLink();
        gLinkCallback = LinkCB_RequestPlayerDataExchange;
        gLinkVSyncDisabled = FALSE;
        gLinkErrorOccurred = FALSE;
        gSuppressLinkErrorMessage = FALSE;
        ResetBlockReceivedFlags();
        ResetBlockSend();
        gUnknown_3000E4C = 0;
        gUnknown_3003F28 = FALSE;
        gUnknown_3003F24 = FALSE;
        gUnknown_3003F34 = 0;
        CreateTask(Task_TriggerHandshake, 2);
    }
    else
    {
        sub_80F86F4();
    }
    gReceivedRemoteLinkPlayers = 0;
    for (i = 0; i < MAX_LINK_PLAYERS; i++)
    {
        gRemoteLinkPlayersNotReceived[i] = TRUE;
        gUnknown_3003F30[i] = FALSE;
        gUnknown_3003F2C[i] = FALSE;
    }
}

void CloseLink(void)
{
    gReceivedRemoteLinkPlayers = FALSE;
    if (gWirelessCommType)
    {
        sub_80F8DC0();
    }
    gLinkOpen = FALSE;
    DisableSerial();
}

void TestBlockTransfer(u8 nothing, u8 is, u8 used)
{
    u8 i;
    u8 status;

    if (sLinkTestLastBlockSendPos != sBlockSend.pos)
    {
        LinkTest_prnthex(sBlockSend.pos, 2, 3, 2);
        sLinkTestLastBlockSendPos = sBlockSend.pos;
    }
    for (i = 0; i < MAX_LINK_PLAYERS; i++)
    {
        if (sLinkTestLastBlockRecvPos[i] != sBlockRecv[i].pos)
        {
            LinkTest_prnthex(sBlockRecv[i].pos, 2, i + 4, 2);
            sLinkTestLastBlockRecvPos[i] = sBlockRecv[i].pos;
        }
    }
    status = GetBlockReceivedStatus();
    if (status == 0xF) // 0b1111
    {
        for (i = 0; i < MAX_LINK_PLAYERS; i++)
        {
            if ((status >> i) & 1)
            {
                gLinkTestBlockChecksums[i] = LinkTestCalcBlockChecksum(gBlockRecvBuffer[i], sBlockRecv[i].size);
                ResetBlockReceivedFlag(i);
                if (gLinkTestBlockChecksums[i] != 0x0342)
                {
                    gLinkTestDebugValuesEnabled = FALSE;
                    gUnknown_2022111 = FALSE;
                }
            }
        }
    }
}

