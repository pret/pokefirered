#ifndef GUARD_START_MENU_H
#define GUARD_START_MENU_H

#include "global.h"

void AppendToList(u8 *list, u8 *pos, u8 newEntry);
void Task_StartMenuHandleInput(u8 taskId);
void SetUpReturnToStartMenu(void);
void ShowStartMenu(void);
void Field_AskSaveTheGame(void);
void CB2_SetUpSaveAfterLinkBattle(void);

#endif // GUARD_START_MENU_H
