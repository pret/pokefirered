#include "global.h"
#include "mystery_gift.h"
#include "random.h"
#include "event_data.h"
#include "wonder_news.h"
#include "constants/items.h"

static u32 GetMENewsJisanRewardItem(struct WonderNewsMetadata *);
static void MENewsJisanIncrementCounterUnk0_5(struct WonderNewsMetadata *);
static u32 GetMENewsJisanState(struct WonderNewsMetadata *);
static void MENewsJisanIncrementCounterUnk0_2(struct WonderNewsMetadata *);
static void MENewsJisanResetCounterUnk0_2(struct WonderNewsMetadata *);

void MENewsJisan_SetRandomReward(u32 a0)
{
    struct WonderNewsMetadata *r5 = GetMENewsJisanStructPtr();

    r5->unk_0_0 = a0;
    switch (a0)
    {
    case 0:
        break;
    case 1:
    case 2:
        r5->berry = (Random() % 15) + ITEM_TO_BERRY(ITEM_RAZZ_BERRY);
        break;
    case 3:
        r5->berry = (Random() % 15) + ITEM_TO_BERRY(ITEM_CHERI_BERRY);
        break;
    }
}

void MENewsJisanReset(void)
{
    struct WonderNewsMetadata *r5 = GetMENewsJisanStructPtr();

    r5->unk_0_0 = 0;
    r5->unk_0_2 = 0;
    r5->unk_0_5 = 0;
    r5->berry = 0;
    VarSet(VAR_MENEWS_JISAN_STEP_COUNTER, 0);
}

void MENewsJisanStepCounter(void)
{
    u16 *r4 = GetVarPointer(VAR_MENEWS_JISAN_STEP_COUNTER);
    struct WonderNewsMetadata *r2 = GetMENewsJisanStructPtr();
    struct WonderNewsMetadata r0 = *r2;

    if ((u8)r0.unk_0_5 > 4 && ++(*r4) >= 500)
    {
        r2->unk_0_5 = 0;
        *r4 = 0;
    }
}

u16 GetMENewsJisanItemAndState(void)
{
    u16 *r6 = &gSpecialVar_Result;
    struct WonderNewsMetadata *r4 = GetMENewsJisanStructPtr();
    u16 r5;

    if (!IsMysteryGiftEnabled() || !ValidateReceivedWonderNews())
        return 0;

    r5 = GetMENewsJisanState(r4);

    switch (r5)
    {
    case 0:
        break;
    case 1:
        *r6 = GetMENewsJisanRewardItem(r4);
        break;
    case 2:
        *r6 = GetMENewsJisanRewardItem(r4);
        break;
    case 3:
        break;
    case 4:
        *r6 = GetMENewsJisanRewardItem(r4);
        MENewsJisanIncrementCounterUnk0_2(r4);
        break;
    case 5:
        *r6 = GetMENewsJisanRewardItem(r4);
        MENewsJisanResetCounterUnk0_2(r4);
        break;
    case 6:
        break;
    }

    return r5;
}

static u32 GetMENewsJisanRewardItem(struct WonderNewsMetadata *a0)
{
    u32 r4;

    a0->unk_0_0 = 0;
    r4 = a0->berry + FIRST_BERRY_INDEX - 1;
    a0->berry = 0;
    MENewsJisanIncrementCounterUnk0_5(a0);
    return r4;
}

static void MENewsJisanResetCounterUnk0_2(struct WonderNewsMetadata *a0)
{
    a0->unk_0_2 = 0;
}

static void MENewsJisanIncrementCounterUnk0_2(struct WonderNewsMetadata *a0)
{
    a0->unk_0_2++;
    if ((u8)a0->unk_0_2 > 4)
        a0->unk_0_2 = 4;
}

static void MENewsJisanIncrementCounterUnk0_5(struct WonderNewsMetadata *a0)
{
    a0->unk_0_5++;
    if ((u8)a0->unk_0_5 > 5)
        a0->unk_0_5 = 5;
}

static u32 GetMENewsJisanState(struct WonderNewsMetadata *a0)
{
    struct WonderNewsMetadata r0;
    if ((u8)a0->unk_0_5 == 5)
        return 6;

    r0 = *a0;
    switch (r0.unk_0_0)
    {
    case 0:
        return 3;
    case 1:
        return 1;
    case 2:
        return 2;
    case 3:
        if ((u8)r0.unk_0_2 < 3)
            return 4;
        return 5;
    default:
        AGB_ASSERT_EX(0, ABSPATH("menews_jisan.c"), 383);
        return 0;
    }
}
