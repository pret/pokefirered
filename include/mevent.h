#ifndef GUARD_MEVENT_H
#define GUARD_MEVENT_H

#include "global.h"

struct MEventStruct_Unk1442CC
{
    u32 unk_00;
    u16 unk_04;
    u32 unk_08;
    u16 unk_0C;
    u32 unk_10;
    u16 unk_14;
    u16 unk_16[4];
    struct MEventBuffer_3430_Sub unk_20;
    u8 unk_44;
    u8 unk_45[7];
    u8 unk_4C[4];
    u16 unk_50[6];
    u8 unk_5C[4];
    u8 unk_60;
};

struct MEvent_Str_1
{
    u16 status;
    size_t size;
    const void * data;
};

struct MEvent_Str_2
{
    u8 fill_00[0x40];
};

struct MEventBuffer_3120_Sub * GetSavedWonderNews(void);
struct MEventBuffer_32E0_Sub * GetSavedWonderCard(void);
struct MEventBuffer_3430_Sub * sav1_get_mevent_buffer_2(void);
struct MENewsJisanStruct * GetMENewsJisanStructPtr(void);
bool32 sub_8143DC8(const struct MEventBuffer_3120_Sub * src);
bool32 ValidateReceivedWonderNews(void);
bool32 ValidateReceivedWonderCard(void);
bool32 sub_8143EF4(const u8 * src);
bool32 sub_8143F68(const struct MEventBuffer_32E0_Sub * data);
void sub_814410C(struct MEventBuffer_32E0_Sub * buffer);
bool32 sub_8144254(const u16 * data);
void sub_81442CC(struct MEventStruct_Unk1442CC * data);
bool32 sub_81443D4(const struct MEventStruct_Unk1442CC * data);
u32 sub_8144418(const u16 * a0, const struct MEventStruct_Unk1442CC * a1, void * unused);
u32 sub_8144434(const u16 * a0, const struct MEventStruct_Unk1442CC * a1, void * unused);
bool32 sub_8144474(const struct MEventStruct_Unk1442CC * a0, const u16 * a1);
u16 sub_81444B0(const struct MEventStruct_Unk1442CC * a0, u32 command);
bool32 InitWonderCardResources(struct MEventBuffer_32E0_Sub * r5, struct MEventBuffer_3430_Sub * r6);
bool32 InitWonderNewsResources(const struct MEventBuffer_3120_Sub * a0);
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
void sub_8143D24(void);
u16 sub_81445C0(u32 command);
void sub_8144714(u32 a0, u32 a1);

#endif //GUARD_MEVENT_H
