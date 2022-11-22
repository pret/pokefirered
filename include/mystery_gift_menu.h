#ifndef GUARD_MYSTERY_GIFT_MENU_H
#define GUARD_MYSTERY_GIFT_MENU_H

extern bool8 gGiftIsFromEReader;

bool32 PrintMysteryGiftMenuMessage(u8 * cmdPtr, const u8 * src);
void AddTextPrinterToWindow1(const u8 *str);
void MainCB_FreeAllBuffersAndReturnToInitTitleScreen(void);
void PrintMysteryGiftOrEReaderTopMenu(bool8, bool32);
void CB2_InitMysteryGift(void);
void CB2_MysteryGiftEReader(void);
s8 DoMysteryGiftYesNo(u8 * textState, u16 * windowId, bool8 yesNoBoxPlacement, const u8 * str);
void MG_DrawTextBorder(u8 windowId);
u16 GetMysteryGiftBaseBlock(void);

#endif //GUARD_MYSTERY_GIFT_MENU_H
