#ifndef GUARD_PLAYER_PC_H
#define GUARD_PLAYER_PC_H

#include "global.h"
#include "list_menu.h"

// Exported type declarations

struct PlayerPC_Unk_203AAC4
{
    u16 selectedRow;
    u16 scrollOffset;
    u8 unk_4;
    u8 unk_5;
    u8 filler_6[4];
    u8 unk_A;
};

// Exported RAM declarations

// Exported ROM declarations

void sub_816B060(u8 taskId);
void NewGameInitPCItems(void);

#endif //GUARD_PLAYER_PC_H
