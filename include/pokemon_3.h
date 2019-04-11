#ifndef GUARD_POKEMON_3_H
#define GUARD_POKEMON_3_H

#include "global.h"

const u8* GetTrainerClassNameFromId(u16 trainerId);
const u8* GetTrainerNameFromId(u16 trainerId);
void * SetUpMonSpriteManagerMaybe(u8, u8);
void sub_8044D80(void);
void * sub_8044E00(u8 buffId);

#endif // GUARD_POKEMON_3_H
