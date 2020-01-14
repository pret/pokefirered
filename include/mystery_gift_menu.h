#ifndef GUARD_MYSTERY_GIFT_MENU_H
#define GUARD_MYSTERY_GIFT_MENU_H

extern bool8 gGiftIsFromEReader;

void MainCB_FreeAllBuffersAndReturnToInitTitleScreen(void);
void PrintMysteryGiftOrEReaderTopMenu(bool8, bool32);
void c2_mystery_gift(void);
void c2_mystery_gift_e_reader_run(void);

#endif //GUARD_MYSTERY_GIFT_MENU_H
