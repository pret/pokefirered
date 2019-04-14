#ifndef GUARD_PARTY_MENU_H
#define GUARD_PARTY_MENU_H

#include "global.h"

enum {
    AILMENT_NONE,
    AILMENT_PSN,
    AILMENT_PRZ,
    AILMENT_SLP,
    AILMENT_FRZ,
    AILMENT_BRN
};

extern void (*gUnknown_3005E98)(u8 taskId, TaskFunc func);

bool8 MonKnowsMove(struct Pokemon *, u16);
void sub_81B58A8(void);
void DoWallyTutorialBagMenu(void);
u8 pokemon_ailments_get_primary(u32 status);
u16 ItemIdToBattleMoveId(u16 itemId);
void sub_8125B40(u8 taskId, TaskFunc func);
void sub_8124C8C(void);
void sub_8126EDC(void);
void c2_8123744(void);

#endif // GUARD_PARTY_MENU_H
