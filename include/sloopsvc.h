#ifndef GUARD_SLOOPSVC_H
#define GUARD_SLOOPSVC_H

#if REVISION >= 0xA

#define SVC4B_EXIT_EARLY (1 << 0)
#define SVC4B_RESEED_RNG (1 << 1)

void svc_40(void);
void svc_41(void);

void svc_47(void);
void svc_42(void);
u32 svc_49(void);
void svc_45_rfu_link_status(void);
u32 svc_4a(void);
void svc_43(u16 pid);
void svc_44(void);
u32 svc_53(void);
u32 svc_51(void);
u32 svc_4b(void);
void svc_WriteSector(u8 sector, u8* data);
void svc_ReplaceSector(u8 sector, u8* data);
void svc_FinishSave(void);
u32 svc_CommsAllowedByParentalControls(void);
u32 svc_BadWordCheck(u8* str);
void svc_4f(u32 arg);
u32 svc_50(void);
void svc_SetSaveBlock2(struct SaveBlock2* saveBlock2);
void svc_stubbed(void);
void svc_SetStarter(u32 species);
void svc_SetActivity(u32 activity);
void svc_IncrementLinkError(void);

#endif
#endif