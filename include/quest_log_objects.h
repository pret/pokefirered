#ifndef GUARD_QUEST_LOG_OBJECTS_H
#define GUARD_QUEST_LOG_OBJECTS_H

#include "global.h"

void QL_RecordObjects(struct QuestLogScene *);
void QL_LoadObjects(struct QuestLogScene *, struct ObjectEventTemplate *);
void QL_TryStopSurfing(void);

#endif //GUARD_QUEST_LOG_OBJECTS_H
