#include "global.h"
#include "string_util.h"
#include "strings.h"
#include "text.h"
#include "rtc.h"
#include "fake_rtc.h"
#include "event_data.h"

struct Time *FakeRtc_GetCurrentTime(void)
{
#if OW_USE_FAKE_RTC
    return &gSaveBlock3Ptr->fakeRTC;
#else
    return NULL;
#endif
}


static void FakeRtc_ConvertTimeToRtc(struct SiiRtcInfo* rtc, struct Time *time)
{
    u8 day = 1;
    u8 month = MONTH_JAN;
    u16 year = 2000;
    u16 days = time->days - 1;

    rtc->second = time->seconds;
    rtc->minute = time->minutes;
    rtc->hour = time->hours;

    while (days > (365 + ((month > MONTH_FEB && IsLeapYear(year + 1)) || (month <= MONTH_FEB && IsLeapYear(year)))))
    {
        days -= (365 + ((month > MONTH_FEB && IsLeapYear(year + 1)) || (month <= MONTH_FEB && IsLeapYear(year))));
        year++;
    }

    while (days > ((sNumDaysInMonths[month - 1] + (month == MONTH_FEB && IsLeapYear(year))) - day))
    {
        days -= (sNumDaysInMonths[month - 1] + (month == MONTH_FEB && IsLeapYear(year)));
        day = 1;
        month++;
    }

    while (month > 12)
    {
        year++;
        month -= 12;
    }

    year -= 2000;

    rtc->day = day + days;
    rtc->month = month;
    rtc->year = year;
}

void FakeRtc_GetRawInfo(struct SiiRtcInfo *rtc)
{
    struct Time* time = FakeRtc_GetCurrentTime();
    FakeRtc_ConvertTimeToRtc(rtc, time);
}

void FakeRtc_TickTimeForward(void)
{
    if (!OW_USE_FAKE_RTC)
        return;

    if (FlagGet(OW_FLAG_PAUSE_TIME))
        return;

    FakeRtc_AdvanceTimeBy(0, 0, 0, FakeRtc_GetSecondsRatio());
}

void FakeRtc_AdvanceTimeBy(s16 days, u32 hours, u32 minutes, u32 seconds)
{
    struct Time* time = FakeRtc_GetCurrentTime();
    if (time == NULL)
        return;
    seconds += time->seconds;
    minutes += time->minutes;
    hours += time->hours;
    days += time->days;

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

    time->seconds = seconds;
    time->minutes = minutes;
    time->hours = hours;
    time->days = days;
}

void FakeRtc_ManuallySetTime(u32 hour, u32 minute, u32 second)
{
    struct Time diff, target;
    RtcCalcLocalTime();

    target.hours = hour;
    target.minutes = minute;
    target.seconds = second;
    target.days = gLocalTime.days;

    CalcTimeDifference(&diff, &gLocalTime, &target);
    FakeRtc_AdvanceTimeBy(diff.days, diff.hours, diff.minutes, diff.seconds);
}

u32 FakeRtc_GetSecondsRatio(void)
{
    return (OW_ALTERED_TIME_RATIO == GEN_8_PLA) ? 60 :
           (OW_ALTERED_TIME_RATIO == GEN_9)     ? 20 :
                                                  1;
}

STATIC_ASSERT((OW_FLAG_PAUSE_TIME == 0 || OW_USE_FAKE_RTC == TRUE), FakeRtcMustBeTrueToPauseTime);

void Script_PauseFakeRtc(void)
{
    FlagSet(OW_FLAG_PAUSE_TIME);
}

void Script_ResumeFakeRtc(void)
{
    FlagClear(OW_FLAG_PAUSE_TIME);
}

void Script_ToggleFakeRtc(void)
{
    FlagToggle(OW_FLAG_PAUSE_TIME);
}
