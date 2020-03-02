#ifndef GUARD_WEATHER_H
#define GUARD_WEATHER_H

#include "global.h"

void FadeScreen(u8, s8);

void SetSav1Weather(u32);
u8 GetSav1Weather(void);
void sub_80AEDBC(void);

void DoCurrentWeather(void);
void SetSav1WeatherFromCurrMapHeader(void);
void sub_807B0C4(u16 *, u16 *, u32);
void PlayRainStoppingSoundEffect(void);
bool8 IsWeatherNotFadingIn(void);
void SetWeatherScreenFadeOut(void);
void sub_807B070(void);
u8 GetCurrentWeather(void);
void FieldWeather_StartFadingOutCreditsMap(u8, u8, u32);
void sub_807AA8C(u8 palIdx);
void ResetPreservedPalettesInWeather(void);
void PreservePaletteInWeather(u8 palIdx);

#endif // GUARD_WEATHER_H
