#ifndef GUARD_MEVENT_H
#define GUARD_MEVENT_H

#include "global.h"

struct MEventClientHeaderStruct
{
    u32 unk_00;
    u16 unk_04;
    u32 unk_08;
    u16 unk_0C;
    u32 unk_10;
    u16 id;
    u16 unk_16[4];
    struct WonderCardMetadata unk_20;
    u8 maxDistributionMons;
    u8 playerName[7];
    u8 playerTrainerId[4];
    u16 easyChatProfile[6];
    u8 gameCode[4];
    u8 version;
};

struct MEvent_Str_1
{
    u16 status;
    size_t size;
    const void *data;
};

struct MEvent_Str_2
{
    u8 fill_00[0x40];
};

struct UnkStruct_8467FB8
{
    u8 textPal1:4;
    u8 textPal2:4;
    u8 textPal3:4;
    u8 index:4;
    const u8 * tiles;
    const u8 * map;
    const u16 * pal;
};

extern const u16 gCard1Pal[];
extern const u16 gCard2Pal[];
extern const u16 gCard3Pal[];
extern const u16 gCard4Pal[];
extern const u16 gCard5Pal[];

struct WonderNews * GetSavedWonderNews(void);
struct WonderCard * GetSavedWonderCard(void);
struct WonderCardMetadata * sav1_get_mevent_buffer_2(void);
struct WonderNewsMetadata * GetMENewsJisanStructPtr(void);
bool32 OverwriteSavedWonderNewsWithReceivedNews(const struct WonderNews * src);
bool32 ValidateReceivedWonderNews(void);
bool32 ValidateReceivedWonderCard(void);
bool32 MEvent_HaveAlreadyReceivedWonderNews(const u8 * src);
bool32 OverwriteSavedWonderCardWithReceivedCard(const struct WonderCard * data);
void MEvent_WonderCardResetUnk08_6(struct WonderCard * buffer);
bool32 MEvent_ReceiveDistributionMon(const u16 * data);
void BuildMEventClientHeader(struct MEventClientHeaderStruct * data);
bool32 ValidateMEventClientHeader(const struct MEventClientHeaderStruct * data);
u32 sub_8144418(const u16 * a0, const struct MEventClientHeaderStruct * a1, void *unused);
u32 MEvent_CanPlayerReceiveDistributionMon(const u16 * a0, const struct MEventClientHeaderStruct * a1, void *unused);
bool32 sub_8144474(const struct MEventClientHeaderStruct * a0, const u16 * a1);
u16 sub_81444B0(const struct MEventClientHeaderStruct * a0, u32 command);
bool32 InitWonderCardResources(struct WonderCard * r5, struct WonderCardMetadata * r6);
bool32 InitWonderNewsResources(const struct WonderNews * a0);
s32 FadeToWonderCardMenu(void);
s32 FadeToWonderNewsMenu(void);
void DestroyWonderCard(void);
void DestroyWonderNews(void);
void DestroyWonderCardResources(void);
void DestroyWonderNewsResources(void);
s32 FadeOutFromWonderCard(bool32 flag);
s32 FadeOutFromWonderNews(bool32 flag);
bool32 CheckReceivedGiftFromWonderCard(void);
void MENews_AddScrollIndicatorArrowPair(void);
void MENews_RemoveScrollIndicatorArrowPair(void);
bool32 WonderNews_Test_Unk_02(void);
bool32 WonderCard_Test_Unk_08_6(void);
u32 MENews_GetInput(u16 input);
void InitMEventData(void);
u16 MEvent_GetBattleCardCount(u32 command);
void MEvent_RecordIdOfWonderCardSenderByEventType(u32 eventId, u32 trainerId);
u16 *GetMEventProfileECWordsMaybe(void);
void ResetReceivedWonderCardFlag(void);
bool32 MEventHandleReceivedWonderCard(u16 flagId);
u16 GetWonderCardFlagId(void);

#endif //GUARD_MEVENT_H
