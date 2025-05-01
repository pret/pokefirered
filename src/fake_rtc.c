#include "global.h"
#include "string_util.h"
#include "strings.h"
#include "text.h"
#include "rtc.h"
#include "fake_rtc.h"
#include "event_data.h"
#include "script.h"

void FakeRtc_Reset(void)
{
#if OW_USE_FAKE_RTC
    memset(&gSaveBlock3Ptr->fakeRTC, 0, sizeof(gSaveBlock3Ptr->fakeRTC));
    gSaveBlock3Ptr->fakeRTC.month = MONTH_JAN;
    gSaveBlock3Ptr->fakeRTC.day = 1;
    gSaveBlock3Ptr->fakeRTC.dayOfWeek = WEEKDAY_SAT;
#endif
}

struct SiiRtcInfo *FakeRtc_GetCurrentTime(void)
{
#if OW_USE_FAKE_RTC
    return &gSaveBlock3Ptr->fakeRTC;
#else
    return NULL;
#endif
}

void FakeRtc_GetRawInfo(struct SiiRtcInfo *rtc)
{
    struct SiiRtcInfo *fakeRtc = FakeRtc_GetCurrentTime();
    if (fakeRtc != NULL)
        memcpy(rtc, fakeRtc, sizeof(struct SiiRtcInfo));
}

void FakeRtc_TickTimeForward(void)
{
    if (!OW_USE_FAKE_RTC)
        return;

    if (FlagGet(OW_FLAG_PAUSE_TIME))
        return;

    FakeRtc_AdvanceTimeBy(0, 0, 0, FakeRtc_GetSecondsRatio());
}

void FakeRtc_AdvanceTimeBy(u32 days, u32 hours, u32 minutes, u32 seconds)
{
    struct SiiRtcInfo *rtc = FakeRtc_GetCurrentTime();
    
    seconds += rtc->second;
    minutes += rtc->minute;
    hours += rtc->hour;

    while(seconds >= SECONDS_PER_MINUTE)
    {
        minutes++;
        seconds -= SECONDS_PER_MINUTE;
    }

    while(minutes >= MINUTES_PER_HOUR)
    {
        hours++;
        minutes -= MINUTES_PER_HOUR;
    }

    while(hours >= HOURS_PER_DAY)
    {
        days++;
        hours -= HOURS_PER_DAY;
    }

    rtc->second = seconds;
    rtc->minute = minutes;
    rtc->hour = hours;

    while (days > 0)
    {
        u32 remainingDaysInMonth = (sNumDaysInMonths[rtc->month - 1] + (rtc->month == MONTH_FEB && IsLeapYear(rtc->year)) - rtc->day);

        if (days > remainingDaysInMonth)
        {
            rtc->day = 1;
            rtc->month++;
            if (rtc->month > MONTH_DEC)
            {
                rtc->month = MONTH_JAN;
                rtc->year++;
            }
            days -= (remainingDaysInMonth + 1);
            rtc->dayOfWeek = (rtc->dayOfWeek + remainingDaysInMonth + 1) % WEEKDAY_COUNT;
        }
        else
        {
            rtc->day += days;
            rtc->dayOfWeek = (rtc->dayOfWeek + days) % WEEKDAY_COUNT;
            days = 0;
        }
    }
}


void FakeRtc_ManuallySetTime(u32 day, u32 hour, u32 minute, u32 second)
{
    FakeRtc_Reset();
    FakeRtc_AdvanceTimeBy(day > 0 ? day - 1 : 0, hour, minute, second);
}

void AdvanceScript(void)
{
    FakeRtc_AdvanceTimeBy(300, 0, 0, 0);
}

u32 FakeRtc_GetSecondsRatio(void)
{
    return (OW_ALTERED_TIME_RATIO == GEN_8_PLA)   ? 60 :
           (OW_ALTERED_TIME_RATIO == GEN_9)       ? 20 :
           (OW_ALTERED_TIME_RATIO == TIME_DEBUG)  ?  1 :
                                                     1;
}

STATIC_ASSERT((OW_FLAG_PAUSE_TIME == 0 || OW_USE_FAKE_RTC == TRUE), FakeRtcMustBeTrueToPauseTime);

void Script_PauseFakeRtc(void)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    FlagSet(OW_FLAG_PAUSE_TIME);
}

void Script_ResumeFakeRtc(void)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    FlagClear(OW_FLAG_PAUSE_TIME);
}

void Script_ToggleFakeRtc(void)
{
    Script_RequestEffects(SCREFF_V1 | SCREFF_SAVE);

    FlagToggle(OW_FLAG_PAUSE_TIME);
}
