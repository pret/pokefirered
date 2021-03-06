#ifndef GUARD_GBA_SYSCALL_H
#define GUARD_GBA_SYSCALL_H

#define RESET_EWRAM      0x01
#define RESET_IWRAM      0x02
#define RESET_PALETTE    0x04
#define RESET_VRAM       0x08
#define RESET_OAM        0x10
#define RESET_SIO_REGS   0x20
#define RESET_SOUND_REGS 0x40
#define RESET_REGS       0x80
#define RESET_ALL        0xFF

extern void SoftReset(u32 ResetFlags);

extern void RegisterRamReset(u32 ResetFlags);

extern void SoundBiasSet(void);
extern void SoundBiasReset(void);

extern void VBlankIntrWait(void);

extern s32 Div(s32 Number, s32 Denom);

extern s32 Mod(s32 Number, s32 Denom);

extern u16 Sqrt(u32 X);

extern u16 ArcTan2(s16 X, s16 Y);

extern void BgAffineSet(const struct BgAffineSrcData *Srcp, struct BgAffineDestData *Destp, s32 Num);

#define CPU_SET_SRC_FIXED 0x01000000
#define CPU_SET_16BIT     0x00000000
#define CPU_SET_32BIT     0x04000000

extern void CpuSet(const void *Srcp, void *Destp, u32 DmaCntData);

#define CPU_FAST_SET_SRC_FIXED 0x01000000

extern void CpuFastSet(const void *Srcp, void *Destp, u32 DmaCntData);

extern void ObjAffineSet(const struct ObjAffineSrcData *Srcp, void *Destp, s32 Num, s32 Offset);

extern void LZ77UnCompWram(const void *Srcp, void *Destp);

extern void LZ77UnCompVram(const void *Srcp, void *Destp);

extern void RLUnCompWram(const void *Srcp, void *Destp);

extern void RLUnCompVram(const void *Srcp, void *Destp);

extern int MultiBoot(struct MultiBootParam *mp);

#endif // GUARD_GBA_SYSCALL_H
