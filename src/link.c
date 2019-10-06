#include "global.h"
#include "palette.h"
#include "bg_regs.h"
#include "gpu_regs.h"
#include "decompress.h"
#include "malloc.h"
#include "save.h"
#include "quest_log.h"
#include "link_rfu.h"
#include "librfu.h"
#include "random.h"
#include "task.h"
#include "event_data.h"
#include "string_util.h"
#include "item_menu.h"
#include "link.h"

extern u16 gHeldKeyCodeToSend;

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

#define SIO_MULTI_CNT ((struct SioMultiCnt *)REG_ADDR_SIOCNT)

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

u16 gLinkPartnersHeldKeys[6];
u32 gLinkDebugSeed;
struct LinkPlayerBlock gLocalLinkPlayerBlock;
bool8 gLinkErrorOccurred;
u32 gLinkDebugFlags;
//u32 gFiller_03003074;
bool8 gRemoteLinkPlayersNotReceived[MAX_LINK_PLAYERS];
u8 gBlockReceivedStatus[MAX_LINK_PLAYERS];
//u32 gFiller_03003080;
u16 gLinkHeldKeys;
u16 gRecvCmds[MAX_RFU_PLAYERS][CMD_LENGTH];
u32 gLinkStatus;
bool8 gUnknown_3003F24;
bool8 gUnknown_3003F28;
bool8 gUnknown_3003F2C[MAX_LINK_PLAYERS];
bool8 gUnknown_3003F30[MAX_LINK_PLAYERS];
u16 gUnknown_3003F34;
u8 gSuppressLinkErrorMessage;
bool8 gWirelessCommType;
bool8 gSavedLinkPlayerCount;
u16 gSendCmd[CMD_LENGTH];
u8 gSavedMultiplayerId;
bool8 gReceivedRemoteLinkPlayers;
struct LinkTestBGInfo gLinkTestBGInfo;
void (*gLinkCallback)(void);
u8 gShouldAdvanceLinkState;
u16 gLinkTestBlockChecksums[MAX_LINK_PLAYERS];
u8 gBlockRequestType;
//u32 gFiller_03003154;
//u32 gFiller_03003158;
//u32 gFiller_0300315c;
u8 gLastSendQueueCount;
struct Link gLink;
u8 gLastRecvQueueCount;
u16 gLinkSavedIme;
//u32 gFiller_03004138;
//u32 gFiller_0300413C;

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
void CB2_LinkTest(void);
void ProcessRecvCmds(u8 id);
void InitBlockSend(const void * src, size_t size);
u16 LinkTestCalcBlockChecksum(const u16 *src, u16 size);
void LinkTest_prnthex(u32 pos, u8 a0, u8 a1, u8 a2);
void LinkCB_RequestPlayerDataExchange(void);
void ResetBlockSend(void);
void task00_link_test(u8 taskId);
void EnableSerial(void);
void sub_800B210(void);
void sub_80F8DC0(void);
void DisableSerial(void);
void CheckErrorStatus(void);
void sub_800B284(struct LinkPlayer * linkPlayer);
void SetBlockReceivedFlag(u8 id);
void sub_800A3CC(void);

ALIGNED(4) const u16 gWirelessLinkDisplayPal[] = INCBIN_U16("graphics/interface/wireless_link_display.gbapal");
const u16 gWirelessLinkDisplay4bpp[] = INCBIN_U16("graphics/interface/wireless_link_display.4bpp.lz");
const u16 gWirelessLinkDisplayBin[] = INCBIN_U16("graphics/interface/wireless_link_display.bin.lz");
const u16 gLinkTestFontPal[] = INCBIN_U16("graphics/interface/link_test_font.gbapal");
const u16 gLinkTestFontGfx[] = INCBIN_U16("graphics/interface/link_test_font.4bpp");

const struct BlockRequest gUnknown_8234598[] = {
    {gBlockSendBuffer, 200},
    {gBlockSendBuffer, 200},
    {gBlockSendBuffer, 100},
    {gBlockSendBuffer, 220},
    {gBlockSendBuffer,  40}
};
const char gASCIIGameFreakInc[] = "GameFreak inc.";
const char gASCIITestPrint[] = "TEST PRINT\n"
                               "P0\n"
                               "P1\n"
                               "P2\n"
                               "P3";

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
    LoadPalette(gLinkTestFontPal, paletteNum * 16, 0x20);
    DmaCopy16(3, gLinkTestFontGfx, (u16 *)BG_CHAR_ADDR(charBaseBlock) + (16 * a4), sizeof gLinkTestFontGfx);
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
    LoadPalette(gLinkTestFontPal, paletteNum * 16, 0x20);
    DmaCopy16(3, gLinkTestFontGfx, (u16 *)BG_CHAR_ADDR(charBaseBlock), sizeof gLinkTestFontGfx);
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

void LinkTestProcessKeyInput(void)
{
    if (JOY_NEW(A_BUTTON))
    {
        gShouldAdvanceLinkState = 1;
    }
    if (JOY_HELD(B_BUTTON))
    {
        InitBlockSend(gHeap + 0x4000, 0x2004);
    }
    if (JOY_NEW(L_BUTTON))
    {
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(2, 0, 0));
    }
    if (JOY_NEW(START_BUTTON))
    {
        SetSuppressLinkErrorMessage(TRUE);
    }
    if (JOY_NEW(R_BUTTON))
    {
        TrySavingData(1);
    }
    if (JOY_NEW(SELECT_BUTTON))
    {
        sub_800AAC0();
    }
    if (gLinkTestDebugValuesEnabled)
    {
        SetLinkDebugValues(gMain.vblankCounter2, gLinkCallback ? gLinkVSyncDisabled : gLinkVSyncDisabled | 0x10);
    }
}

void CB2_LinkTest(void)
{
    LinkTestProcessKeyInput();
    TestBlockTransfer(1, 1, 0);
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

u16 LinkMain2(const u16 *heldKeys)
{
    u8 i;

    if (!gLinkOpen)
    {
        return 0;
    }
    for (i = 0; i < 8; i++)
    {
        gSendCmd[i] = 0;
    }
    gLinkHeldKeys = *heldKeys;
    if (gLinkStatus & LINK_STAT_CONN_ESTABLISHED)
    {
        ProcessRecvCmds(SIO_MULTI_CNT->id);
        if (gLinkCallback != NULL)
        {
            gLinkCallback();
        }
        CheckErrorStatus();
    }
    return gLinkStatus;
}

void HandleReceiveRemoteLinkPlayer(u8 who)
{
    int i;
    int count;

    count = 0;
    gRemoteLinkPlayersNotReceived[who] = FALSE;
    for (i = 0; i < GetLinkPlayerCount_2(); i++)
    {
        count += gRemoteLinkPlayersNotReceived[i];
    }
    if (count == 0 && gReceivedRemoteLinkPlayers == 0)
    {
        gReceivedRemoteLinkPlayers = 1;
    }
}

void ProcessRecvCmds(u8 unused)
{
    u16 i;

    for (i = 0; i < MAX_LINK_PLAYERS; i++)
    {
        gLinkPartnersHeldKeys[i] = 0;
        if (gRecvCmds[i][0] == 0)
        {
            continue;
        }
        switch (gRecvCmds[i][0])
        {
        case LINKCMD_SEND_LINK_TYPE:
        {
            struct LinkPlayerBlock *block;

            InitLocalLinkPlayer();
            block = &gLocalLinkPlayerBlock;
            block->linkPlayer = gLocalLinkPlayer;
            memcpy(block->magic1, gASCIIGameFreakInc, sizeof(block->magic1) - 1);
            memcpy(block->magic2, gASCIIGameFreakInc, sizeof(block->magic2) - 1);
            InitBlockSend(block, sizeof(*block));
            break;
        }
        case LINKCMD_SEND_HELD_KEYS:
            gLinkPartnersHeldKeys[i] = gRecvCmds[i][1];
            break;
        case LINKCMD_0x5555:
            gUnknown_3003F28 = TRUE;
            break;
        case LINKCMD_0x5566:
            gUnknown_3003F28 = TRUE;
            break;
        case LINKCMD_INIT_BLOCK:
        {
            struct BlockTransfer *blockRecv;

            blockRecv = &sBlockRecv[i];
            blockRecv->pos = 0;
            blockRecv->size = gRecvCmds[i][1];
            blockRecv->multiplayerId = gRecvCmds[i][2];
            break;
        }
        case LINKCMD_CONT_BLOCK:
        {
            if (sBlockRecv[i].size > BLOCK_BUFFER_SIZE)
            {
                u16 *buffer;
                u16 j;

                buffer = (u16 *)gDecompressionBuffer;
                for (j = 0; j < CMD_LENGTH - 1; j++)
                {
                    buffer[(sBlockRecv[i].pos / 2) + j] = gRecvCmds[i][j + 1];
                }
            }
            else
            {
                u16 j;

                for (j = 0; j < CMD_LENGTH - 1; j++)
                {
                    gBlockRecvBuffer[i][(sBlockRecv[i].pos / 2) + j] = gRecvCmds[i][j + 1];
                }
            }

            sBlockRecv[i].pos += (CMD_LENGTH - 1) * 2;

            if (sBlockRecv[i].pos >= sBlockRecv[i].size)
            {
                if (gRemoteLinkPlayersNotReceived[i] == TRUE)
                {
                    struct LinkPlayerBlock *block;
                    struct LinkPlayer *linkPlayer;

                    block = (struct LinkPlayerBlock *)&gBlockRecvBuffer[i];
                    linkPlayer = &gLinkPlayers[i];
                    *linkPlayer = block->linkPlayer;
                    if ((linkPlayer->version & 0xFF) == VERSION_RUBY || (linkPlayer->version & 0xFF) == VERSION_SAPPHIRE)
                    {
                        linkPlayer->name[10] = 0;
                        linkPlayer->name[9] = 0;
                        linkPlayer->name[8] = 0;
                    }
                    sub_800B284(linkPlayer);
                    if (strcmp(block->magic1, gASCIIGameFreakInc) != 0
                        || strcmp(block->magic2, gASCIIGameFreakInc) != 0)
                    {
                        SetMainCallback2(CB2_LinkError);
                    }
                    else
                    {
                        HandleReceiveRemoteLinkPlayer(i);
                    }
                }
                else
                {
                    SetBlockReceivedFlag(i);
                }
            }
        }
            break;
        case LINKCMD_0x5FFF:
            gUnknown_3003F30[i] = TRUE;
            break;
        case LINKCMD_0x2FFE:
            gUnknown_3003F2C[i] = TRUE;
            break;
        case LINKCMD_0xAAAA:
            sub_800A3CC();
            break;
        case LINKCMD_0xCCCC:
            SendBlock(0, gUnknown_8234598[gRecvCmds[i][1]].address, gUnknown_8234598[gRecvCmds[i][1]].size);
            break;
        case LINKCMD_SEND_HELD_KEYS_2:
            gLinkPartnersHeldKeys[i] = gRecvCmds[i][1];
            break;
        }
    }
}

void BuildSendCmd(u16 command)
{
    switch (command)
    {
    case LINKCMD_SEND_LINK_TYPE:
        gSendCmd[0] = LINKCMD_SEND_LINK_TYPE;
        gSendCmd[1] = gLinkType;
        break;
    case LINKCMD_0x2FFE:
        gSendCmd[0] = LINKCMD_0x2FFE;
        break;
    case LINKCMD_SEND_HELD_KEYS:
        gSendCmd[0] = LINKCMD_SEND_HELD_KEYS;
        gSendCmd[1] = gMain.heldKeys;
        break;
    case LINKCMD_0x5555:
        gSendCmd[0] = LINKCMD_0x5555;
        break;
    case LINKCMD_0x6666:
        gSendCmd[0] = LINKCMD_0x6666;
        gSendCmd[1] = 0;
        break;
    case LINKCMD_0x7777:
    {
        u8 i;

        gSendCmd[0] = LINKCMD_0x7777;
        for (i = 0; i < 5; i++)
        {
            gSendCmd[i + 1] = 0xEE;
        }
        break;
    }
    case LINKCMD_INIT_BLOCK:
        gSendCmd[0] = LINKCMD_INIT_BLOCK;
        gSendCmd[1] = sBlockSend.size;
        gSendCmd[2] = sBlockSend.multiplayerId + 0x80;
        break;
    case LINKCMD_0xAAAA:
        gSendCmd[0] = LINKCMD_0xAAAA;
        break;
    case LINKCMD_0xAAAB:
        gSendCmd[0] = LINKCMD_0xAAAB;
        gSendCmd[1] = gSpecialVar_ItemId;
        break;
    case LINKCMD_0xCCCC:
        gSendCmd[0] = LINKCMD_0xCCCC;
        gSendCmd[1] = gBlockRequestType;
        break;
    case LINKCMD_0x5FFF:
        gSendCmd[0] = LINKCMD_0x5FFF;
        gSendCmd[1] = gUnknown_3003F34;
        break;
    case LINKCMD_0x5566:
        gSendCmd[0] = LINKCMD_0x5566;
        break;
    case LINKCMD_SEND_HELD_KEYS_2:
        if (gHeldKeyCodeToSend == 0 || gLinkTransferringData)
        {
            break;
        }
        gSendCmd[0] = LINKCMD_SEND_HELD_KEYS_2;
        gSendCmd[1] = gHeldKeyCodeToSend;
        break;
    }
}
