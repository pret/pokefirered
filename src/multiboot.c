#include "global.h"
#include "multiboot.h"

static u16 MultiBoot_required_data[MULTIBOOT_NCHILD];
void MultiBootInit(struct MultiBootParam *mp){}
int MultiBootMain(struct MultiBootParam *mp){}
void MultiBootStartProbe(struct MultiBootParam *mp){}
void MultiBootStartMaster(struct MultiBootParam *mp, const u8 *srcp, int length, u8 palette_color, s8 palette_speed){}
bool32 MultiBootCheckComplete(struct MultiBootParam *mp){}