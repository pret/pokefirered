#include "global.h"
#include "gflib.h"
#include "script.h"
#include "mystery_gift.h"
#include "mystery_gift_server.h"

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
    svr->recvBuffer = AllocZeroed(ME_SEND_BUF_SIZE);
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
    AGB_ASSERT_EX(size <= ME_SEND_BUF_SIZE, ABSPATH("mevent_server.c"), 257);
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
        AGB_ASSERT_EX(cmd->parameter == NULL, ABSPATH("mevent_server.c"), 354);
        svr->funcId = FUNC_DONE;
        svr->param = cmd->flag; // Set for endVal in MysteryGiftServer_Run
        break;
    case SVR_SEND:
        svr->funcId = FUNC_SEND;
        break;
    case SVR_RECV:
        AGB_ASSERT_EX(cmd->parameter == NULL, ABSPATH("mevent_server.c"), 364);
        MysteryGiftLink_InitRecv(&svr->manager, cmd->flag, svr->recvBuffer);
        svr->funcId = FUNC_RECV;
        break;
    case SVR_GOTO:
        AGB_ASSERT_EX(cmd->flag == FALSE, ABSPATH("mevent_server.c"), 370);
        svr->cmdidx = 0;
        svr->script = cmd->parameter;
        break;
    case SVR_COPY_GAME_DATA:
        AGB_ASSERT_EX(cmd->flag == FALSE, ABSPATH("mevent_server.c"), 376);
        AGB_ASSERT_EX(cmd->parameter == NULL, ABSPATH("mevent_server.c"), 377);
        memcpy(svr->linkGameData, svr->recvBuffer, sizeof(*svr->linkGameData));
        break;
    case SVR_CHECK_GAME_DATA:
        AGB_ASSERT_EX(cmd->flag == FALSE, ABSPATH("mevent_server.c"), 382);
        AGB_ASSERT_EX(cmd->parameter == NULL, ABSPATH("mevent_server.c"), 383);
        svr->param = MysteryGift_ValidateLinkGameData(svr->linkGameData);
        break;
    case SVR_GOTO_IF_EQ:
        if (svr->param == cmd->flag)
        {
            svr->cmdidx = 0;
            svr->script = cmd->parameter;
        }
        break;
    case SVR_CHECK_EXISTING_CARD:
        AGB_ASSERT_EX(cmd->flag == FALSE, ABSPATH("mevent_server.c"), 396);
        ptr = MysteryGiftServer_GetSendData(cmd->parameter, svr->card);
        svr->param = MysteryGift_CompareCardFlags(ptr, svr->linkGameData, ptr);
        break;
    case SVR_READ_RESPONSE:
        AGB_ASSERT_EX(cmd->flag == FALSE, ABSPATH("mevent_server.c"), 402);
        AGB_ASSERT_EX(cmd->parameter == NULL, ABSPATH("mevent_server.c"), 403);
        svr->param = *(u32 *)svr->recvBuffer;
        break;
    case SVR_CHECK_EXISTING_STAMPS:
        AGB_ASSERT_EX(cmd->flag == FALSE, ABSPATH("mevent_server.c"), 408);
        ptr = MysteryGiftServer_GetSendData(cmd->parameter, &svr->stamp);
        svr->param = MysteryGift_CheckStamps(ptr, svr->linkGameData, ptr);
        break;
    case SVR_GET_CARD_STAT:
        AGB_ASSERT_EX(cmd->parameter == NULL, ABSPATH("mevent_server.c"), 415);
        svr->param = MysteryGift_GetCardStatFromLinkData(svr->linkGameData, cmd->flag);
        break;
    case SVR_CHECK_QUESTIONNAIRE:
        AGB_ASSERT_EX(cmd->flag == FALSE, ABSPATH("mevent_server.c"), 420);
        svr->param = MysteryGift_DoesQuestionnaireMatch(svr->linkGameData, cmd->parameter);
        break;
    case SVR_COMPARE:
        AGB_ASSERT_EX(cmd->flag == FALSE, ABSPATH("mevent_server.c"), 426);
        svr->param = MysteryGiftServer_Compare(cmd->parameter, *(void **)svr->recvBuffer);
        break;
    case SVR_LOAD_NEWS:
        AGB_ASSERT_EX(cmd->flag == FALSE, ABSPATH("mevent_server.c"), 432);
        MysteryGiftServer_InitSend(svr, MG_LINKID_NEWS, MysteryGiftServer_GetSendData(cmd->parameter, svr->news), sizeof(struct WonderNews));
        break;
    case SVR_LOAD_CARD:
        AGB_ASSERT_EX(cmd->flag == FALSE, ABSPATH("mevent_server.c"), 438);
        MysteryGiftServer_InitSend(svr, MG_LINKID_CARD, MysteryGiftServer_GetSendData(cmd->parameter, svr->card), sizeof(struct WonderCard));
        break;
    case SVR_LOAD_STAMP:
        AGB_ASSERT_EX(cmd->flag == FALSE, ABSPATH("mevent_server.c"), 444);
        MysteryGiftServer_InitSend(svr, MG_LINKID_STAMP, MysteryGiftServer_GetSendData(cmd->parameter, &svr->stamp), sizeof(svr->stamp));
        break;
    case SVR_LOAD_RAM_SCRIPT:
        if (cmd->parameter == NULL)
            MysteryGiftServer_InitSend(svr, MG_LINKID_RAM_SCRIPT, svr->ramScript, svr->ramScriptSize);
        else
            MysteryGiftServer_InitSend(svr, MG_LINKID_RAM_SCRIPT, cmd->parameter, cmd->flag);
        break;
    case SVR_LOAD_CLIENT_SCRIPT:
        if (cmd->parameter == NULL)
            MysteryGiftServer_InitSend(svr, MG_LINKID_CLIENT_SCRIPT, svr->clientScript, svr->clientScriptSize);
        else
            MysteryGiftServer_InitSend(svr, MG_LINKID_CLIENT_SCRIPT, cmd->parameter, cmd->flag);
        break;
    case SVR_LOAD_EREADER_TRAINER:
        AGB_ASSERT_EX(cmd->flag == FALSE, ABSPATH("mevent_server.c"), 466);
        MysteryGiftServer_InitSend(svr, MG_LINKID_EREADER_TRAINER, cmd->parameter, 188);
        break;
    case SVR_LOAD_MSG:
        MysteryGiftServer_InitSend(svr, MG_LINKID_DYNAMIC_MSG, cmd->parameter, cmd->flag);
        break;
    case SVR_LOAD_UNK_2:
        MysteryGiftServer_InitSend(svr, MG_LINKID_UNK_2, cmd->parameter, cmd->flag);
        break;
    case SVR_COPY_CARD:
        AGB_ASSERT_EX(cmd->flag == FALSE, ABSPATH("mevent_server.c"), 481);
        memcpy(svr->card, cmd->parameter, sizeof(*svr->card));
        break;
    case SVR_COPY_NEWS:
        AGB_ASSERT_EX(cmd->flag == FALSE, ABSPATH("mevent_server.c"), 486);
        memcpy(svr->news, cmd->parameter, sizeof(*svr->news));
        break;
    case SVR_COPY_STAMP:
        AGB_ASSERT_EX(cmd->flag == FALSE, ABSPATH("mevent_server.c"), 491);
        svr->stamp = *(u32 *)cmd->parameter;
        break;
    case SVR_SET_RAM_SCRIPT:
        svr->ramScript = cmd->parameter;
        svr->ramScriptSize = cmd->flag;
        break;
    case SVR_SET_CLIENT_SCRIPT:
        svr->clientScript = cmd->parameter;
        svr->clientScriptSize = cmd->flag;
        break;
    case SVR_COPY_SAVED_CARD:
        AGB_ASSERT_EX(cmd->flag == FALSE && cmd->parameter == NULL, ABSPATH("mevent_server.c"), 506);
        memcpy(svr->card, GetSavedWonderCard(), sizeof(*svr->card));
        DisableWonderCardSending(svr->card);
        break;
    case SVR_COPY_SAVED_NEWS:
        AGB_ASSERT_EX(cmd->flag == FALSE && cmd->parameter == NULL, ABSPATH("mevent_server.c"), 512);
        memcpy(svr->news, GetSavedWonderNews(), sizeof(*svr->news));
        break;
    case SVR_COPY_SAVED_RAM_SCRIPT:
        AGB_ASSERT_EX(cmd->flag == FALSE && cmd->parameter == NULL, ABSPATH("mevent_server.c"), 517);
        svr->ramScript = GetSavedRamScriptIfValid();
        break;
    case SVR_LOAD_UNK_1:
        MysteryGiftServer_InitSend(svr, MG_LINKID_UNK_1, cmd->parameter, cmd->flag);
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
// Original GF names
#define mainseqno funcId
#define func_tbl sFuncTable
    u32 response;
    AGB_ASSERT_EX(svr->mainseqno < NELEMS(func_tbl), ABSPATH("mevent_server.c"), 546);
    response = sFuncTable[svr->funcId](svr);
    AGB_ASSERT_EX(svr->mainseqno < NELEMS(func_tbl), ABSPATH("mevent_server.c"), 548);
    return response;
#undef mainseqno
#undef func_tbl
}
