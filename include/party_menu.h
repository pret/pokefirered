#ifndef GUARD_PARTY_MENU_H
#define GUARD_PARTY_MENU_H

#include "main.h"
#include "task.h"

enum {
    AILMENT_NONE,
    AILMENT_PSN,
    AILMENT_PRZ,
    AILMENT_SLP,
    AILMENT_FRZ,
    AILMENT_BRN,
    AILMENT_PKRS,
    AILMENT_FNT
};

enum
{
    PARTY_CHOOSE_MON,
    PARTY_MUST_CHOOSE_MON,
    PARTY_CANT_SWITCH,
    PARTY_USE_ITEM_ON,
    PARTY_ABILITY_PREVENTS,
    PARTY_GIVE_ITEM,
};

struct Struct203B0A0
{
    MainCallback exitCallback;
    TaskFunc unk4;
    u8 unk8_0:4;
    u8 mode:2;
    u8 unk8_2:2;
    s8 unk9;
    s8 unkA;
    u8 unkB;
    u16 unkC;
    s16 unkE;
    s16 unk10;
};

extern struct Struct203B0A0 gUnknown_203B0A0;
extern u8 gUnknown_203B0C0;
extern u8 gUnknown_203B0C1;
extern u8 gUnknown_203B0DC[3];
extern void (*gUnknown_3005E98)(u8 taskId, TaskFunc func);

bool8 FieldCallback_PrepareFadeInFromMenu(void);
bool8 MonKnowsMove(struct Pokemon *, u16);
void sub_81B58A8(void);
void DoWallyTutorialBagMenu(void);
u8 pokemon_ailments_get_primary(u32 status);
u16 ItemIdToBattleMoveId(u16 itemId);
void sub_8125B40(u8 taskId, TaskFunc func);
void sub_8124C8C(void);
void sub_8126EDC(void);
void c2_8123744(void);
u8 GetCursorSelectionMonId(void);
void sub_8128370(void);
void sub_811F818(u8 monId, u8 a1);
void sub_8121D0C(u8);
void sub_811FB28(u8 taskId);
void sub_8120760(u8 taskId, u8 a1, s8 a2, s16 amount, TaskFunc followupFunc);
void GetMonNickname(const struct Pokemon * mon, u8 * dest);
void sub_81202F8(const u8 * src, u8 a1);
bool8 sub_8120370(void);
void PartyMenuInit(u8 a, u8 b, u8 c, u8 d, u8 messageId, TaskFunc task, MainCallback callback);
void sub_81252D0(u8 taskId, TaskFunc followUpFunc);
void ItemUseCB_PpRestore(u8 taskId, TaskFunc followUpFunc);
void dp05_pp_up(u8 taskId, TaskFunc followUpFunc);
void dp05_rare_candy(u8 taskId, TaskFunc followUpFunc);
void sub_8126B60(u8 taskId, TaskFunc followUpFunc);
void sub_8126894(u8 taskId, TaskFunc followUpFunc);
void sub_81279E0(void);
void ItemUseCB_Medicine(u8 taskId, TaskFunc followUpFunc);
u8 GetItemEffectType(u16 itemId);
u8 pokemon_order_func(u8);
void sub_8127CAC(void);
void sub_8127DA8(u8 battlerId, u8 multiplayerFlag);
void OpenPartyMenuInBattle(u8 arg);
void sub_8127EC4(u8 battlerId, u8 unk, u8 arrayIndex);
bool8 IsMultiBattle(void);
void sub_8126EDC(void);
void sub_812256C(u8 *partyCount, u8 (*icons)[6], u8 side);
void PartyMenuInit_FromPlayerPc(void);
void CB2_PartyMenuFromStartMenu(void);
void sub_8128198(void);
void sub_8127FF4(u8 slot, u8 slot2);

#endif // GUARD_PARTY_MENU_H
