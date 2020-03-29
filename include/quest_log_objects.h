#ifndef GUARD_QUEST_LOG_OBJECTS_H
#define GUARD_QUEST_LOG_OBJECTS_H

#include "global.h"

void SetQuestLogObjectEventsData(struct QuestLog *);
void SetSav1ObjectEventsFromQuestLog(struct QuestLog *, struct ObjectEventTemplate *);
void sub_815A540(void);

#endif //GUARD_QUEST_LOG_OBJECTS_H
