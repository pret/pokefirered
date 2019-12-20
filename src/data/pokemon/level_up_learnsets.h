#define LEVEL_UP_MOVE(lvl, move) ((lvl << 9) | move)
#define LEVEL_UP_END 0xFFFF

#if defined(FIRERED)
#include "level_up_learnsets_fr.h"
#elif defined(LEAFGREEN)
#include "level_up_learnsets_lg.h"
#endif
