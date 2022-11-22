#include "global.h"
#include "gflib.h"
#include "script.h"
#include "mystery_gift.h"
#include "mystery_gift_server.h"

// Assert statements use the original GF names, which are defined below.
// Note that their name "flag" is especially misleading,
// as it's not a boolean (for example it can contain a size argument).
// 'parameter' is shortened to param explicitly to avoid a collision with
// the original name for a different field.
#define mainseqno funcId
#define func_tbl sFuncTable
#define parameter ptr
#define flag param
#define ME_SEND_BUF_SIZE MG_LINK_BUFFER_SIZE
#define FILE ABSPATH("mevent_server.c")

#define ASSERT_PTR_EMPTY(lineNum)       AGB_ASSERT_EX(cmd->parameter == NULL,                       FILE, (lineNum));
#define ASSERT_PARAM_EMPTY(lineNum)     AGB_ASSERT_EX(cmd->flag == FALSE,                           FILE, (lineNum));
#define ASSERT_PTR_PARAM_EMPTY(lineNum) AGB_ASSERT_EX(cmd->flag == FALSE && cmd->parameter == NULL, FILE, (lineNum));
#define ASSERT_VALID_FUNC(lineNum)      AGB_ASSERT_EX(svr->mainseqno < NELEMS(func_tbl),            FILE, (lineNum));
#define ASSERT_SIZE_OK(lineNum)         AGB_ASSERT_EX(size <= ME_SEND_BUF_SIZE,                     FILE, (lineNum));

enum {
    FUNC_INIT,
    FUNC_DONE,
    FUNC_RECV,
    FUNC_SEND,
    FUNC_RUN,
};

static EWRAM_DATA struct MysteryGiftServer * sServer = NULL;

static void MysteryGiftServer_Init(struct MysteryGiftServer *, const void *, u32, u32);
static void MysteryGiftServer_Free(struct MysteryGiftServer *);
static u32 MysteryGiftServer_CallFunc(struct MysteryGiftServer *);

extern const struct MysteryGiftServerCmd gMysteryGiftServerScript_SendWonderNews[];
extern const struct MysteryGiftServerCmd gMysteryGiftServerScript_SendWonderCard[];

void MysterGiftServer_CreateForNews(void)
{
    sServer = AllocZeroed(sizeof(*sServer));
    MysteryGiftServer_Init(sServer, gMysteryGiftServerScript_SendWonderNews, 0, 1);
}

void MysterGiftServer_CreateForCard(void)
{
    sServer = AllocZeroed(sizeof(*sServer));
    MysteryGiftServer_Init(sServer, gMysteryGiftServerScript_SendWonderCard, 0, 1);
}

u32 MysterGiftServer_Run(u16 * endVal)
{
    u32 result;
    if (sServer == NULL)
        return SVR_RET_END;
    result = MysteryGiftServer_CallFunc(sServer);
    if (result == SVR_RET_END)
    {
        *endVal = sServer->param;
        MysteryGiftServer_Free(sServer);
        FREE_AND_SET_NULL(sServer);
    }
    return result;
}

static void MysteryGiftServer_Init(struct MysteryGiftServer * svr, const void *script, u32 sendPlayerId, u32 recvPlayerId)
{
    svr->unused = 0;
    svr->funcId = FUNC_INIT;
    svr->card = AllocZeroed(sizeof(*svr->card));
    svr->news = AllocZeroed(sizeof(*svr->news));
    svr->recvBuffer = AllocZeroed(MG_LINK_BUFFER_SIZE);
    svr->linkGameData = AllocZeroed(sizeof(*svr->linkGameData));
    svr->script = script;
    svr->cmdidx = 0;
    MysteryGiftLink_Init(&svr->manager, sendPlayerId, recvPlayerId);
}

static void MysteryGiftServer_Free(struct MysteryGiftServer * svr)
{
    Free(svr->card);
    Free(svr->news);
    Free(svr->recvBuffer);
    Free(svr->linkGameData);
}

static void MysteryGiftServer_InitSend(struct MysteryGiftServer * svr, u32 ident, const void *src, u32 size)
{
    ASSERT_SIZE_OK(257);
    MysteryGiftLink_InitSend(&svr->manager, ident, src, size);
}

// Given the command pointer parameter and the 'default' normal data.
// If the command's pointer is not empty use that as the send data, otherwise use the default.
static const void *MysteryGiftServer_GetSendData(const void *dynamicData, const void *defaultData)
{
    if (dynamicData != NULL)
        return dynamicData;
    else
        return defaultData;
}

static u32 MysteryGiftServer_Compare(const void *a, const void *b)
{
    if (b < a)
        return 0;
    else if (b == a)
        return 1;
    else
        return 2;
}

static u32 Server_Init(struct MysteryGiftServer * svr)
{
    svr->funcId = FUNC_RUN;
    return SVR_RET_INIT;
}

static u32 Server_Done(struct MysteryGiftServer * svr)
{
    return SVR_RET_END;
}

static u32 Server_Recv(struct MysteryGiftServer * svr)
{
    if (MysteryGiftLink_Recv(&svr->manager))
        svr->funcId = FUNC_RUN;
    return SVR_RET_ACTIVE;
}

static u32 Server_Send(struct MysteryGiftServer * svr)
{
    if (MysteryGiftLink_Send(&svr->manager))
        svr->funcId = FUNC_RUN;
    return SVR_RET_ACTIVE;
}

static u32 Server_Run(struct MysteryGiftServer * svr)
{
    // process command
    const struct MysteryGiftServerCmd * cmd = &svr->script[svr->cmdidx];
    const void *ptr;
    svr->cmdidx++;

    switch (cmd->instr)
    {
    case SVR_RETURN:
        ASSERT_PTR_EMPTY(354);
        svr->funcId = FUNC_DONE;
        svr->param = cmd->param; // Set for endVal in MysteryGiftServer_Run
        break;
    case SVR_SEND:
        svr->funcId = FUNC_SEND;
        break;
    case SVR_RECV:
        ASSERT_PTR_EMPTY(364);
        MysteryGiftLink_InitRecv(&svr->manager, cmd->param, svr->recvBuffer);
        svr->funcId = FUNC_RECV;
        break;
    case SVR_GOTO:
        ASSERT_PARAM_EMPTY(370);
        svr->cmdidx = 0;
        svr->script = cmd->ptr;
        break;
    case SVR_COPY_GAME_DATA:
        ASSERT_PARAM_EMPTY(376);
        ASSERT_PTR_EMPTY(377);
        memcpy(svr->linkGameData, svr->recvBuffer, sizeof(*svr->linkGameData));
        break;
    case SVR_CHECK_GAME_DATA:
        ASSERT_PARAM_EMPTY(382);
        ASSERT_PTR_EMPTY(383);
        svr->param = MysteryGift_ValidateLinkGameData(svr->linkGameData);
        break;
    case SVR_GOTO_IF_EQ:
        if (svr->param == cmd->param)
        {
            svr->cmdidx = 0;
            svr->script = cmd->ptr;
        }
        break;
    case SVR_CHECK_EXISTING_CARD:
        ASSERT_PARAM_EMPTY(396);
        ptr = MysteryGiftServer_GetSendData(cmd->ptr, svr->card);
        svr->param = MysteryGift_CompareCardFlags(ptr, svr->linkGameData, ptr);
        break;
    case SVR_READ_RESPONSE:
        ASSERT_PARAM_EMPTY(402);
        ASSERT_PTR_EMPTY(403);
        svr->param = *(u32 *)svr->recvBuffer;
        break;
    case SVR_CHECK_EXISTING_STAMPS:
        ASSERT_PARAM_EMPTY(408);
        ptr = MysteryGiftServer_GetSendData(cmd->ptr, &svr->stamp);
        svr->param = MysteryGift_CheckStamps(ptr, svr->linkGameData, ptr);
        break;
    case SVR_GET_CARD_STAT:
        ASSERT_PTR_EMPTY(415);
        svr->param = MysteryGift_GetCardStatFromLinkData(svr->linkGameData, cmd->param);
        break;
    case SVR_CHECK_QUESTIONNAIRE:
        ASSERT_PARAM_EMPTY(420);
        svr->param = MysteryGift_DoesQuestionnaireMatch(svr->linkGameData, cmd->ptr);
        break;
    case SVR_COMPARE:
        ASSERT_PARAM_EMPTY(426);
        svr->param = MysteryGiftServer_Compare(cmd->ptr, *(void **)svr->recvBuffer);
        break;
    case SVR_LOAD_NEWS:
        ASSERT_PARAM_EMPTY(432);
        MysteryGiftServer_InitSend(svr, MG_LINKID_NEWS, MysteryGiftServer_GetSendData(cmd->ptr, svr->news), sizeof(struct WonderNews));
        break;
    case SVR_LOAD_CARD:
        ASSERT_PARAM_EMPTY(438);
        MysteryGiftServer_InitSend(svr, MG_LINKID_CARD, MysteryGiftServer_GetSendData(cmd->ptr, svr->card), sizeof(struct WonderCard));
        break;
    case SVR_LOAD_STAMP:
        ASSERT_PARAM_EMPTY(444);
        MysteryGiftServer_InitSend(svr, MG_LINKID_STAMP, MysteryGiftServer_GetSendData(cmd->ptr, &svr->stamp), sizeof(svr->stamp));
        break;
    case SVR_LOAD_RAM_SCRIPT:
        if (cmd->ptr == NULL)
            MysteryGiftServer_InitSend(svr, MG_LINKID_RAM_SCRIPT, svr->ramScript, svr->ramScriptSize);
        else
            MysteryGiftServer_InitSend(svr, MG_LINKID_RAM_SCRIPT, cmd->ptr, cmd->param);
        break;
    case SVR_LOAD_CLIENT_SCRIPT:
        if (cmd->ptr == NULL)
            MysteryGiftServer_InitSend(svr, MG_LINKID_CLIENT_SCRIPT, svr->clientScript, svr->clientScriptSize);
        else
            MysteryGiftServer_InitSend(svr, MG_LINKID_CLIENT_SCRIPT, cmd->ptr, cmd->param);
        break;
    case SVR_LOAD_EREADER_TRAINER:
        ASSERT_PARAM_EMPTY(466);
        MysteryGiftServer_InitSend(svr, MG_LINKID_EREADER_TRAINER, cmd->ptr, sizeof(struct BattleTowerEReaderTrainer));
        break;
    case SVR_LOAD_MSG:
        MysteryGiftServer_InitSend(svr, MG_LINKID_DYNAMIC_MSG, cmd->ptr, cmd->param);
        break;
    case SVR_LOAD_UNK_2:
        MysteryGiftServer_InitSend(svr, MG_LINKID_UNK_2, cmd->ptr, cmd->param);
        break;
    case SVR_COPY_CARD:
        ASSERT_PARAM_EMPTY(481);
        memcpy(svr->card, cmd->ptr, sizeof(*svr->card));
        break;
    case SVR_COPY_NEWS:
        ASSERT_PARAM_EMPTY(486);
        memcpy(svr->news, cmd->ptr, sizeof(*svr->news));
        break;
    case SVR_COPY_STAMP:
        ASSERT_PARAM_EMPTY(491);
        svr->stamp = *(u32 *)cmd->ptr;
        break;
    case SVR_SET_RAM_SCRIPT:
        svr->ramScript = cmd->ptr;
        svr->ramScriptSize = cmd->param;
        break;
    case SVR_SET_CLIENT_SCRIPT:
        svr->clientScript = cmd->ptr;
        svr->clientScriptSize = cmd->param;
        break;
    case SVR_COPY_SAVED_CARD:
        ASSERT_PTR_PARAM_EMPTY(506);
        memcpy(svr->card, GetSavedWonderCard(), sizeof(*svr->card));
        DisableWonderCardSending(svr->card);
        break;
    case SVR_COPY_SAVED_NEWS:
        ASSERT_PTR_PARAM_EMPTY(512);
        memcpy(svr->news, GetSavedWonderNews(), sizeof(*svr->news));
        break;
    case SVR_COPY_SAVED_RAM_SCRIPT:
        ASSERT_PTR_PARAM_EMPTY(517);
        svr->ramScript = GetSavedRamScriptIfValid();
        break;
    case SVR_LOAD_UNK_1:
        MysteryGiftServer_InitSend(svr, MG_LINKID_UNK_1, cmd->ptr, cmd->param);
        break;
    }

    return SVR_RET_ACTIVE;
}

static u32 (*const sFuncTable[])(struct MysteryGiftServer *) = {
    [FUNC_INIT] = Server_Init,
    [FUNC_DONE] = Server_Done,
    [FUNC_RECV] = Server_Recv,
    [FUNC_SEND] = Server_Send,
    [FUNC_RUN] = Server_Run
};

static u32 MysteryGiftServer_CallFunc(struct MysteryGiftServer * svr)
{
    u32 response;
    ASSERT_VALID_FUNC(546)
    response = sFuncTable[svr->funcId](svr);
    ASSERT_VALID_FUNC(548)
    return response;
}
