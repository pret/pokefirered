#ifndef GUARD_CABLE_CLUB_H
#define GUARD_CABLE_CLUB_H

void Task_WaitForLinkPlayerConnection(u8 taskId);
u8 CreateTask_ReestablishCableClubLink(void);
void CB2_ReturnFromCableClubBattle(void);
bool32 GetSeeingLinkPlayerCardMsg(u8 who);

#endif //GUARD_CABLE_CLUB_H
