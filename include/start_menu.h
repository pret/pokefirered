#ifndef GUARD_START_MENU_H
#define GUARD_START_MENU_H

#include "global.h"

void AppendToList(u8 *list, u8 *pos, u8 newEntry);
void Task_ShowStartMenu(u8 taskId);
void ShowReturnToFieldStartMenu(void);
void ShowStartMenu(void);
void SaveGame(void);
void CB2_SetUpSaveAfterLinkBattle(void);
void HideStartMenu(void);
void ShowBattlePyramidStartMenu(void);

#endif // GUARD_START_MENU_H
