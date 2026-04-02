#include "global.h"
#include "gba/syscall.h"

//STUBS
u16 ArcTan(s16 i) { return 0; }
u16 ArcTan2(s16 x, s16 y) { return 0; }
void BgAffineSet(struct BgAffineSrcData *src, struct BgAffineDstData *dest, s32 count) {}
void CpuFastSet(const void *src, void *dst, u32 cnt) {}
void CpuSet(const void *src, void *dst, u32 cnt) {}
s32 Div(s32 num, s32 denom) { return 0; }
void LZ77UnCompVram(const void *src_, void *dest_) {}
void LZ77UnCompWram(const void *src, void *dst) {}
int MultiBoot(struct MultiBootParam *mp){ return 0; }
void ObjAffineSet(struct ObjAffineSrcData *src, void *dest, s32 count, s32 offset){}
void RegisterRamReset(u32 resetFlags){}
void SoftReset(u32 resetFlags){}
u16 Sqrt(u32 num) { return 0; }
void VBlankIntrWait(void){}
