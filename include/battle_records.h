#ifndef GUARD_BATTLE_RECORDS_H
#define GUARD_BATTLE_RECORDS_H

extern u8 gRecordsWindowId;

void ClearPlayerLinkBattleRecords(void);
void UpdatePlayerLinkBattleRecords(s32 battlerId);
void RemoveRecordsWindow(void);

#endif // GUARD_BATTLE_RECORDS_H
