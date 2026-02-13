#ifndef GUARD_BATTLE_TOWER_H
#define GUARD_BATTLE_TOWER_H

#include "data.h"
#include "battle_frontier.h"

extern const u8 gTowerMaleFacilityClasses[30];
extern const u16 gTowerMaleTrainerGfxIds[30];
extern const u8 gTowerFemaleFacilityClasses[20];
extern const u16 gTowerFemaleTrainerGfxIds[20];

void CallBattleTowerFunc(void);
void PutNewBattleTowerRecord(struct EmeraldBattleTowerRecord *newRecordEm);
void CalcEmeraldBattleTowerChecksum(struct EmeraldBattleTowerRecord *record);
u16 GetCurrentBattleTowerWinStreak(enum FrontierLevelMode lvlMode, u8 battleMode);
void TryHideBattleTowerReporter(void);
void CalcApprenticeChecksum(struct Apprentice *apprentice);
void GetBattleTowerTrainerLanguage(u8 *dst, u16 trainerId);
bool32 ValidateBattleTowerRecord(u8 recordId); // unused
void TrySetLinkBattleTowerEnemyPartyLevel(void);

#endif //GUARD_BATTLE_TOWER_H
