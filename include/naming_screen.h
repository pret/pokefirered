#ifndef GUARD_NAMING_SCREEN_H
#define GUARD_NAMING_SCREEN_H

#include "global.h"

#define NAMING_SCREEN_PLAYER        0
#define NAMING_SCREEN_BOX           1
#define NAMING_SCREEN_CAUGHT_MON    2
#define NAMING_SCREEN_NAME_RATER    3
#define NAMING_SCREEN_RIVAL         4

void DoNamingScreen(u8 templateNum, u8 *destBuffer, u16 monSpecies, u16 monGender, u32 monPersonality, MainCallback returnCallback);

#endif // GUARD_NAMING_SCREEN_H
