#ifndef GUARD_MAILBOX_PC_H
#define GUARD_MAILBOX_PC_H

#include "player_pc.h"

bool8 MailboxPC_InitBuffers(u8 num);
u8 MailboxPC_GetAddWindow(u8 winIdx);
void MailboxPC_RemoveWindow(u8 winIdx);
u8 MailboxPC_GetWindowId(u8 winIdx);
u8 MailboxPC_InitListMenu(struct PlayerPCItemPageStruct * playerPcStruct);
void MailboxPC_AddScrollIndicatorArrows(struct PlayerPCItemPageStruct * playerPcStruct);
void MailboxPC_DestroyListMenuBuffer(void);

#endif //GUARD_MAILBOX_PC_H
