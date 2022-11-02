#include "global.h"
#include "gflib.h"
#include "constants/songs.h"
#include "easy_chat.h"
#include "task.h"
#include "decompress.h"
#include "link.h"
#include "link_rfu.h"
#include "ereader_helpers.h"
#include "util.h"
#include "script.h"
#include "event_data.h"
#include "battle_tower.h"
#include "new_game.h"
#include "menews_jisan.h"
#include "cereader_tool.h"
#include "mystery_gift_menu.h"
#include "help_system.h"
#include "mevent.h"
#include "strings.h"

struct MEventTaskData1
{
    u16 stateAdvanceDelay;
    u16 t02;
    u16 t04;
    u16 t06;
    u8 state;
    u8 textOrReceiveState;
    u8 t0A;
    u8 t0B;
    u8 t0C;
    u8 t0D;
    u8 initialSendResult;
    struct MEvent_Str_2 *t10;
};

static void Task_EReaderComm(u8 taskId);
static bool32 IsReceivedWonderNewsHeaderValid(const struct WonderNews * src);
static void BlankWonderNews(void);
static void BlankMENewsJisan(void);
static bool32 IsReceivedWonderCardHeaderValid(const struct WonderCard * src);
static void BlankSavedWonderCard(void);
static void BlankMEventBuffer2(void);
static void RecordIdOfWonderCardSender(u32 eventId, u32 trainerId, u32 *idsList, s32 count);
static void BlankBuffer344(void);

extern const u8 gMultiBootProgram_EReader_Start[];
extern const u8 gMultiBootProgram_EReader_End[];

static const u16 sGiftItemFlagIds[] = {
    FLAG_GOT_AURORA_TICKET,
    FLAG_GOT_MYSTIC_TICKET,
    FLAG_0x2A9,
    FLAG_0x2AA,
    FLAG_0x2AB,
    FLAG_0x2AC,
    FLAG_0x2AD,
    FLAG_0x2AE,
    FLAG_0x2AF,
    FLAG_0x2B0,
    FLAG_0x2B1,
    FLAG_0x2B2,
    FLAG_0x2B3,
    FLAG_0x2B4,
    FLAG_0x2B5,
    FLAG_0x2B6,
    FLAG_0x2B7,
    FLAG_0x2B8,
    FLAG_0x2B9,
    FLAG_0x2BA
};

struct MEvent_Str_1 sMEventSendToEReaderManager;

static EWRAM_DATA bool32 sReceivedWonderCardIsValid = FALSE;

void SendUnknownSerialData_Init(struct MEvent_Str_1 *mgr, size_t size, const void *data)
{
    vu16 imeBak = REG_IME;
    REG_IME = 0;
    gIntrTable[1] = EReaderHelper_SerialCallback;
    gIntrTable[2] = EReaderHelper_Timer3Callback;
    EReaderHelper_SaveRegsState();
    EReaderHelper_ClearsSendRecvMgr();
    REG_IE |= INTR_FLAG_VCOUNT;
    REG_IME = imeBak;
    mgr->status = 0;
    mgr->size = size;
    mgr->data = data;
}

void SendUnknownSerialData_Teardown(struct MEvent_Str_1 *unused)
{
    vu16 imeBak = REG_IME;
    REG_IME = 0;
    EReaderHelper_ClearsSendRecvMgr();
    EReaderHelper_RestoreRegsState();
    RestoreSerialTimer3IntrHandlers();
    REG_IME = imeBak;
}

u8 SendUnknownSerialData_Run(struct MEvent_Str_1 *mgr)
{
    u8 resp = 0;
    mgr->status = EReaderHandleTransfer(1, mgr->size, mgr->data, 0);
    if ((mgr->status & 0x13) == 0x10) // checksum OK and xfer off
        resp = 1;
    if (mgr->status & 8) // cancelled by player
        resp = 2;
    if (mgr->status & 4) // timed out
        resp = 3;
    gShouldAdvanceLinkState = 0;
    return resp;
}

static void ResetTTDataBuffer(void)
{
    memset(gDecompressionBuffer, 0, 0x2000);
    gLinkType = 0x5502;
    OpenLink();
    SetSuppressLinkErrorMessage(TRUE);
}

bool32 sub_81436EC(void)
{
    vu16 imeBak = REG_IME;
    u16 data[4];
    REG_IME = 0;
    *(u64 *)data = *(u64 *)gLink.tempRecvBuffer;
    REG_IME = imeBak;
    if (   data[0] == 0xB9A0
        && data[1] == 0xCCD0
        && data[2] == 0xFFFF
        && data[3] == 0xFFFF
    )
        return TRUE;
    return FALSE;
}

static bool32 IsEReaderConnectionSane(void)
{
    if (IsLinkMaster() && GetLinkPlayerCount_2() == 2)
        return TRUE;
    return FALSE;
}

static u32 EReaderReceive(u8 * state_p, u16 * receiveDelay)
{
    if ((*state_p == 3 || *state_p == 4 || *state_p == 5) && HasLinkErrorOccurred())
    {
        *state_p = 0;
        return 3;
    }
    switch (*state_p)
    {
        case 0:
            if (IsLinkMaster() && GetLinkPlayerCount_2() > 1)
            {
                *state_p = 1;
                ;
            }
            else if (JOY_NEW(B_BUTTON))
            {
                *state_p = 0;
                return 1;
            }
            break;
        case 1:
            if (++(*receiveDelay) > 5)
            {
                *receiveDelay = 0;
                *state_p = 2;
            }
            break;
        case 2:
            if (GetLinkPlayerCount_2() == 2)
            {
                PlaySE(SE_DING_DONG);
                CheckShouldAdvanceLinkState();
                *receiveDelay = 0;
                *state_p = 3;
            }
            else if (JOY_NEW(B_BUTTON))
            {
                *state_p = 0;
                return 1;
            }
            break;
        case 3:
            if (++(*receiveDelay) > 30)
            {
                *state_p = 0;
                return 5;
            }
            else if (IsLinkConnectionEstablished())
            {
                if (gReceivedRemoteLinkPlayers)
                {
                    if (IsLinkPlayerDataExchangeComplete())
                    {
                        *state_p = 0;
                        return 2;
                    }
                    else
                        *state_p = 4;
                }
                else
                    *state_p = 3;
            }
            break;
        case 4:
            SetCloseLinkCallbackAndType(0);
            *state_p = 5;
            break;
        case 5:
            if (!gReceivedRemoteLinkPlayers)
            {
                *state_p = 0;
                return 4;
            }
            break;
    }
    return 0;
}

void task_add_00_ereader(void)
{
    u8 taskId = CreateTask(Task_EReaderComm, 0);
    struct MEventTaskData1 *data = (struct MEventTaskData1 *)gTasks[taskId].data;
    data->state = 0;
    data->textOrReceiveState = 0;
    data->t0A = 0;
    data->t0B = 0;
    data->t0C = 0;
    data->t0D = 0;
    data->stateAdvanceDelay = 0;
    data->t02 = 0;
    data->t04 = 0;
    data->t06 = 0;
    data->initialSendResult = 0;
    data->t10 = AllocZeroed(sizeof(struct MEvent_Str_2));
}

static void ResetDelayTimer(u16 *a0)
{
    *a0 = 0;
}

static bool32 AdvanceDelayTimerCheckTimeout(u16 * a0, u16 a1)
{
    if (++(*a0) > a1)
    {
        *a0 = 0;
        return TRUE;
    }
    return FALSE;
}

static void Task_EReaderComm(u8 taskId)
{
    struct MEventTaskData1 *data = (struct MEventTaskData1 *)gTasks[taskId].data;
    switch (data->state)
    {
        case 0:
            if (MG_PrintTextOnWindow1AndWaitButton(&data->textOrReceiveState, gJPText_ReceiveMysteryGiftWithEReader))
                data->state = 1;
            break;
        case 1:
            ResetTTDataBuffer();
            ResetDelayTimer(&data->stateAdvanceDelay);
            data->state = 2;
            break;
        case 2:
            if (AdvanceDelayTimerCheckTimeout(&data->stateAdvanceDelay, 10))
                data->state = 3;
            break;
        case 3:
            if (!IsEReaderConnectionSane())
            {
                CloseLink();
                data->state = 4;
            }
            else
                data->state = 13;
            break;
        case 4:
            if (MG_PrintTextOnWindow1AndWaitButton(&data->textOrReceiveState, gJPText_SelectConnectFromEReaderMenu))
            {
                AddTextPrinterToWindow1(gJPText_SelectConnectWithGBA);
                ResetDelayTimer(&data->stateAdvanceDelay);
                data->state = 5;
            }
            break;
        case 5:
            if (AdvanceDelayTimerCheckTimeout(&data->stateAdvanceDelay, 90))
            {
                ResetTTDataBuffer();
                data->state = 6;
            }
            else if (JOY_NEW(B_BUTTON))
            {
                ResetDelayTimer(&data->stateAdvanceDelay);
                PlaySE(SE_SELECT);
                data->state = 23;
            }
            break;
        case 6:
            if (JOY_NEW(B_BUTTON))
            {
                PlaySE(SE_SELECT);
                CloseLink();
                ResetDelayTimer(&data->stateAdvanceDelay);
                data->state = 23;
            }
            else if (GetLinkPlayerCount_2() > 1)
            {
                ResetDelayTimer(&data->stateAdvanceDelay);
                CloseLink();
                data->state = 7;
            }
            else if (sub_81436EC())
            {
                PlaySE(SE_SELECT);
                CloseLink();
                ResetDelayTimer(&data->stateAdvanceDelay);
                data->state = 8;
            }
            else if (AdvanceDelayTimerCheckTimeout(&data->stateAdvanceDelay, 10))
            {
                CloseLink();
                ResetTTDataBuffer();
                ResetDelayTimer(&data->stateAdvanceDelay);
            }
            break;
        case 7:
            if (MG_PrintTextOnWindow1AndWaitButton(&data->textOrReceiveState, gJPText_LinkIsIncorrect))
                data->state = 4;
            break;
        case 8:
            AddTextPrinterToWindow1(gJPText_Connecting);
            SendUnknownSerialData_Init(&sMEventSendToEReaderManager, gMultiBootProgram_EReader_End - gMultiBootProgram_EReader_Start, gMultiBootProgram_EReader_Start);
            data->state = 9;
            break;
        case 9:
            data->initialSendResult = SendUnknownSerialData_Run(&sMEventSendToEReaderManager);
            if (data->initialSendResult != 0)
                data->state = 10;
            break;
        case 10:
            SendUnknownSerialData_Teardown(&sMEventSendToEReaderManager);
            if (data->initialSendResult == 3)
                // Error
                data->state = 20;
            else if (data->initialSendResult == 1)
            {
                // OK
                ResetDelayTimer(&data->stateAdvanceDelay);
                AddTextPrinterToWindow1(gJPText_PleaseWaitAMoment);
                data->state = 11;
            }
            else
                // Try again
                data->state = 0;
            break;
        case 11:
            if (AdvanceDelayTimerCheckTimeout(&data->stateAdvanceDelay, 840))
                data->state = 12;
            break;
        case 12:
            ResetTTDataBuffer();
            AddTextPrinterToWindow1(gJPText_AllowEReaderToLoadCard);
            data->state = 13;
            break;
        case 13:
            switch (EReaderReceive(&data->textOrReceiveState, &data->stateAdvanceDelay))
            {
                case 0:
                    // Running
                    break;
                case 2:
                    // Done
                    AddTextPrinterToWindow1(gJPText_Connecting);
                    data->state = 14;
                    break;
                case 1:
                    // Cancelled
                    PlaySE(SE_SELECT);
                    CloseLink();
                    data->state = 23;
                    break;
                case 5:
                    // Error Try Again
                    CloseLink();
                    data->state = 21;
                    break;
                case 3:
                case 4:
                    // Error CheckLink
                    CloseLink();
                    data->state = 20;
                    break;
            }
            break;
        case 14:
            if (HasLinkErrorOccurred())
            {
                CloseLink();
                data->state = 20;
            }
            else if (GetBlockReceivedStatus())
            {
                ResetBlockReceivedFlags();
                data->state = 15;
            }
            break;
        case 15:
            data->initialSendResult = ValidateTrainerTowerData((struct EReaderTrainerTowerSet *)gDecompressionBuffer);
            SetCloseLinkCallbackAndType(data->initialSendResult);
            data->state = 16;
            break;
        case 16:
            if (!gReceivedRemoteLinkPlayers)
            {
                if (data->initialSendResult == 1)
                    data->state = 17;
                else
                    data->state = 20;
            }
            break;
        case 17:
            if (CEReaderTool_SaveTrainerTower((struct EReaderTrainerTowerSet *)gDecompressionBuffer))
            {
                AddTextPrinterToWindow1(gJPText_ConnectionComplete);
                ResetDelayTimer(&data->stateAdvanceDelay);
                data->state = 18;
            }
            else
                data->state = 22;
            break;
        case 18:
            if (AdvanceDelayTimerCheckTimeout(&data->stateAdvanceDelay, 120))
            {
                AddTextPrinterToWindow1(gJPText_NewTrainerHasComeToSevii);
                PlayFanfare(MUS_OBTAIN_ITEM);
                data->state = 19;
            }
            break;
        case 19:
            if (IsFanfareTaskInactive() && JOY_NEW(A_BUTTON | B_BUTTON))
                data->state = 26;
            break;
        case 23:
            if (MG_PrintTextOnWindow1AndWaitButton(&data->textOrReceiveState, gJPText_CardReadingHasBeenHalted))
                data->state = 26;
            break;
        case 20:
            if (MG_PrintTextOnWindow1AndWaitButton(&data->textOrReceiveState, gJPText_ConnectionErrorCheckLink))
                data->state = 0;
            break;
        case 21:
            if (MG_PrintTextOnWindow1AndWaitButton(&data->textOrReceiveState, gJPText_ConnectionErrorTryAgain))
                data->state = 0;
            break;
        case 22:
            if (MG_PrintTextOnWindow1AndWaitButton(&data->textOrReceiveState, gJPText_WriteErrorUnableToSaveData))
                data->state = 0;
            break;
        case 26:
            HelpSystem_Enable();
            Free(data->t10);
            DestroyTask(taskId);
            SetMainCallback2(MainCB_FreeAllBuffersAndReturnToInitTitleScreen);
            break;
    }
}

void InitMEventData(void)
{
    CpuFill32(0, &gSaveBlock1Ptr->mysteryGift, sizeof(gSaveBlock1Ptr->mysteryGift));
    BlankMENewsJisan();
    EC_ResetMEventProfileMaybe();
}

struct WonderNews * GetSavedWonderNews(void)
{
    return &gSaveBlock1Ptr->mysteryGift.news;
}

struct WonderCard * GetSavedWonderCard(void)
{
    return &gSaveBlock1Ptr->mysteryGift.card;
}

struct WonderCardMetadata * sav1_get_mevent_buffer_2(void)
{
    return &gSaveBlock1Ptr->mysteryGift.cardMetadata;
}

struct WonderNewsMetadata * GetMENewsJisanStructPtr(void)
{
    return &gSaveBlock1Ptr->mysteryGift.newsMetadata;
}

u16 * GetMEventProfileECWordsMaybe(void)
{
    return gSaveBlock1Ptr->mysteryGift.questionnaireWords;
}

void DestroyWonderNews(void)
{
    BlankWonderNews();
}

bool32 OverwriteSavedWonderNewsWithReceivedNews(const struct WonderNews * src)
{
    if (!IsReceivedWonderNewsHeaderValid(src))
        return FALSE;
    BlankWonderNews();
    gSaveBlock1Ptr->mysteryGift.news = *src;
    gSaveBlock1Ptr->mysteryGift.newsCrc = CalcCRC16WithTable((void *)&gSaveBlock1Ptr->mysteryGift.news, sizeof(struct WonderNews));
    return TRUE;
}

bool32 ValidateReceivedWonderNews(void)
{
    if (CalcCRC16WithTable((void *)&gSaveBlock1Ptr->mysteryGift.news, sizeof(struct WonderNews)) != gSaveBlock1Ptr->mysteryGift.newsCrc)
        return FALSE;
    if (!IsReceivedWonderNewsHeaderValid(&gSaveBlock1Ptr->mysteryGift.news))
        return FALSE;
    return TRUE;
}

static bool32 IsReceivedWonderNewsHeaderValid(const struct WonderNews * data)
{
    if (data->newsId == 0)
        return FALSE;
    return TRUE;
}

bool32 WonderNews_Test_Unk_02(void)
{
    const struct WonderNews * data = &gSaveBlock1Ptr->mysteryGift.news;
    if (data->sendType == 0)
        return FALSE;
    return TRUE;
}

static void BlankWonderNews(void)
{
    CpuFill32(0, GetSavedWonderNews(), sizeof(gSaveBlock1Ptr->mysteryGift.news));
    gSaveBlock1Ptr->mysteryGift.newsCrc = 0;
}

static void BlankMENewsJisan(void)
{
    CpuFill32(0, GetMENewsJisanStructPtr(), sizeof(struct WonderNewsMetadata));
    MENewsJisanReset();
}

bool32 MEvent_HaveAlreadyReceivedWonderNews(const u8 * src)
{
    const u8 * r5 = (const u8 *)&gSaveBlock1Ptr->mysteryGift.news;
    u32 i;
    if (!ValidateReceivedWonderNews())
        return FALSE;
    for (i = 0; i < sizeof(struct WonderNews); i++)
    {
        if (r5[i] != src[i])
            return FALSE;
    }
    return TRUE;
}

void DestroyWonderCard(void)
{
    BlankSavedWonderCard();
    BlankMEventBuffer2();
    BlankBuffer344();
    ClearRamScript();
    ResetMysteryEventFlags();
    ResetMysteryEventVars();
    ClearEReaderTrainer(&gSaveBlock2Ptr->battleTower.ereaderTrainer);
}

bool32 OverwriteSavedWonderCardWithReceivedCard(const struct WonderCard * data)
{
    struct WonderCardMetadata * r2;
    struct WonderCard * r1;
    if (!IsReceivedWonderCardHeaderValid(data))
        return FALSE;
    DestroyWonderCard();
    memcpy(&gSaveBlock1Ptr->mysteryGift.card, data, sizeof(struct WonderCard));
    gSaveBlock1Ptr->mysteryGift.cardCrc = CalcCRC16WithTable((void *)&gSaveBlock1Ptr->mysteryGift.card, sizeof(struct WonderCard));
    // Annoying hack to match
    r2 = &gSaveBlock1Ptr->mysteryGift.cardMetadata;
    r1 = &gSaveBlock1Ptr->mysteryGift.card;
    r2->iconSpecies = r1->iconSpecies;
    return TRUE;
}

bool32 ValidateReceivedWonderCard(void)
{
    if (gSaveBlock1Ptr->mysteryGift.cardCrc != CalcCRC16WithTable((void *)&gSaveBlock1Ptr->mysteryGift.card, sizeof(struct WonderCard)))
        return FALSE;
    if (!IsReceivedWonderCardHeaderValid(&gSaveBlock1Ptr->mysteryGift.card))
        return FALSE;
    if (!ValidateRamScript())
        return FALSE;
    return TRUE;
}

static bool32 IsReceivedWonderCardHeaderValid(const struct WonderCard * data)
{
    if (data->flagId == 0)
        return FALSE;
    if (data->type > 2)
        return FALSE;
    if (!(data->sendType == 0 || data->sendType == 1 || data->sendType == 2))
        return FALSE;
    if (data->bgType > 7)
        return FALSE;
    if (data->maxStamps > 7)
        return FALSE;
    return TRUE;
}

bool32 WonderCard_Test_Unk_08_6(void)
{
    const struct WonderCard * data = &gSaveBlock1Ptr->mysteryGift.card;
    if (data->sendType == 0)
        return FALSE;
    return TRUE;
}

static void BlankSavedWonderCard(void)
{
    CpuFill32(0, &gSaveBlock1Ptr->mysteryGift.card, sizeof(struct WonderCard));
    gSaveBlock1Ptr->mysteryGift.cardCrc = 0;
}

static void BlankMEventBuffer2(void)
{
    CpuFill32(0, sav1_get_mevent_buffer_2(), 18 * sizeof(u16));
    gSaveBlock1Ptr->mysteryGift.cardMetadataCrc = 0;
}

u16 GetWonderCardFlagId(void)
{
    if (ValidateReceivedWonderCard())
        return gSaveBlock1Ptr->mysteryGift.card.flagId;
    return 0;
}

void MEvent_WonderCardResetUnk08_6(struct WonderCard * buffer)
{
    if (buffer->sendType == 1)
        buffer->sendType = 0;
}

static bool32 IsCardIdInValidRange(u16 a0)
{
    if (a0 >= 1000 && a0 < 1020)
        return TRUE;
    return FALSE;
}

bool32 CheckReceivedGiftFromWonderCard(void)
{
    u16 value = GetWonderCardFlagId();
    if (!IsCardIdInValidRange(value))
        return FALSE;
    if (FlagGet(sGiftItemFlagIds[value - 1000]) == TRUE)
        return FALSE;
    return TRUE;
}

static s32 CountReceivedDistributionMons(const struct WonderCardMetadata * data, s32 size)
{
    s32 r3 = 0;
    s32 i;
    for (i = 0; i < size; i++)
    {
        if (data->stampData[1][i] && data->stampData[0][i])
            r3++;
    }
    return r3;
}

static bool32 HasPlayerAlreadyReceivedDistributedMon(const struct WonderCardMetadata * data1, const u16 * data2, s32 size)
{
    s32 i;
    for (i = 0; i < size; i++)
    {
        if (data1->stampData[1][i] == data2[1])
            return TRUE;
        if (data1->stampData[0][i] == data2[0])
            return TRUE;
    }
    return FALSE;
}

static bool32 IsWonderCardSpeciesValid(const u16 * data)
{
    if (data[1] == 0)
        return FALSE;
    if (data[0] == SPECIES_NONE)
        return FALSE;
    if (data[0] >= NUM_SPECIES)
        return FALSE;
    return TRUE;
}

static s32 ValidateCardAndCountMonsReceived(void)
{
    struct WonderCard * data;
    if (!ValidateReceivedWonderCard())
        return 0;
    data = &gSaveBlock1Ptr->mysteryGift.card;
    if (data->type != 1)
        return 0;
    return CountReceivedDistributionMons(&gSaveBlock1Ptr->mysteryGift.cardMetadata, data->maxStamps);
}

bool32 MEvent_ReceiveDistributionMon(const u16 * data)
{
    struct WonderCard * buffer = &gSaveBlock1Ptr->mysteryGift.card;
    s32 capacity = buffer->maxStamps;
    s32 i;
    if (!IsWonderCardSpeciesValid(data))
        return FALSE;
    if (HasPlayerAlreadyReceivedDistributedMon(&gSaveBlock1Ptr->mysteryGift.cardMetadata, data, capacity))
        return FALSE;
    for (i = 0; i < capacity; i++)
    {
        if (gSaveBlock1Ptr->mysteryGift.cardMetadata.stampData[1][i] == 0 && gSaveBlock1Ptr->mysteryGift.cardMetadata.stampData[0][i] == 0)
        {
            gSaveBlock1Ptr->mysteryGift.cardMetadata.stampData[1][i] = data[1];
            gSaveBlock1Ptr->mysteryGift.cardMetadata.stampData[0][i] = data[0];
            return TRUE;
        }
    }
    return FALSE;
}

#if defined(FIRERED)
#define MEVENT_HEADER_VERSION_CODE 1
#elif defined(LEAFGREEN)
#define MEVENT_HEADER_VERSION_CODE 2
#endif

void BuildMEventClientHeader(struct MEventClientHeaderStruct * data)
{
    s32 i;
    CpuFill32(0, data, sizeof(struct MEventClientHeaderStruct));
    // Magic
    data->unk_00 = 0x101;
    data->unk_04 = 1;
    data->unk_08 = 1;
    data->unk_0C = 1;
    data->unk_10 = MEVENT_HEADER_VERSION_CODE;

    // Check whether a card already exists
    if (ValidateReceivedWonderCard())
    {
        // Populate fields
        data->id = GetSavedWonderCard()->flagId;
        data->unk_20 = *sav1_get_mevent_buffer_2();
        data->maxDistributionMons = GetSavedWonderCard()->maxStamps;
    }
    else
        data->id = 0;

    // Get something
    for (i = 0; i < 4; i++)
        data->unk_16[i] = gSaveBlock1Ptr->mysteryGift.questionnaireWords[i];

    // Get player ID
    CopyTrainerId(data->playerTrainerId, gSaveBlock2Ptr->playerTrainerId);
    StringCopy(data->playerName, gSaveBlock2Ptr->playerName);
    for (i = 0; i < 6; i++)
        data->easyChatProfile[i] = gSaveBlock1Ptr->easyChatProfile[i];
    memcpy(data->gameCode, RomHeaderGameCode, 4);
    data->version = RomHeaderSoftwareVersion;
}

bool32 ValidateMEventClientHeader(const struct MEventClientHeaderStruct * data)
{
    if (data->unk_00 != 0x101)
        return FALSE;
    if (!(data->unk_04 & 1))
        return FALSE;
    if (!(data->unk_08 & 1))
        return FALSE;
    if (!(data->unk_0C & 1))
        return FALSE;
    if (!(data->unk_10 & 0x0F))
        return FALSE;
    return TRUE;
}

u32 sub_8144418(const u16 * a0, const struct MEventClientHeaderStruct * a1, void *unused)
{
    if (a1->id == 0)
        return 0;
    if (*a0 == a1->id)
        return 1;
    return 2;
}

u32 MEvent_CanPlayerReceiveDistributionMon(const u16 * a0, const struct MEventClientHeaderStruct * a1, void *unused)
{
    s32 numSpaces = a1->maxDistributionMons - CountReceivedDistributionMons(&a1->unk_20, a1->maxDistributionMons);
    if (numSpaces == 0)
        return 1;
    if (HasPlayerAlreadyReceivedDistributedMon(&a1->unk_20, a0, a1->maxDistributionMons))
        return 3;
    if (numSpaces == 1)
        return 4;
    return 2;
}

bool32 sub_8144474(const struct MEventClientHeaderStruct * a0, const u16 * a1)
{
    s32 i;
    for (i = 0; i < 4; i++)
    {
        if (a0->unk_16[i] != a1[i])
            return FALSE;
    }
    return TRUE;
}

static s32 GetNumReceivedDistributionMons(const struct MEventClientHeaderStruct * a0)
{
    return CountReceivedDistributionMons(&a0->unk_20, a0->maxDistributionMons);
}

u16 sub_81444B0(const struct MEventClientHeaderStruct * a0, u32 command)
{
    switch (command)
    {
        case 0:
            return a0->unk_20.battlesWon;
        case 1:
            return a0->unk_20.battlesLost;
        case 2:
            return a0->unk_20.numTrades;
        case 3:
            return GetNumReceivedDistributionMons(a0);
        case 4:
            return a0->maxDistributionMons;
        default:
             AGB_ASSERT_EX(0, ABSPATH("mevent.c"), 825);
            return 0;
    }
}

// Increments an interaction count in the save block
static void IncrementBattleCardCount(u32 command)
{
    struct WonderCard * data = &gSaveBlock1Ptr->mysteryGift.card;
    if (data->type == 2)
    {
        u16 * dest = NULL;
        switch (command)
        {
            case 0:
                dest = &gSaveBlock1Ptr->mysteryGift.cardMetadata.battlesWon;
                break;
            case 1:
                dest = &gSaveBlock1Ptr->mysteryGift.cardMetadata.battlesLost;
                break;
            case 2:
                dest = &gSaveBlock1Ptr->mysteryGift.cardMetadata.numTrades;
                break;
            case 3:
                break;
            case 4:
                break;
        }
        if (dest == NULL)
        {
             AGB_ASSERT_EX(0, ABSPATH("mevent.c"), 868);
        }
        else if (++(*dest) > 999)
        {
            *dest = 999;
        }
    }
}

u16 MEvent_GetBattleCardCount(u32 command)
{
    switch (command)
    {
        case 0:
        {
            struct WonderCard * data = &gSaveBlock1Ptr->mysteryGift.card;
            if (data->type == 2)
            {
                struct WonderCardMetadata * buffer = &gSaveBlock1Ptr->mysteryGift.cardMetadata;
                return buffer->battlesWon;
            }
            break;
        }
        case 1:
        {
            struct WonderCard * data = &gSaveBlock1Ptr->mysteryGift.card;
            if (data->type == 2)
            {
                struct WonderCardMetadata * buffer = &gSaveBlock1Ptr->mysteryGift.cardMetadata;
                return buffer->battlesLost;
            }
            break;
        }
        case 2:
        {
            struct WonderCard * data = &gSaveBlock1Ptr->mysteryGift.card;
            if (data->type == 2)
            {
                struct WonderCardMetadata * buffer = &gSaveBlock1Ptr->mysteryGift.cardMetadata;
                return buffer->numTrades;
            }
            break;
        }
        case 3:
        {
            struct WonderCard * data = &gSaveBlock1Ptr->mysteryGift.card;
            if (data->type == 1)
                return ValidateCardAndCountMonsReceived();
            break;
        }
        case 4:
        {
            struct WonderCard * data = &gSaveBlock1Ptr->mysteryGift.card;
            if (data->type == 1)
                return data->maxStamps;
            break;
        }
    }
    AGB_ASSERT_EX(0, ABSPATH("mevent.c"), 913);
    return 0;
}

void ResetReceivedWonderCardFlag(void)
{
    sReceivedWonderCardIsValid = FALSE;
}

bool32 MEventHandleReceivedWonderCard(u16 flagId)
{
    sReceivedWonderCardIsValid = FALSE;
    if (flagId == 0)
        return FALSE;
    if (!ValidateReceivedWonderCard())
        return FALSE;
    if (gSaveBlock1Ptr->mysteryGift.card.flagId != flagId)
        return FALSE;
    sReceivedWonderCardIsValid = TRUE;
    return TRUE;
}

void MysteryGift_TryIncrementStat(u32 eventId, u32 trainerId)
{
    if (sReceivedWonderCardIsValid)
    {
        switch (eventId)
        {
            case 2: // trade
                RecordIdOfWonderCardSender(2, trainerId, gSaveBlock1Ptr->mysteryGift.trainerIds[1], 5);
                break;
            case 0: // link win
                RecordIdOfWonderCardSender(0, trainerId, gSaveBlock1Ptr->mysteryGift.trainerIds[0], 5);
                break;
            case 1: // link loss
                RecordIdOfWonderCardSender(1, trainerId, gSaveBlock1Ptr->mysteryGift.trainerIds[0], 5);
                break;
            default:
                 AGB_ASSERT_EX(0, ABSPATH("mevent.c"), 988);
        }
    }
}

static void BlankBuffer344(void)
{
    CpuFill32(0, gSaveBlock1Ptr->mysteryGift.trainerIds, sizeof(gSaveBlock1Ptr->mysteryGift.trainerIds));
}

// Looks up trainerId in an array idsList with count elements.
// If trainerId is found, rearranges idsList to put it in the front.
// Otherwise, drops the last element of the list and inserts
// trainerId at the front.
// Returns TRUE in the latter case.
static bool32 PlaceTrainerIdAtFrontOfList(u32 trainerId, u32 * idsList, s32 count)
{
    s32 i;
    s32 j;

    for (i = 0; i < count; i++)
    {
        if (idsList[i] == trainerId)
            break;
    }
    if (i == count)
    {
        for (j = count - 1; j > 0; j--)
        {
            idsList[j] = idsList[j - 1];
        }
        idsList[0] = trainerId;
        return TRUE;
    }
    else
    {
        for (j = i; j > 0; j--)
        {
            idsList[j] = idsList[j - 1];
        }
        idsList[0] = trainerId;
        return FALSE;
    }
}

static void RecordIdOfWonderCardSender(u32 eventId, u32 trainerId, u32 * idsList, s32 count)
{
    if (PlaceTrainerIdAtFrontOfList(trainerId, idsList, count))
        IncrementBattleCardCount(eventId);
}
