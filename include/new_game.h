#ifndef GUARD_NEW_GAME_H
#define GUARD_NEW_GAME_H

void SetTrainerId(u32 trainerId, u8 *dst);
u32 ReadUnalignedWord(u8* dataPtr);
void CopyTrainerId(u8 *dst, u8 *src);
void NewGameInitData(void);
void ResetMenuAndMonGlobals(void);
void Sav2_ClearSetDefault(void);
void ResetMiniGamesResults(void);
void sub_808447C(void);

#endif // GUARD_NEW_GAME_H
