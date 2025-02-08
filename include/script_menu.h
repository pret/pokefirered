#ifndef GUARD_SCRIPT_MENU_H
#define GUARD_SCRIPT_MENU_H

#include "global.h"
#include "menu.h"

extern const u8 *const gStdStringPtrs[];

bool8 ScriptMenu_Multichoice(u8 left, u8 top, u8 var3, u8 var4);
bool8 ScriptMenu_MultichoiceWithDefault(u8 left, u8 top, u8 var3, u8 var4, u8 var5);
bool8 ScriptMenu_YesNo(u8 var1, u8 var2);
bool8 ScriptMenu_MultichoiceGrid(u8 left, u8 top, u8 multichoiceId, u8 a4, u8 columnCount);
bool8 ScriptMenu_ShowPokemonPic(u16 var1, u8 var2, u8 var3);
bool8 CreatePCMenu(void);
void ScriptMenu_DisplayPCStartupPrompt(void);
void DrawVerticalMultichoiceMenuInternal(u8 left, u8 top, u8 mcId, u8 ignoreBpress, u8 initPos, const struct MenuAction *list, u8 count);
int ConvertPixelWidthToTileWidth(int width);

bool8 (*ScriptMenu_HidePokemonPic(void))(void);
void QL_DestroyAbortedDisplay(void);
void PicboxCancel(void);

// Dynamic Multichoice Callbacks

#define DYN_MULTICHOICE_CB_DEBUG      0
#define DYN_MULTICHOICE_CB_SHOW_ITEM  1
#define DYN_MULTICHOICE_CB_NONE       255

#endif //GUARD_SCRIPT_MENU_H
