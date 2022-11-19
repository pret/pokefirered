#include "global.h"
#include "mystery_gift.h"
#include "random.h"
#include "event_data.h"
#include "wonder_news.h"
#include "constants/items.h"

/*
    Wonder News related functions.
    Because this feature is largely unused, the names in here are
    mostly nebulous and without a real indication of purpose.
*/

enum {
    NEWS_VAL_INVALID,
    NEWS_VAL_RECV_FRIEND,
    NEWS_VAL_RECV_WIRELESS,
    NEWS_VAL_NONE,
    NEWS_VAL_SENT,
    NEWS_VAL_SENT_MAX,
    NEWS_VAL_GET_MAX,
};

static u32 GetMENewsJisanRewardItem(struct WonderNewsMetadata *);
static void MENewsJisanIncrementCounterUnk0_5(struct WonderNewsMetadata *);
static u32 GetMENewsJisanState(struct WonderNewsMetadata *);
static void MENewsJisanIncrementCounterUnk0_2(struct WonderNewsMetadata *);
static void MENewsJisanResetCounterUnk0_2(struct WonderNewsMetadata *);

void WonderNews_SetReward(u32 newsType)
{
    struct WonderNewsMetadata *data = GetSavedWonderNewsMetadata();

    data->newsType = newsType;
    switch (newsType)
    {
    case WONDER_NEWS_NONE:
        break;
    case WONDER_NEWS_RECV_FRIEND:
    case WONDER_NEWS_RECV_WIRELESS:
        data->berry = (Random() % 15) + ITEM_TO_BERRY(ITEM_RAZZ_BERRY);
        break;
    case WONDER_NEWS_SENT:
        data->berry = (Random() % 15) + ITEM_TO_BERRY(ITEM_CHERI_BERRY);
        break;
    }
}

void WonderNews_Reset(void)
{
    struct WonderNewsMetadata *r5 = GetSavedWonderNewsMetadata();

    r5->newsType = 0;
    r5->unk_0_2 = 0;
    r5->unk_0_5 = 0;
    r5->berry = 0;
    VarSet(VAR_WONDER_NEWS_STEP_COUNTER, 0);
}

void WonderNews_IncrementStepCounter(void)
{
    u16 *stepCounter = GetVarPointer(VAR_WONDER_NEWS_STEP_COUNTER);
    struct WonderNewsMetadata *data = GetSavedWonderNewsMetadata();

    if (data->unk_0_5 > 4 && ++(*stepCounter) >= 500)
    {
        data->unk_0_5 = 0;
        *stepCounter = 0;
    }
}

u16 GetMENewsJisanItemAndState(void)
{
    u16 *result = &gSpecialVar_Result;
    struct WonderNewsMetadata *data = GetSavedWonderNewsMetadata();
    u16 r5;

    if (!IsMysteryGiftEnabled() || !ValidateSavedWonderNews())
        return 0;

    r5 = GetMENewsJisanState(data);

    switch (r5)
    {
    case 0:
        break;
    case 1:
        *result = GetMENewsJisanRewardItem(data);
        break;
    case 2:
        *result = GetMENewsJisanRewardItem(data);
        break;
    case 3:
        break;
    case 4:
        *result = GetMENewsJisanRewardItem(data);
        MENewsJisanIncrementCounterUnk0_2(data);
        break;
    case 5:
        *result = GetMENewsJisanRewardItem(data);
        MENewsJisanResetCounterUnk0_2(data);
        break;
    case 6:
        break;
    }

    return r5;
}

static u32 GetMENewsJisanRewardItem(struct WonderNewsMetadata *a0)
{
    u32 r4;

    a0->newsType = 0;
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

static u32 GetMENewsJisanState(struct WonderNewsMetadata *data)
{
    if (data->unk_0_5 == 5)
        return 6;

    switch (data->newsType)
    {
    case WONDER_NEWS_NONE:
        return 3;
    case WONDER_NEWS_RECV_FRIEND:
        return 1;
    case WONDER_NEWS_RECV_WIRELESS:
        return 2;
    case WONDER_NEWS_SENT:
        if (data->unk_0_2 < 3)
            return 4;
        return 5;
    default:
        AGB_ASSERT_EX(0, ABSPATH("menews_jisan.c"), 383);
        return 0;
    }
}
