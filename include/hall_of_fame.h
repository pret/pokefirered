#ifndef GUARD_HALL_OF_FAME_H
#define GUARD_HALL_OF_FAME_H

#include "global.h"

struct HallofFameMon
{
    u32 tid;
    u32 personality;
    u16 isShiny:1;
    u16 species:15;
    u8 lvl;
    u8 nick[POKEMON_NAME_LENGTH];
};

struct HallofFameTeam
{
    struct HallofFameMon mon[PARTY_SIZE];
};

extern struct HallofFameTeam *gHoFSaveBuffer;

void CB2_DoHallOfFameScreen(void);
void CB2_DoHallOfFameScreenDontSaveData(void);
void CB2_DoHallOfFamePC(void);
void CB2_InitHofPC(void);
void HallOfFamePCBeginFade(void);
void ReturnFromHallOfFamePC(void);

#endif // GUARD_HALL_OF_FAME_H
