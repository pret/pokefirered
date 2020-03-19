#ifndef GUARD_SCRIPT_MENU_H
#define GUARD_SCRIPT_MENU_H

#include "global.h"

extern const u8 *const gStdStringPtrs[];

bool8 ScriptMenu_Multichoice(u8 left, u8 top, u8 var3, u8 var4);
bool8 ScriptMenu_MultichoiceWithDefault(u8 left, u8 top, u8 var3, u8 var4, u8 var5);
bool8 ScriptMenu_YesNo(u8 var1, u8 var2);
bool8 ScriptMenu_MultichoiceGrid(u8 left, u8 top, u8 multichoiceId, u8 a4, u8 columnCount);
bool8 ScriptMenu_ShowPokemonPic(u16 var1, u8 var2, u8 var3);
bool8 CreatePCMenu(void);
void ScriptMenu_DisplayPCStartupPrompt(void);

bool8 (*ScriptMenu_GetPicboxWaitFunc(void))(void);
void QLPlaybackCB_DestroyScriptMenuMonPicSprites(void);
void PicboxCancel(void);

#endif //GUARD_SCRIPT_MENU_H
