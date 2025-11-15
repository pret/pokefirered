#include "global.h"
// #include "battle_pike.h"
// #include "battle_pyramid.h"
#include "datetime.h"
#include "rtc.h"
#include "string_util.h"
#include "strings.h"
#include "text.h"
#include "fake_rtc.h"
#include "overworld.h"

// iwram bss
static u16 sErrorStatus;
static struct SiiRtcInfo sRtc;
static u8 sProbeResult;
static u16 sSavedIme;

// iwram common
COMMON_DATA struct Time gLocalTime = {0};

EWRAM_DATA enum Season gLoadedSeason = SEASON_SPRING;

// const rom
static const u8 sText_SpringName[] = _("Spring");
static const u8 sText_SummerName[] = _("Summer");
static const u8 sText_AutumnName[] = _("Autumn");
static const u8 sText_WinterName[] = _("Winter");

static const struct SiiRtcInfo sRtcDummy = {0, MONTH_JAN, 1}; // 2000 Jan 1

const s32 sNumDaysInMonths[MONTH_COUNT] =
{
    [MONTH_JAN - 1] = 31,
    [MONTH_FEB - 1] = 28,
    [MONTH_MAR - 1] = 31,
    [MONTH_APR - 1] = 30,
    [MONTH_MAY - 1] = 31,
    [MONTH_JUN - 1] = 30,
    [MONTH_JUL - 1] = 31,
    [MONTH_AUG - 1] = 31,
    [MONTH_SEP - 1] = 30,
    [MONTH_OCT - 1] = 31,
    [MONTH_NOV - 1] = 30,
    [MONTH_DEC - 1] = 31,
};

static const u32 sTimeOfDayStarts[SEASON_WINTER + 1][TIME_NIGHT + 1] = {
    [SEASON_SPRING] = {
        [TIME_MORNING] = 5,
        [TIME_DAY] = 10,
        [TIME_EVENING] = 17,
        [TIME_NIGHT] = 20,
    },
    [SEASON_SUMMER] = {
        [TIME_MORNING] = 4,
        [TIME_DAY] = 9,
        [TIME_EVENING] = 19,
        [TIME_NIGHT] = 21,
    },
    [SEASON_AUTUMN] = {
        [TIME_MORNING] = 6,
        [TIME_DAY] = 10,
        [TIME_EVENING] = 18,
        [TIME_NIGHT] = 20,
    },
    [SEASON_WINTER] = {
        [TIME_MORNING] = 7,
        [TIME_DAY] = 11,
        [TIME_EVENING] = 17,
        [TIME_NIGHT] = 19,
    },
};

void RtcDisableInterrupts(void)
{
    sSavedIme = REG_IME;
    REG_IME = 0;
}

void RtcRestoreInterrupts(void)
{
    REG_IME = sSavedIme;
}

u32 ConvertBcdToBinary(u8 bcd)
{
    if (OW_USE_FAKE_RTC)
        return bcd;

    if (bcd > 0x9F)
        return 0xFF;

    if ((bcd & 0xF) <= 9)
        return (10 * ((bcd >> 4) & 0xF)) + (bcd & 0xF);
    else
        return 0xFF;
}

bool8 IsLeapYear(u32 year)
{
    if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))
        return TRUE;

    return FALSE;
}

u16 ConvertDateToDayCount(u8 year, u8 month, u8 day)
{
    s32 i;
    u16 dayCount = 0;

    for (i = year - 1; i >= 0; i--)
    {
        dayCount += 365;

        if (IsLeapYear(i) == TRUE)
            dayCount++;
    }

    for (i = 0; i < month - 1; i++)
        dayCount += sNumDaysInMonths[i];

    if (month > MONTH_FEB && IsLeapYear(year) == TRUE)
        dayCount++;

    dayCount += day;

    return dayCount;
}

u16 RtcGetDayCount(struct SiiRtcInfo *rtc)
{
    u8 year, month, day;

    year = ConvertBcdToBinary(rtc->year);
    month = ConvertBcdToBinary(rtc->month);
    day = ConvertBcdToBinary(rtc->day);
    return ConvertDateToDayCount(year, month, day);
}

void RtcInit(void)
{
    if (OW_USE_FAKE_RTC)
        return;

    sErrorStatus = 0;

    RtcDisableInterrupts();
    SiiRtcUnprotect();
    sProbeResult = SiiRtcProbe();
    RtcRestoreInterrupts();

    if ((sProbeResult & 0xF) != 1)
    {
        sErrorStatus = RTC_INIT_ERROR;
        return;
    }

    if (sProbeResult & 0xF0)
        sErrorStatus = RTC_INIT_WARNING;
    else
        sErrorStatus = 0;

    RtcGetRawInfo(&sRtc);
    sErrorStatus = RtcCheckInfo(&sRtc);
}

u16 RtcGetErrorStatus(void)
{
    return (OW_USE_FAKE_RTC) ? 0 : sErrorStatus;
}

void RtcGetInfo(struct SiiRtcInfo *rtc)
{
    if (OW_USE_FAKE_RTC)
        FakeRtc_GetRawInfo(rtc);
    else if (sErrorStatus & RTC_ERR_FLAG_MASK)
        *rtc = sRtcDummy;
    else
        RtcGetRawInfo(rtc);
}

void RtcGetDateTime(struct SiiRtcInfo *rtc)
{
    RtcDisableInterrupts();
    SiiRtcGetDateTime(rtc);
    RtcRestoreInterrupts();
}

void RtcGetStatus(struct SiiRtcInfo *rtc)
{
    RtcDisableInterrupts();
    SiiRtcGetStatus(rtc);
    RtcRestoreInterrupts();
}

void RtcGetRawInfo(struct SiiRtcInfo *rtc)
{
    RtcGetStatus(rtc);
    RtcGetDateTime(rtc);
}

u16 RtcCheckInfo(struct SiiRtcInfo *rtc)
{
    u16 errorFlags = 0;
    s32 year;
    s32 month;
    s32 value;

    if (OW_USE_FAKE_RTC)
        return 0;

    if (rtc->status & SIIRTCINFO_POWER)
        errorFlags |= RTC_ERR_POWER_FAILURE;

    if (!(rtc->status & SIIRTCINFO_24HOUR))
        errorFlags |= RTC_ERR_12HOUR_CLOCK;

    year = ConvertBcdToBinary(rtc->year);

    if (year == 0xFF)
        errorFlags |= RTC_ERR_INVALID_YEAR;

    month = ConvertBcdToBinary(rtc->month);

    if (month == 0xFF || month == 0 || month > MONTH_COUNT)
        errorFlags |= RTC_ERR_INVALID_MONTH;

    value = ConvertBcdToBinary(rtc->day);

    if (value == 0xFF)
        errorFlags |= RTC_ERR_INVALID_DAY;

    if (month == MONTH_FEB)
    {
        if (value > IsLeapYear(year) + sNumDaysInMonths[month - 1])
            errorFlags |= RTC_ERR_INVALID_DAY;
    }
    else
    {
        if (value > sNumDaysInMonths[month - 1])
            errorFlags |= RTC_ERR_INVALID_DAY;
    }

    value = ConvertBcdToBinary(rtc->hour);

    if (value > HOURS_PER_DAY)
        errorFlags |= RTC_ERR_INVALID_HOUR;

    value = ConvertBcdToBinary(rtc->minute);

    if (value > MINUTES_PER_HOUR)
        errorFlags |= RTC_ERR_INVALID_MINUTE;

    value = ConvertBcdToBinary(rtc->second);

    if (value > SECONDS_PER_MINUTE)
        errorFlags |= RTC_ERR_INVALID_SECOND;

    return errorFlags;
}

void RtcReset(void)
{
    if (OW_USE_FAKE_RTC)
    {
        FakeRtc_Reset();
        return;
    }

    RtcDisableInterrupts();
    SiiRtcReset();
    RtcRestoreInterrupts();
}

void FormatDecimalTime(u8 *dest, s32 hour, s32 minute, s32 second)
{
    dest = ConvertIntToDecimalStringN(dest, hour, STR_CONV_MODE_LEADING_ZEROS, 2);
    *dest++ = CHAR_COLON;
    dest = ConvertIntToDecimalStringN(dest, minute, STR_CONV_MODE_LEADING_ZEROS, 2);
    *dest++ = CHAR_COLON;
    dest = ConvertIntToDecimalStringN(dest, second, STR_CONV_MODE_LEADING_ZEROS, 2);
    *dest = EOS;
}

void FormatHexTime(u8 *dest, s32 hour, s32 minute, s32 second)
{
    dest = ConvertIntToHexStringN(dest, hour, STR_CONV_MODE_LEADING_ZEROS, 2);
    *dest++ = CHAR_COLON;
    dest = ConvertIntToHexStringN(dest, minute, STR_CONV_MODE_LEADING_ZEROS, 2);
    *dest++ = CHAR_COLON;
    dest = ConvertIntToHexStringN(dest, second, STR_CONV_MODE_LEADING_ZEROS, 2);
    *dest = EOS;
}

void FormatHexRtcTime(u8 *dest)
{
    FormatHexTime(dest, sRtc.hour, sRtc.minute, sRtc.second);
}

void FormatDecimalDate(u8 *dest, s32 year, s32 month, s32 day)
{
    dest = ConvertIntToDecimalStringN(dest, year, STR_CONV_MODE_LEADING_ZEROS, 4);
    *dest++ = CHAR_HYPHEN;
    dest = ConvertIntToDecimalStringN(dest, month, STR_CONV_MODE_LEADING_ZEROS, 2);
    *dest++ = CHAR_HYPHEN;
    dest = ConvertIntToDecimalStringN(dest, day, STR_CONV_MODE_LEADING_ZEROS, 2);
    *dest = EOS;
}

void FormatHexDate(u8 *dest, s32 year, s32 month, s32 day)
{
    dest = ConvertIntToHexStringN(dest, year, STR_CONV_MODE_LEADING_ZEROS, 4);
    *dest++ = CHAR_HYPHEN;
    dest = ConvertIntToHexStringN(dest, month, STR_CONV_MODE_LEADING_ZEROS, 2);
    *dest++ = CHAR_HYPHEN;
    dest = ConvertIntToHexStringN(dest, day, STR_CONV_MODE_LEADING_ZEROS, 2);
    *dest = EOS;
}

void RtcCalcTimeDifference(struct SiiRtcInfo *rtc, struct Time *result, struct Time *t)
{
    u16 days = RtcGetDayCount(rtc);
    result->seconds = ConvertBcdToBinary(rtc->second) - t->seconds;
    result->minutes = ConvertBcdToBinary(rtc->minute) - t->minutes;
    result->hours = ConvertBcdToBinary(rtc->hour) - t->hours;
    result->days = days - t->days;

    if (result->seconds < 0)
    {
        result->seconds += SECONDS_PER_MINUTE;
        --result->minutes;
    }

    if (result->minutes < 0)
    {
        result->minutes += MINUTES_PER_HOUR;
        --result->hours;
    }

    if (result->hours < 0)
    {
        result->hours += HOURS_PER_DAY;
        --result->days;
    }
}

void RtcCalcLocalTime(void)
{
    RtcGetInfo(&sRtc);
    RtcCalcTimeDifference(&sRtc, &gLocalTime, &gSaveBlock2Ptr->localTimeOffset);
}

bool8 IsBetweenHours(s32 hours, s32 begin, s32 end)
{
    if (end < begin)
        return hours >= begin || hours < end;
    else
        return hours >= begin && hours < end;
}

enum TimeOfDay GetTimeOfDay(void)
{
    UpdateTimeOfDay();
    return gTimeOfDay;
}

enum TimeOfDay GetTimeOfDayForDex(void)
{
    enum TimeOfDay timeOfDay = OW_TIME_OF_DAY_ENCOUNTERS ? GetTimeOfDay() : TIME_OF_DAY_DEFAULT;
    return GenConfigTimeOfDay(timeOfDay);
}

void RtcInitLocalTimeOffset(s32 hour, s32 minute)
{
    RtcCalcLocalTimeOffset(0, hour, minute, 0);
}

void RtcCalcLocalTimeOffset(s32 days, s32 hours, s32 minutes, s32 seconds)
{
    gLocalTime.days = days;
    gLocalTime.hours = hours;
    gLocalTime.minutes = minutes;
    gLocalTime.seconds = seconds;
    FakeRtc_ManuallySetTime(gLocalTime.days, gLocalTime.hours, gLocalTime.minutes, seconds);
    RtcGetInfo(&sRtc);
    RtcCalcTimeDifference(&sRtc, &gSaveBlock2Ptr->localTimeOffset, &gLocalTime);
}

void CalcTimeDifference(struct Time *result, struct Time *t1, struct Time *t2)
{
    result->seconds = t2->seconds - t1->seconds;
    result->minutes = t2->minutes - t1->minutes;
    result->hours = t2->hours - t1->hours;
    result->days = t2->days - t1->days;

    if (result->seconds < 0)
    {
        result->seconds += SECONDS_PER_MINUTE;
        --result->minutes;
    }

    if (result->minutes < 0)
    {
        result->minutes += MINUTES_PER_HOUR;
        --result->hours;
    }

    if (result->hours < 0)
    {
        result->hours += HOURS_PER_DAY;
        --result->days;
    }
}

u32 RtcGetMinuteCount(void)
{
    RtcGetInfo(&sRtc);
    return (HOURS_PER_DAY * MINUTES_PER_HOUR) * RtcGetDayCount(&sRtc) + MINUTES_PER_HOUR * sRtc.hour + sRtc.minute;
}

u32 RtcGetLocalDayCount(void)
{
    return RtcGetDayCount(&sRtc);
}

void FormatDecimalTimeWithoutSeconds(u8 *txtPtr, s8 hour, s8 minute, bool32 is24Hour)
{
    if (is24Hour)
    {
        txtPtr = ConvertIntToDecimalStringN(txtPtr, hour, STR_CONV_MODE_LEADING_ZEROS, 2);
        *txtPtr++ = CHAR_COLON;
        txtPtr = ConvertIntToDecimalStringN(txtPtr, minute, STR_CONV_MODE_LEADING_ZEROS, 2);
    }
    else
    {
        if (hour == 0)
            txtPtr = ConvertIntToDecimalStringN(txtPtr, 12, STR_CONV_MODE_LEADING_ZEROS, 2);
        else if (hour < 13)
            txtPtr = ConvertIntToDecimalStringN(txtPtr, hour, STR_CONV_MODE_LEADING_ZEROS, 2);
        else
            txtPtr = ConvertIntToDecimalStringN(txtPtr, hour - 12, STR_CONV_MODE_LEADING_ZEROS, 2);

        *txtPtr++ = CHAR_COLON;
        txtPtr = ConvertIntToDecimalStringN(txtPtr, minute, STR_CONV_MODE_LEADING_ZEROS, 2);
        txtPtr = StringAppend(txtPtr, gText_Space2);
        if (hour < 12)
            txtPtr = StringAppend(txtPtr, gText_AM);
        else
            txtPtr = StringAppend(txtPtr, gText_PM);
    }

    *txtPtr++ = EOS;
    *txtPtr = EOS;
}

u16 GetFullYear(void)
{
    struct DateTime dateTime;
    RtcCalcLocalTime();
    ConvertTimeToDateTime(&dateTime, &gLocalTime);

    return dateTime.year;
}

enum Month GetMonth(void)
{
    struct DateTime dateTime;
    RtcCalcLocalTime();
    ConvertTimeToDateTime(&dateTime, &gLocalTime);

    return dateTime.month;
}

u8 GetDay(void)
{
    struct DateTime dateTime;
    RtcCalcLocalTime();
    ConvertTimeToDateTime(&dateTime, &gLocalTime);

    return dateTime.day;
}

enum Weekday GetDayOfWeek(void)
{
    struct DateTime dateTime;
    RtcCalcLocalTime();
    ConvertTimeToDateTime(&dateTime, &gLocalTime);

    return dateTime.dayOfWeek;
}

enum TimeOfDay GenConfigTimeOfDay(enum TimeOfDay timeOfDay)
{
    if ((((timeOfDay == TIME_MORNING || timeOfDay == TIME_EVENING) && OW_TIMES_OF_DAY == GEN_3)
        || (timeOfDay == TIME_EVENING && OW_TIMES_OF_DAY == GEN_4))
        && timeOfDay < TIME_LAST)
        timeOfDay++;

    return timeOfDay;
}

enum TimeOfDay TryIncrementTimeOfDay(enum TimeOfDay timeOfDay)
{
    timeOfDay = timeOfDay == TIME_LAST ? TIME_FIRST : timeOfDay + 1;
    return GenConfigTimeOfDay(timeOfDay);
}

enum TimeOfDay TryDecrementTimeOfDay(enum TimeOfDay timeOfDay)
{
    timeOfDay = timeOfDay == TIME_FIRST ? TIME_LAST : timeOfDay - 1;
    return GenConfigTimeOfDay(timeOfDay);
}

u8 GetCurrentHour(void)
{
    RtcCalcLocalTime();
    return gLocalTime.hours;
}

u8 GetCurrentMinute(void)
{
    RtcCalcLocalTime();
    return gLocalTime.minutes;
}

enum Season GetSeason(void)
{
    RtcGetInfo(&sRtc);
    switch(ConvertBcdToBinary(sRtc.month))
    {
        case MONTH_JAN:
        case MONTH_MAY:
        case MONTH_SEP:
        default:
            return SEASON_SPRING;
        case MONTH_FEB:
        case MONTH_JUN:
        case MONTH_OCT:
            return SEASON_SUMMER;
        case MONTH_MAR:
        case MONTH_JUL:
        case MONTH_NOV:
            return SEASON_AUTUMN;
        case MONTH_APR:
        case MONTH_AUG:
        case MONTH_DEC:
            return SEASON_WINTER;
    }
}

const u8* GetSeasonName(enum Season season)
{
    switch (season)
    {
        case SEASON_SPRING:
        default:
            return sText_SpringName;
        case SEASON_SUMMER:
            return sText_SummerName;
        case SEASON_AUTUMN:
            return sText_AutumnName;
        case SEASON_WINTER:
            return sText_WinterName;
    }
}

u8 GetSeasonDay(void)
{
    RtcGetInfo(&sRtc);

    return ConvertBcdToBinary(sRtc.day);
}

u32 GetGen5TimeOfDayStart(enum TimeOfDay timeOfDay)
{
    return sTimeOfDayStarts[GetSeason()][timeOfDay];
}

void UpdateLoadedSeason()
{
    gLoadedSeason = GetSeason();
}
