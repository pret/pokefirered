#ifndef GUARD_FIELD_SPECIALS_H
#define GUARD_FIELD_SPECIALS_H

#include "global.h"

enum HiddenItemAttr
{
    HIDDEN_ITEM_ID = 0,
    HIDDEN_ITEM_FLAG,
    HIDDEN_ITEM_QUANTITY,
    HIDDEN_ITEM_UNDERFOOT
};

u8 GetLeadMonIndex(void);
s32 CountDigits(s32 number);
void TV_PrintIntToStringVar(u8, int);
u16 ScrSpecial_GetStarter(void);
void StopPokemonLeagueLightingEffectTask(void);
void nullsub_60(void);
void nullsub_61(void);
u8 ContextNpcGetTextColor(void);
void set_unknown_box_id(u8);
u16 get_unknown_box_id(void);
bool8 sub_80CC7B4(void);
u16 GetHiddenItemAttr(u32 hiddenItem, u8 attr);
u8 GetUnlockedSeviiAreas(void);
u32 GetPlayerTrainerId(void);

#endif // GUARD_FIELD_SPECIALS_H
