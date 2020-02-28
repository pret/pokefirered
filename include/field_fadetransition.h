#ifndef GUARD_FIELD_FADETRANSITION_H
#define GUARD_FIELD_FADETRANSITION_H

#include "global.h"

void sub_807DF7C(void);
void DoWarp(void);
void DoDiveWarp(void);
void DoDoorWarp(void);

void DoFallWarp(void);
void sub_807E59C(void);
void sub_807E500(void);
void sub_807DF64(void);
void WarpFadeOutScreen(void);
void FieldCallback_ReturnToEventScript2(void);
void FadeInFromBlack(void);
void FadeTransition_FadeInOnReturnToStartMenu(void);
void pal_fill_for_maplights(void);

void sub_807DCE4(void);

bool32 sub_807E418(void);
void palette_bg_faded_fill_black(void);

#endif // GUARD_FIELD_FADETRANSITION_H
