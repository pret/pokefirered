#ifndef GUARD_FIELD_SPECIALS_H
#define GUARD_FIELD_SPECIALS_H

#include "global.h"

extern u16 gScrollableMultichoice_ScrollOffset;

u8 GetLeadMonIndex(void);
size_t CountDigits(s32 value);
void TV_PrintIntToStringVar(u8 varidx, s32 number);
u16 GetStarterSpecies(void);
void StopPokemonLeagueLightingEffectTask(void);
void FieldCB_ShowPortholeView(void);
u8 ContextNpcGetTextColor(void);
void SetPCBoxToSendMon(u8);
u16 GetPCBoxToSendMon(void);
bool8 IsDestinationBoxFull(void);
bool8 ShouldShowBoxWasFullMessage(void);
u16 GetHiddenItemAttr(u32 hiddenItem, u8 attr);
u8 GetUnlockedSeviiAreas(void);
u32 GetPlayerTrainerId(void);
bool8 CutMoveRuinValleyCheck(void);
void CutMoveOpenDottedHoleDoor(void);
void RunMassageCooldownStepCounter(void);
void IncrementResortGorgeousStepCounter(void);
void IncrementBirthIslandRockStepCount(void);
void ResetCyclingRoadChallengeData(void);
void ResetFieldTasksArgs(void);
bool8 UsedPokemonCenterWarp(void);
void QuestLog_CheckDepartingIndoorsMap(void);
void QuestLog_TryRecordDepartedLocation(void);
bool8 InPokemonCenter(void);
void UpdateFrontierManiac(u16 daysSince);
void UpdateFrontierGambler(u16 daysSince);
void FrontierGamblerSetWonOrLost(bool8 won);
bool8 InMultiPartnerRoom(void);

#endif // GUARD_FIELD_SPECIALS_H
