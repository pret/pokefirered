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

extern struct Struct203B0A0 gPartyMenu;
extern u8 gPartyMenuUseExitCallback;
extern u8 gUnknown_203B0C1;
extern u8 gBattlePartyCurrentOrder[3];
extern void (*gItemUseCB)(u8 taskId, TaskFunc func);
extern u8 gSelectedOrderFromParty[3];

bool8 FieldCallback_PrepareFadeInFromMenu(void);
bool8 MonKnowsMove(struct Pokemon *, u16);
void sub_81B58A8(void);
void DoWallyTutorialBagMenu(void);
u8 GetAilmentFromStatus(u32 status);
u16 ItemIdToBattleMoveId(u16 itemId);
void ItemUseCB_TMHM(u8 taskId, TaskFunc func);
void CB2_ShowPartyMenuForItemUse(void);
void CB2_ChooseMonToGiveItem(void);
void CB2_GiveHoldItem(void);
u8 GetCursorSelectionMonId(void);
void ChooseMonForDaycare(void);
void AnimatePartySlot(u8 monId, u8 a1);
void DisplayPartyMenuStdMessage(u8);
void Task_HandleChooseMonInput(u8 taskId);
void PartyMenuModifyHP(u8 taskId, u8 a1, s8 a2, s16 amount, TaskFunc followupFunc);
void GetMonNickname(const struct Pokemon * mon, u8 * dest);
void DisplayPartyMenuMessage(const u8 * src, u8 a1);
bool8 IsPartyMenuTextPrinterActive(void);
void InitPartyMenu(u8 a, u8 b, u8 c, u8 d, u8 messageId, TaskFunc task, MainCallback callback);
void sub_81252D0(u8 taskId, TaskFunc followUpFunc);
void ItemUseCB_PPRecovery(u8 taskId, TaskFunc followUpFunc);
void ItemUseCB_PPUp(u8 taskId, TaskFunc followUpFunc);
void dp05_rare_candy(u8 taskId, TaskFunc followUpFunc);
void sub_8126B60(u8 taskId, TaskFunc followUpFunc);
void ItemUseCB_SacredAsh(u8 taskId, TaskFunc followUpFunc);
void sub_81279E0(void);
void ItemUseCB_Medicine(u8 taskId, TaskFunc followUpFunc);
u8 GetItemEffectType(u16 itemId);
u8 pokemon_order_func(u8);
void BufferBattlePartyCurrentOrder(void);
void BufferBattlePartyCurrentOrderBySide(u8 battlerId, u8 multiplayerFlag);
void OpenPartyMenuInBattle(void);
void SwitchPartyOrderLinkMulti(u8 battlerId, u8 unk, u8 arrayIndex);
bool8 IsMultiBattle(void);
void CB2_ChooseMonToGiveItem(void);
void DrawHeldItemIconsForTrade(u8 *partyCount, u8 (*icons)[6], u8 side);
void ChooseMonToGiveMailFromMailbox(void);
void CB2_PartyMenuFromStartMenu(void);
void ShowPartyMenuToShowcaseMultiBattleParty(void);
void SwitchPartyMonSlots(u8 slot, u8 slot2);
void LoadHeldItemIcons(void);
void OpenPartyMenuInTutorialBattle(u8 partyAction);

#endif // GUARD_PARTY_MENU_H
