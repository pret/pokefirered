#ifndef GUARD_PARTY_MENU_H
#define GUARD_PARTY_MENU_H

#include "main.h"
#include "task.h"
#include "constants/party_menu.h"

struct PartyMenu
{
    MainCallback exitCallback;
    TaskFunc task;
    u8 menuType:4;
    u8 layout:2;
    u8 unk_8_6:2;
    s8 slotId;
    s8 slotId2;
    u8 action;
    u16 bagItem;
    s16 data1;           // used variously as a moveId, counter, moveSlotId, or cursorPos
    s16 learnMoveState;  // data2, used only as a learn move state
};

extern struct PartyMenu gPartyMenu;
extern u8 gPartyMenuUseExitCallback;
extern u8 gSelectedMonPartyId;
extern u8 gBattlePartyCurrentOrder[PARTY_SIZE / 2];
extern void (*gItemUseCB)(u8 taskId, TaskFunc func);
extern u8 gSelectedOrderFromParty[4];

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
void DisplayPartyMenuStdMessage(u32);
void Task_HandleChooseMonInput(u8 taskId);
void PartyMenuModifyHP(u8 taskId, u8 a1, s8 a2, s16 amount, TaskFunc followupFunc);
u8 *GetMonNickname(struct Pokemon *mon, u8 *dest);
u8 DisplayPartyMenuMessage(const u8 * src, u8 a1);
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
void ClearSelectedPartyOrder(void);

#endif // GUARD_PARTY_MENU_H
