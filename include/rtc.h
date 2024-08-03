#ifndef GUARD_RTC_UTIL_H
#define GUARD_RTC_UTIL_H

#include "siirtc.h"

#define RTC_INIT_ERROR         0x0001
#define RTC_INIT_WARNING       0x0002

#define RTC_ERR_12HOUR_CLOCK   0x0010
#define RTC_ERR_POWER_FAILURE  0x0020
#define RTC_ERR_INVALID_YEAR   0x0040
#define RTC_ERR_INVALID_MONTH  0x0080
#define RTC_ERR_INVALID_DAY    0x0100
#define RTC_ERR_INVALID_HOUR   0x0200
#define RTC_ERR_INVALID_MINUTE 0x0400
#define RTC_ERR_INVALID_SECOND 0x0800

#define RTC_ERR_FLAG_MASK      0x0FF0

//Morning and evening don't exist in Gen 3
#if OW_TIMES_OF_DAY == GEN_3
    #define MORNING_HOUR_BEGIN 0
    #define MORNING_HOUR_END   0

    #define DAY_HOUR_BEGIN     12
    #define DAY_HOUR_END       HOURS_PER_DAY

    #define EVENING_HOUR_BEGIN 0
    #define EVENING_HOUR_END   0

    #define NIGHT_HOUR_BEGIN   0
    #define NIGHT_HOUR_END     12
//Evening doesn't exist in Gen 4
#elif OW_TIMES_OF_DAY == GEN_4
    #define MORNING_HOUR_BEGIN 4
    #define MORNING_HOUR_END   10

    #define DAY_HOUR_BEGIN     10
    #define DAY_HOUR_END       20

    #define EVENING_HOUR_BEGIN 0
    #define EVENING_HOUR_END   0

    #define NIGHT_HOUR_BEGIN   20
    #define NIGHT_HOUR_END     4
//Gen 5 seasons change the times of day
#elif OW_TIMES_OF_DAY == GEN_5
    #define MORNING_HOUR_BEGIN GetGen5MorningBegin()
    #define MORNING_HOUR_END   GetGen5DayBegin()

    #define DAY_HOUR_BEGIN     GetGen5DayBegin()
    #define DAY_HOUR_END       GetGen5EveningBegin()

    #define EVENING_HOUR_BEGIN GetGen5EveningBegin()
    #define EVENING_HOUR_END   GetGen5NightBegin()

    #define NIGHT_HOUR_BEGIN   GetGen5NightBegin()
    #define NIGHT_HOUR_END     GetGen5MorningBegin()
#elif OW_TIMES_OF_DAY == GEN_6
    #define MORNING_HOUR_BEGIN 4
    #define MORNING_HOUR_END   11

    #define DAY_HOUR_BEGIN     11
    #define DAY_HOUR_END       18

    #define EVENING_HOUR_BEGIN 18
    #define EVENING_HOUR_END   21

    #define NIGHT_HOUR_BEGIN   21
    #define NIGHT_HOUR_END     4
//These are the Sun/Ultra Sun times
#elif OW_TIMES_OF_DAY == GEN_7
    #define MORNING_HOUR_BEGIN 6
    #define MORNING_HOUR_END   10

    #define DAY_HOUR_BEGIN     10
    #define DAY_HOUR_END       17

    #define EVENING_HOUR_BEGIN 17
    #define EVENING_HOUR_END   18

    #define NIGHT_HOUR_BEGIN   18
    #define NIGHT_HOUR_END     6
#elif OW_TIMES_OF_DAY >= GEN_8
    #define MORNING_HOUR_BEGIN 6
    #define MORNING_HOUR_END   10

    #define DAY_HOUR_BEGIN     10
    #define DAY_HOUR_END       19

    #define EVENING_HOUR_BEGIN 19
    #define EVENING_HOUR_END   20

    #define NIGHT_HOUR_BEGIN   20
    #define NIGHT_HOUR_END     6
#endif

#define TIME_MORNING           0
#define TIME_DAY               1
#define TIME_EVENING           2
#define TIME_NIGHT             3

#define SEASON_SPRING   0
#define SEASON_SUMMER   1
#define SEASON_AUTUMN   2
#define SEASON_WINTER   3

extern struct Time gLocalTime;

void RtcDisableInterrupts(void);
void RtcRestoreInterrupts(void);
u32 ConvertBcdToBinary(u8 bcd);
bool8 IsLeapYear(u32 year);
u16 ConvertDateToDayCount(u8 year, u8 month, u8 day);
u16 RtcGetDayCount(struct SiiRtcInfo *rtc);
void RtcInit(void);
u16 RtcGetErrorStatus(void);
void RtcGetInfo(struct SiiRtcInfo *rtc);
void RtcGetDateTime(struct SiiRtcInfo *rtc);
void RtcGetStatus(struct SiiRtcInfo *rtc);
void RtcGetRawInfo(struct SiiRtcInfo *rtc);
u16 RtcCheckInfo(struct SiiRtcInfo *rtc);
void RtcReset(void);
void FormatDecimalTime(u8 *dest, s32 hour, s32 minute, s32 second);
void FormatHexTime(u8 *dest, s32 hour, s32 minute, s32 second);
void FormatHexRtcTime(u8 *dest);
void FormatDecimalDate(u8 *dest, s32 year, s32 month, s32 day);
void FormatHexDate(u8 *dest, s32 year, s32 month, s32 day);
void RtcCalcTimeDifference(struct SiiRtcInfo *rtc, struct Time *result, struct Time *t);
void RtcCalcLocalTime(void);
bool8 IsBetweenHours(s32 hours, s32 begin, s32 end);
u8 GetTimeOfDay(void);
void RtcInitLocalTimeOffset(s32 hour, s32 minute);
void RtcCalcLocalTimeOffset(s32 days, s32 hours, s32 minutes, s32 seconds);
void CalcTimeDifference(struct Time *result, struct Time *t1, struct Time *t2);
u32 RtcGetMinuteCount(void);
u32 RtcGetLocalDayCount(void);
void FormatDecimalTimeWithoutSeconds(u8 *dest, s8 hour, s8 minute, bool32 is24Hour);
u8 GetCurrentHour(void);
u8 GetCurrentMinute(void);
u8 GetSeason(void);
u8 GetSeasonDay(void);

static inline s32 GetGen5MorningBegin()
{
    switch (GetSeason())
    {
        case SEASON_SPRING:
        default:
            return 5;
        case SEASON_SUMMER:
            return 4;
        case SEASON_AUTUMN:
            return 6;
        case SEASON_WINTER:
            return 7;
    }
}

static inline s32 GetGen5DayBegin()
{
    switch (GetSeason())
    {
        case SEASON_SPRING:
        default:
            return 10;
        case SEASON_SUMMER:
            return 9;
        case SEASON_AUTUMN:
            return 10;
        case SEASON_WINTER:
            return 11;
    }
}

static inline s32 GetGen5EveningBegin()
{
    switch (GetSeason())
    {
        case SEASON_SPRING:
        default:
            return 17;
        case SEASON_SUMMER:
            return 19;
        case SEASON_AUTUMN:
            return 18;
        case SEASON_WINTER:
            return 17;
    }
}

static inline s32 GetGen5NightBegin()
{
    switch (GetSeason())
    {
        case SEASON_SPRING:
        default:
            return 20;
        case SEASON_SUMMER:
            return 21;
        case SEASON_AUTUMN:
            return 20;
        case SEASON_WINTER:
            return 19;
    }
}

#endif // GUARD_RTC_UTIL_H
