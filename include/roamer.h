#ifndef GUARD_ROAMER_H
#define GUARD_ROAMER_H

#include "global.h"

void DeactivateAllRoamers(void);
void ClearRoamerLocationData(void);
void InitRoamer(void);
void UpdateLocationHistoryForRoamer(void);
bool32 IsRoamerAt(u32 roamerIndex, u32 mapGroup, u32 mapNum);
void CreateRoamerMonInstance(u32 roamerIndex);
bool32 TryStartRoamerEncounter(void);
void UpdateRoamerHPStatus(struct Pokemon *mon);
void SetRoamerInactive(u32 roamerIndex);
void GetRoamerLocation(u32 roamerIndex, u8 *mapGroup, u8 *mapNum);
u16 GetRoamerLocationMapSectionId(u32 roamerIndex);
void MoveAllRoamersToOtherLocationSets(void);
void MoveAllRoamers(void);

extern u8 gEncounteredRoamerIndex;

#endif // GUARD_ROAMER_H
